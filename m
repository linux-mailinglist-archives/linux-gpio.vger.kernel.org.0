Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5313079E062
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Sep 2023 09:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238414AbjIMHDz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Sep 2023 03:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbjIMHDz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2023 03:03:55 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654691738;
        Wed, 13 Sep 2023 00:03:51 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38D6q17L027482;
        Wed, 13 Sep 2023 07:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ziSOaqQRIoG94oZGz0d5r0+7UOw/nEgZ32lMUgWge/E=;
 b=l1Mm2/Gor3UeT616Kj3wNqUh82gOg4TSYQDva8Q2a6CTViIYYdhbrzuC9UGrBUKAJK5Y
 qA6fr3JCshsUCAimWB2n1/3f7Xyts2008/ruKvk8vzDL3jTayon0X3Kshvg9nTkmnT3h
 UZkJoP5+qQul3Mt8O/yEsV7+4MJXxqsFF4PEHQaagoKuC48c3Z5aLcL5144Q/FBRZLXH
 upRNzbXFML4EGc0RRDTN+btvDpCrnZo0Eu82M+/bRkmgeb3UJG321CJM/JL3bkPB6mYw
 7ssWkFHFxV9GlT7L+ClJPWVzRTAVqt4WX/L28bvHcvN05+W1SO7GklEcXUHB6YzBi64O 3Q== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2y7ts0vg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Sep 2023 07:03:15 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38D73Eg8010732
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Sep 2023 07:03:14 GMT
Received: from [10.214.66.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 13 Sep
 2023 00:03:02 -0700
Message-ID: <14bf3fca-f031-d000-6fd6-d82f4de9b255@quicinc.com>
Date:   Wed, 13 Sep 2023 12:32:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [REBASE PATCH v5 08/17] arm64: mm: Add dynamic ramoops region
 support through command line
Content-Language: en-US
To:     Will Deacon <will@kernel.org>
CC:     <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>,
        <gpiccoli@igalia.com>, <mathieu.poirier@linaro.org>,
        <catalin.marinas@arm.com>, <linus.walleij@linaro.org>,
        <andy.shevchenko@gmail.com>, <vigneshr@ti.com>, <nm@ti.com>,
        <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>,
        <quic_tsoni@quicinc.com>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
 <1694429639-21484-9-git-send-email-quic_mojha@quicinc.com>
 <20230912101820.GA10884@willie-the-truck>
From:   Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20230912101820.GA10884@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GyAbQ0AdteB_VHS7rJh3KcbsPiZrwY1L
X-Proofpoint-ORIG-GUID: GyAbQ0AdteB_VHS7rJh3KcbsPiZrwY1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_24,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309130058
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for the response.

On 9/12/2023 3:48 PM, Will Deacon wrote:
> On Mon, Sep 11, 2023 at 04:23:50PM +0530, Mukesh Ojha wrote:
>> The reserved memory region for ramoops is assumed to be at a fixed
>> and known location when read from the devicetree. This may not be
>> required for something like Qualcomm's minidump which is interested
>> in knowing addresses of ramoops region but it does not put hard
>> requirement of address being fixed as most of it's SoC does not
>> support warm reset and does not use pstorefs at all instead it has
>> firmware way of collecting ramoops region if it gets to know the
>> address and register it with apss minidump table which is sitting
>> in shared memory region in DDR and firmware will have access to
>> these table during reset and collects it on crash of SoC.
>>
>> So, add the support of reserving ramoops region to be dynamically
>> allocated early during boot if it is request through command line
>> via 'dyn_ramoops_size=' and fill up reserved resource structure and
>> export the structure, so that it can be read by ramoops driver.
>>
>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>> ---
>>   arch/arm64/mm/init.c       | 94 ++++++++++++++++++++++++++++++++++++++++++++++
> 
> Why does this need to be in the arch code? There's absolutely nothing
> arm64-specific here.

Current clients of this cmdline would be only arm64, and that is the
reason of putting this here.

I was checking the places where memblock_phys_alloc_range() gets called
and found either it is arch/*/ and drivers/of/of_reserved_mem.c .

Since, this is not related to device tree, did not find a proper place
than this, i took the reference of this place from
reserve_crashkernel(). Also, not sure how could it be of help to other
non-arch64 users at this point.

-Mukesh
> 
> Will
