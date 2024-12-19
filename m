Return-Path: <linux-gpio+bounces-14042-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9349F8605
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 21:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C28E67A2AE5
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 20:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4B41BD9CB;
	Thu, 19 Dec 2024 20:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1yi4B9A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769121BD9C2
	for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 20:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734640616; cv=none; b=CE0jz8Orv0amiApizAlR3LXq3SpqaPef9nWVGQ7Hqqe/JYX5abin8hwsokPeWm1+HxS8BDkwILRRFVKfQdhrZ4nvl9mPAafButBVonNzXp0sRQJNxpWUnAuIi2yIBgx9nY+8NIl6DK8q1L5CewRPSJEj93hkp844Ma/QVLQjGQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734640616; c=relaxed/simple;
	bh=PKmV12KmIaIne4Yp9ni3s/DThfu+7FkzDjmXAOjYKa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jy48ISRz3cAmRboCW9KPonRBePRL2/Or8YlmU/4UJ2hRsNORRovKQntI5vfryH76hGNvR9bl5q4DEeDY29+7KrkNqwywqe4gPy0R2lYTPHCly//oB6ysONtNgL10wtD0BhGbvGq07Q7PHgUbfObSs9KI1xP4Hxv4vZMdoAU6TM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1yi4B9A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJBkJV9017839
	for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 20:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rbLPj5k+mWqJD2ZbJjIgJjHFkUEA4luzmueKH21YY8g=; b=e1yi4B9A1ccQ5oCI
	JYIUwhbZvtoAmplJxCcCM/f92vZw1L0RHE7stPqhzaM4Kv3ffhaxMot+OZ+COp/o
	F/fKdgKH2dVzOPIrIM9/ChrBtBsl85S0KpPhtJhwq06iQBzcZpq9GYPYObWtqFPO
	J51hs5RpB2tueyr/tZwQA1De33iPWhtSoezayxlk8DsHzwNrMrFwrXMdKIFckeV5
	dbqFgtoYr5Ee8Yc5TlPDjSSXL8ZXZTBmzv9iflQG6F3/LUFbNvnzZRaTXf3zLDBj
	vafkLK13GZBomkrlXFncct97H/N3WDETo/n7CFvvqYh6pbSTYyS2B7DQ38s1CyAv
	zCgA+Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mjw81bwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 20:36:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4679fb949e8so2891181cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 12:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734640613; x=1735245413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbLPj5k+mWqJD2ZbJjIgJjHFkUEA4luzmueKH21YY8g=;
        b=OPJThRkimbr4DpolBYx9z5siCDPnjRpc/qa1G994HG3XN39707fmoa6RotZh7Nn98o
         UwVyJVAme1+WtqLbAGp1Zj/qZ2r/qigHNZSrKbAedZiSVHP89oKMVGPxbuaaYjkO2Okz
         gnioNBr/YNkmh+4GDXg3Hpm7zmSbgx98Hq+GgdSfn+eiQAiv8ammG2DrODa94Oxr7P/J
         /GFKV2a9QAMavGltMezvbWWyqR/Yk1gMtcRo3BcA/qYMHmtNQFO4QWdf3mAEkgMbiRKi
         MPDmmvsr4PZeYJAnspR235xnCsGNLzqc7lzktIXaxnGMEC5qKY4Q9qu4Kwe5qMTtV1pR
         XUEw==
X-Forwarded-Encrypted: i=1; AJvYcCWvefTgZRXgeRnxEKdJ8Np1H1kE8K/Y+1H7v6ryUOZgRY5aH/dpjzL89W83wZURigG6eo7mGgrn50uj@vger.kernel.org
X-Gm-Message-State: AOJu0YyNNRYIIsvCo7Ay/tjuXC2CWwtrOWn6tEQ3QeUOH/Lxg9MVag7M
	uvTy17WAFtdrAabClB0nzNsPrSqjjVMkyNJtb8CUi8s+fJDcE8cvinRZo4VQ5U4h4OuDwNDhxj9
	mKo1SfofGzT9VFQhQ7gm2+Q/km+mA6pQBDQ3S0QIlSTJ7rSG6hqYJ7aQemVEH
X-Gm-Gg: ASbGncsCC5xGhCW8qYSz8FnRwYomFrbvgV6PRVERxX6cPuXpB6LBz563Y1zksmFNQ4O
	VXwSVkFeS/5b6etUVnOxYYysZI9aGawwBYwaRY2xChLGXN0hq/snf2mMrMETXW9BRTEttYdZagW
	Nbm1eYaV/1au8/o4wQl3V8P/TEGi5iWSvbF9HNMJFaVO1QXUsjqZJHY2W/FOhU++ISA108YokM+
	afefWXr8YTW1r4AxVvxu7YqVlILE9gloAJ++1AUY3390ZZ8qluraxmcUnNMEJ5VsvrVjAtXd6q5
	Jygm6fr6mLSKA3yVlwCJcp6rURxjLZhVWwU=
X-Received: by 2002:a05:622a:7:b0:458:2619:457e with SMTP id d75a77b69052e-46a4a9709b8mr2535181cf.10.1734640613504;
        Thu, 19 Dec 2024 12:36:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDTEtCDQCMvHYR8I3DxMlrpc6duYjEQ6rOxFM+v836//HR/Xl5QsrRv0X4F0BqVXUKzXselw==
X-Received: by 2002:a05:622a:7:b0:458:2619:457e with SMTP id d75a77b69052e-46a4a9709b8mr2535001cf.10.1734640613131;
        Thu, 19 Dec 2024 12:36:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e830b00sm101119766b.16.2024.12.19.12.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 12:36:52 -0800 (PST)
Message-ID: <ca0ecc07-fd45-4116-9927-8eb3e737505f@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 21:36:50 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: ipq5424: add spi0 node
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, quic_srichara@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com
References: <20241217091308.3253897-1-quic_mmanikan@quicinc.com>
 <20241217091308.3253897-4-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241217091308.3253897-4-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UiAEX_-X45gTDapIY3DkhqT0nDXLOKUl
X-Proofpoint-ORIG-GUID: UiAEX_-X45gTDapIY3DkhqT0nDXLOKUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=968
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190163

On 17.12.2024 10:13 AM, Manikanta Mylavarapu wrote:
> Add SPI0 node for IPQ5424 SoC.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---
> Changes in V2:
> 	- No change
> 
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 5e219f900412..b4d736cd8610 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -201,6 +201,17 @@ uart1: serial@1a84000 {
>  				clock-names = "se";
>  				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
>  			};
> +
> +			spi0: spi@1a90000 {
> +				compatible = "qcom,geni-spi";
> +				reg = <0 0x01a90000 0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_SPI0_CLK>;

This register base suggests SPI4 for both the name and clock

The existing UART1 similarly should be UART0

Konrad

