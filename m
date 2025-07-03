Return-Path: <linux-gpio+bounces-22720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D5DAF7374
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 14:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87CF57AAE90
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 12:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F292E4997;
	Thu,  3 Jul 2025 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4UhgkLL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0122E3382
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544880; cv=none; b=LrcwZGCClIpgwFQUHJdjLyLhDSsMA1OYGw889lmBzna5okY7y7IYQS6nPlRH66OH+f68Yia+4oZLShFVsVtXs2kc1LK4RyOhKn/LaqWX+yXksTIhs0EzpMuOS5OXc2P921e83aowG7lMPHji0dvA0O2PPT1HQ3GJgCVJGr0wo3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544880; c=relaxed/simple;
	bh=NxTRFXEOSM97xS6sYUrK3OZV1E+9Shcf60A8QqXUvPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HJ586iDFjOSpVP4lnr86bRBzsPMuWmhwPoI6AZ1KNGs1/kKd/9qj/XhPFOmuDzIikP6zGzvBf5bt2f/CQ1WRev4KEMn5R9sFtCLAwQoLDcLFXxetKQzjMHhRK8XwWZmkxo05jfxJUbIj1Y++lka15DeNeYhbjbTDqEy4RVmSO60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4UhgkLL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5638aWN2022019
	for <linux-gpio@vger.kernel.org>; Thu, 3 Jul 2025 12:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h2x3WpVgowQyzY4em9pyKWoaGXSc06FpOT7YW7pB1lw=; b=g4UhgkLLr1VlwHfN
	wVL7Bj3Q5Nn7x1YdMiQ8oMgKdzy6ldIZ6NRpj2gkV+iNalwLwG7i9fdK4T7vngAn
	wACxt2VbL9ruvTNdep6qvs+C0Y2RwbjWgzrQ6AiDC2aWbgIZgsybjlq5ghkSwJ5D
	ncPDMQpGvB4pn4WB59CTmF7PVflGFuFnyRI7ZvwLMOAb40j3D7WkFBl1+G29gKFD
	F+zBuhoCfuiIioBvCay5n1p9XXk0tRBjKx5We1kWHZLsS5E3pZfoGhqackEMXGYB
	qfTtkbeSZ9DUUKJcdqlTzPmpX9a/b4hg+ZFQjUcGMg6cqePIirVa9NYOa0qqHBJh
	KJ4iMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxrfc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 12:14:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d094e04aa4so234018585a.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 05:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751544877; x=1752149677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2x3WpVgowQyzY4em9pyKWoaGXSc06FpOT7YW7pB1lw=;
        b=tuXGijE9FwFOMBbeo5TKOGzLdY/1PTxF5M/vnqbyXa0XCk6CvgF+1yD3FMKLOht9zh
         6igldM6YRtX0raJuUmhOYOADQjVi6Zc60LozM342ipaLHWMwOa6EiRyUlNxofCIwP0A6
         xhRrjr2NX6oESTVqIQRuk+PSEFlGbtMwqhiICCZMjQuFY9L1+QBAS9z2ln+IUrR9dRT4
         Cx+paGc9iUJpCpod1Lvt7jMhBri3IVx41KeIQX0b2sb++iyAzA3bm3/WiLh4Ai2IJ6Gs
         qdZgZu+rFeMvsBnpyJAwUnj2yD9e8E21CvQwwmnkcGQgqFM73tNiln3bC0Ipr9AeLcsm
         XNJg==
X-Forwarded-Encrypted: i=1; AJvYcCWUkSy/EunCInnRQBB+GUf1PgZ46Em8ctjvrzfn7TOWzZNbySNaEBYv9TIPwbMolviKH9ikJRBVyeik@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjk2a+M8FGl1d4wQFGKScbduPhg80btVdL3vTdmNuU5QYweoua
	/qMZZUFA91vlaEbEq7mjPYgSCDeAv1CfrdRHzuH+wqmXHHOGZQ/vxVt++jeM1KO/S3WzN0zVTbF
	iiFTlvwHDiDJfJI4DaIn67pGWS/lKaq1CGm+w3OZ9A1TlZ+eJ/uS9HRznKPE10IzX
X-Gm-Gg: ASbGncsDb5s01UdpfwRzT16+eD/KBjOiJcj5TqTRZURfFI2KVcsOAUofgeHtiL4Ir/k
	gepVSWntMZCR70oMcuxYuU9zIlxw1OT3RiWLI0g7TDbPlO/A8Wp1nHhrAoRdeZSoKQptDuVY8K4
	RqyCSwdtVElj4O9z2I5hfGmxEzOmBVXVY/vCTp9hWlHcGFK6pRj9JhA+k4/mXh42uF1fqP/4bW2
	IA4MLp/IphMnE1cH9Mn7lWlrrqcgavgQfZq0DN2M9pSVrLM1bIROVU1yuks0Mjowh3N2m3Cavbs
	ecs/0K2cgaFgG0ud51QLB5VDvGDeO8IYn5j2F0cFTPlJAPunTqr4uKXxJNSbUCWEE1qLmIwlJjT
	hPPKhwidm
X-Received: by 2002:a05:620a:4620:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7d5d3f957abmr99410385a.12.1751544876866;
        Thu, 03 Jul 2025 05:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMv5CgId/QhgXJ5gc0O6c/YrTGP1GxnRv/PEaNbJnkJ4hBNjdFtHUDliUBepNzEy+MEM5IEw==
X-Received: by 2002:a05:620a:4620:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7d5d3f957abmr99409185a.12.1751544876461;
        Thu, 03 Jul 2025 05:14:36 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c013b7sm1244061366b.80.2025.07.03.05.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:14:35 -0700 (PDT)
Message-ID: <9217c52e-f0c0-4e7e-a2c2-bfb580c7cb17@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 14:14:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
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
 <20250625082927.31038-7-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625082927.31038-7-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwMSBTYWx0ZWRfXyBu3Z6OkwJ83
 gTK2wHin3dOA818YlxagJ7+UgMmRwr7FiIMSUF4K+jt9yrh7xuqfJMbgkyFuEjnRaliNpyWBgAE
 nH7jULeKYG8j1GTLCW7qz39Dxc9tP7GRlio/Qd2fe7ZXWf7kYA12p7a1J6GDkut3V7lKmHdZmpj
 3D7tOR+x2T8kUhA0TOI5wSC0FG5VafVJdGQChnfoO/jc3t4wAmca2HVd3UehjlxnF7tIc4XTK7l
 ZNzrATcJN2iMiTu0KJ71R9Q6IAegY757D2pIBLtWBxkBONhdAHe2vVtn1FjzAedXA+ElNUKS9Q0
 yVe0rLwjkB5KXOUveU6gS3fHtk8YnIMHy9XwOujK3kSDXz1OKvVNcar9RlRKZOSbDp3V0RA6bf2
 uuS1eeQTQjriJeVabZqT+QndBLPxRCDNrMNvTMKUJ3+/VBdy9t5wzT3zXmE8F5psj3lIvici
X-Proofpoint-GUID: Ug2RParzaDnGbM_ubKmApzNe31L6YJ-r
X-Proofpoint-ORIG-GUID: Ug2RParzaDnGbM_ubKmApzNe31L6YJ-r
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6866742d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=ZTnHXLMoH8r4M2ZBRPgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030101



On 25-Jun-25 10:29, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.
> 
> Enable lpass_wsa and lpass_va macros along with pinctrl settings
> for audio.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     |  6 ++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 35 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          |  6 ++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> index 6d3a9e171066..078936237e20 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> @@ -58,6 +58,12 @@ &lpass_va_macro {
>  	clock-names = "mclk",
>  		      "macro",
>  		      "dcodec";
> +
> +	pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>,
> +		    <&lpass_dmic23_clk>, <&lpass_dmic23_data>;
> +	pinctrl-names = "default";

This can be moved to sc7280.dtsi (and removed from IDP
and chromebook DTs as it's always assigned when VA macro is
enabled - they also make the same changes to the pinmux
properties that you make here) - perhaps in a separate
commit to keep things clear

otherwise, I this looks good as far as I'm concerned

Konrad

