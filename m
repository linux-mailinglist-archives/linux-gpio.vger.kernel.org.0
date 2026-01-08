Return-Path: <linux-gpio+bounces-30247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D94D014E2
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 07:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E715C3002FD5
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 06:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2EA2FFDE2;
	Thu,  8 Jan 2026 06:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZUenZjAU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWsZus89"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AE527F171
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 06:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767854969; cv=none; b=Z8GeGquMxi/np3uzx91amv1XY/spiwOJfvFnQhNHl76Gxs0pLsV3TDj9zn7WSGoHBh0ruwkwzrRnmtGP0EP9ZgwrFxPWP9WsTrRV7SsVRiAYx25TCDaR6T7isvwiYiZa9s4ZwrzElQJkKpDlW2cRmSXbia/rgoLRNC/F2lBhF6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767854969; c=relaxed/simple;
	bh=oGnBvdCUeJHZCq8sF3f7mVtn5T3/f7oioutUblXEixs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+lvYqLtN+9JiGBpb1VnUjJlH5my/BnhZvBVrqEA/NDOIGL9YiSzN1AGQN5jlUjjRH1oSf6jXUWaVo6/8HN4LZvITimmy/uN9j8Qzy6qsAEEaM54h2wT3yKkNsM9Pl4LhfpAc31y3SD4aRA3bu0iRrelxA/Jgm7KFLokMIeVlCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZUenZjAU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWsZus89; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6083xbWE3752247
	for <linux-gpio@vger.kernel.org>; Thu, 8 Jan 2026 06:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gWe1pS84hpZm8SeY6BVBV1GqP1fj0whNytN+YYS408A=; b=ZUenZjAU0swzmpON
	v9hwK34UB72PTyx19jiQaAweV0EUY+7ETCaUH51uyaZwlCNOY3lvMhvrsvwRSuTO
	62Ws1kq0CjhtyqIb7kWun0PIMvgK7IZlNaoaQTubw4gJrZAu1xSxm8h346emU+Ds
	5XMJYjlNhUO7ooIkC9dGEfQVD3u5bb+5AXDFgli+8OwhHOH04TyhLnjYqNsHrvyu
	rVZXj7J8F05DZHKy8S+MqmCvQX+eOWpicjVCvoi1RaJki46sJN+n00ktvN1pPX7+
	OJvLY8a9FCbsHNqFVJongXbVURD0/ZsFFjzgpfqdcFkUcAMoVYmKI65aQharB5UE
	Up/qHw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxct6qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 06:49:27 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b9090d9f2eso3414949b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 22:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767854966; x=1768459766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWe1pS84hpZm8SeY6BVBV1GqP1fj0whNytN+YYS408A=;
        b=AWsZus89j+wFddCMz0SMTQPx4PQRvSSwkFt2CgeiHC+hm6Fkfe7hHrGZt9I+R/Frxn
         AsrrUjrqbWQUViBIbky0ihxoq1Kvpu4HJXreHZxHraws6NjkYsZ/e3FZTghQWH3fQntN
         oYP3XCq+SFyaLCPEZS0HdZyjSxy2vveKQLCyI4w6V/cOsrnW/hXjtLOiv/0e1atZ45TX
         MU17htLSMC2MbRPSQ1pHTUUEVhmYZ7HlfcqHtCJiflgjoLqOEOjTmSQjzFA9OBlHPdbS
         FSXMGSZWPLlRQP9S5Iw++4GJ5SCJSUrLtWdNeBmnoz81xtEWr0FP9h78sSIjupq2vSkJ
         tQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767854966; x=1768459766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWe1pS84hpZm8SeY6BVBV1GqP1fj0whNytN+YYS408A=;
        b=Ebx7dMogEU3UJJrkv5v6+/Vb8S90Tnjo7wsvbVDf9cyNnbVCGCLtFT6Vc0Y1vdidcE
         aS2EmchdYRx2d/4x5wsPftT4GHW7YPG/aO3a4a/7OlkLqD6H+hbtrvyaR6tw10AvDsgc
         GqydMRdzY2fNRq0IjEeE4C3M8AwmCsdxd73agfq3wcORUukKzrcvelHlVFBJ5VloOyhC
         CBmMAa7X5kVuFkVtFew+8ckZuyAAfR1S+Uu2a7i2LUgZ7pf7p8tS4f3xmvCpuw0btGM7
         OPR/aMbd8AuCpZldNEPWMAAK2lH1j9SrdRE79uXc+tSkI8FsiEA/AEhilFY1iPbBm55t
         C/mw==
X-Forwarded-Encrypted: i=1; AJvYcCVD2PAGIVjxxF3gyHufeA06+sL3Srt4E0TT3Om8tYPtSH74SOajFbdTxucQDLZS+PofWPsVxITrufCh@vger.kernel.org
X-Gm-Message-State: AOJu0YyZThdFu8ZXixfQAkNZLFaIpHILlj0tl3yfgKXQgW6qDFnY3TZ6
	8NlTCUv1SN7mkan+Nj9FcLa7CgO82yWDtW9Iqw5nFPFbFrnohAm8WuKuS2qby815ksQLdtdJWhD
	tSYCdb2RcoBLbe7vW+r1Ae5SQkiTd0TfWJk1Y7E5/zZOTbXKVxTNOKwLLYsGxriYS
X-Gm-Gg: AY/fxX653ndUJ6en57ZGvPTQ9D6zw7llCogbuZF+Vxh4DC7BW6MXanvpL1cTKUYXTju
	1yMFUX9C6mB6YTtWArwVfSu8e7GiNKkHhoYdtVJMjYxIZao/I3IK5/f8wRv6LerF4+4s+Btt+74
	o4hKxXbFnexbF+NagKveOrnm6c92/Zs3u+NqXzXRWHHennfWLKverL5aST/a2yhRkoU0DJeECUE
	5y6k2RcNa6Y8b0GhJKjD0p4z4nCf+kRkozTMzbuU2Kt5+nG8y9/I3F0NN6c16wvzNPUX/dFGmEU
	d87xOEbAVGMfVG6cCEedUDBLxzBvOoyKswQRzQQsx5ipj0sxTc8NQYy9UoTRAxeOcIex58v0DqG
	USQyGz2x+U1G9W2s1/hWmTiomEJPjhId1G8ZSXrwzWV1zCMcvg9H1p7iwskHFQF2/TKlkCJiUqP
	Ht72AFKaNRLc/Jd3W3MGnAfBt7xnE=
X-Received: by 2002:a05:6a21:32a2:b0:366:14af:9bb7 with SMTP id adf61e73a8af0-3898fa087b6mr4665346637.65.1767854966469;
        Wed, 07 Jan 2026 22:49:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHa2SdPaKLqYb+HLrRZM9A6ohxX3cBE+s5ZZnWlaUs2rO6QVISa1iEsyIT/QJ73LDsxfm5vzQ==
X-Received: by 2002:a05:6a21:32a2:b0:366:14af:9bb7 with SMTP id adf61e73a8af0-3898fa087b6mr4665331637.65.1767854965984;
        Wed, 07 Jan 2026 22:49:25 -0800 (PST)
Received: from [10.190.201.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29521sm6894788a12.23.2026.01.07.22.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 22:49:25 -0800 (PST)
Message-ID: <98d69fb9-d3bc-4439-88b4-60f3cdea3422@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 12:19:20 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
 <66eaf003-c397-4920-b3b7-93ac8a5adfda@oss.qualcomm.com>
 <CAMRc=McXFTLjE=2-xsx4sodHgd83h822iEBHT7bxcNOQm6OJ3A@mail.gmail.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <CAMRc=McXFTLjE=2-xsx4sodHgd83h822iEBHT7bxcNOQm6OJ3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MyBTYWx0ZWRfX6eegIHDie/uu
 IawVxXSPVR+za9OzI6BAgIG2WQcsDPUHSK7HzFra52GhLPzLuItYH6bkBhX8HUK/9++8B66ljoW
 v7d5uB8+zpQb4N83m831bHH7N8xUCjVMFLtaFfDyNz8sd2d+Iu+qRbbibaMZ/BAcJZ0S/X4LGFI
 ena4uSBP5dUOpwbdGKHNpQxAGofcoUS9erDq8zC5EMl2ZHhGA5aHl6xxdJhG611SC35mLuHzGXq
 T+7KAb1evjvYOtDL1uW5nBQBlppIcf8gLcku+bB/8ax+l9NA/u45XePCH5LgLH2mgbEeD82HPkQ
 2UnUoMu6T1QiTp4G8GpUpr4oMwGmymYytTknAGDJmnb2j1NnH+tD3xvnO/TUV/7txZAA1yijpd2
 P+kIYrcLTGn8u85WjL+rB2rkkMBXIUqIFmE6kqzJ6VOxpTkk5FM3ZDBlf2VRZuWE44I5/yn15eS
 BXwuyQPMMM98hxO0t9w==
X-Proofpoint-ORIG-GUID: epl-ORWgQAmM8PYFdyJ0bchlSe5_Pla4
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695f5377 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=3ijyyCfgxb-kCMGLBNUA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: epl-ORWgQAmM8PYFdyJ0bchlSe5_Pla4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080043

On 1/7/2026 6:08 PM, Bartosz Golaszewski wrote:
> On Wed, Jan 7, 2026 at 12:07=E2=80=AFPM Pankaj Patil
> <pankaj.patil@oss.qualcomm.com> wrote:
>>
>> On 11/12/2025 7:25 PM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> Some qualcomm platforms use shared GPIOs. Enable support for them by
>>> selecting the Kconfig switch provided by GPIOLIB.
>>>
>>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>>  arch/arm64/Kconfig.platforms | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platfo=
rms
>>> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8c=
b3fd0f29e277af94f20 100644
>>> --- a/arch/arm64/Kconfig.platforms
>>> +++ b/arch/arm64/Kconfig.platforms
>>> @@ -316,6 +316,7 @@ config ARCH_QCOM
>>>       select GPIOLIB
>>>       select PINCTRL
>>>       select HAVE_PWRCTRL if PCI
>>> +     select HAVE_SHARED_GPIOS
>>>       help
>>>         This enables support for the ARMv8 based Qualcomm chipsets.
>>>
>>>
>> Enabling shared gpios is breaking hamoa and glymur boot on next-202601=
06
>> For hamoa - reg_fixed_voltage_probe which calls gpio api is breaking
>> Please find the log here - https://lava-oss.qualcomm.com/scheduler/job=
/24722#L3514
>>
>> For Glymur - qcom_pcie_parse_perst calls the gpio api <4>[    2.910982=
] WARNING: drivers/gpio/gpiolib-shared.c:493 at gpio_shared_add_proxy_loo=
kup+0x160/0x24c, CPU#1: kworker/u75:0/109 <4>[    2.911027] Call trace: <=
4>[    2.911028]  gpio_shared_add_proxy_lookup+0x160/0x24c (P) <4>[    2.=
911030]  gpiod_find_and_request+0x1c0/0x504 <4>[    2.911032]  devm_fwnod=
e_gpiod_get_index+0x1c/0x6c <4>[    2.911034]  qcom_pcie_parse_perst+0x70=
/0x150 <4>[    2.911037]  qcom_pcie_probe+0x414/0x804 <4>[    2.911039]  =
platform_probe+0x5c/0x98 <4>[    2.911042] qcom-eusb2-repeater c448000.sp=
mi:pmic@9:phy@fd00: supply vdd18 not found, using dummy regulator <4>[   =
 2.911043]  really_probe+0xbc/0x298 <4>[    2.911045]  __driver_probe_dev=
ice+0x78/0x12c <4>[    2.911047]  driver_probe_device+0x3c/0x15c <4>[    =
2.911049]  __device_attach_driver+0xb8/0x134 <4>[    2.911050]  bus_for_e=
ach_drv+0x84/0xe0 <4>[    2.911052]  __device_attach_async_helper+0xac/0x=
d0 <4>[    2.911053]  async_run_entry_fn+0x34/0xe0
>> <4>[    2.911055]  process_one_work+0x14c/0x28c <4>[    2.911058]  wor=
ker_thread+0x188/0x304 <4>[    2.911059]  kthread+0x11c/0x128 <4>[    2.9=
11060] qcom-eusb2-repeater c448000.spmi:pmic@9:phy@fd00: supply vdd3 not =
found, using dummy regulator <4>[    2.911061]  ret_from_fork+0x10/0x20 <=
4>[    2.911063] ---[ end trace 0000000000000000 ]--- <3>[    2.911065] q=
com-pcie 1b40000.pci: error -ENOENT: Failed to parse Root Port: -2 <3>[  =
  2.911069] qcom-pcie 1b40000.pci: probe with driver qcom-pcie failed wit=
h error -2
>> Reverting this commit fixes the boot on both platforms
>>
>=20
> Hi!
>=20
> This is not really the offending commit, it's a recent one in the
> implementation. The issue should be fixed by the following series[1]
> that will be in the next next tag. Can you give it a try?
>=20
> Bart
>=20
> [1] https://lore.kernel.org/all/20260106-gpio-shared-fixes-v2-0-c7091d2=
f7581@oss.qualcomm.com/

With the linked patchset applied I still see the same issue

Pankaj

