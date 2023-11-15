Return-Path: <linux-gpio+bounces-121-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA1B7EBB75
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 04:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55CF5281278
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 03:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BD564F;
	Wed, 15 Nov 2023 03:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZEbWV/9l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5728644
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 03:06:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9939C;
	Tue, 14 Nov 2023 19:06:03 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF2dsgt025091;
	Wed, 15 Nov 2023 03:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=qImNRJev3vwWyXbCa/2Bu0Xhzk10uxAu1Jy7o/H/tiY=;
 b=ZEbWV/9lxUIzEx84Sh3Rs0IumDKbeCVvhJYgt1FXJbaHStkiwM3AiTfr+u/G7RmRJCRH
 hoWOfvJ9vOwE5je85PRhKFzIvhrSO6/U6fFgfTMzcuKKlKUxinltkdKA/BfIQ45AFhpo
 V3UhN2FnHdi4JQ10gtKdQU8hdjb1nRzrSNsx+pOH9qDG0slwNZ3omrwfyPWT8sYr0Vyo
 UEj3eXZ88DCxVZndKELLXKeqG7nFYxjBBx93tRwlU/3wox3pIazgB5AcpCMGEA3gRKhF
 8KrIeqassLCwtlEl8DKckUeEqoILlLCdFrGgqy+xZzjCQj0wHxTJWIrvKwYrCl7Ym+Q+ Iw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uc6nujabp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 03:06:00 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AF360ed014488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 03:06:00 GMT
Received: from [10.239.133.73] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 14 Nov
 2023 19:05:55 -0800
Message-ID: <fc1a3bd3-c8d7-4deb-a4d5-4f56516abd8a@quicinc.com>
Date: Wed, 15 Nov 2023 11:05:52 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: avoid reload of p state in interation
To: <andy.shevchenko@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <stable@vger.kernel.org>
References: <20231114085258.2378-1-quic_aiquny@quicinc.com>
 <CACRpkdYgyASV6ttW=AeAWSh3oiFDk9_Q1WV00=7yTxtuhpdXEg@mail.gmail.com>
 <94de6d83-d181-4a04-875a-377fb5e10b25@quicinc.com>
 <ZVQn8EpU8UrFMm20@surfacebook.localdomain>
From: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
In-Reply-To: <ZVQn8EpU8UrFMm20@surfacebook.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rj9eEyeeoQEcRQysQoWRYrvTJHqlvdvS
X-Proofpoint-GUID: rj9eEyeeoQEcRQysQoWRYrvTJHqlvdvS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_01,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 mlxscore=0
 bulkscore=0 clxscore=1011 malwarescore=0 mlxlogscore=615
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150024

On 11/15/2023 10:07 AM, andy.shevchenko@gmail.com wrote:
> Wed, Nov 15, 2023 at 08:56:35AM +0800, Aiqun(Maria) Yu kirjoitti:
>> On 11/14/2023 9:21 PM, Linus Walleij wrote:
>>> On Tue, Nov 14, 2023 at 9:54 AM Maria Yu <quic_aiquny@quicinc.com> wrote:
> 
> ...
> 
>>> This makes sense in a way, since this is a compiler-dependent problem,
>>> can you state in the commit message which compiler and architecture
>>> you see this on?
>> I have a crash dump which caused by this issue which is using Clang 10.0,
>> arm64, Linux Version 4.19.
>> Thx for your suggestion, I will put this information in the commit message.
> 
> Please, also add a kernel version and a few (most important) lines from the crash.
Thx for the suggetion. Will add kernel version as well.
> 
>>> If it is a regression, should this also be queued for stable? (I guess so?)
>> This is a corner case which is very hard to reproduce in product, I suggest
>> this fix to be queued for stable.
> 
> Please, provide a respective Fixes tag.
Thx for remind. Will do.
> 

-- 
Thx and BRs,
Aiqun(Maria) Yu


