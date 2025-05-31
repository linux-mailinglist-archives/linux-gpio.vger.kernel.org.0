Return-Path: <linux-gpio+bounces-20831-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0A2AC9C46
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 20:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C01A67AC07F
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 18:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A58719DF40;
	Sat, 31 May 2025 18:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOt1W4ok"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FB5199FD0
	for <linux-gpio@vger.kernel.org>; Sat, 31 May 2025 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748716069; cv=none; b=bhisE2VPW7GWIMLhMORLgDTWj0cX2GZg6zWAV4ElgeLEtnBaKpecvZfcUXFXuibfKhrL4kDsaf1Rs4x/bj2/jPehcTsgiXCuhHnZgoWZRvb3HaWnDhweMWIoo0v6cODDQ3L/pmPKot84ZqCaO/yJ5Wyacc4nvx83RSSMixSpjQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748716069; c=relaxed/simple;
	bh=QVyTy39kGa7O/ePiyt+9nmFnLXJK/m+e+8pa1txDyEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bP9EklFd0AqqG/myD1VZZ5XsecFD17ndIqSBNlrXLRcOPGW5GRkO64piz8sBEaopmMOqlCIHXTdTS/hbdfPhlbpdENEiXc48vNiIsD/pTVwoZCazaY3SEPrT7BNGK8rzMBdsOtk5/k+3VFIjP6gyvu93oQXg684sJXw1Tbt5V74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOt1W4ok; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VI8QPo012050
	for <linux-gpio@vger.kernel.org>; Sat, 31 May 2025 18:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNLoxJaeNa7H9bgjtofmrjyfeoUO0fEK6F2yize1zNw=; b=LOt1W4okxakbYLOA
	+Wk4LRUaEH5afMT2rxrcAR0ehLnk0BQmTiKh3x3YqPwgqnsXSToeEzfR9wHASoHp
	KUgabv5mkXnIK/LodEMYUssWg/PgXv7ceS9crjh/KoeMdFFCIZ9UcA7YL6tjUoU6
	92YSDS76VRgKVeUlgZ1CPNtd8z/EUGR4lWACPptAgMZb5L75eJsRw13FI7GhaRyx
	oz8kITxX6ysSpQPFfXBnRra0rXELn3rs3ia53CKwu03mo1QxEMSAf8OfkmqIpMzc
	DyTWrnfQUGOOgIXDlXX3uIZPmEpaj54KaGnxUB0OPuDyc2R+/R/aYVFON+8zAO6+
	9mBQKw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytj0s5sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 31 May 2025 18:27:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a42e9c8577so8285521cf.0
        for <linux-gpio@vger.kernel.org>; Sat, 31 May 2025 11:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748716059; x=1749320859;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dNLoxJaeNa7H9bgjtofmrjyfeoUO0fEK6F2yize1zNw=;
        b=QJ0pC50ATlL9Sbfrb35feHOmgvAd/0Hd3fxi53eDrNW5jEViYaybApYZx/aV7gRBye
         nFbGZGTbCfzS5zAqb+YUuVkGrD3tCwMJI7l1TQjkUxEBKimaPbCtlCQOgPYXXDs7Hm/d
         QEMEvlIe2/RMzx7A7vEMNpCHc11x5WaDEoei/y6xc8Sm/uu83D8srBTq6+GrPK1lvWlV
         izf2dsgLSnjDvsDYeNb/HDW8QIcCc6eNuHBiOVqrUI4uYIlVwRPRFbzzdvkF7LalANom
         onINGS9Lq5RXXAAnsxBGkoVaKWd3BH+GRpTa+cGvfAIHbEY45+lkCxiUypZjs+fNhDJg
         1D4g==
X-Forwarded-Encrypted: i=1; AJvYcCVWQevHFZM8xA+wnf9SBMcrcoZOO42apJlYz8OkonsV/WrEPJrZXCC4BXDWRbAj4jWHHDm20tKZyIFB@vger.kernel.org
X-Gm-Message-State: AOJu0YytYn6cr2d+ECYULSD10Gp8suZ5yjQlfjdUZx4Uo/GfBEs5co9h
	eU5YxBvQz/mn5AamkE2Zh0TxRZWwunGF1pqqrdhm6PAzwVIAEGwXtEW3CSujVchmn8inXcoEAdq
	XEKx6s0t1nLZ6NFh+qp4Q6LshFbY76GiQyjT7ixDzLDb0h2tFCR35RAsuwg6I3Kny
X-Gm-Gg: ASbGnctedGuxyVyEzrrnYQMS1yYMUJat6A1JDJ6nK+fBxSYcVZ0lwy3/mGKxyS+H8H/
	88gqDW2CoddNFneQai8l4DmtlzaamJMmU7fwRCnOdtNlxXFkcbmpdXYK+BGUxCtPJsi1r7W8PsV
	1UjFkjxqT2iFj1WDFBYRY76CXrk0TjOl3vMoH9ocPhF1E+DDC8d8w4/siW2HAnZRO8xGHXdcsp3
	7jaOiia1wS7ZLht15deglY3ht2i0Dqc6dMpYPDx1+OuIE3O4RYLz2cwJILwaGsECVDBWbSeVG/h
	eyMUXe1cBC7KfbL7dhh7uphpO7Ldd9UOAKBJ8al7VxMikgy8dKxKbFcttRyKfOtGFQ==
X-Received: by 2002:a05:620a:298c:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7d0a3d775a0mr413429385a.2.1748716059009;
        Sat, 31 May 2025 11:27:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4okjwDO7D+IbmXbi6WJ92L36mIWN1ZbbjDie9mCBjaikBKTLN4+hEu+tJwMEbwza5FLtwWA==
X-Received: by 2002:a05:620a:298c:b0:7c0:cc94:46c4 with SMTP id af79cd13be357-7d0a3d775a0mr413428085a.2.1748716058574;
        Sat, 31 May 2025 11:27:38 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fef7dsm530456866b.6.2025.05.31.11.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 11:27:37 -0700 (PDT)
Message-ID: <d3ee0492-afca-471f-9dc3-456a94bfa355@oss.qualcomm.com>
Date: Sat, 31 May 2025 20:27:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] arm64: dts: qcom: qcs6490-audioreach: Modify LPASS
 macros clock settings for audioreach
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
 <20250527111227.2318021-5-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250527111227.2318021-5-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDE2OCBTYWx0ZWRfX12Iapek5S67S
 hvt3BLYRfKB5r9kt+onT9HYIKVDvpaZT3rPZHU2+z6Ia3ee+KqCDJ5mZqLfk6rCWJi+QJO9Z6Vd
 p/jZcGpLb8X1mkepZ87ZCb9E7Th2qh8+UIBHUOdcYJrwKMb8lywZpez+xsPRaoCZdk/v/KhkRbW
 NnErC744eXQXgHPpudEcRv/BERoheWWT7VSKjz3U7dnJbkwB3vT+e8h4uVKEL3Bpe8tJnGqiRwu
 jo66QhWrKjxrDp0alPU7lRdIYGLtWaAPL4Eedq/KAsUBy+eB85witgRA3tdxQfVkNfsBKoTH/fI
 YwpCfpuNeXLcGdmnHXPXHi5Cb10QqYBd5yWcB+o8mLEuhQARhkDjRjMRHYiMiOmAY38YuexnqvJ
 vgQYDvS8srdS8yDqWRLgw7J9wDD/wCjdUKuvBLqlSddiGYKFPfe4DAz6rArd9QkqB7/0AaVo
X-Proofpoint-GUID: HzSqMipdrFsGg9cQfEEBz0fAocRqfB1g
X-Proofpoint-ORIG-GUID: HzSqMipdrFsGg9cQfEEBz0fAocRqfB1g
X-Authority-Analysis: v=2.4 cv=dc+A3WXe c=1 sm=1 tr=0 ts=683b4a1b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=IZQIRLw8iM99TnyeTF4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxlogscore=897 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505310168

On 5/27/25 1:12 PM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Modify and enable WSA, VA, RX and TX lpass macros and lpass_tlmm clock
> settings. For audioreach solution mclk, npl and fsgen clocks are enabled
> through the q6prm clock driver.
> 
> For qcs6490 RX drives clk from TX CORE which is mandated from DSP side,
> Unlike dedicated core clocks. Core TX clk is used for both RX and
> WSA as per DSP recommendations.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

