Return-Path: <linux-gpio+bounces-19013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7044FA91A26
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 13:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF65E4622CD
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 11:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3393D236458;
	Thu, 17 Apr 2025 11:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAvYzxEN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BB7236A7A
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 11:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888286; cv=none; b=FZYuBNrahP6JcdhC8NqtY/upG0VOnTEmkaEWgmNC5HiPZ/TMB2q+++SMualW6tOD8TVOIfn8WJhVGpqazw4GSMUGlVEIbSPSHD8SFFgTCzr99ze99arhg76iPxVXKho/5YyR+2BnA08RWtZZ0l0Cz9REwWcj31FQJ7whI4yzJqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888286; c=relaxed/simple;
	bh=cQFl5PUzH6hg0oQP041Wr6N3dkwwS+iRu/+8WAAEhHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpVf9fI+tXAd0GiKKvQNAVslRw8DF9IMWmknyno4uEljZW2eRpdG5sJ9uosDMgRFX9xEJL+AbAoeLCDGCMwERNtN7chFbuMo/LfVHQloeMxPmlx+VbiKBeDqcSacVci7Pb5Glm69+tZN7X3BCOO8FPB8GQ0SuXFR3MOTB9S1uw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAvYzxEN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5l73d003029
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 11:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQFl5PUzH6hg0oQP041Wr6N3dkwwS+iRu/+8WAAEhHg=; b=JAvYzxEN2qi+MMUi
	ZC1VD7t5J625JEd9CrPq3AAkROFDv7AVAMbvQkO3obP0OSyN5T9Ucmzz5OGPg+4Z
	UXHDA1S+yX2j6xA/0Eu0PNDPmynTwngd0hpDdNMU/y1vuUHOhtdt6w+VoySpxsnl
	XAsxSHSuhnDGRC3s4lXR1skfZ6T0fHlx1QX3K0k6M7Ruw9tyAdVd9OfmpLs103UM
	IzgwJVxmKDOcVGSEZ14f2DbJljZbVF8vgrrHDkResKonzukGlYlzK55OyhK0eH91
	kfd2h57cfjtPI/KieNACUEQGSw/cy+f9j6VrolxIznyDvBMiBqTVs+H0RwTfEbrv
	/UKxcA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk6hgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 11:11:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ead1d6fd54so761906d6.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 04:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744888282; x=1745493082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQFl5PUzH6hg0oQP041Wr6N3dkwwS+iRu/+8WAAEhHg=;
        b=rAv+lkXmi4W9UddIjIuhJkpHMMaiiBygSVfKiI9vbbscHfLFKEeVJxyazJ5ij7lMED
         REnt5PuJwIueAWK5DbrieM0OwKYhkwqpkpSkAlO8nAVUpo2VNlgLkpOcJiMThf9xhzbr
         DNQoGtTmOcFh2ul6lvpXQE4ms42VtEnvw1ZAVdlZGr8d7UcRjq+K6tyujLbJ4+TTUaXZ
         VVRY/ZohpBBtxTomYGNwfKmT+pO1zQ2GqyMwSIe1vO1UUmCZERx+qRLsAhUBug7/9os8
         KXT03oHda8XzTFVkTTYC+YjgSPt60eDleO/ecD7rcWq5pdgpNVAa1ilBaAbh5wdO82Fy
         J+lw==
X-Forwarded-Encrypted: i=1; AJvYcCWijElHPuhabmZeTs5S60QMqcnzQUrP9U8YmaOeNCK5w/+9f411zwtDCVPckV4CNm47JkF40YugIl8h@vger.kernel.org
X-Gm-Message-State: AOJu0YxatwmygsjtWukHGO+H6eaa2kXiUsXOyUe17Bef718Yes+9fnza
	lHZMpdzuyYOVxfQyzcla9ysd+Tx0Qite1dJH+DjmYD28Yv/EkP35T1dAnxWyeuyt163Wegv3JdV
	/v7UtYh2jJdeyDUE8UNQ5Llb88qnCf8nXG3kWrOMhwWRL8zSCA3I+UE8y9GhB
X-Gm-Gg: ASbGncuD7FK3iRba73Vkb4YxL9lt2lZLK/fiBmDGF02z+4kfHPZLpZPzZNw85q7sKRl
	CMOOE9ZZkVx9TcmzNDNu4x0O8+tsJRtGnBMdj0+85inwCY2VTe/FIXtDUv97BClxkV+IN+iH+33
	PfNGEe5Mn+vrRXYWhjptC2pdu3uG94JLzzYj6g9fbeNigb8Qx4So/7oBgt04nPU3/m7njBZL2ZE
	tHYhI5WcfeEQVHXZG9iTu0Sj+hbBtNIDuBWJHCXrFAuB6XQGQuc3Eu/osocxU9uZ6ml/c+NoJoK
	uiDTPcBiEgySpO/7PNyxelRCOH2fLZbdyAox9SUZqA5AZ/64Xordl/JqVgM48NSbJA==
X-Received: by 2002:a05:6214:b11:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f2c10be8bcmr1283186d6.1.1744888282055;
        Thu, 17 Apr 2025 04:11:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5kju+O/dWoPIE9Ybn1kg3pBvJPXA+KWO908qYET4dQsJeQp8XiEZRcojtLSXCqXemg9A1+Q==
X-Received: by 2002:a05:6214:b11:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f2c10be8bcmr1282886d6.1.1744888281656;
        Thu, 17 Apr 2025 04:11:21 -0700 (PDT)
Received: from [192.168.65.58] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd6257bsm278243066b.13.2025.04.17.04.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 04:11:21 -0700 (PDT)
Message-ID: <bfc3247e-16e7-4897-bdbd-dc7d82d45fa3@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 13:11:16 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Dang Huynh <danct12@riseup.net>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-4-1f132e870a49@mainlining.org>
 <f85195a1-f55e-41ea-967d-b758014cba06@oss.qualcomm.com>
 <93ea35691deaa1ff38d229225e26cf41@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <93ea35691deaa1ff38d229225e26cf41@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=6800e1db cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8 a=L7gxQ87vPTAOeZ-rjWYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-GUID: UdbUG2cDn2EJGHAkVoQzl6rDFq-Lo_Nh
X-Proofpoint-ORIG-GUID: UdbUG2cDn2EJGHAkVoQzl6rDFq-Lo_Nh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=716 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170084

On 4/17/25 8:20 AM, barnabas.czeman@mainlining.org wrote:
> On 2025-04-14 22:55, Konrad Dybcio wrote:
>> On 3/15/25 3:57 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---

[...]

>> 0xff is overly broad, please document the existing known speed bins
> There are no speedbins for 8937 gpu. 8940 have but 8940 is not scope of this series.

So it would make sense to either drop them, or fill in the actual
values here

Konrad

