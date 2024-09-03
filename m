Return-Path: <linux-gpio+bounces-9665-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A77AA96A241
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A63C28A537
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 15:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E997C18C01C;
	Tue,  3 Sep 2024 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qeq6HSvt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0882A188916;
	Tue,  3 Sep 2024 15:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725376956; cv=none; b=kZM0O1PDn72rLKYZ7/af5AAteM9eYyCHUw8ioP2Sw9BELUtTcYIX+QpOgrhRal9C7jTRlMecpbDr7/DdUiu74oKiGcnko2XqiQssMPYpQdTvPvXFl+z0+UsWp+t310LvHcmkUe9b16//AeZnKrsCUAivtEpWqr4qlJ0fte6Ojbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725376956; c=relaxed/simple;
	bh=ydEOJKqbC1qt7jvR+WVtAfHN6Tl14xqH4jUsl/hUDdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8zDNQ2/fRN7DPgNkEedA8Mt+ygRmaTVrbQg4zv3nbJHxbv1QppIKI+LR+CrmgQFYAdMWc3M2C5OgSDKc+BlwBiQB9SeKhS3SS2wKVEJ6IuI3PkgHw/8wRTbhyeoa+JfncQxuJwubX+EoNW3Zqjs9SERimcm+Vv0u5OAR50Kmkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qeq6HSvt; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5353d0b7463so9296161e87.3;
        Tue, 03 Sep 2024 08:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725376953; x=1725981753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydEOJKqbC1qt7jvR+WVtAfHN6Tl14xqH4jUsl/hUDdY=;
        b=Qeq6HSvt7eobW4DYO5pBQ/BwtSUIWm5WbJW5KUsMmjYo/BqA+3nbN5fA28DmervvxR
         hbCmIL2y8IWMwXhBT1F+2PV1X+k8WoTx+nHcoLTFtE3BIZECQ43i88Nsyh970XDoKWz8
         GitzVaLWufBZ5vvho7NySWxOpSaaMSIRNaz4ZusS/wAhFOhLi85IMHGBa3qpmOkwyoIO
         R9gTv85vw3KxowOhUDW09TZfoX5mE7jVC7e8IGD0VJF13QYOBA2VQM8JVoZdurQqKCcy
         yDnu9P3j2CKXbq3qVIh5kx2JExRoCZLaEvg3b3Ze1UAJkBVynRMRwMnihkAAGt8Us2tE
         bTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725376953; x=1725981753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydEOJKqbC1qt7jvR+WVtAfHN6Tl14xqH4jUsl/hUDdY=;
        b=ipR2/SMpbjmhFmaZkVsolAurp0pm7g84Con+eAcCK+W26J7EVDJANjOrHtPvPKKp88
         0GRZ+EaL9NmVSpRdSCX3XdFMIl4Edkovng2ZmRn/FZLcbOHFcSdG+WL7tzUE1F0YbMeh
         miuGqqcR90RGgVsuvfoUphBwYX8c9MfRvOCV7Cl1Krub4l0kU84F4yHMKywvp8LxPirx
         r4iHfDy4jvfXXQ7QvqqSYkkIPVL3jNiFsJ40vbZ1qiJ8Eoq/wf2cRVs6KmNrzvjyTcu2
         FFPDfodDxRaRyQpxtxsNpJ11eZJAaWhqHS8CBs17r5k3FPJe0aqGvD5aYcAWQmJCFYUd
         ByCw==
X-Forwarded-Encrypted: i=1; AJvYcCUn845lP7NIhXNsM7DQKcaBcG7dLFzNHQU7sya8jAWbL2rQaj9RhXShgf3kzQY0VLztbAdUpLr1J8bL@vger.kernel.org, AJvYcCV9SJSplYJM25DH2ZfjXeW/U04sk1EN+pbuGQBRcF6axtsTIvWtXcwx0T8fsou5gmqRcTPNbVI+oO1Itw==@vger.kernel.org, AJvYcCWtqrjNi8p2vh426J0QBZOEmbCzcNlNfwaKiJVGx5pL6nFT5vnbK5XRDUUETcjXHDGx0i6Mf01MslwN6CzF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6PdVGJeuDZkg03doNTiCJRFk33pYUnX3Pm20LGkEzA18eGTLl
	9KMS4gp53Q893lhmtGX2PXl7PTweMWgcT2yctWFQPKiTFW14qlUR
X-Google-Smtp-Source: AGHT+IFumu0d3aSL9MdXegbiKD/oDMgzcmWWDAp9GrMS9UAoUq2UXSYKwiW0K8wjP43RuzzviZ24kQ==
X-Received: by 2002:a05:6512:3e28:b0:534:3cdc:dbe6 with SMTP id 2adb3069b0e04-53546b1968emr11428897e87.9.1725376952528;
        Tue, 03 Sep 2024 08:22:32 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb25asm694026566b.41.2024.09.03.08.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 08:22:32 -0700 (PDT)
Message-ID: <12f68236-bd8e-6240-c7d5-d61e0e102e04@gmail.com>
Date: Tue, 3 Sep 2024 18:22:30 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 00/10] Add minimal Exynos8895 SoC and SM-G950F support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
 <03e65361-790b-441e-b8e2-b8db4ffc6603@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <03e65361-790b-441e-b8e2-b8db4ffc6603@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/3/24 17:45, Krzysztof Kozlowski wrote:
> On 03/09/2024 14:44, Ivaylo Ivanov wrote:
>> Hi folks,
>>
>> This series adds initial SoC support for the Exynos 8895 SoC and also
>> initial board support for Samsung Galaxy S8 phone (SM-G950F), codenamed
>> dreamlte.
>>
>> The Exynos 8895 SoC is also used in S8 Plus (dream2lte), Note 8 (greatlte)
>> and Meizu 15 Plus (m1891). Currently DT is added for the Exynos 8895 SoC
>> and dreamlte, but it should be really easy to adapt for the other devices
>> with the same SoC.
> How did you resolve this comment:
>
> "I do not believe this was tested. See maintainer SoC profile for
> Samsung Exynos."
>
> ?
> - Fixed suffixes for the exynos8895 pinctrl device tree

It seems, however, that I've left a few nodes improper.


$ make CHECK_DTBS=y ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- exynos/exynos8895-dreamlte.dtb W=1
  DTC_CHK arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb
arch/arm64/boot/dts/exynos/exynos8895.dtsi:175.38-186.5: Warning (simple_bus_reg): /soc@0/interrupt-controller@10200000: simple-bus unit address format error, expected "10201000"
/home/ivaylo/linux/s8/for-upstream/linux/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@11430000: 'sd2-clk_fast_slew_rate_1x-pins', 'sd2-clk_fast_slew_rate_2x-pins', 'sd2-clk_fast_slew_rate_3x-pins', 'sd2-clk_fast_slew_rate_4x-pins' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
    from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#
/home/ivaylo/linux/s8/for-upstream/linux/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@164b0000: gpa1-gpio-bank:#interrupt-cells:0:0: 2 was expected
    from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#
/home/ivaylo/linux/s8/for-upstream/linux/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@164b0000: 'key-power', 'key-voldown', 'key-volup', 'key-wink', 'pcie_wake-pins', 'wlan_host_wake-pins' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
    from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#


I'll ensure this is properly tested and fixed next time.


Thanks for the quick response and best regards,

Ivaylo


