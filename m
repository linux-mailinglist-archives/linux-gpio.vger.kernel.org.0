Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4AA7BA173
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 16:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236824AbjJEOm3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 10:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236986AbjJEOhh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 10:37:37 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C42C34F6CF;
        Thu,  5 Oct 2023 07:02:50 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3959mP2d016206;
        Thu, 5 Oct 2023 11:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=AStgfaaTWIWjtJNJOJxciXIDBBRnSo68KvO+i7k27lU=;
 b=ggk4UX5n75YzD4YsFD4zLDhSuQydWWKsE4Qv8PgwqD+GoRRjC7toHCPS/mkyI4wW2CbW
 r0c/BMZzMWqhY1e4ft9nbPA47sNserFtmyue086NlFl++7Qnzcv9iHEWrsRQPtgdlxLR
 ibMgyI1+Nn/IaBjmkVm2g4ieaQysibX7v2QsQlRQCmP7BCbpV74rNqvUL1ZgVmE9g3Rf
 Zf2JzPDbHQizL88V6DlzQL2+S30y4n4YDUv4fPJlB/3sN912+gWQX5PaFsSiJOoWSKEQ
 T65rzenwyoApz9Vh42qef3YNXbz5tPZluzGDsSjn6/qPn/aXWFYeEkT+TSjEzKIANc/O Jg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3th8ck2nn9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 05 Oct 2023 11:23:56 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 395BNtw3002316
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 5 Oct 2023 11:23:55 GMT
Received: from [10.216.26.22] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 5 Oct
 2023 04:23:05 -0700
Message-ID: <3273977a-be7d-85f6-6754-52a3dd9b784a@quicinc.com>
Date:   Thu, 5 Oct 2023 16:52:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [REBASE PATCH v5 08/17] arm64: mm: Add dynamic ramoops region
 support through command line
Content-Language: en-US
To:     Kees Cook <keescook@chromium.org>, Will Deacon <will@kernel.org>
CC:     <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <mathieu.poirier@linaro.org>, <catalin.marinas@arm.com>,
        <linus.walleij@linaro.org>, <andy.shevchenko@gmail.com>,
        <vigneshr@ti.com>, <nm@ti.com>, <matthias.bgg@gmail.com>,
        <kgene@kernel.org>, <alim.akhtar@samsung.com>,
        <bmasney@redhat.com>, <quic_tsoni@quicinc.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
 <1694429639-21484-9-git-send-email-quic_mojha@quicinc.com>
 <20230912101820.GA10884@willie-the-truck> <202309131613.C0E12D0D14@keescook>
From:   Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <202309131613.C0E12D0D14@keescook>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tYP2aPd8wLHqCtbdfy0OmUbx-TMAVFMI
X-Proofpoint-ORIG-GUID: tYP2aPd8wLHqCtbdfy0OmUbx-TMAVFMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_08,2023-10-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 mlxscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310050088
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sorry for the late reply, was on a long vacation.

On 9/14/2023 4:47 AM, Kees Cook wrote:
> On Tue, Sep 12, 2023 at 11:18:20AM +0100, Will Deacon wrote:
>> On Mon, Sep 11, 2023 at 04:23:50PM +0530, Mukesh Ojha wrote:
>>> The reserved memory region for ramoops is assumed to be at a fixed
>>> and known location when read from the devicetree. This may not be
>>> required for something like Qualcomm's minidump which is interested
>>> in knowing addresses of ramoops region but it does not put hard
>>> requirement of address being fixed as most of it's SoC does not
>>> support warm reset and does not use pstorefs at all instead it has
>>> firmware way of collecting ramoops region if it gets to know the
>>> address and register it with apss minidump table which is sitting
>>> in shared memory region in DDR and firmware will have access to
>>> these table during reset and collects it on crash of SoC.
>>>
>>> So, add the support of reserving ramoops region to be dynamically
>>> allocated early during boot if it is request through command line
>>> via 'dyn_ramoops_size=' and fill up reserved resource structure and
>>> export the structure, so that it can be read by ramoops driver.
>>>
>>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>>> ---
>>>   arch/arm64/mm/init.c       | 94 ++++++++++++++++++++++++++++++++++++++++++++++
>>
>> Why does this need to be in the arch code? There's absolutely nothing
>> arm64-specific here.
> 
> I would agree: this needs to be in ramoops itself, IMO. It should be a
> ramoops module argument, too.
> 
> It being unhelpful for systems that don't have an external consumer is
> certainly true, but I think it would still make more sense for this
> change to live entirely within ramoops. Specifically: you're
> implementing a pstore backend behavioral change. In the same way that
> patch 10 is putting the "output" side of this into pstore/, I'd expect
> the "input" side also in pstore/

How do we reserve memory? are you suggesting to use dma api's for
dynamic ramoops ?

-Mukesh
> 
> More comments there, though.
> 
