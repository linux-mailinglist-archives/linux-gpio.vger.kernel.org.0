Return-Path: <linux-gpio+bounces-11615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BDA9A39CE
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 11:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 498A21F25269
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 09:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9EE31EBFFA;
	Fri, 18 Oct 2024 09:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iZWU85ec"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E38A190665
	for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729243263; cv=none; b=HsxTFQ+mkpmnb/OcV7aSQapLS2EvF7EEdq5Bmly0kmoJM9b45JT3kS7SrTVm74/IRYYtrTkq4aINN9S/fMvOyW2nAs6KU1bfgLB4yGML4EnTbsP+qqZvfRabiOYdQUfBTs3xS6IKyLcAeCIMqrVosaxSjEUHdN/grbn029IBJ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729243263; c=relaxed/simple;
	bh=2m70Uo5edm0oou27BOFno3Tc7nrR3KC/y7H2rhdo2cI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m3BKsktQT5DDdTmswUtjCUE7xpy9fEyMhjTjgNKyPZ/ZRLTFEcb10F2sbmLEVPXN3/BBT9pvT5la1NMPicy5QPHO89kVXDqgCr0YNFv2XL5678fGenskmP5HlSeIwLO7xoVVhH5yKap/9S76eW9nczRyje/H3jXD28AS8AlcI0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iZWU85ec; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43055b43604so19785475e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 02:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729243260; x=1729848060; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6CJlVFCdkLnXR5mIG5TznNaMuOGXx1zBL9Ig1xKknA=;
        b=iZWU85ecUfM5JfobrqRPohtE6Qaq+tJ4NSord7rOJxlYRdln2IuKS6HVBKTNMHDsp3
         gmp9ghZn3PSSunfL5ExtHg0FSdVDzrfz9+RY2cSBT9cCZsM9U2wPGEu2sCP4sUvL6EAn
         E0qB4OpnkJNeDd/y4Fy0FlS70JerECngT4o3n8UrgU62H947D4SHKJjC4tNPR/TaVJl4
         fOhoRS+b3oihaoNNlp9VSD+sWG8lEOKwpDotonmNP5EBIxsx3P1MENKu3yPVYW7y8Kj0
         9u1ByKHB/dhFIhnm6OEQ0MsVa1NScCVgFysJfroTCOVC7kvpNOUItbMWLORfjdiyTUqX
         4b0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729243260; x=1729848060;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6CJlVFCdkLnXR5mIG5TznNaMuOGXx1zBL9Ig1xKknA=;
        b=YqHzcu7Cn/3gcuJEdd7UbQtTuDJBDIWeULGf0Sa8ZHEb4LS50feCfZsTA2xgqnW6nH
         1W/59B4ySOiLaDR+FtrAvwbiF7uaULlgmPAHMuzxG63nnH+r+eSNx7TliYeVaOInY33I
         wjGRzdg4MEnJF3DKI68l0go4UJgdM4gtFJ+AwChIbHhwJAzw08YyQ+wGoJMjsAi02hGg
         Dsj105EKONYAo5lS187Ev0cTrLiD2IoHG9lQItVuAGESwnJy3jtLlLC5TFcAl3q9yvng
         rg8CjQO+d4VSV+SINucqkjkF+r14Cs67wE2ufuMiUGaMkcfeW+2qoCA/kpuwBhAEnREL
         VeAA==
X-Forwarded-Encrypted: i=1; AJvYcCWwpcwnnicSlkaGb0Qm5cXC2PbGR55pd/ue4m0G5+y6qk3jC2UAhX/LaXJAdXf9SWTNbjEQX962/i2F@vger.kernel.org
X-Gm-Message-State: AOJu0YxeTPg+ShYcveVF/37KlEICPs/is4n4z8zHaOfxLA9b6N54kPT5
	ktXZ+/cMvN6iUFX/JDHi1NFhqwNT7sv1WRdiibKG0wPhWkEZpb2MFEzzhp2juKc=
X-Google-Smtp-Source: AGHT+IEjc8x6P1fiXZXvuy0RRWf3NASza2rMgKQJv+Xo7tziKvwCXEKE7ppPcNk2dKWu+ZlA7d9gqg==
X-Received: by 2002:adf:9bce:0:b0:374:c3e4:d6de with SMTP id ffacd0b85a97d-37eb47693ebmr1176601f8f.41.1729243259689;
        Fri, 18 Oct 2024 02:20:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6e2b:4562:2d66:575e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0eccbasm1390562f8f.81.2024.10.18.02.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:20:59 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,  Linus Walleij
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
In-Reply-To: <4127b448-a914-4c69-b938-29512995326f@amlogic.com> (Xianwei
	Zhao's message of "Fri, 18 Oct 2024 17:01:09 +0800")
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
	<20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
	<4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
	<1jttd9rein.fsf@starbuckisacylon.baylibre.com>
	<4127b448-a914-4c69-b938-29512995326f@amlogic.com>
Date: Fri, 18 Oct 2024 11:20:58 +0200
Message-ID: <1jmsj1rclh.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 18 Oct 2024 at 17:01, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:

> Hi Jerome,
>    Thanks for your reply.
>
> On 2024/10/18 16:39, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On Fri 18 Oct 2024 at 10:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> 
>>> On 18/10/2024 10:10, Xianwei Zhao via B4 Relay wrote:
>>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>
>>>> Add the new compatible name for Amlogic A4 pin controller, and add
>>>> a new dt-binding header file which document the detail pin names.
>> the change does not do what is described here. At least the description
>> needs updating.
>> 
>
> Will do.
>
>> So if the pin definition is now in the driver, does it mean that pins have
>> to be referenced in DT directly using the made up numbers that are
>> created in pinctrl-amlogic-a4.c at the beginning of patch #2 ?
>> 
>
> Yes.
>
>> If that's case, it does not look very easy a read.
>> 
>
> It does happen. The pin definition does not fall under the category of
> binding.
>
> https://lore.kernel.org/all/106f4321-59e8-49b9-bad3-eeb57627c921@amlogic.com/

So the expectation is that people will write something like:

 reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;

And others will go in the driver to see that is maps to GPIOX_10 ? the number
being completly made up, with no link to anything HW/Datasheet
whatsoever ?

This is how things should be done now ?

>
>>>>
>>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Best regards,
>>> Krzysztof
>> --
>> Jerome

-- 
Jerome

