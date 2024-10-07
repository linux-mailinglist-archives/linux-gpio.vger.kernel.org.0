Return-Path: <linux-gpio+bounces-11003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D17C0993990
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 23:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A5FA2850BC
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 21:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F383C18C352;
	Mon,  7 Oct 2024 21:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M2eYu2uZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545A918B487
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 21:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728337938; cv=none; b=D25J7FgD3e6Y+8evx6oYEYKGbKbgCZDuvSAd5gcIXeoIdHfJ9QOB3Xn9XXY9K+ub4ACMPhaqdo6XobRpz4Kv+dRzc/N1B9zF9OXSYvRV9dNe5zvwct6XwokSV+hyaqbtxzkeSwCvTQdALFz3YmmQmh8+k9ArHopx5PurKtDrfpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728337938; c=relaxed/simple;
	bh=V0IYxckZax0MHCL+pk0Wse+pSfLhhZ2PLyVEvlYWrJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xy4ic/wizTV1Bvhjfj6fKmKG8wWIAcSz0EiPkGFvpsvToxOrXGT686zv57NHwVh/TkO81i7jQnosjYimGvVXYGYHLhdU6YnaCqeoPzA9So4ETvBvc/AVO+xl31+WqbZiI8wOiK0T+TTve8S8RsSbM/2Us3tSTtTb+j4lHg6u78U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M2eYu2uZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497FcLG3021858
	for <linux-gpio@vger.kernel.org>; Mon, 7 Oct 2024 21:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5WldPX1HElD7MkR5uLdSM6teFmc3O8Siba0UndRRQH4=; b=M2eYu2uZ8WotBVP9
	tRHLsARM5MgpgdNUoIfHajRX5wEoxIIQQIindG+57RpPglrwb52K8T0VuuiJi47n
	6vLHe9henKGAwI2Gp6W3ZKHi5zq1EfDlX6Z1bXpoHkzYS4/ZhKCEwe4OZ6QRxLDk
	Ol0bg9lKg6BztvGs02+1QUY8XbbFy1txFSHcUaFc4azH/+3Nlq3UUDTo7P1+LmZ9
	Hlo+OFJ0r30XhZJwfKugGrI/D5XRfai6aXeDTNwWT74Vu1N029DNODVuqH+SRgEd
	0Yv6TyOv/t5KeMGS5xfl4yjCJ6ezCR3gk/oYEcU2iqxA7MCMetRGpmdEwuillTZz
	UEa1MQ==
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xr5nbtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 21:52:16 +0000 (GMT)
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42caf36a016so8031295e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 14:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728337934; x=1728942734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WldPX1HElD7MkR5uLdSM6teFmc3O8Siba0UndRRQH4=;
        b=FWMymZuYdeowZ+H+1h6PVcfQFur5/ZkicdkSFFknDgolyYW1e2qxYl0W9wHsRgI7jZ
         a7CGUVGssOWX/WnuMmNrkanmohGGsSvdaxdz2GmG0ryT0HOP0Db10dBmZGQilvCuOAhB
         XK6yUsu47z723fmEGv88rMOUh2IULjR+uYc7H8N1K9MoUFS+fzG+U0nmao2GrwLW7YpY
         nreWOs1gscL7crFArTQR2EkD8jL5U78ZL67XPgCvLx3mbTLRuVHuFDJZ25swyvt9FHpW
         L2Mcez6IxC+Id/oEA+EILPwmOD45pFvhm2yjCDPSbSZJOgCZYuc+cXCGsc3hXfafdtcK
         42Ow==
X-Forwarded-Encrypted: i=1; AJvYcCU5dhYvPoAKv2wAiuCHnZ60gYfO3z/AejEETjZxGjp4PofSaXEDR/cTcVE0FAQEaoExYx8nwH6xX+Ml@vger.kernel.org
X-Gm-Message-State: AOJu0YxJCvKAQ/ICEDo4a/MLvKSHdxraIH0WDhkSOr+rJ0bqKguKQsoJ
	BWf0XaWtX7dHcOGPAXwriJYYaZG1zkX8B38YIZFp9izsv0z2rFK9La7A3HLaG71vcxVINhaBXwq
	EOkTNEvYeBd7hRSoMzXSGQKb710O8F4ag7Rw9szm4j3BroPD4rZAXdOo81Wwh
X-Received: by 2002:a05:6000:1acc:b0:378:c6f5:9e54 with SMTP id ffacd0b85a97d-37d0e7af459mr3493126f8f.5.1728337934199;
        Mon, 07 Oct 2024 14:52:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaMbyT7dDMapB076G7LQwkZU0xFaEj25mSmt+D0+BLMUp3fAakSFZUwmy/E7gSJp44UTpC1w==
X-Received: by 2002:a05:6000:1acc:b0:378:c6f5:9e54 with SMTP id ffacd0b85a97d-37d0e7af459mr3493115f8f.5.1728337933604;
        Mon, 07 Oct 2024 14:52:13 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a995253abfasm204148166b.185.2024.10.07.14.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 14:52:13 -0700 (PDT)
Message-ID: <374339b4-3875-4680-a0b6-e0d3e69f4935@oss.qualcomm.com>
Date: Mon, 7 Oct 2024 23:52:10 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] Initial Support for Linksys EA9350 V3
 (linksys-jamaica)
To: Linus Walleij <linus.walleij@linaro.org>,
        Karl Chan <exxxxkc@getgoogleoff.me>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
 <CACRpkdbj8fkQf38n0t-==cFZj55TPgoTGM-dzESWgeRGfPHofQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACRpkdbj8fkQf38n0t-==cFZj55TPgoTGM-dzESWgeRGfPHofQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IGXPd2DsVXMvyRmMOaBR8sEjoNw_DucW
X-Proofpoint-ORIG-GUID: IGXPd2DsVXMvyRmMOaBR8sEjoNw_DucW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070150

On 7.10.2024 10:23 PM, Linus Walleij wrote:
> On Mon, Oct 7, 2024 at 6:35 PM Karl Chan <exxxxkc@getgoogleoff.me> wrote:
> 
>> Also The original firmware from Linksys can only boot ARM32 kernels.
>>
>> As of now There seems to be no way to boot ARM64 kernels on those device.
> 
> So this is a Cortex-A53 Aarch64 system running in ARM32 mode.
> 
> So I got this interactive U-boot log from Karl showing how the attempt
> to boot an Aarch64 kernel manifests:
> 
> CBT U-Boot ver: 3.2.08  ([IPQ5018].[SPF11.3].[CSU2])
> 
> ## Loading kernel from FIT Image at 44000000 ...
>    Using 'standard' configuration
>    Trying 'kernel' kernel subimage
>      Description:  Kernel
>      Type:         Kernel Image
>      Compression:  uncompressed
>      Data Start:   0x440000a8
>      Data Size:    8249289 Bytes = 7.9 MiB
>      Architecture: AArch64
>      OS:           Linux
>      Load Address: 0x41208000
>      Entry Point:  0x41208000
>    Verifying Hash Integrity ... OK
> (...)
> ## Loading ramdisk from FIT Image at 44000000 ...
> (...)
> ## Loading fdt from FIT Image at 44000000 ...
> (...)
> fdt_fixup_qpic: QPIC: unable to find node '/soc/qpic-nand@79b0000'
> Could not find PCI in device tree
> Using machid 0x8040001 from environment
> 
> Starting kernel ...
> 
> undefined instruction
> pc : [<41208004>]          lr : [<4a921f8f>]
> reloc pc : [<41208004>]    lr : [<4a921f8f>]
> sp : 4a822838  ip : 00000001     fp : 00000000
> r10: 4a83b914  r9 : 4a822ea0     r8 : 00000000
> r7 : 00000000  r6 : 41208000     r5 : 4a97d848  r4 : 00000000
> r3 : 644d5241  r2 : 4a0ae000     r1 : 08040001  r0 : 00000000
> Flags: nzCV  IRQs off  FIQs off  Mode SVC_32
> Resetting CPU ...
> 
> resetting ...
> 
> So perhaps someone knows how we can get around this.
> 
> It seems to me the U-Boot is in 32bit mode and tries to just
> execute an Aarch64 binary and that doesn't work.
> 
> What we need is a 32bit mode preamble that can switch
> the machine to Aarch64 and continue.
> 
> I don't know *how* to do that, but I would *guess* a botched
> return from exception where you provide your own stack
> with the Aarch64 state hardcoded on it should do the job?
> 
> The Aarch64 maintainers will know what to do.
> 
> Surely it should be possible to add a little code snippet
> to do this somewhere in memory, and that in turn jumps
> to execute the actual Aarch64 kernel in Aarch64 mode?

Not sure about this one, but older (10+yo) qcom socs had a
secure call to switch to 64bit..

Konrad

