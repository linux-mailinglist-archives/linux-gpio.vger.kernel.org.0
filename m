Return-Path: <linux-gpio+bounces-13300-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 592CA9D9FD7
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 00:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0087168978
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 23:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC24F1DFE08;
	Tue, 26 Nov 2024 23:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIS06G2I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F088D299;
	Tue, 26 Nov 2024 23:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732665187; cv=none; b=bbMKpWN/rzCwCH9KFZejcm29y/RaCugUeQZRZldJt1OvdkESa8iNuBCkvvk81BgggqkVBRSx5ut8/ZQghOpGCncJRcQI5r60O+gdcnP/8vKwV0yS3kK45yJCBz0/ARMmhlD71DLa/zjtcLALI1zlqJg4sprD7oIr2OrWhiOwZZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732665187; c=relaxed/simple;
	bh=V7GPfC/BvKvlcEQJz3x25eNhixzXaqUhRbElO3/Aj7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U1RC6sOs5Y9/rp9fw7HN18hcOUQQaBK/wHIFArBP8eDAutdcfa3M5v5/e8hFLJMj59cHYMyYKa4fdjz7ho5c2S2WkMp2ks0wlLa+tYv7fSFF/N/L3yWLbqrBfaA4/t7MUyN+HOpT+UNzn37/xfMCv6OwLSZTuRr2xnoKGevrhkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIS06G2I; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21288ce11d7so48844205ad.2;
        Tue, 26 Nov 2024 15:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732665184; x=1733269984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Mv0GRhBH22P990rmtaQGs6C18s0425l5jLKWrD0nHGY=;
        b=RIS06G2IO1v1D2WzgYcBO2EJJd0yppSflWWzL8VC+UOydtJYFiuxXl+eBmCor2vxOO
         lsxj+UAXQkJv4XLKKEDmzudIdbMZ7TvrIgiRx7ZF5D6JB+x727s0NV9EtAiwYC4jq1IT
         H7QQh4V1RPAzpp6NzyZB8Zz1Ewqlvq527lDwVrc/AGgHId9DliteZ8lTEWVpW1nZOFxA
         aVLkXRveVrb4+3dLa0/BNVsW0OPQHDadmayAqibRDWAD0XIufsPAZ+5ACOGUT3qAqT8+
         /4OOQD+IUpCEcTEzAN0Aw2qYvormHY4V7Mr0IFYRSx6pAKXSxte8TDc/iKTJaK75ssBw
         NGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732665184; x=1733269984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mv0GRhBH22P990rmtaQGs6C18s0425l5jLKWrD0nHGY=;
        b=xOBwYv2d4TO09T2R6llpFv2YtxyVHgqWNvlxkxjcwe/qFXMs5UcFnoSUQP8TRKjGxk
         GtMNc8IDE2GRspN7pIfC9gNmsSrqSPDzSVmzycmW5XG16gkdlxrDfxUjFynbEwZ/bgrj
         vZh+mTbJP7kzqkl/Mel38lIgQ6+3x8SJANQqtdfvG6iO8yvdV3QOzZ46YA0yfu5hNnjS
         bYadM53QGF+LpABjZ5vwNUXaR5RNilfgssH0yv8sIPLDvZ4NHum7r5OKq1+JRq5FdPpl
         mArAzw6tVullWEgWLj9cHMRmm3TcF1h6SG+H+Ag/3ylA4j1MyZFDyEAZiPVveapT7C5u
         Qmkg==
X-Forwarded-Encrypted: i=1; AJvYcCWWMwptWqsuM4R+Fn0sQ0RxLhPDObLnfK01NsWSxBOeqapp9wSZP9L6IriwNtvloBJqIDiiKU2XRmoKxtGC@vger.kernel.org, AJvYcCXY68uqtCYNczCIN41WT2JtWoIfpihlPtwQuzB/p8pW2J0x7q5h8nuBltc0Vx8RudrgUklHFRpjvSTY@vger.kernel.org
X-Gm-Message-State: AOJu0YyozmjilaDEmWoR6qoyjPYRQeEqqO98kM/ch23ONUUiAlEdbyCL
	kTg8OMgJaKurHfv6CgFmf9Px09TMeQ14tVqxFrkY8iGX9s5deQXi
X-Gm-Gg: ASbGnctLVwS1mOhgPXiWsgmHAdYZFz6VZfJu7T0atCzDGDptfuMl42Plk2QIG/7gOtt
	+36WHYci2zOHMMHdJP0iWrer6fYu58ylsII2PnWixAPB7Vqr3sP0covrxiAgv2av5OAeOi3603m
	Wp6eL1odp454UMWV2WoXsppY8alCTMmkj4RkYcga9v670OZJFWg9bVRGWJoJhaUP6pu197kgIdz
	t6qexr+BuQmhNZXo4qTnnV63WHs7WygVWoJ0yK9Kr1a6wGlMY5rEZbxexvBDuN3YBJYoaJHRARk
	GwwXFP+G7nqKEHSls8q3fWE=
X-Google-Smtp-Source: AGHT+IE+aE0RgQuJgMVW2Z2si/glU755xysZtQ/41BKL2LKF0wCUKtK1Qcir7UQQcj0Abw8HICDgRw==
X-Received: by 2002:a17:902:da92:b0:211:efa9:a4df with SMTP id d9443c01a7336-2150128c651mr9699265ad.17.1732665184346;
        Tue, 26 Nov 2024 15:53:04 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfed7esm90546515ad.148.2024.11.26.15.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 15:53:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
Date: Tue, 26 Nov 2024 15:53:01 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Esben Haabendal <esben@geanix.com>, Russell King <linux@armlinux.org.uk>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
 <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net>
 <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/26/24 13:24, Linus Walleij wrote:
> On Tue, Nov 26, 2024 at 5:17 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> On Mon, May 06, 2024 at 12:23:53PM +0200, Esben Haabendal wrote:
> 
>>> Making pinctrl drivers and subsequently the pinctrl framework
>>> user-controllable, allows building a kernel without this.
>>> While in many (most) cases, this could make the system unbootable, it
>>> does allow building smaller kernels for those situations where picntrl
>>> is not needed.
>>>
>>> One such situation is when building a kernel for NXP LS1021A systems,
>>> which does not have run-time controllable pinctrl, so pinctrl framework
>>> and drivers are 100% dead-weight.
>>>
>>>
>>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>>
>> This patch didn't update default configurations, meaning PINCTRL is now
>> disabled by affected configurations such as imx_v4_v5_defconfig or
>> imx_v6_v7_defconfig, making pretty much all imx platforms non-bootable
>> unless the default configuration is changed manually.
> 
> Since the patch tries to add default selects for all drivers I suspect this
> oneliner is the culprit:
> 
> @@ -6,7 +6,6 @@ menuconfig ARCH_MXC
>          select CLKSRC_IMX_GPT
>          select GENERIC_IRQ_CHIP
>          select GPIOLIB
> -       select PINCTRL
>          select PM_OPP if PM
>          select SOC_BUS
>          select SRAM
> 
> Should we just add that one line back?
> 

My understanding (which may be wrong) is that being able to disable
PINCTRL was the whole point of the patch.

Fabio submitted a patch enabling PINCTRL for imx_v4_v5_defconfig and
imx_v6_v7_defconfig explicitly [1]. I don't know if that fixes the
problem for good - I see CONFIG_ARCH_MXC in other configurations as
well.

Guenter

---
[1] https://lore.kernel.org/imx/d718ddd2-d473-4455-b21a-15024e46787c@roeck-us.net/T/#mc71dc21d99e0b013c5ce46c0d90940fd8806ae9a

