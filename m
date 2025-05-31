Return-Path: <linux-gpio+bounces-20832-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A343AC9C4B
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 20:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53C7E16E4AD
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 18:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F49F19D89B;
	Sat, 31 May 2025 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjkU/YuU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E5E12DD95
	for <linux-gpio@vger.kernel.org>; Sat, 31 May 2025 18:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748716330; cv=none; b=nFm3nDEifCG81VeC/6JL980BHVFbCvrCxsBGVFiw/1uMr1+6RiWapiHVNm+evPI5U/O8gMtNZTofy/1v+JU104SS4UHD4GQS/Qc2/AXV711Uq/L5M8G4TvxzFt7mFl/TSXbztlnRXF6FhVT6LAVBDtElZ39vh1C53LR4ApWDAVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748716330; c=relaxed/simple;
	bh=PiF6hqUws/uXK2z2qLpJr3JuiGcUxwlTUjPFuJp5SPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJrn3414rgwNS2kUe6vQgCICk0qnyN8aqim3LQ5iNxw1WbJzDbr350X7WIROLkjfhdC1zryD2SDwt0TbYuzH74kbHdoyL4YpCREmixFbKZgEKGSMapo2ReGZZxlOWZmrWUuxo/c7XX7YPt7G8FK0H/a0dBlTw4K81cJKsIEJfxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjkU/YuU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VINaSU016680
	for <linux-gpio@vger.kernel.org>; Sat, 31 May 2025 18:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZHCTS02b52liYmEagWUc7peB8KjJ4JVv3poNupxDf3M=; b=SjkU/YuU2tgu9LAc
	lpXpv+zCBHDyUnast/fSqKYDa1PdEFc3KcOPd4NGYFlWIWlBSEy1/13XQwqVGbgX
	wGfch5cuXzyrHHdj2i6ULQJrSfkZ845+Q95wQHu9EPxhBMencNNVTzIu3sFpD+q+
	yc3gfXM7vH9galL04CfSLwF/j6hlKMnVKr/wgYXzFIJr64GpF/vs7kqaZEL8FRiM
	9p5H/SekzhMDBnDFgsY3GW9XIrVFJH3iW/K7HJAVX2DKEy6+rNu3SaExMD6l94mW
	mrvVR4acb2nY6pr4RlorNreZn6fZd0jjbEjqkdPfq/Cr2SJrrat3dUXqAZUqXx6/
	PIWDFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytm696ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 31 May 2025 18:32:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09a3b806aso66651485a.0
        for <linux-gpio@vger.kernel.org>; Sat, 31 May 2025 11:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748716327; x=1749321127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHCTS02b52liYmEagWUc7peB8KjJ4JVv3poNupxDf3M=;
        b=CeghYza7Y8iJZsdR7+noCmJrAqh/rcoBPsSSGCUWWLoVYRYKnomJ13Af77/rwNxwPI
         Ww9GD+0aPpwU33FyShmGerY1iJZOsTbFIExY2DLl+BRIdtVccXQVNr4Qie7uXsEKyxpe
         bRL2bvX6vAxy9Qzlc9lV29qC5Wb1GSXDDjtYM4Mx6d9FuZUyWSFgyReTMpvVjGFasgZz
         PLJLP5udUJ/hQ+bxOEY57aYghZYg3QM3PiWcpUHBAwFzwOJ8vgdxds3gdFjgvRxbs/hV
         +qUxjswmXvH04iXawPJWKdR+8grphTxZmgYH1hnUvDisLf6Wkz4Scq40e4R4F9sB8iOx
         C/8w==
X-Forwarded-Encrypted: i=1; AJvYcCWFjM1NkwrxDG2tFjyuaC3gZ0KpDE8zYv8EQ0domSaHunPQ9mNC8jKRgJKEwtXd8MRK++D0jPSIekO6@vger.kernel.org
X-Gm-Message-State: AOJu0YxSkvz5cgJIY7mx5R6lMM6txOVjhC0GX3Cxn/6+lpoM8mBIHfsY
	kz6CRgl74xhEdgBeSTgiQccfUJUQFZiMnty/8y1Va5PdzW5Eppl0OmaQUqjFUFasvTAleFGfOGA
	d7y4yEiHttep+aC6I5jvrkL/usRZdvUXCiuwpcbr7q+HBdyWDJJTcqFgW0qBjYNzN
X-Gm-Gg: ASbGncskgmwwUZQINiRyFP3YZViABVHFYwwfjKtt1KOfZom3rZ8dmZnXatz7lpVeELV
	61RSHq1qasetK9yjA93G+QK7A7XpRWIUZpwnTAqN5827Of5JC5ZvYbJI7KNdpp26vm06FzMGidi
	hqnMul5h4Tztq6wJ5wbvS2TsbJ984g2bzRewLQf8tvXnyX4O5NGRn5M28+gmW5V0d1LVLa/wy2y
	RbaUj0UWgs96wUdp1Q+TcDEpWyc1T26tmrcJJdahsyAULcV8/7lC4QgMvWFXn0kqUlkE0tzMszl
	+hgGGpDO4c8VRLGzDLxx5GY9z9DNnWPrIu6g2njS1hKhwD+S1phQ22LNqSE+6xqiPw==
X-Received: by 2002:a05:620a:44c1:b0:7ca:d396:1460 with SMTP id af79cd13be357-7d0a3e12576mr385234285a.14.1748716327480;
        Sat, 31 May 2025 11:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKHQuo7PTOJi1tD+3r4vH4UDMjXZMCtq0HBjSd2NTJ1pkGxJ8G662rVF3hH5fenX9J6ZKNqg==
X-Received: by 2002:a05:620a:44c1:b0:7ca:d396:1460 with SMTP id af79cd13be357-7d0a3e12576mr385232685a.14.1748716327088;
        Sat, 31 May 2025 11:32:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82d773sm534600666b.61.2025.05.31.11.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 11:32:06 -0700 (PDT)
Message-ID: <14492412-d340-4c9f-9597-39219712c0f5@oss.qualcomm.com>
Date: Sat, 31 May 2025 20:32:03 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] arm64: dts: qcom: sc7280: Add WSA SoundWire and
 LPASS support
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
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-4-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250527111227.2318021-4-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDE2OSBTYWx0ZWRfX5MTq/mFm4GeO
 hefm1qQzSrd/+3ok+cekk3UW/TvDC06jqqUyH2DI46QcZ04r5iti36O0Ev2fbGjaC1jZMGubjDm
 OS+CI/Jh3uRpZncjRAwjphds9md3gqV/VuipblshznYu0aHY7XOclMvDJPwTqaZi4Dcbb4rphlj
 DuY4np3ra+w1FnDx1yORgGtQDKuLPzFm8o6k8OSaKUzy1Tfxx+qR9UFci/GyK98Zhenz7K1ptmY
 FQHEvdVpnFupJxDNcpuBeY8oRFuWaa3SwAs/UP7L8eUJvuGVfpO5HBvgWP2ZWwNJaQyeU/NraZo
 BHQiR9cYEoyi+ZtWGO2sY0gItfrbjwU+N8RyN/p6/t83WLB6wdqakad8ARP+YKr2TeFpd/sKd7I
 zMoO5NFZixcDfe1wGUCWZZaNjUQ346XotRo26oyC6qpV3i8kZpUEI1VVtdUblgZ4YegPZsf7
X-Authority-Analysis: v=2.4 cv=EOIG00ZC c=1 sm=1 tr=0 ts=683b4b28 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=RWuSP1-prhlrjYyZVaYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zeqVVqHl-AZjFDvYMxDR6a1jUS6vm6hq
X-Proofpoint-ORIG-GUID: zeqVVqHl-AZjFDvYMxDR6a1jUS6vm6hq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=926 adultscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505310169

On 5/27/25 1:12 PM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add WSA LPASS macro Codec along with SoundWire controller.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

[...]

> +		swr2: soundwire@3250000 {
> +			compatible = "qcom,soundwire-v1.6.0";
> +			reg = <0x0 0x03250000 0x0 0x2000>;

0x10_000 for size

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

