Return-Path: <linux-gpio+bounces-138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF687EC0BE
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 11:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2356BB20A19
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 10:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684CFD516;
	Wed, 15 Nov 2023 10:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QRw+8ueD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070AFFBF3
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 10:31:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7C6F5;
	Wed, 15 Nov 2023 02:31:49 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF9r1EZ012730;
	Wed, 15 Nov 2023 10:31:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Pym2wX6/6jKhK2jh1Ks0i8sNe03dRoq5qKQSyQTmiHg=;
 b=QRw+8ueDDltgZjxDWC4Y7aG6UA1iPiOzFz3euUYntaQ0jIciP8dzElnL9OT43XrFLHAF
 mmApKDg3vU9/r3161i7aQNtU1Um32CXEs1/LzsVAQDPnOSEUH2JpBhLnMxrjc4Tl4gyq
 KGyFUNerTFafrqmwZ8mi8zRlW4ZZYhDXOQhigxvVhINJm1oXcrBkj1zqMSnPcXbc1zxp
 vaIguk5fNUSYaGKaV/GiaN6IrYcykU0N+WWAVENWt+buE/57xRScvEjhoSZXguprgC0s
 n7PX5aUEsjR5GuvzZUXplC/Sf1MF84QFC6PK9hwgZyqUwaAMgl8pbBhrMB/eZ2VvSvUq 7g== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucg2u9jdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 10:31:48 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AFAVmgq009416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 10:31:48 GMT
Received: from [10.239.133.73] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 15 Nov
 2023 02:31:43 -0800
Message-ID: <4184a40b-2b1a-4692-bd9b-b7639768a86b@quicinc.com>
Date: Wed, 15 Nov 2023 18:31:41 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: avoid reload of p state in list iteration
To: Linus Walleij <linus.walleij@linaro.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, <stable@vger.kernel.org>
References: <20231115010906.35357-1-quic_aiquny@quicinc.com>
 <CACRpkdbmw=goFFiSYOC4_ybiHiiBJJqmVv2Gh=v5nuTnQ1Z1Gg@mail.gmail.com>
From: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
In-Reply-To: <CACRpkdbmw=goFFiSYOC4_ybiHiiBJJqmVv2Gh=v5nuTnQ1Z1Gg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sOBrNOCD9OwBa_jP5D2s9j4AB4GSV9AH
X-Proofpoint-GUID: sOBrNOCD9OwBa_jP5D2s9j4AB4GSV9AH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_08,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=781
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311150079

On 11/15/2023 5:58 PM, Linus Walleij wrote:
> Hi Maria,
> 
> On Wed, Nov 15, 2023 at 2:13 AM Maria Yu <quic_aiquny@quicinc.com> wrote:
> 
>> When in the list_for_each_entry iteration, reload of p->state->settings
>> with a local setting from old_state will makes the list iteration in a
>> infinite loop.
>> The typical issue happened, it will frequently have printk message like:
>>    "not freeing pin xx (xxx) as part of deactivating group xxx - it is
>> already used for some other setting".
>> This is a compiler-dependent problem, one instance was got using Clang
>> version 10.0 plus arm64 architecture.
>>
>> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
>> Cc: stable@vger.kernel.org
> 
> Thanks, very much to the point.
> 
> Can you please send a v3 and add the info Andy requested too,
> and I will apply it!
> 
> Yours,
> Linus Walleij
Thx Linus Walleij for your quick response.

here it is:
[https://lore.kernel.org/lkml/20231115102824.23727-1-quic_aiquny@quicinc.com/]

-- 
Thx and BRs,
Aiqun(Maria) Yu


