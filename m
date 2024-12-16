Return-Path: <linux-gpio+bounces-13913-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 630179F3057
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 13:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E782B1883E8A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 12:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C8A204C08;
	Mon, 16 Dec 2024 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljwNsghQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A71204561
	for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 12:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734351604; cv=none; b=FkI/9zIabgXBYbl5m/qr5OK3XwmwV6dvTDRzU7o8A8kQZXNOHE+JF2XzVXrcJcHw1ZJeguUL2RVwDXUKdJ51az+FA2dfBiWmzzx6AGJZFWpw9kv8cX3XrEctP5Im1k4ByyTLhOh1spwmSBkbCHPokVTomffLU1+QGFkxck4FMyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734351604; c=relaxed/simple;
	bh=ybgRkqth+vwtYw+ouWiPcZbJPYXXDnMbtY440TFFZKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ma2NcGSWBtCIUFsxtIzWG4s4S4oeDKEkOk17uEH1DHjR4AjJQm3ehO//ty1Se1xERl9RkdE/H176jjLdCBd5Vqgx6TqL4ovTpTeyIB3TJxpdcIbCJEiP04XE2j8nuEFjUTwtPPK26PsFGhkKTVn4P+N52RqTQHToXR3e6eePmUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljwNsghQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG86W69000696
	for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 12:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VOsyJZCKFlaXhdMetjiPjn7ZCm+QcoQaD1OHyhj1lNg=; b=ljwNsghQHT1/dn9K
	UdHd2TXkOk8OLqslle2mW6hDI6SuRkEjJiBVqGUBMPtFRs0M1YKjFaFbcifMCvlZ
	r0Y3Sn6O6B+GsEAxW7Iiqttk8NcEeP4oRGzXIetRwkWubTVevNug668xejMbd9L7
	0Cw9dgc8+NJv1suU3L8JZ4mVQxJowFU18cIhRcQoU7bYBcCYwy5pCzXZYXc/5jzE
	jpE7mHHYXByDFgunE8CNzn5W7vIvG+hAPakuOa1z+bVAvh5sJqd42fsnHBirgHQK
	89p72pO4ag+U9fBJD6vfaY3PvaKivKz4sJY+28xaIQdlOV0K1by0Q6oLcYc7iaDT
	gLdmKw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jgdhgpkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 12:20:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467b09809easo1968981cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 04:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734351601; x=1734956401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VOsyJZCKFlaXhdMetjiPjn7ZCm+QcoQaD1OHyhj1lNg=;
        b=h3xz5ySKavAAyB6TG1XP10oIUSQ71ItpI14L6WGku66dIK6t/aLPZ7bw4b6OVc6fFh
         RUTmN59kSGay2EBZVogWSKHo15/l8zpsmrx4Xru5/C/rNUu3rgHgBtL17u4flzPV7E1+
         aKQEmgfioCCU+bdZ6fUXC4TMQwcM6igNm/PVTsQAB78yIe7Kqfw1/p/NO9igMDnVstl2
         9qYLFdcGfjRF+1o1sh+KYol0M1qlzJFSaZ5iiCdA9HDT+c0E1tw4wq4HIOut4XzYxTv5
         c1Z6xgS75QHPq72AflbEbKhR2MYwANndElT6nA3rIOfJ7UtfDJgIcYT0vncMIdFLD1mf
         N4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY62BJnUmV61G6WTODKaeJPGhE4LvfTkB1veKted8o9UZgwdW9rr45Tbcb1aJPULSkuu7BIgLDbhTO@vger.kernel.org
X-Gm-Message-State: AOJu0YwKuUmasHO2D6ThxOFMFw2t19G9SltCBQkVGlIl6VM5MH6MZNET
	qpk8q//zWfZXhxfAiZW6PJLIGNBVii4AJ9/GaNF9FuC0wqPK9DEDt7Wn0JL7D3B7wSVM/a43JvT
	pscO9sN8FIn29WLtHsQ699qpOK1hZcVFCP1cR/3OcSGJBR0yZZtD8skZGL8hn
X-Gm-Gg: ASbGncszDRDMG8AFvheCW2AjafrJ/4AAV/VA/RgcF1Wigpj6eTH6v2lFVRM1WUijKIT
	6PCZ8ZEE1o1NEqE6Dmc4VoRH08jIavZOvoCUsjyd04GswahPXER2maprRiHNSAWbfsBlz3oRyOU
	jopnwaHNC2p9gtFj0bZW9nGg3LtBWGDqQN5uG9Xg8Ik+DxKD1Q9jUjEBIRIhfr2rX5izjVyQPYf
	wklZChGbThG/iSaPa8+TnroTlcayXQ3F6PdFoQHOKpjYW6d1Oe15uVzgZE3RaO+Sk+35bXUzxCY
	wlNh8vEg2UVgMKRZErW6uJFBGNvgdD0WF84=
X-Received: by 2002:ac8:5d0f:0:b0:461:3cd2:390 with SMTP id d75a77b69052e-467a58137a1mr86824031cf.12.1734351601269;
        Mon, 16 Dec 2024 04:20:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9pG1Ysvkr5Hyq/nig+qT8t4gtr5EQRe9497XJuqjF5LANAYeaCtwgGtk6X8FjF5ldW00HDw==
X-Received: by 2002:ac8:5d0f:0:b0:461:3cd2:390 with SMTP id d75a77b69052e-467a58137a1mr86823711cf.12.1734351600845;
        Mon, 16 Dec 2024 04:20:00 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ae11f8sm3285148a12.41.2024.12.16.04.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 04:20:00 -0800 (PST)
Message-ID: <3a67bc1f-dba9-4ab3-9c01-f889dd24359b@oss.qualcomm.com>
Date: Mon, 16 Dec 2024 13:19:58 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] Add MSM8917/PM8937/Redmi 5A
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, iommu@lists.linux.dev,
        Dang Huynh <danct12@riseup.net>, Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241215-msm8917-v9-0-bacaa26f3eef@mainlining.org>
 <CACRpkdZ-ZEiGMUPObHU=kw=OUADrRGtxgMc-QC3EaBevp-Shng@mail.gmail.com>
 <vfwisdkjg3czwesi6yqaznvxcz2z5ksqezhsh6ytrc2g2ypszy@wqkr5cgr26vq>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <vfwisdkjg3czwesi6yqaznvxcz2z5ksqezhsh6ytrc2g2ypszy@wqkr5cgr26vq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Kw2cZIJQIgsw9I28WjOoMPi7eQUD27PM
X-Proofpoint-ORIG-GUID: Kw2cZIJQIgsw9I28WjOoMPi7eQUD27PM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=890 mlxscore=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160103

On 16.12.2024 12:28 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 11:33:30AM +0100, Linus Walleij wrote:
>> On Sun, Dec 15, 2024 at 12:15 PM Barnabás Czémán
>> <barnabas.czeman@mainlining.org> wrote:
>>
>>> This patch series add support for MSM8917 soc with PM8937 and
>>> Xiaomi Redmi 5A (riva).
>>>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> (...)
>>>       dt-bindings: pinctrl: qcom: Add MSM8917 pinctrl
>> (...)
>>>       pinctrl: qcom: Add MSM8917 tlmm pinctrl driver
>>
>> Is it possible for me to apply these two patches in isolation?
> 
> I think so. They have no external dependencies.

Green light!

Konrad

