Return-Path: <linux-gpio+bounces-30217-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0180CCFD532
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 12:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E59CE300E82C
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 11:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315762E5B2A;
	Wed,  7 Jan 2026 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IgDDvd01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OEQbZok3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7A776025
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784023; cv=none; b=HucSxfklibZzZOsMTokk6PO/y4jD3cb0NIkCIP86N6Squz3CJA460MtmefAY8uXsj7Lk+5qvKRv03CO1WGuV4GMHi1Xy+r3/ZjRfIfbT4RoGpfyRvS0sTkfOg3u9peqxNuVmZhMlKngJhENhpnofvzxksFsjwW2si6RXdHbIntE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784023; c=relaxed/simple;
	bh=ZDWny5wBsnqvakPkuiA7j81WDWTjo5+R7P/pTb2lMn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QqybyadztKJkR7k/7/z27JLlWfKOjC8MX22nMVkktvymBKNlZ0KETXFto9nn0zyhOIjGRLxtzrMgCXHvw1TgDqaFrdSYprBK2eVZ3TepAT/+6gkVkE/tduy4596FrAHqUbyei1F0iMMGcq4c8iA8Q/dgIvLZTwMDcn7lsu+bHEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IgDDvd01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OEQbZok3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074mD8o1643107
	for <linux-gpio@vger.kernel.org>; Wed, 7 Jan 2026 11:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dt7bcHZjNmsVrg3C2DydsxusAHzKSarCVoMIbPpzC1E=; b=IgDDvd010tQr7TlM
	LLqfPW89nf/amk5Gb7rpZPqQFEWzffH0YHUn0XsG/39habiFplv2gVWEmxzCz6RL
	bnTw6wmkdMLaK5ZZSJ2rYnYvAc5nYTzq74V2iOs9fa6QjBTuRa9tDcS0xRvlLk+D
	NcaJmU9Gd88O8IICyeRiEi86JAuvQNuhzJ/r56NSw9dQJkra1FmG/XYAmqK/hz+F
	iGB1fuGMC0PVsNoa1BpqtKsdw6MKnEPamhoHd89nKIWU1mxXyZ2hntcp7klyzzuo
	sigbgANEEc/V4ylSidAt1qzDWx3OrQpdtx6du+lUDXyh5mwtFP0RW32lH7fbBA0U
	VXBJ1Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfh5m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 11:07:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b90740249dso2714964b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 03:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767784020; x=1768388820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dt7bcHZjNmsVrg3C2DydsxusAHzKSarCVoMIbPpzC1E=;
        b=OEQbZok3cHy4M8Z6FCD9Kq86pgf60uO5SqI3G1JCm9U8pmrfq43mSUswKj+PY2eYnW
         MqA08Dn6UOcJ+Q+ph2nnuGHah9vYsWUNI2RZrciyKMCcCqU81POZqmZLWJHD2NtU12J1
         0DNe8iuxrqAlaMPrXjJ3Lt6h19n9vi7FrDKjaTII73ejnYjN7JU6mfI1QuUQWKu3eWaG
         sQE38RxnGmXn8Rjx1bJ4ZiEW3Wywhp+qY36amzOVoMvEObUadcBAkDzGoPwOGjbmz8vI
         vTGDhuL9uHm7x9qvyjdEFtVaXVmOSjvEYQSNEo6QXSef967TV7tgzaK9w2zggNFMmX6L
         0ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767784020; x=1768388820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dt7bcHZjNmsVrg3C2DydsxusAHzKSarCVoMIbPpzC1E=;
        b=BipFOoYEL1FbEjLYQFv+QbgpYhDYJfRBAXvPv/JgDCKfegIIkk/s64fU0FxgujSHXb
         b6xGezS4rhoSJ95RUp72wLFYwBm2G8zy4wzqf1A3O5iPl4oipRiu1/eaWdyXrETMtyt9
         lsZ+usV2K7x2+gDSW8RBeBkLLtBskdWaK9x+CpGQoTz8TmaSgdpTeMtQ/O5UUwPrwMr6
         qiu+TUvg9aXUcoAaDAhPbr+jdo1MHlhAIe+q6hJdJzlLRVsVXEzXAMU1Tp/ivkA9dBi8
         7UrZEKhOBa7PdXLEOF20iU++3jTJmx7as5000C/wayi9ZhhYLTKfh5iH0LM78AnIrDDF
         r9HQ==
X-Gm-Message-State: AOJu0YzkwZbXY3QOS1rO69pI0L79og7zoKC2SfO1T/fPAOu3GQN4Yb+q
	OkhyHtFTYUPDLYWyQZ1kLgdPaBPCdUoIKkHFOonmdCEE86Vnj5h2R8+r5EaE5QBBNJggG704Rz3
	7YVtJJDZ1h/Vv692ymBdiEJEAql5hzSu0aOahMlN7supwc6BS92E86An0ozlO9DGb
X-Gm-Gg: AY/fxX6ELEK86Dw9BI5ZLEkHP+BXS/o7fZwmEH9GJ8qGAvoWm3NGX2kCYG4fjGsOxVj
	DfpJJUCL8tUc/L4UNz88axsryc+w95AUHVNSkrYGTwJfGDXqGW/v3DOaNB4TMT/46gRFfVzaxqz
	0J5R0Lhqk4U5WkywSbrtFO6McwVbXSHvqpRtJgPPCWKZZR4lF/SvNqgA0/ZL41X+61oXUxktVvg
	O1LAXK4hZRPQTPngvupbkucxLic3H8UJLyJdEut4n2hzZt5+o9Mff9ROD87UKw+GDUjHFhrn8GN
	LPFcOWvN/RQ4GFQhPWEubWecyK3pQTmUTwhSlxz9QVXo6IXgDifVytlf+1fa+XwDKBuZTQ1KLo2
	2mcaVaif3ZDz/QSPCUV0dRL+upe+3b+I7kbSAceT1gLB0ghhcKHZTg3qXG3EtLC3VExAqRqMV+r
	hfUnJfQZSd6xPaPvzNrehlQ+2LjSU=
X-Received: by 2002:a05:6a00:e8c:b0:7fb:c6ce:a858 with SMTP id d2e1a72fcca58-81b81197415mr2009342b3a.68.1767784020255;
        Wed, 07 Jan 2026 03:07:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxOrOZj/lOLSkp/SPwAFiTXNYU9SdlgYCvG6OI4vj5T5zuAQFA2+WcItbEGmouMPaYav8bQQ==
X-Received: by 2002:a05:6a00:e8c:b0:7fb:c6ce:a858 with SMTP id d2e1a72fcca58-81b81197415mr2009315b3a.68.1767784019750;
        Wed, 07 Jan 2026 03:06:59 -0800 (PST)
Received: from [10.79.192.227] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe96absm4739372b3a.17.2026.01.07.03.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 03:06:59 -0800 (PST)
Message-ID: <66eaf003-c397-4920-b3b7-93ac8a5adfda@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 16:36:53 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5MCBTYWx0ZWRfX0QEYRZQE+H4S
 SqtrRzvuejKEFb5FlB7c7IhLqkW7fOrddjawj/zbRQAhS3J6koilKXX4jnD4Irl4FcYNQABwLP6
 V0aUKbeG2tZm7wBDgNlBD7Af1qEAkg0vxDiyVYmXnvFLEJ5By6JSOWg0Y2NV9KDSqlo0j1YvBXh
 B2wBeT4rOTexQxwo+3S8h5bhmCBxUVF2jfI96+H8umTjkoZNzE371cKzuZstTiLeMwRWUA/Ccqk
 TdRBCF/47BiuZvY2HDg5wxRTOVqMzzuOOebIy85vSNlQvsjdxoSPqgbfRbP2ydCdeaLgv62K7b/
 J0yzbdsBClS2qGlNQqR7K32uEJvDlIZiQWVJ8PrTzfak1yTixl1ZGZoFr2qaGe0jFaSwTXjYI8r
 P1mulsItAIDWe0yw+hMRpMODw4vkHrf+31rNxIbQmu4MZqouhA6a5r6eRXustoRsWl7I4O6tRQJ
 zNNpda5tLfCuHVxfCrA==
X-Proofpoint-GUID: VPIr7mIWxO7yWTBVkykmpFPICjGouMxl
X-Proofpoint-ORIG-GUID: VPIr7mIWxO7yWTBVkykmpFPICjGouMxl
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695e3e55 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=MQqTiiUG2llzu4MCLGsA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070090

On 11/12/2025 7:25 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Some qualcomm platforms use shared GPIOs. Enable support for them by
> selecting the Kconfig switch provided by GPIOLIB.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platform=
s
> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3=
fd0f29e277af94f20 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -316,6 +316,7 @@ config ARCH_QCOM
>  	select GPIOLIB
>  	select PINCTRL
>  	select HAVE_PWRCTRL if PCI
> +	select HAVE_SHARED_GPIOS
>  	help
>  	  This enables support for the ARMv8 based Qualcomm chipsets.
> =20
>
Enabling shared gpios is breaking hamoa and glymur boot on next-20260106
For hamoa - reg_fixed_voltage_probe which calls gpio api is breaking
Please find the log here - https://lava-oss.qualcomm.com/scheduler/job/24=
722#L3514

For Glymur - qcom_pcie_parse_perst calls the gpio api <4>[=C2=A0=C2=A0=C2=
=A0 2.910982] WARNING: drivers/gpio/gpiolib-shared.c:493 at gpio_shared_a=
dd_proxy_lookup+0x160/0x24c, CPU#1: kworker/u75:0/109 <4>[=C2=A0=C2=A0=C2=
=A0 2.911027] Call trace: <4>[=C2=A0=C2=A0=C2=A0 2.911028]=C2=A0 gpio_sha=
red_add_proxy_lookup+0x160/0x24c (P) <4>[=C2=A0=C2=A0=C2=A0 2.911030]=C2=A0=
 gpiod_find_and_request+0x1c0/0x504 <4>[=C2=A0=C2=A0=C2=A0 2.911032]=C2=A0=
 devm_fwnode_gpiod_get_index+0x1c/0x6c <4>[=C2=A0=C2=A0=C2=A0 2.911034]=C2=
=A0 qcom_pcie_parse_perst+0x70/0x150 <4>[=C2=A0=C2=A0=C2=A0 2.911037]=C2=A0=
 qcom_pcie_probe+0x414/0x804 <4>[=C2=A0=C2=A0=C2=A0 2.911039]=C2=A0 platf=
orm_probe+0x5c/0x98 <4>[=C2=A0=C2=A0=C2=A0 2.911042] qcom-eusb2-repeater =
c448000.spmi:pmic@9:phy@fd00: supply vdd18 not found, using dummy regulat=
or <4>[=C2=A0=C2=A0=C2=A0 2.911043]=C2=A0 really_probe+0xbc/0x298 <4>[=C2=
=A0=C2=A0=C2=A0 2.911045]=C2=A0 __driver_probe_device+0x78/0x12c <4>[=C2=A0=
=C2=A0=C2=A0 2.911047]=C2=A0 driver_probe_device+0x3c/0x15c <4>[=C2=A0=C2=
=A0=C2=A0 2.911049]=C2=A0 __device_attach_driver+0xb8/0x134 <4>[=C2=A0=C2=
=A0=C2=A0 2.911050]=C2=A0 bus_for_each_drv+0x84/0xe0 <4>[=C2=A0=C2=A0=C2=A0=
 2.911052]=C2=A0 __device_attach_async_helper+0xac/0xd0 <4>[=C2=A0=C2=A0=C2=
=A0 2.911053]=C2=A0 async_run_entry_fn+0x34/0xe0
<4>[=C2=A0=C2=A0=C2=A0 2.911055]=C2=A0 process_one_work+0x14c/0x28c <4>[=C2=
=A0=C2=A0=C2=A0 2.911058]=C2=A0 worker_thread+0x188/0x304 <4>[=C2=A0=C2=A0=
=C2=A0 2.911059]=C2=A0 kthread+0x11c/0x128 <4>[=C2=A0=C2=A0=C2=A0 2.91106=
0] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@fd00: supply vdd3 not foun=
d, using dummy regulator <4>[=C2=A0=C2=A0=C2=A0 2.911061]=C2=A0 ret_from_=
fork+0x10/0x20 <4>[=C2=A0=C2=A0=C2=A0 2.911063] ---[ end trace 0000000000=
000000 ]--- <3>[=C2=A0=C2=A0=C2=A0 2.911065] qcom-pcie 1b40000.pci: error=
 -ENOENT: Failed to parse Root Port: -2 <3>[=C2=A0=C2=A0=C2=A0 2.911069] =
qcom-pcie 1b40000.pci: probe with driver qcom-pcie failed with error -2
Reverting this commit fixes the boot on both platforms


