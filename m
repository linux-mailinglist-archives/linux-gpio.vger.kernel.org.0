Return-Path: <linux-gpio+bounces-11624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B13269A3E56
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 14:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64AFE1F24AFA
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 12:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E208F18872C;
	Fri, 18 Oct 2024 12:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ewnT43Dv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799388F6B
	for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 12:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729254391; cv=none; b=bgHPkr3svTitkpV3kW4KlGUKlAOoxldS78SGV3V3f8/0XW8VBemYAqvjtlml32OVw+mTYSioNG/Ct2kpjBotXcCmXA86bF0XtghpWhyDZ+G3busqX2xX0EpwN5sJbqpl9Lq7IkLFIkUyFRl7y9dJQqNiqSVderIJUTqdAqCfIYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729254391; c=relaxed/simple;
	bh=Uh3+7TMjGd7ntNY9Wy8bfawFFggv5z6Z2IzetUpvySk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EfIp/fl7Ofb7MXh2wOA1J32p2PoqNEYBuIWvPNEkDQExqxYcFt1Dt/dFXPRjy1jv+s1joWEwfCpkJEjkRovN0POTfsbE0hEa9APftKXFEiwLypkFI4nu3pLx5Pk7+e5zeFU42fswr/moQ2If0x6/r3lNlh41dfU2dqwdOMTRhNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ewnT43Dv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43055b43604so21626065e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 05:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729254388; x=1729859188; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5YS74a7m9Z0FRUCbatwYpptX+BA9xoFlV0gIpbemQJQ=;
        b=ewnT43DvMRmcJegNAco0VFet0s2TcXL+0abocHZlwAyot7NWlGAbhtY639y2Sus2X6
         n4T8LgyAvl3svdY87L2ThvnhO6qiEidEuhKcWe6JK/wKdd4smtLeiXN7Zvyq+/cMNY2w
         oD1DzIa1n3g9dcWdphuHh09XkLXOnIe79nqcQp9fxyz2PRWGjueoOXBKNLSxC05k/Bf5
         Owegb0md1Orz8qjjfMsuHllZZMRY7xW92CfDkr3DLEUNyq+c2w3KNCONvYM3ECV5kcL9
         ZLT0PSd0icfWYBoVFQwloGiD69oOVFFfqDCz3XjFK2JUNXKumdlko2eVW8mnJ0JGhmw1
         zQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729254388; x=1729859188;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5YS74a7m9Z0FRUCbatwYpptX+BA9xoFlV0gIpbemQJQ=;
        b=Xi3zyMtSf9C21B0GDHeIrFr2H6G63oj4JXRLuDomXz47zruYzkC7TGNozUeMHY4zxC
         Pj6f6yBJlSAwq0Tb3HG+i3KnnDiAFu5Dg1T+5jg0xEwhHptF5BciZJrW1HI++Zj25Ald
         ApTLJH4TYDiaA26BkuwOP1XINttbDoqZD9+fM3OTxHTlX4QNbpcJuMit0o8jgmG3fp6n
         hS7sZbHl2aN43fuhNWpAmtSU19QMMGuWAWXJ7BWhM0RoznR13NtP2NOn66ZzDrCzqRR1
         7+9hZ6NuwNDKaQ2Oe3W0LrA1EvoGGbKGIrzqeZ5Z82nuuC4fw3jWFdEukCbaC1G97c/S
         h4CA==
X-Forwarded-Encrypted: i=1; AJvYcCU5KsYPGIoia6k5w7xZmPU6JCLBl5kckPVK42TqFGC5PU8tUjaJujZZQgTdKZgDSnfsLfhj1kKhYITm@vger.kernel.org
X-Gm-Message-State: AOJu0YwJsqwAG0dWBRk5j0hs4hJuJo4gv4Mfd8glKK859cs5E7XGYK9K
	0/rqQjwuQdbaF7/Tx7qgr+S0CdWabn1GJN2hvwb9uuvailFVkkEE5Nn8kJMtXnc=
X-Google-Smtp-Source: AGHT+IH0D342MuhKUa3UYsaToIehwKc/N4IfojfzV6RoQLZSnVuOV356C0GEf4yeThmx1zhx7T5kGg==
X-Received: by 2002:a05:600c:4687:b0:42e:d4a2:ce67 with SMTP id 5b1f17b1804b1-4316164dd02mr18506575e9.17.1729254387614;
        Fri, 18 Oct 2024 05:26:27 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6e2b:4562:2d66:575e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43160e4fe8bsm22609435e9.44.2024.10.18.05.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 05:26:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Linus Walleij
 <linus.walleij@linaro.org>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Bartosz Golaszewski
 <brgl@bgdev.pl>,  linux-gpio@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
In-Reply-To: <d654d2b2-977b-44c0-8b01-b26f5eb0a3fe@kernel.org> (Krzysztof
	Kozlowski's message of "Fri, 18 Oct 2024 12:13:14 +0200")
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
	<20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
	<4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
	<1jttd9rein.fsf@starbuckisacylon.baylibre.com>
	<4127b448-a914-4c69-b938-29512995326f@amlogic.com>
	<1jmsj1rclh.fsf@starbuckisacylon.baylibre.com>
	<d654d2b2-977b-44c0-8b01-b26f5eb0a3fe@kernel.org>
Date: Fri, 18 Oct 2024 14:26:26 +0200
Message-ID: <1jiktpr40d.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 18 Oct 2024 at 12:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 18/10/2024 11:20, Jerome Brunet wrote:
>> On Fri 18 Oct 2024 at 17:01, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>> 
>>> Hi Jerome,
>>>    Thanks for your reply.
>>>
>>> On 2024/10/18 16:39, Jerome Brunet wrote:
>>>> [ EXTERNAL EMAIL ]
>>>> On Fri 18 Oct 2024 at 10:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>>> On 18/10/2024 10:10, Xianwei Zhao via B4 Relay wrote:
>>>>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>>
>>>>>> Add the new compatible name for Amlogic A4 pin controller, and add
>>>>>> a new dt-binding header file which document the detail pin names.
>>>> the change does not do what is described here. At least the description
>>>> needs updating.
>>>>
>>>
>>> Will do.
>>>
>>>> So if the pin definition is now in the driver, does it mean that pins have
>>>> to be referenced in DT directly using the made up numbers that are
>>>> created in pinctrl-amlogic-a4.c at the beginning of patch #2 ?
>>>>
>>>
>>> Yes.
>>>
>>>> If that's case, it does not look very easy a read.
>>>>
>>>
>>> It does happen. The pin definition does not fall under the category of
>>> binding.
>>>
>>> https://lore.kernel.org/all/106f4321-59e8-49b9-bad3-eeb57627c921@amlogic.com/
>> 
>> So the expectation is that people will write something like:
>> 
>>  reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;
>> 
>> And others will go in the driver to see that is maps to GPIOX_10 ? the number
>> being completly made up, with no link to anything HW/Datasheet
>> whatsoever ?
>> 
>> This is how things should be done now ?
>
> Why would you need to do this? Why it cannot be <&gpio 10
> GPIO_ACTIVE_LOW>, assuming it is GPIO 10?
>
> Bindings have absolutely nothing to do with it. You have GPIO 10, not
> 42, right?

That's what being proposed here, as far as I can see.

GPIOX_10 (not GPIO 10) maps to 42. If this goes through, for DTs to be
valid in any OS, all need to share the same definition. That looks like
a binding to me.

On these SOC, gpios in each controller are organized in bank with
different number of pins. So far, this was represented as single linear
array and that was not a problem since the mapping was part of the binding.

Are you suggesting 2 params instead of one ? something like this maybe ?

reset-gpios = <&gpio BANK_X 10 GPIO_ACTIVE_LOW>;

This means this A4 controller will be software incompatible with the
previous generation. It will need to handled differently eventhough the
HW is exactly the same.

Note that some form of binding would still be required to define the
banks which are referenced by arbitrary letter in doc, not numbers.

>
> Best regards,
> Krzysztof

-- 
Jerome

