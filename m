Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA6E675E22B
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Jul 2023 15:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjGWNzV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jul 2023 09:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjGWNzU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Jul 2023 09:55:20 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1BE61B7;
        Sun, 23 Jul 2023 06:55:19 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36NDpJd4024655;
        Sun, 23 Jul 2023 13:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=u+caH/jXzIboqbPc+68HICuOSaGacOVF6EUqDgGZlbE=;
 b=XpkTf53ODsR21xx/CxH0EilppZ7wnX6xLIHI7OhxG++SNAxdhMgjZAn9bUpj0HPkkN1U
 LEY98sQhGOOLnPxAvV4Y8d2VGHUBjnfP5FdHFkR6mZt3V6nCV9MrI8xR639r+54fK+9U
 wGagQyNyEj+Vd06pDcQlMre1LAvZODnvgBVLABe+Z5FsuwFU8kSSsWJTO84ReubPegWB
 1v4dlR0FSXoGDFbuE/BqYORoXmsca8hCAnTymfnokqbrn5429np9cpBsZJZEjEbUMfBF
 eS61zjTRc0GQii0FIzdokHCGdnZZHSuNHk8TNvi83nBCJ7jGJKNyVVi6S9kmckc3btjU 0Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s062xhpv7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 23 Jul 2023 13:55:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36NDtEHA012974
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 23 Jul 2023 13:55:14 GMT
Received: from [10.216.27.226] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Sun, 23 Jul
 2023 06:55:08 -0700
Message-ID: <3ab86e8d-cc00-d0bb-20f8-4c75c90a7db8@quicinc.com>
Date:   Sun, 23 Jul 2023 19:25:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH V5 1/3] firmware: qcom_scm: provide a read-modify-write
 function
Content-Language: en-US
To:     Trilok Soni <quic_tsoni@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Elliot Berman" <quic_eberman@quicinc.com>,
        Mukesh Ojha <quic_mojha@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
CC:     <quic_srichara@quicinc.com>, <quic_sjaganat@quicinc.com>,
        <quic_anusha@quicinc.com>, <quic_saahtoma@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20230720070408.1093698-1-quic_kathirav@quicinc.com>
 <20230720070408.1093698-2-quic_kathirav@quicinc.com>
 <fdd4bc8b-1349-485d-18c5-c6d69cd415a1@quicinc.com>
From:   Kathiravan T <quic_kathirav@quicinc.com>
In-Reply-To: <fdd4bc8b-1349-485d-18c5-c6d69cd415a1@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CQTBlGzgl9e64_1FjOo66yQJkLrQB8J9
X-Proofpoint-ORIG-GUID: CQTBlGzgl9e64_1FjOo66yQJkLrQB8J9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-23_03,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxlogscore=634 phishscore=0 bulkscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307230129
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/22/2023 6:47 AM, Trilok Soni wrote:
> On 7/20/2023 12:04 AM, Kathiravan T wrote:
>> From: Mukesh Ojha <quic_mojha@quicinc.com>
>>
>> It was realized by Srinivas K. that there is a need of read-modify-write
>> scm exported function so that it can be used by multiple clients.
>>
>> Let's introduce qcom_scm_io_update_field() which masks out the bits and
>> write the passed value to that bit-offset.
>>
>> Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
>> ---
>> Changes in V5:
>>     - No changes
>>
>>   drivers/firmware/qcom_scm.c            | 15 +++++++++++++++
>>   include/linux/firmware/qcom/qcom_scm.h |  2 ++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
>> index fde33acd46b7..104d86e49b97 100644
>> --- a/drivers/firmware/qcom_scm.c
>> +++ b/drivers/firmware/qcom_scm.c
>> @@ -407,6 +407,21 @@ int qcom_scm_set_remote_state(u32 state, u32 id)
>>   }
>>   EXPORT_SYMBOL(qcom_scm_set_remote_state);
>>   +int qcom_scm_io_update_field(phys_addr_t addr, unsigned int mask, 
>> unsigned int val)
>> +{
>> +    unsigned int old, new;
>> +    int ret;
>> +
>> +    ret = qcom_scm_io_readl(addr, &old);
>> +    if (ret)
>> +        return ret;
>> +
>> +    new = (old & ~mask) | (val & mask);
>> +
>> +    return qcom_scm_io_writel(addr, new);
>> +}
>> +EXPORT_SYMBOL(qcom_scm_io_update_field);
>
> EXPORT_SYMBO_GPL please.


Sure, is it okay if I send the patch to convert the existing 
EXPORT_SYMBOL to EXPORT_SYMBOL_GPL as well?


>
>> +
>>   static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
>>   {
>>       struct qcom_scm_desc desc = {
>> diff --git a/include/linux/firmware/qcom/qcom_scm.h 
>> b/include/linux/firmware/qcom/qcom_scm.h
>> index 250ea4efb7cb..ca41e4eb33ad 100644
>> --- a/include/linux/firmware/qcom/qcom_scm.h
>> +++ b/include/linux/firmware/qcom/qcom_scm.h
>> @@ -84,6 +84,8 @@ extern bool qcom_scm_pas_supported(u32 peripheral);
>>     extern int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
>>   extern int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
>> +extern int qcom_scm_io_update_field(phys_addr_t addr, unsigned int 
>> mask,
>> +                    unsigned int val);
>>     extern bool qcom_scm_restore_sec_cfg_available(void);
>>   extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
