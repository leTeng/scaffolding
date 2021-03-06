package ${package}.service.dto;

import lombok.Data;
import lombok.Builder;
<#if queryHasTimestamp>
import java.sql.Timestamp;
</#if>
<#if queryHasBigDecimal>
import java.math.BigDecimal;
</#if>
<#if queryColumns??>
import com.eteng.scaffolding.common.annotation.Query;
</#if>

/**
* @author ${author}
* @date ${date}
*/
@Data
@Builder
public class ${className}QueryCriteria{
<#if queryColumns??>
    <#list queryColumns as column>

    <#if column.columnQuery = '1'>
    // 模糊
    @Query(type = Query.Type.INNER_LIKE)
    </#if>
    <#if column.columnQuery = '2'>
    // 精确
    @Query
    </#if>
    private ${column.columnType} ${column.changeColumnName};
    </#list>
</#if>
}