Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0B0776109E
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jul 2023 12:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbjGYKYg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jul 2023 06:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233577AbjGYKYd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jul 2023 06:24:33 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91211999;
        Tue, 25 Jul 2023 03:24:30 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36P8CZm8016022;
        Tue, 25 Jul 2023 10:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=LIDESBazjCw78yAhdu5pUDpDabOEq3/ROBQDdIP1mJ0=;
 b=A4k2L1PNlF/10bwJGSo56zIeh+huOdsyQVMX3bGYEIPb7ZseY8zNzTcqIY5y75mrmVb8
 UnO0HR0nOHGNq07MSlhzlsT55FrMJGt1AJuDtGKe9jT8suwXhWNIr99LAXGW4l6gVyhQ
 PEA7O6BX2+4qQrzYh/V+5tFPPqxG4/lztJ4vOknYT4Yh70oO1ye3IF8rDS4fgBcLFxZz
 mCnowQuX3lc/qq7dXuxKqejzonej6/wjv+6e9uAToun1+2dGA2hEpTOxCkxY23p//UUr
 +Fp0Ioa1u5Hf2lN1sr+A5gR19lz2So8aY/zqEKx+5ARobeoAMbxikklfzbbG7eHQTnOG ZA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s1s1jtfbu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Jul 2023 10:24:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36PAOQ7E004096
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Jul 2023 10:24:26 GMT
Received: from [10.201.2.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 25 Jul
 2023 03:24:21 -0700
Message-ID: <6b6a383f-4a3a-e55b-dc86-b1abb8c7acab@quicinc.com>
Date:   Tue, 25 Jul 2023 15:54:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH V5 3/3] firmware: scm: Modify only the download bits in
 TCSR register
Content-Language: en-US
To:     Elliot Berman <quic_eberman@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Mukesh Ojha" <quic_mojha@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
CC:     <quic_srichara@quicinc.com>, <quic_sjaganat@quicinc.com>,
        <quic_anusha@quicinc.com>, <quic_saahtoma@quicinc.com>,
        Poovendhan Selvaraj <quic_poovendh@quicinc.com>
References: <20230720070408.1093698-1-quic_kathirav@quicinc.com>
 <20230720070408.1093698-4-quic_kathirav@quicinc.com>
 <5c56cc3c-13d0-d9d8-0209-5b6e8d7a4dac@quicinc.com>
From:   Kathiravan T <quic_kathirav@quicinc.com>
In-Reply-To: <5c56cc3c-13d0-d9d8-0209-5b6e8d7a4dac@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VyznCL38aiVkAVYp3259z1FGRn0Er_Oo
X-Proofpoint-ORIG-GUID: VyznCL38aiVkAVYp3259z1FGRn0Er_Oo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_05,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250090
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 7/25/2023 12:35 AM, Elliot Berman wrote:
>
>
> On 7/20/2023 12:04 AM, Kathiravan T wrote:
>> From: Mukesh Ojha <quic_mojha@quicinc.com>
>>
>> CrashDump collection is based on the DLOAD bit of TCSR register. To 
>> retain
>> other bits, we read the register and modify only the DLOAD bit as the
>> other bits have their own significance.
>>
>> Co-developed-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
>> Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
>> ---
>> Changes in V5:
>>     - Added the Signed-off-by tag for user Poovendhan
>>     - Dropped the macro QCOM_DOWNLOAD_MODE_SHIFT in the favor of
>>       PREP_FIELD
>>
>>   drivers/firmware/qcom_scm.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
>> index 104d86e49b97..3830dcf14326 100644
>> --- a/drivers/firmware/qcom_scm.c
>> +++ b/drivers/firmware/qcom_scm.c
>> @@ -30,6 +30,10 @@ module_param(download_mode, bool, 0);
>>   #define SCM_HAS_IFACE_CLK    BIT(1)
>>   #define SCM_HAS_BUS_CLK        BIT(2)
>>   +#define QCOM_DOWNLOAD_FULLDUMP        0x1
>> +#define QCOM_DOWNLOAD_NODUMP        0x0
>> +#define QCOM_DOWNLOAD_MODE_MASK        BIT(4)
>> +
>
> Can you update __qcom_scm_set_dload_mode to use the FIELD_PREP bits as 
> well? Ideally, you should be able to have no duplicate logic in 
> __qcom_scm_set_dload_mode and in qcom_scm_set_download_mode. Before 
> your patch, it was duplicated and we probably should've had it 
> de-duplicated. With this patch, the logic and constants used have 
> diverged when they don't need to.


Sure, will check this.


>
>>   struct qcom_scm {
>>       struct device *dev;
>>       struct clk *core_clk;
>> @@ -440,6 +444,7 @@ static int __qcom_scm_set_dload_mode(struct 
>> device *dev, bool enable)
>>   static void qcom_scm_set_download_mode(bool enable)
>>   {
>>       bool avail;
>> +    int val;
>>       int ret = 0;
>>         avail = __qcom_scm_is_call_available(__scm->dev,
>> @@ -448,8 +453,10 @@ static void qcom_scm_set_download_mode(bool enable)
>>       if (avail) {
>>           ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
>>       } else if (__scm->dload_mode_addr) {
>> -        ret = qcom_scm_io_writel(__scm->dload_mode_addr,
>> -                enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
>> +        val = enable ? QCOM_DOWNLOAD_FULLDUMP : QCOM_DOWNLOAD_NODUMP;
>> +        ret = qcom_scm_io_update_field(__scm->dload_mode_addr,
>> +                           QCOM_DOWNLOAD_MODE_MASK,
>> +                           FIELD_PREP(QCOM_DOWNLOAD_MODE_MASK, val));
>>       } else {
>>           dev_err(__scm->dev,
>>               "No available mechanism for setting download mode\n");
