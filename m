Return-Path: <linux-gpio+bounces-24586-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AE7B2D219
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 04:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ADD51C21F98
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 02:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815CD24A067;
	Wed, 20 Aug 2025 02:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nvNMWxUn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90DA220F38
	for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 02:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755658548; cv=none; b=Uh6CQQk4zfpCZWdJQu3kmBiEDwyV8a3E/U11H3nLG/rpMeuxSzlDIOOjQjowksvPIVczo7FwTKHC00uGFo2KzwFZ4rgDvIcTyAQmxqOEcG63UW0RbSoWop5+Ny+9WtEg0kV9Ein1by/qkS1w2fXUo5Yc5iBdhr+o3dH5hsCGtpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755658548; c=relaxed/simple;
	bh=xU/2aA2D1MSytR7qACtCUwX9lfnjaVK8VsLwR69D1T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XgOFo9e25b1se+U0AaBwMKoA9DakXqW3K+w2jtSbD6f7eMwpqlSumicdVXbv5NAZ4+UTtLrIvYnYgzk7GRLDmQRrKSOsFQ2NL5geM+Pt+bUNpdW5j9EE3eaefnW4VnjHHGME9BjYSi6AbyieOR5UHAYn+zikEiL56oSS6L8frP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nvNMWxUn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1onBx005777
	for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 02:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cDjR+QnaSGppNI8qcVMUT2dKaPtQ/kTLxQK50E6D+fw=; b=nvNMWxUnlvBXLmiu
	5T41vztnuyL6NBCpJ5MYhcDnR2gorbOWJ3jHboMctCHqggEChYhBLVjjv3vSBkRl
	wbnj7CueIRrjm4XVz682M2k3KFJEtHxx9CKBk9Pz9bRHQFCTks3d/5ewXH0f4tah
	ePyZx1/FYmwuzum5tnGeoy0ScGSoewAY+l1KKcQu5M0Tq6IcKW4P3MvKFRCpMmlR
	OODD6IpnOSdjXiWv7v9M1mKV10CCh2MzWxL0LGyUD/vrT7OcfWignkUET24dFDZ7
	hiqS8hoNK4K+vSxHiMQWkcjknH8F8oJJL1EFfesfaRuAzAc9RnC4tkzZa9/aMnT0
	r6EqBg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cg4jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 02:55:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-244581953b8so72964455ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 19:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755658545; x=1756263345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDjR+QnaSGppNI8qcVMUT2dKaPtQ/kTLxQK50E6D+fw=;
        b=pFl/cc+XkTScATgiHIe5Rh545s4O7BogjA3gh7FsIQjW1zNGhDDz6RF8nQz5X0Alkc
         IkczzPksk7ZbGov6CSQ4DO2iYTGV4t0c2CdbhBc+67prwOcg939H4OVOJdZSLAgL+3u+
         cgxdTkM+9FqVEaBgm31xOhx0IyBjXVlaWneTivtZNAsQ1eBgiIc5jfvFZwBqU9r0y/cr
         nFCYPpDYuH/Lnok7Ipd7JEoTdjzLB1ilEuulcxHLFog/RzIh2BAL0txQ4cXFbRBcC/Gw
         rvczG2DNev3rynhXNiwSmrRtsGeBzhXxhDZTwatn0PUw0g3fj1ymo2lDe5M0zAZOmKPv
         wuXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvXciuPDroiWEZTWY+WznCofyJHuqghY2m4ZyGgk+Vaaysx/9l9ptPgAmvh9bvqleIb3YE28H2nkFt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzl4813jA9C2bNl+I2vn2l/lpHycmTz1TVp7anadDFyu52ohLk
	BIkOVwmy5ws83EyxFZHAvGtIv3P4Iqyq3EwZZHU3A0+zsKsAdCZjzNWrGqUgh9yEWTS1WjNlZPV
	M/+0nQOBNWpdMQmQp20AdwrU0f0ufCbgtYI49iPh7qkm97CzWJJ9cyc6ex0FdFKsk
X-Gm-Gg: ASbGncuRSXQ43zqXP6DSdY/BqSOzNbUcUSssPtdBDACGoCQy9WV8uiMP1KuEDywBWeT
	nGO7+sm5p+8ThX/ZrwvCmS9Lrr3KiSMcw4nLRmZF+B6GkLpQIyGwU24YjhtLLOd2zSckZwuDTjf
	OwviR0CbtDcO9gW0j/8GFNkodyXYuQPW3KWhLm4cISbzxiMDUsoFw6XBv+wN8UmbcY8T6rGLGL3
	lq00w/XtMRstw5DhOrfk4sFjOeqkOfJuDoXDPbcWYmrjDk3M4yEGeoZxPJ1SPs6TQNBS9JSqjrK
	jNtT0QG1qL/r/+XOjZxWY3BZNavjruTl0YD7a38TBcTc82fpMhUwULKdoELyGPPj3pgu9z/Q4U7
	UITOejz6te+aGDSnY0Q+n3Ki2gK7AKKiTi9w=
X-Received: by 2002:a17:902:e743:b0:242:9bc4:f1ca with SMTP id d9443c01a7336-245ef2a827emr12434365ad.57.1755658545036;
        Tue, 19 Aug 2025 19:55:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYWiwV5y8RHJF84lWSVJjKu3Owq0+l/8s5e+spsF//U1keVzXap3hJwWNCadNua0rlA41efg==
X-Received: by 2002:a17:902:e743:b0:242:9bc4:f1ca with SMTP id d9443c01a7336-245ef2a827emr12434095ad.57.1755658544591;
        Tue, 19 Aug 2025 19:55:44 -0700 (PDT)
Received: from [10.249.23.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4f7b77sm11170125ad.117.2025.08.19.19.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 19:55:44 -0700 (PDT)
Message-ID: <aae972ca-5b8f-4329-ab32-12da1522e01b@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 10:55:38 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: sx150x: Make the driver tristate
To: Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com, kernel@oss.qualcomm.com
References: <20250818-modularize-sx150x-gpio-expander-v1-0-c2a027200fed@oss.qualcomm.com>
 <20250818-modularize-sx150x-gpio-expander-v1-1-c2a027200fed@oss.qualcomm.com>
 <CACRpkdaeAqD=mpG4y16CPKwJ=pjATY9TxeRnXR9abziCOQb-0Q@mail.gmail.com>
Content-Language: en-US
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
In-Reply-To: <CACRpkdaeAqD=mpG4y16CPKwJ=pjATY9TxeRnXR9abziCOQb-0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YeUnYPZTMwCStzdnyJvtswVZ-CqyTnFc
X-Proofpoint-ORIG-GUID: YeUnYPZTMwCStzdnyJvtswVZ-CqyTnFc
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a53932 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=UVvxqbSGffHEz0aJwqgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXwBTZeHepXNvZ
 u3pGQ/ALwAVj0IYWvFHJ9zonKLhe+RRY+qlwhqN8BDkOP/NN/mPI64irSOzeE4+XNHyDi1S+XNg
 tTHixbnsQCUdeQrOgu9X0sKIT+PonKADmSqu5EULItRzmN4mUd0bo2XVy627T54YRbw94fTkATf
 TNJIyI/ICGCcac68v6SWMBxGhTdgnsAZITe0vZm53znGjkT2otlGmnhvrF4Qh1aEfjj7QiOmck6
 OIVZCEjFWPDUrwOQDgFrcJkrLtK6z17CnanXBeoEKUdUaBvPYF8A0vE4i+PIUwWXLVUKLkE26DF
 0M6cmy2sobq2iqBRVdD5P/Gq1sWRyUkA5XyP7DWs+0fHNBVo/6ZzSvPU45FkV5KZmaPNtZet5f0
 195rrYO0gPTGBJMgRMLJyjS6r0laNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/19/2025 8:55 PM, Linus Walleij wrote:
> On Mon, Aug 18, 2025 at 6:41 AM Fange Zhang
> <fange.zhang@oss.qualcomm.com> wrote:
> 
>> Set PINCTRL_SX150X config option as a tristate and add
>> MODULE_DEVICE_TABLE()/MODULE_LICENSE() to export appropriate information.
>>
>> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
> 
> Fair enough!
> 
> This patch 1/2 applied to the pinctrl tree.

Thanks

> 
> Please funnel patch 2/2 through the SoC tree.

Hi Bjorn, Konrad,

Would it be acceptable to include this defconfig change, or is there a 
preferred process I should follow to get it reviewed and accepted?

Thanks,
Fange Zhang

> 
>> subsys_initcall(sx150x_init
> 
> I seriously wonder about this. It feels like this driver should
> be a pure module_init() device. But other users may disagree.
> 
> Yours,
> Linus Walleij


