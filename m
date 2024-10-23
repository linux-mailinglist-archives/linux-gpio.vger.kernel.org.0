Return-Path: <linux-gpio+bounces-11866-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5009AD13B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 18:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 689FC1F23493
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 16:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB09C1CDA27;
	Wed, 23 Oct 2024 16:40:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302141CACF8;
	Wed, 23 Oct 2024 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729701659; cv=none; b=GqXpE8fO/1AXbKrvdJYX2roRkpqsGu3YnU7e434C/bqQUrw+29pBY9Jyd2UG7s5XF6UUCON5ronwQh5uu8kvuiSCoGhkTiw3YH1mE1b5adch87zGmkdDmA0lL3qXhiD/7zt4IFK2m6T6GpRTQjcs5D4jqRfXYfvOqZpeUTaCcBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729701659; c=relaxed/simple;
	bh=U7vYeewN1cBeAgG85SWDVHs0Z+SGYz/SFAE4vOYySMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0cuMTqk2rwLScMyhzg06Y8fGIHOsw8kpz8g947m5P3YTF0KseZawLAd9DuLRuLxpezkCaIgHceF5q2oKQ1wOfS7LV1Lp3w64FKUPv+ppbIV/80Q35ltq2vdI90sufh2V0AUntIDuDn+lEnn0XGcZCmJZdSP1gMNkWfCRAOC3TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so3714929e87.2;
        Wed, 23 Oct 2024 09:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729701654; x=1730306454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YO6Pe177O4zi05IsxsZHsEP5nWXUeem4INsgbYfTE8=;
        b=MAlMMcF7AJcS1nFPmehV5Z7P+6v2eU434n6UZod2VABvAjdUZTKKjbbwNs6eRJwt+1
         +cj0WVJjB4SHfc4URBADGnj/feSMt028hD7tnerqSvQBTN4611i7gjYZo1ZOAorZqHUo
         AvG3DRpfClTM39N+rWkh0IQp6IZqeEG2zzvtdHbd1tDrEPP2ATyEj2Yo6/jtC4Afy3Hd
         Qd7qvhvGv3VzkDa/nV4lhcThJOk2NvhhUXsPaLnKCpPwcDOB3Z3gs+nE6WmHMabLx7kI
         zEWbK8WZlSGBU5Hj7FlZ3fXfNdXsIHdRejPdoB+NqUbzgQ7/zrf7KZXpWVbTidtotPsh
         k80g==
X-Forwarded-Encrypted: i=1; AJvYcCUJn4IYm9J2NtpbPCsBehX3+lFt967prd5gxFgMm9rNhjIbciuxvDCKzNzimU374sy7WCye9+5D56X6HU3y@vger.kernel.org, AJvYcCVcBe3HCcCpAC6hB4dbW4TXzujJMOAm7PHcKttGektWnj1l1ol5oCiGK0H4st6i1W7TnLgx7PeOMlL9@vger.kernel.org, AJvYcCVjuLscfg/4xswDckiRTJYSDwAosv88rxWjZMrZOtHJ0IOkNvTy5nkR05crE3IM9pzM9kORfDd5FpOmJiSc0Lo=@vger.kernel.org, AJvYcCWSFmgiLnYBJS3Fsgt51yB+/BE820JmNH7cfJy3M29l9sxEUSqIGtMcqMVny5IFlpkPeDTXbdDj76K75g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzN/F/RW5e1ZSkPwkD3ooqGR1YoStoyoGD+fotxkHnoYZddEIZW
	zalWyHzeCNdsw4PR+dl0yMdwiLbFbfnr/+O7trPFtpUo+aIjpfp3rRuaUpNCPhLohQ==
X-Google-Smtp-Source: AGHT+IGG9jFE0uwZbfokO5YfbIDZOE/lolwoCy6mDX7Q8T67psGycFth9ZOs11K1tTD4BIsUnmxpyQ==
X-Received: by 2002:ac2:4bcd:0:b0:53b:1fd1:df34 with SMTP id 2adb3069b0e04-53b1fd1e057mr1747771e87.45.1729701653415;
        Wed, 23 Oct 2024 09:40:53 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ace60bab1sm371166b.170.2024.10.23.09.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 09:40:53 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so85182155e9.2;
        Wed, 23 Oct 2024 09:40:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVqzZC/qw8qaK6guIEq6FpDI+BLuK03GLZ7UGLKh5lGFAMr0fSZErbjPqmLVA3RUaYyomGqmneo4MuIBIQs@vger.kernel.org, AJvYcCVrCgn1MZkcn2bvEmjj8N0PAKiD8BTlJ5iR2Sc5lwKl5wA3EKfG5LBww57Hn76PWkvZ/TlOEc5p1mr1/w==@vger.kernel.org, AJvYcCWNQlzrfPPuUew1Jte/154/Ea1E5rfRsmFgIPm38Ejqr8W3fg+uo0Df5f6xSDXiKtpPZ75WjjSzFf7I@vger.kernel.org, AJvYcCWS6FpCJ4L24sMv9NB7VL8r42/3EVQk1iiHr3hVHC430pqqdWBg43lWT/u6zH8H+TI8HLuvU9ntFD0ihlCF8jM=@vger.kernel.org
X-Received: by 2002:adf:f0cc:0:b0:37c:d2e3:1298 with SMTP id
 ffacd0b85a97d-37efcf91142mr2571245f8f.55.1729701652458; Wed, 23 Oct 2024
 09:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023044423.18294-1-towinchenmi@gmail.com>
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 23 Oct 2024 12:40:15 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_anyiA-fRJOvYrbC1fMrsqZsYQoPWGDfc=_a1hCwy8-Q@mail.gmail.com>
Message-ID: <CAEg-Je_anyiA-fRJOvYrbC1fMrsqZsYQoPWGDfc=_a1hCwy8-Q@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 00/20] Initial device trees for A7-A11 based
 Apple devices
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 12:44=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> =
wrote:
>
> Hi,
>
> This series adds device trees for all A7-A11 SoC based iPhones, iPads,
> iPod touches and Apple TVs.
>
> The following devices has been excluded from this series:
>   - All T2 devices (A10-based): bootloader does not work (yet)
>   - HomePod: Not tested, and it's also a different form factor
>
> To pass `make dtbs_check`, please install the latest dtschema from the ma=
in
> branch, for the `television` chassis type.
>
> This series supports the following on all devices:
> - SMP (spin-table)
> - UART
> - simple-framebuffer
> - watchdog
> - timer
> - pinctrl
> - AIC interrupts
>
> The following is supported on A7-A10:
> - Buttons and switches (with pinctrl)
> The buttons on A11 based devices like the iPhone X is a subdevice of the
> not yet supported SMC.
>
> Patch dependencies:
> - A patch to increase the reset delay in the watchdog driver[1] are
> needed on some SoCs to avoid the "Reboot Failed" message. (The
> system will reset regardless of the patch)
>
> Authorship information:
> - The commits to actually add the dts files are mostly made by Konrad,
> and Konrad's sign-off is added by me with permission. I also updated the
> Konrad's email in the actual dts files. Konrad can confirm this.
>
> - Everything else is entirely made by me.
>
> Changes since v5:
>  - Changed how device trees are split. {soc}.dtsi now only contain on-SoC
>    parts, and parts common to all devices using a soc is in
>    {soc}-common.dtsi. For A9 devices the common .dtsi is
>    "s800-0-3-common.dtsi". For A8 devices additonally there is
>    "t7000-handheld.dtsi" to group iPhones, iPad and iPod touches from
>    Apple TVs.
>  - For other SoCs, either all devices are handheld or there are only one
>    type of handheld devices using it, so no handheld .dtsi is needed.
>  - This is closer to how the existing device trees are split, and will
>    allow nodes likes power manager and battery to be added more easily.
>  - Fixed Apple TV HD serial debug console. It is serial6, not serial0.
>
> Changes since v4:
>   - Removed incorrect commit message about the order of CPU cores
>     in the commit adding Apple A7-A11 CPU cores.
>   - Update tags on commit added A8X device tree files, requested by
>     Markuss.
>
> Changes since v3:
>   - Properly seperate A10X dt-binding additions and dts additions.
>   - Apple CPU cores, including the existing ones are now ordered
>     alphabetically.
>
> Changes since v2:
>   - Removed A10 cpufreq. The loader may be missing some initialization
>     code that just happened to be performed by some versions of the
>     firmware as well, given the inconsistent behavior on different
>     devices. It is also possible that the driver needs to be modified,
>     I do not know and this needs more research first.
>
>   - Removed Ivaylo's tags on commit to add A8X device trees, seems he
>     does not want those anymore[2].
>   - Added Ivaylo's tags on commit to add A8 device tree, I have missed
>     the tag. See [3] for source of those tags.
>   - Added Conor's missing A-b on the commit to add A7 machine bindings.
>
> Changes since v1:
>   - Added /chassis-type property
>   - Added opp-microvolt in A10 cpufreq for documentation purposes
>   - Home button is now assigned KEY_HOMEPAGE
>   - Fixed t8010-n112.dts and do not remove it from Makefile in later
>     commits... (iPod touch 7)
>
> In order to be consistent with the Apple ARM Machines bindings,
> the order of dt-bindings did not change from v1.
>
> The sort order logic here is having SoC type families in release
> order, and SoCs within each family in release order:
>
> - t8xxx/t700x/s5l8960x (Apple HxxP/G series, "phone"/"tablet" chips)
>    - s5l8960x (Apple H6/A7)
>    - t7000 (Apple H7P/A8)
>    - t7001 (Apple H7G/A8X)
>    - s8000/3 (Apple H8P/A9)
>    - s8001 (Apple H8G/A9X)
>    - t8010 (Apple H9P/A10)
>    - t8011 (Apple H9G/A10X)
>    - t8015 (Apple H10/A11)
>    - t8103 (Apple H13G/M1)
>    - t8112 (Apple H14G/M2)
> - t6xxx (Apple HxxJ series, "desktop" chips)
>    - t6000 (Apple H13J(S)/M1 Pro)
>    - t6001 (Apple H13J(C)/M1 Max)
>    - t6002 (Apple H13J(D)/M1 Ultra)
>
> At this moment, it is expected that most hardware blocks will be 100%
> compatible between A-series and AX-series SoCs, though to a less extent
> than compatibility between desktop chips of the same generation.
>
> v1: https://lore.kernel.org/asahi/20240911084353.28888-2-towinchenmi@gmai=
l.com
> v2: https://lore.kernel.org/asahi/20240914052413.68177-1-towinchenmi@gmai=
l.com
> v3: https://lore.kernel.org/asahi/20240915080733.3565-1-towinchenmi@gmail=
.com
> v4: https://lore.kernel.org/asahi/20240919161443.10340-1-towinchenmi@gmai=
l.com
> v5: https://lore.kernel.org/asahi/20240925071939.6107-1-towinchenmi@gmail=
.com
>
> [1]: https://lore.kernel.org/asahi/20241001170018.20139-1-towinchenmi@gma=
il.com
> [2]: https://lore.kernel.org/asahi/34c748fe-89d2-d3a5-599d-52972c10f688@g=
mail.com
> [3]: https://github.com/konradybcio/linux-apple/commits/apple/v5.19-rc1
>
> Nick Chan
> ---
>
> Konrad Dybcio (8):
>   arm64: dts: apple: Add A7 devices
>   arm64: dts: apple: Add A8 devices
>   arm64: dts: apple: Add A8X devices
>   arm64: dts: apple: Add A9 devices
>   arm64: dts: apple: Add A9X devices
>   arm64: dts: apple: Add A10 devices
>   arm64: dts: apple: Add A10X devices
>   arm64: dts: apple: Add A11 devices
>
> Nick Chan (12):
>   dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
>   dt-bindings: watchdog: apple,wdt: Add A7-A11 compatibles
>   dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
>   dt-bindings: arm: apple: Add A7 devices
>   dt-bindings: arm: apple: Add A8 devices
>   dt-bindings: arm: apple: Add A8X devices
>   dt-bindings: arm: apple: Add A9 devices
>   dt-bindings: arm: apple: Add A9X devices
>   dt-bindings: arm: apple: Add A10 devices
>   dt-bindings: arm: apple: Add A10X devices
>   dt-bindings: arm: apple: Add A11 devices
>   arm64: Kconfig: Update help text for CONFIG_ARCH_APPLE
>
>  .../devicetree/bindings/arm/apple.yaml        | 160 +++++++++++-
>  .../devicetree/bindings/arm/cpus.yaml         |   8 +-
>  .../bindings/pinctrl/apple,pinctrl.yaml       |   5 +
>  .../bindings/watchdog/apple,wdt.yaml          |   5 +
>  arch/arm64/Kconfig.platforms                  |   4 +-
>  arch/arm64/boot/dts/apple/Makefile            |  53 ++++
>  arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |  51 ++++
>  arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |  51 ++++
>  .../arm64/boot/dts/apple/s5l8960x-common.dtsi |  48 ++++
>  arch/arm64/boot/dts/apple/s5l8960x-j71.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j72.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j73.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j85.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j85m.dts   |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j86.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j86m.dts   |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j87.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-j87m.dts   |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |  51 ++++
>  arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-n51.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x-n53.dts    |  14 ++
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi       | 113 +++++++++
>  .../arm64/boot/dts/apple/s800-0-3-common.dtsi |  48 ++++
>  arch/arm64/boot/dts/apple/s8000-j71s.dts      |  15 ++
>  arch/arm64/boot/dts/apple/s8000-j72s.dts      |  15 ++
>  arch/arm64/boot/dts/apple/s8000-n66.dts       |  15 ++
>  arch/arm64/boot/dts/apple/s8000-n69u.dts      |  15 ++
>  arch/arm64/boot/dts/apple/s8000-n71.dts       |  15 ++
>  arch/arm64/boot/dts/apple/s8000.dtsi          | 144 +++++++++++
>  arch/arm64/boot/dts/apple/s8001-common.dtsi   |  48 ++++
>  arch/arm64/boot/dts/apple/s8001-j127.dts      |  14 ++
>  arch/arm64/boot/dts/apple/s8001-j128.dts      |  14 ++
>  arch/arm64/boot/dts/apple/s8001-j98a.dts      |  14 ++
>  arch/arm64/boot/dts/apple/s8001-j99a.dts      |  14 ++
>  arch/arm64/boot/dts/apple/s8001-pro.dtsi      |  44 ++++
>  arch/arm64/boot/dts/apple/s8001.dtsi          | 133 ++++++++++
>  arch/arm64/boot/dts/apple/s8003-j71t.dts      |  15 ++
>  arch/arm64/boot/dts/apple/s8003-j72t.dts      |  15 ++
>  arch/arm64/boot/dts/apple/s8003-n66m.dts      |  15 ++
>  arch/arm64/boot/dts/apple/s8003-n69.dts       |  15 ++
>  arch/arm64/boot/dts/apple/s8003-n71m.dts      |  15 ++
>  arch/arm64/boot/dts/apple/s8003.dtsi          |  21 ++
>  arch/arm64/boot/dts/apple/s800x-6s.dtsi       |  49 ++++
>  arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |  43 ++++
>  arch/arm64/boot/dts/apple/s800x-se.dtsi       |  49 ++++
>  arch/arm64/boot/dts/apple/t7000-6.dtsi        |  50 ++++
>  arch/arm64/boot/dts/apple/t7000-common.dtsi   |  36 +++
>  arch/arm64/boot/dts/apple/t7000-handheld.dtsi |  27 ++
>  arch/arm64/boot/dts/apple/t7000-j42d.dts      |  31 +++
>  arch/arm64/boot/dts/apple/t7000-j96.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t7000-j97.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |  51 ++++
>  arch/arm64/boot/dts/apple/t7000-n102.dts      |  48 ++++
>  arch/arm64/boot/dts/apple/t7000-n56.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t7000-n61.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t7000.dtsi          | 125 ++++++++++
>  arch/arm64/boot/dts/apple/t7001-air2.dtsi     |  74 ++++++
>  arch/arm64/boot/dts/apple/t7001-j81.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t7001-j82.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t7001.dtsi          | 123 +++++++++
>  arch/arm64/boot/dts/apple/t8010-7.dtsi        |  43 ++++
>  arch/arm64/boot/dts/apple/t8010-common.dtsi   |  48 ++++
>  arch/arm64/boot/dts/apple/t8010-d10.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t8010-d101.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8010-d11.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t8010-d111.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |  44 ++++
>  arch/arm64/boot/dts/apple/t8010-ipad7.dtsi    |  14 ++
>  arch/arm64/boot/dts/apple/t8010-j171.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8010-j172.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8010-j71b.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8010-j72b.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8010-n112.dts      |  47 ++++
>  arch/arm64/boot/dts/apple/t8010.dtsi          | 133 ++++++++++
>  arch/arm64/boot/dts/apple/t8011-common.dtsi   |  46 ++++
>  arch/arm64/boot/dts/apple/t8011-j105a.dts     |  16 ++
>  arch/arm64/boot/dts/apple/t8011-j120.dts      |  16 ++
>  arch/arm64/boot/dts/apple/t8011-j121.dts      |  16 ++
>  arch/arm64/boot/dts/apple/t8011-j207.dts      |  16 ++
>  arch/arm64/boot/dts/apple/t8011-j208.dts      |  16 ++
>  arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |  42 ++++
>  arch/arm64/boot/dts/apple/t8011.dtsi          | 141 +++++++++++
>  arch/arm64/boot/dts/apple/t8015-8.dtsi        |  13 +
>  arch/arm64/boot/dts/apple/t8015-8plus.dtsi    |   9 +
>  arch/arm64/boot/dts/apple/t8015-common.dtsi   |  48 ++++
>  arch/arm64/boot/dts/apple/t8015-d20.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t8015-d201.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8015-d21.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t8015-d211.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8015-d22.dts       |  14 ++
>  arch/arm64/boot/dts/apple/t8015-d221.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8015-x.dtsi        |  13 +
>  arch/arm64/boot/dts/apple/t8015.dtsi          | 234 ++++++++++++++++++
>  94 files changed, 3298 insertions(+), 4 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j71.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j72.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j73.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j85.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j85m.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j86.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j86m.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j87.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-j87m.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-mini3.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-n51.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-n53.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8000-j71s.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8000-j72s.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8000-n66.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8000-n69u.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8000-n71.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8000.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-j127.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-j128.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-j99a.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-pro.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8003-j71t.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8003-j72t.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8003-n66m.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8003-n69.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8003-n71m.dts
>  create mode 100644 arch/arm64/boot/dts/apple/s8003.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s800x-6s.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s800x-se.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-6.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-handheld.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-j42d.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-j96.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-j97.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-mini4.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-n102.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-n56.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-n61.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7000.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7001-air2.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7001-j81.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7001-j82.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t7001.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-7.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-d10.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-d101.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-d11.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-d111.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-ipad7.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-j171.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-j172.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-j71b.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-j72b.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-n112.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8010.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-j105a.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-j120.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-j121.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-j207.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-j208.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-pro2.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8011.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-8.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-8plus.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-common.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-d20.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-d201.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-d21.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-d211.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-d22.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-d221.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-x.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015.dtsi
>
>
> base-commit: 7436324ebd147598f940dde1335b7979dbccc339
> --
> 2.47.0
>
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

