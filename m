Return-Path: <linux-gpio+bounces-28297-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7D2C46360
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 12:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F12A4E0F69
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 11:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8AB221542;
	Mon, 10 Nov 2025 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPINLj1j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jsPNiCMm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC4A1D9346
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 11:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762773790; cv=none; b=Q2lRiGO2tOtv0dEF+6A1YClGDnDSCuvYEz4HZlSIipbx468nCEGUjQZbbk726G/3YCQw2Q52FMnodIFxh09l8pWi0eTVnx8Cr5AY2YZhHZ0IUtrQ5wppdLFiznGMvOtAZ8qw/OpH//AK7IqdfqUGubpNzTZRTbKbAb1S/QXmw9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762773790; c=relaxed/simple;
	bh=yO77kwBGZo7GfxU02vl61rDFI9SWDoQ8KYXb0fdAB+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNYL+jG43pdB6BO1L72MoL0o4Aes0wLiWNWu9Bs8K0O8MOK/RGbLc18DOZtm2tXOymxqvqu8dWBTv7H986YYnFWnnfdgdSBvIuXu+SUrzDAEDU9hq6bQURM7kExKUtlhQb5zybivCsd8X8Z5n75msBlzNZpV6VChua+GXrYSE/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EPINLj1j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jsPNiCMm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA84nIs1610869
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 11:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ybEh9EFc/k/OEFrYVPKW0AEC0K4ZVsg0OtLxn2/42jg=; b=EPINLj1j6GgstPbx
	EjcOg6UjpKrFUYhA8RYbB6DrKy12ikq8bgeLM3PTbAfswMaq4+O/Ca44BVa7rEsX
	QU8uxAE0NAyZ9RKHifJj6S3gze3r5/BhE6PFpLi+Np/nE7SubUI0B4mCk7YVziyG
	ywhFO8n911i4X5pqXKnNbJyjSuzLf5JDRWvZfZnXHYySaTRILme/MwWeM51Ja1uw
	pSZNWM+kuo5UpOR8wLplKTPpEr1Ut1JNHvjFAuNaRU1OlkJBRyD54L/RcRNeJTfx
	nMsZ/wFMnzgBb3MSFzUTvx9TzoK6jWQlMc2BroZfL3CcIHnWGcuMTCjbLTRZRKIa
	Rcnpiw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aaue0jcbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 11:23:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34180bae854so1282312a91.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 03:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762773787; x=1763378587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ybEh9EFc/k/OEFrYVPKW0AEC0K4ZVsg0OtLxn2/42jg=;
        b=jsPNiCMm7lLDoL5L/5jLgfEw2OUAGpCDNS/fPSk/jLTvYKD2912PkoZwePJ683hBw9
         qNmbhTkEXcICXRlaAnMPx84kVw/k8kob8szHozx9QYN9Wo/BbYycaF5S5r9ULz0N10JT
         TQdGspHhF7eVumtW/4O9w2Uw12DXjgHNgf5bjV7a3kIPqVmhLZELlRjlsQNN3Oi/TNbD
         QIBo9EO7qLKo0OEhgjSA3RfUIQHm90OhVehZbSXWcWWYbKndfgdJ6hvoDFYckgfJJVgt
         I79uVayGQCDXGbSgw9O1CRF2nCVSzdaK15x2JwHk0DH/XSG8EbzMLR++5h/DjJWLoJzT
         r4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762773787; x=1763378587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ybEh9EFc/k/OEFrYVPKW0AEC0K4ZVsg0OtLxn2/42jg=;
        b=MK2MWERlrNxvndvnKkgSqmlHKsyJgcoNjMvsx/wT1wAoTZlQ+DjD1Oes2gGUZ+Ngkc
         r6bbmNNob2mwgLDwWqQpOxkGw9yun2UwMCNJW6B3ayJzNHg7uziKVnB9Ol3ZmXLUo3Of
         yRX3OdxH/0Keb6ITFHWWkLKBvK8F7UN1y5nDK92QVUQTC9sLcAHEK8jqumdBbEc2Oiqf
         t6gGMMrZFm1uRu8gJpPw9USKawXvuRwHvmW6A4TfFAcRvmcYVhdhzGpE4ox0Jc4EeG6m
         RVlMZSK0Fvl7qDG7Evq8LI2SykhhckeJb4W7Qjoy74CXkbClR1IoMLmdvv30d+RAUXU8
         nPvA==
X-Forwarded-Encrypted: i=1; AJvYcCVZDJrN80HayKhghnUUXkbJQwfJSjek4N9v1mdDCxspnhqVO1jDmpfbV8SxiD8DY0H0YOSLCOrWhKRu@vger.kernel.org
X-Gm-Message-State: AOJu0YxFT9C9ArQxuI+HqqeT127Rqbt3YgmWn1NXly/vB0XwZxNNEqzR
	igBBWb662IOxZgG7FfaGYjWm7dVnhBGKpIvC0ysxn13BYQFrzY90Zw5PGE8zEhTHwIxE4dAuFSm
	/jkiZwbaHwIA0uq8XKt2yssiYKu0JTlcwLlrBMvjZFs5rnfa7LvxnHM/cCaMnFukr
X-Gm-Gg: ASbGncuda5EH3oQIHX7oidv/EwgRn8nZT/C16mhFsyShBENO6fEtaLWe0nfiavp+37O
	4HdFRLktE7aO8sR7O+nSJ7Za1pohR2Sx76FM9HKCD6EzpL3AqQ+p1KJh994YeolvkEghpemI213
	uF/cQ5W6QrLvGWHxNFvx+GW9Zzqrmx0fzohfoggEYPHwJplN5xG4Jlg1JyaoO0hT12mr7zHelq5
	CCVkpexDXRe0Vw7gr6modEwjfNxifauHCP5LIRbXm7fziOKUCSIxDEPasmLq9HNaSvDXAiw9sv9
	WShOeg9Qcu07mkmInomM0+ynHY0lSiZoAOXr2I8XxILYh7ba3lP3tnKV9iALAbHolL0ZXmwfr5o
	80AX3jQLWRa6oVUcI6EBmVP07kVIWjW5VNQzeGTHaNpJGC7IBMyWKobZN
X-Received: by 2002:a05:622a:24a:b0:4ec:f7e4:8a0e with SMTP id d75a77b69052e-4eda4f9a9bbmr68189941cf.9.1762773053470;
        Mon, 10 Nov 2025 03:10:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQu4fNZk2qrYjwhHpbxn0AAwOS/Kjp/AlwHX5/cKYvrUDHHZLvsGb09MZi5m64KKoPHWj67g==
X-Received: by 2002:a05:622a:24a:b0:4ec:f7e4:8a0e with SMTP id d75a77b69052e-4eda4f9a9bbmr68189481cf.9.1762773052978;
        Mon, 10 Nov 2025 03:10:52 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6417b28a73esm3989933a12.35.2025.11.10.03.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:10:52 -0800 (PST)
Message-ID: <fbd241d2-d383-4476-8e2e-0f9dd9dae484@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 12:10:48 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: qrb2210-rb1: Fix UART3 wakeup
 IRQ storm
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
 <20251110101043.2108414-2-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110101043.2108414-2-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nEC9AQGPiwtdSumzPKR4ASeETu8lQiEx
X-Authority-Analysis: v=2.4 cv=BfDVE7t2 c=1 sm=1 tr=0 ts=6911cb1b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jiGHEdQAExhvJ1pZOisA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: nEC9AQGPiwtdSumzPKR4ASeETu8lQiEx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5OSBTYWx0ZWRfXzS3xpePWQsgj
 OriSUw+5es48GwonXiLYDrUcQUrGiuUcbgykGZKwCP4G/XBkB5ajfK7MHOsc/lApVAlVZLJMB/j
 GEpZ2+0DIaxRC5ICqlCFLQJ8YcOQ31sYjHvqNYpJoPDto/NMRPHAxibNMFzkRdwI//adXExZxRj
 fs/5HxZK6gyemM/Xn31Mq+fEWMzRs7rMkl72Muj0FBVGkIe45CpAn9rbMwp0iQiC7tc70DKdG4e
 RHFDQu9SudwJ08RBhJCEj3s7pzfRJqWw+9k11zUHtm2ECrUvZdf2zC6PwpJaraNkOdW3b4Sdjp5
 bNU6NjF1Sr7by5Szz2S80du6HxsG3FOdqHRqf9WHaVfAZUw1f7N27AD7Nn1HWS8AAD9UxPUSXKo
 IprXUG4oX/0S/5e3PhKkTgcWT8g/Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100099

On 11/10/25 11:10 AM, Praveen Talari wrote:
> For BT use cases, pins are configured with pull-up state in sleep state
> to avoid noise. If IRQ type is configured as level high and the GPIO line
> is also in a high state, it causes continuous interrupt assertions leading
> to an IRQ storm when wakeup irq enables at system suspend/runtime suspend.
> 
> Switching to edge-triggered interrupt (IRQ_TYPE_EDGE_FALLING) resolves
> this by only triggering on state transitions (high-to-low) rather than
> maintaining sensitivity to the static level state, effectively preventing
> the continuous interrupt condition and eliminating the wakeup IRQ storm.
> 
> Fixes: 9380e0a1d449 ("arm64: dts: qcom: qrb2210-rb1: add Bluetooth support")
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

