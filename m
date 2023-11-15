Return-Path: <linux-gpio+bounces-115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 330527EBAB8
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 01:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C68751F25136
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 00:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1FB396;
	Wed, 15 Nov 2023 00:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TUZl27QD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57046394
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 00:56:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2868FE4;
	Tue, 14 Nov 2023 16:56:45 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF0uhpw003700;
	Wed, 15 Nov 2023 00:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OZhcjbz2HQ/QZtD8XrsoT733l56Lr8KKufKLGmGFN40=;
 b=TUZl27QDrhnL+nT980GR1xOcdif/xfxuvcqEziYRo+eCy5FaFz85cnSxp37OJBzyy1Tf
 cnxNY1sS9UOBo1g/V8Fxt38eljw9LU1ph7Hvf7g9so4WwpuW4LqgqjPJX4UaxoEo5uYT
 A/DGPcosdsgcmJl98LkeGqvv0OOmAH+MxwahiyV4DSVfJutiuJrlazJhCNY3dZ4P8Z9H
 FzYDpoPPS2awHgjkT0gmYcasVKcugEhCYkyfd3UNjof+8Oy/2Fm4k0+jcX1v7VwCynVc
 LInxA0NRUFNchQJ9bQZwM0aylJZGkN3uPmCDl78C9f7nSRoetrsfJ60aC7FGUUYAKVCU dA== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucfka8h81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 00:56:43 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AF0uhmN021165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 00:56:43 GMT
Received: from [10.239.133.73] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 14 Nov
 2023 16:56:37 -0800
Message-ID: <94de6d83-d181-4a04-875a-377fb5e10b25@quicinc.com>
Date: Wed, 15 Nov 2023 08:56:35 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: avoid reload of p state in interation
To: Linus Walleij <linus.walleij@linaro.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <stable@vger.kernel.org>
References: <20231114085258.2378-1-quic_aiquny@quicinc.com>
 <CACRpkdYgyASV6ttW=AeAWSh3oiFDk9_Q1WV00=7yTxtuhpdXEg@mail.gmail.com>
From: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
In-Reply-To: <CACRpkdYgyASV6ttW=AeAWSh3oiFDk9_Q1WV00=7yTxtuhpdXEg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uZFTKSBSghaYmd4jEbbX-RQVPAHnAZoa
X-Proofpoint-GUID: uZFTKSBSghaYmd4jEbbX-RQVPAHnAZoa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_24,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 phishscore=0 mlxscore=0 mlxlogscore=688 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150006

On 11/14/2023 9:21 PM, Linus Walleij wrote:
> Hi Maria,
> 
> thanks for your patch!
> 
> On Tue, Nov 14, 2023 at 9:54 AM Maria Yu <quic_aiquny@quicinc.com> wrote:
> 
>> When in the list_for_each_entry interation, reload of p->state->settings
>> with a local setting from old_state will makes the list interation in a
>> infite loop.
>>
>> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> 
> This makes sense in a way, since this is a compiler-dependent problem,
> can you state in the commit message which compiler and architecture
> you see this on?
I have a crash dump which caused by this issue which is using Clang 
10.0, arm64, Linux Version 4.19.
Thx for your suggestion, I will put this information in the commit message.
> 
> If it is a regression, should this also be queued for stable? (I guess so?)
This is a corner case which is very hard to reproduce in product, I 
suggest this fix to be queued for stable.
> 
> Yours,
> Linus Walleij

-- 
Thx and BRs,
Aiqun(Maria) Yu


