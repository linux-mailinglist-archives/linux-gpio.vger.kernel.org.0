Return-Path: <linux-gpio+bounces-30256-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 493E3D022FF
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 11:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFDE630DC8F4
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 10:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5153445F15;
	Thu,  8 Jan 2026 09:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X0x1Vk5I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b4akn6RH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE57543FD32
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 09:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864607; cv=none; b=dap3czDZ0Gl4B7dEy+ofxcKGaorv/0v9MYclPHY7UfMKJ+ZQR2dDDvNHTy/xc+lKrDsz9us1a/Sbhvs2YaFrQmNvh4iJQqL67jbJmvWOMTmuAner8KGViZZ7P6+Y+xjpWMFF1HIn1klt057qI+6rGU+qId/0nSDCbvO91YnoSKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864607; c=relaxed/simple;
	bh=Q3UjGBJ+gd1W+HYENu/Pc2Sn5F+OBztRRngBuogIDhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IW0QRensyV8wYRseevn6k0/1vEUN39qQPlSwJoe5Uos9aYRELX3T2Oq/rdzCln6DE6z7r6RDLxJ6UmEvLbc6Sg6Mcu1cHpt5uTpE0nnlZP5rMX5RY1oRdmGjhJJEmqQX/WxG7Sx8L836IzjHwEdQLQgVflRjJ/P/sUn26jnpiwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X0x1Vk5I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b4akn6RH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60872L5V1496310
	for <linux-gpio@vger.kernel.org>; Thu, 8 Jan 2026 09:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MBX2Rlp0vP8KamvbjCr9HnnvFpdO76mb8cSGwyGZKNA=; b=X0x1Vk5IQqaaeDc+
	jIl2KMfUtGNadKfoBTyW9LocfiJMIc0axq3GebkB6Rt0c80ugoKF7shywl48/3kM
	iKjJMzNNq86brLcak0QwGW5TyjgRsRUQQRljkb2dhFtu1uwgY6/8mn8jRPYkZ1g5
	FtZfvEIdOPT1cOC3fj61XEU9d5m2XacXBamyxsAFDHxP7kWD55ht7FQTw1bCwZ1M
	1CYHkl0MY8qq2vYS63RN9Ykg0L1lrxhQJG9QrB5Sv9RpzWKcPVQSHpUvX8TZhGZ8
	54bKwHcMdOJlJJLIvInzlXBZJ4zxu6z0soxgDfFaqRZBQtgvHTbY5sxus4sEGeXM
	JmHrJQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj7ua8e3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 09:29:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-888881a1cf7so5335126d6.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 01:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767864596; x=1768469396; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBX2Rlp0vP8KamvbjCr9HnnvFpdO76mb8cSGwyGZKNA=;
        b=b4akn6RHh4w4v+TIG0pdkfT3mMmG4gM5ApxfWEUKoUsvETLr9Ca7yZlxrv6rWOVUr3
         aV3VYjBFoUaKlQFn+lp6rHGeXKZF9fH4qfqc4hPUVfh126ma/wycI7Iyn++WNCl7g6MP
         avSHuxT3HUwQdwJcBBEg0ZuNOGEJjuTzbwaS11Geah1q3+8bSCOz65M33CPCT6QAUD4c
         +8q9ojbjJDg4+p3g9aWwK2tnTq7MO+Qz1+rDbmaCVVeEGKzMC7GcmbxGhzYYhmlAZ1Yo
         ozSgWAQHE+O1GiEGvqJ8uIFzAndcOfytCNapn0ec0UC6r/83AjeByruN8GV8ExYcc8D2
         9jYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864596; x=1768469396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBX2Rlp0vP8KamvbjCr9HnnvFpdO76mb8cSGwyGZKNA=;
        b=WUEXoj6ZZWCz5g7Mhp+wmniRrZD6H6ry264blByk474S2xQTz1x+XltqmVOTWEkQVj
         XAjJ4hG6rgq0kU7aldHLe4OSqb5+OTxYJP9Ke84hHEFoeLLA9VZyaK9kBSgesqpb70+0
         uy1CSobwT1NrpUiKmXQw6LRqpS4sEmg2bWL8NBbzg/LjV1Je1ELy9ChDypgy63P3rW6Z
         G8VdGYzIGHRLP10pgWRRnQlxPI+sQBBlNPyp2ZXm6CF3NUFoU1dfOeb/5C18T1kCZ8fi
         IdzY4MWVCOOn1q1ZTLIsSGUXR/6fUeL6yXFEh8+9cvtkdHUf6sIe1R9kws/eYuibfAiA
         uu+w==
X-Forwarded-Encrypted: i=1; AJvYcCW0/+VgeUXIxO0+yc9OzxqFrjhIHF2yA+USVguarX9N95B1IHBTpT58F4F9m2L2g+lFIg+E6BVbghLD@vger.kernel.org
X-Gm-Message-State: AOJu0YxkS93+oOLdeVA6awDEGtEYrETaYR4pc4WHcJb5RWHNsatDf3pu
	EK2Mpqt5NPIQIxG4U4O7WF4MjPeG2d2j3fyzgoZV8hsA07q9qcdS0qMw7UBnrMFXlj2WDZq7u8N
	nS75UkkD1laJjnbB0yeLy0TRW8bNkNfre9Vqe0swJlhK/TY/34JjbOUlHDQlQdp3D
X-Gm-Gg: AY/fxX4Fd67P4zdlhKFeYjgsZvESTrKqURAtRoJPjWG3K+IlrDAUd5DxePGzzD8V8jO
	fWdwTlFHpgEJqSC6cu9N1mHNhr7pOgdKkfP5jJqesUSMX9LpfzoSb+6Xvn02BsPGHa8VfsrxsFY
	bFXlEJOqR+Y/eYDUC7a5U1KJRTBTbQm0TcNNkI4zpbqRLOMtQyng6bJvy9j/3Apz46PlUq6TLWy
	J76T+DjUgL3GZqgegeUNzolSWCkhKrKuw7HRRIqKjZRWfRuVdtMQ2x9SV0Bxq51GLUj89DbBGJQ
	dFYNSOhN9Fch2ZQ2MXV1qaB+hcys99US/fOK8Qwv6fQNVIAdAuVMbn4h0fiwaM1ZO79EWg6Tfjy
	pZaL+T99hcAYKWUXplApcdwRIeiT8Oxbb4iDKwbFtPdWCcu91UwJ9riCpM2fa1rHwLCI=
X-Received: by 2002:a05:622a:143:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4ffb4a9a78bmr55886481cf.10.1767864596122;
        Thu, 08 Jan 2026 01:29:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCxFAviDmUzwHekCFADRtQYZCQJZlxVO/OkZM//n7Kd1TZaAtX2ZL+zp1lC9CgvTfiUiqZIA==
X-Received: by 2002:a05:622a:143:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4ffb4a9a78bmr55886371cf.10.1767864595668;
        Thu, 08 Jan 2026 01:29:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c4484sm7141571a12.7.2026.01.08.01.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:29:54 -0800 (PST)
Message-ID: <a1905df6-5054-4ee2-a8fb-d130f42faa4a@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:29:52 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sa8775p-lpass-lpi: Add SA8775P
 LPASS pinctrl
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260107192007.500995-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107192007.500995-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX8zUeZeFazuwy
 +HAUpuuv83LaIBtluluT4y2edGue3Ox7k0/5iJpi3Ec17c1JPDmffHnOyh9ejw3d9xnhinaQSHl
 ePzpMRK3MjPaaXxHvczt0ZYHZpecOimxCVNN5RTc2QJbOCbBTf3wQiWaNp2VGG91vxfyPVuC2b2
 Yu9xSEvfZG39MZsNNY+/g85TopUkzYTcmLTCPaKVFq5bxVEh++Wu9/pZxx1Yzc0WKhXQR0bJt+b
 uHUH8g1/gY/ckmGVPMfQ/jvL2B+/1b3tm9z8lLWTQYnxitY66dRj/7JkTjV5rzo2pn4/Ymt4CdU
 Zh9Xlo3tal0Jw+wVqQrRJwBccDKVUL8QxucDUyy52qVkQGYvZY3aAfG/XX9uBSh53jeP3+sWGMK
 IMJD7szNTF5GvHnP0y9eBKPDgJvvA6PUkEsOQ0bhSXOYaEQ806EoZDmytKnYtbWBnOxF21POKq4
 48uBemcpVfG5KVVh2bQ==
X-Proofpoint-GUID: RvWWnQ1tsMuCPHPc3-8IQQ0rww4EnqC4
X-Proofpoint-ORIG-GUID: RvWWnQ1tsMuCPHPc3-8IQQ0rww4EnqC4
X-Authority-Analysis: v=2.4 cv=XMM9iAhE c=1 sm=1 tr=0 ts=695f7914 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=h_bAiBQL0yDKBMXIJFEA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080062

On 1/7/26 8:20 PM, Mohammad Rafi Shaik wrote:
> Add pin control support for Low Power Audio SubSystem (LPASS)
> of Qualcomm SA8775P SoC.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


