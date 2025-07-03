Return-Path: <linux-gpio+bounces-22721-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C10B9AF7392
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 14:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0F431C4832B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 12:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083B92E6D0D;
	Thu,  3 Jul 2025 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICjvnVjY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9CF27467A
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 12:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544981; cv=none; b=Ouj281gPrtJ9cRCwj0RFwEAG/IYS7WhPeU8rSC4LXmO41YmN+Gq1p2eNTlj/O2iGkradaj2sccsBP3geMAHMsQNFhRBCRXCZ0OCzqqcIRQiiCkKVcvZJ2crgKf/25TgZXAFj/9AfPjCtLZejQvQsp3UYs1DDvEPlj2U2MY7PTOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544981; c=relaxed/simple;
	bh=wqz04Db6LoZ9YrCmc82vhkASDZs0DPlOdRoUbKw44cM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=je4GlpokPoB+t9PpYKFB+/t5bz4bTXWeszdk5Ig3VE+qLNX7YAhfOqDl5yLr3iuUpIInZcK9hZU8w5NwpCSg2Cfyixew9QD0nRK1j6QkY/ZPbWP7ZbhP1ruwQDanLFMh++DDq5SBQgJGZAAt8GxnTtYPsYPRnCJmlkN8ySpuaT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICjvnVjY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5637gYeu028616
	for <linux-gpio@vger.kernel.org>; Thu, 3 Jul 2025 12:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VkKzD5qOAqZJdTLWvOv7/OBA1XDD5p0ax7HN7SWd3zA=; b=ICjvnVjY3rSvxC8H
	Rs3oOg97hLP4jbDcnW3srMrXJhYLCnNFqdph63UBFw9+gHvVoKmQGbaGNlFTluMg
	CGr03xkjJ5VMFrzoeAT6k7P8OAQSV+I7YFvJq2jJERMCpGrbC6g7DM+WRvfEa9FA
	Sr/cE8OdD/9H5q3awv2RBv0HyWaVdbG/lxKRkyjkzKHwu9GQUqIa5rjBt954qZ2C
	PBsq9xKgJYmga65O1ouiAZPrCX8unTLBILn7J+soMoyQgNSxa4OviYq/ehZZelWJ
	ZZpBI/mYiJGOGTPGSySVdr+OKG22UY6xyS1RQKT7PlQdAvR1zUbVpYm3/C/dZ66R
	Aqfmpg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw0guf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 12:16:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d097083cc3so202933385a.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 05:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751544977; x=1752149777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkKzD5qOAqZJdTLWvOv7/OBA1XDD5p0ax7HN7SWd3zA=;
        b=o8K0Fa5XoX0YQ5nxrfDvahQ8L4l9V2bo/tp4jNOHxTea0VTBTB/UP8ogxpt0soyT0J
         7v8n02JIOsDvHzRSYXLKUsFlDw41pmsfKgQWDbmCXMmqE+e+uFWocmfgl6kvBREt1AXu
         T+0HRv3vvrhaUuqIzg64xulRtEm/NdoJbZHMs0eR74+hpXwBViHYi+kdyAcxgMdueq3t
         fr0yUWfxVNx1XyYwKMTolos12pAp4GMAvGhpB8o794trY2Z+n8qmh3y3qn7qHC9hiJK9
         V/hamKjiz9VCV1ljiSni5B7WHOy+j/FxZh38So7rrSNsNG5xIP1ND31OBJl5wSLChzPN
         /biA==
X-Forwarded-Encrypted: i=1; AJvYcCU60EM4yZgoBhKc54pVzFBU5CFmwosmqxqItozkfG2z6bUp4WLUAHFrbXl3Q3A7wv65l6LbMA/Vs3w6@vger.kernel.org
X-Gm-Message-State: AOJu0YzGcfPmjBpOXeg6AIfQrjW6p5L1UqKZJK2G5qWd8Pl1h+tSOaRX
	XsvCQ7WtjDcmX6/UELtIjihgLIlC0I+0M+hWk+1B2H6IjG8Lyunrvglh55YoMuXymIFsEjbEWSC
	LhRKxfTOrvNU7u9Et0itBRXljGA4553XFJ+qCo2o2iw6Un/GHkoqRcxEFhinWhLZD
X-Gm-Gg: ASbGncu27XSlGDkd4G5bZS37+1KSj558LQJxGO5b41JhO0cxEdT78410QSKQ4fTnGxW
	AqPs466fl0+/B+IoNp1siU85Srq4/EQGdcQQ00TL6bDr023poCf3/RdWiuK2dl1pPoGJNuC0KkA
	IopVKGNQTaqO8KWCrRIKwukI5H+rOENnvY9Kufe59ImD4mP2+pY8f4XOGPFlmntnfDb/HaeNDpv
	Zl79hKX633f3JbkuULZUD2I8EV9f8G+lxoPwqrIsJU5Ni2Tx0COtgxCVbOw1+Lp6UbBds8vfNkH
	ELJeUsdot1Y9IrCinsGQxtfivogPigZ9wVozkBCrtTjioUuV5RkUH2nd7pUpK0JwoWl1KEmxVxF
	own+Rgl5C
X-Received: by 2002:a05:620a:4553:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d5d3edaafemr103809485a.2.1751544976979;
        Thu, 03 Jul 2025 05:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUrtibPHvr8N2yWud8azUvDMAXwVyMTTd9CkJd3HPkF5mfJT5kEni5VZ3YyZtkHv1BLI2AFQ==
X-Received: by 2002:a05:620a:4553:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d5d3edaafemr103806385a.2.1751544976513;
        Thu, 03 Jul 2025 05:16:16 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3d0351285sm179677866b.23.2025.07.03.05.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:16:11 -0700 (PDT)
Message-ID: <185e2398-e804-46c6-ba94-44c42cce684c@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 14:16:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] arm64: dts: qcom: qcm6490-idp: Add sound card
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250625082927.31038-1-quic_pkumpatl@quicinc.com>
 <20250625082927.31038-10-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625082927.31038-10-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 50NWZRsmpEZ1zo112HJJLSOjNOqQOWBy
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68667492 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=m2XL-mgSGVCMsbPKemYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 50NWZRsmpEZ1zo112HJJLSOjNOqQOWBy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwMiBTYWx0ZWRfX1ow25EKvBKiZ
 DxGYoWpogeFI/sSEEzy4L2Ni9HrfQDOUYTwRsI6YhQPVrTbLMzqnwHSps3ENP2iusCV3yeRqARB
 EramYpD1mpMvwQl+/YgvX4lDqetemgghj74rwa1h5aNBl/aJzFdCoobooXqDn2DZKaWa99UHA9r
 OFHeBhGFjEw0qpV+LDMat105GtaCfLkBG6pB4MqGxLwi+nBpbSv4Kbd1di6njlzQxg3VPXvZOv8
 Vap35Rl1owPN39RkZfP9HAZcpNGoMMCCCIXlBMQIRKIJBeASHDXp6NNko5xJs7z8n+ahS7hIAwQ
 VwyHr66My2/lLw5TShCMxdyfmJYbRurab+gJ4TuACRLcrMXEMeF89qzZctNETwp0ZY1USbOejpy
 44xOXhQEUWxBELYjaq8LpNoWCtyG/cJIf6aehjtCa2+2tuNKPfqJBGEPtIqPxlUnBf/n04pF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=836 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030102



On 25-Jun-25 10:29, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers,
> digital on-board mics along with wcd9370 headset playabck and record.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

