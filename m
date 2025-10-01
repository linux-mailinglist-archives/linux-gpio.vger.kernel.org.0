Return-Path: <linux-gpio+bounces-26714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1ACBB0291
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 13:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 164D37A5166
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 11:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F90C2C3263;
	Wed,  1 Oct 2025 11:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CxxW67fb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485F328F935
	for <linux-gpio@vger.kernel.org>; Wed,  1 Oct 2025 11:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759318157; cv=none; b=o7JvcwNYq4E9gXuF556vvndXRMGelW2oB3AplYk7P99GO4A9r8ALnPHj7pMHA+H68Z30XajPxesI6icX7VLBFO2NThrRCn0gKV/46zud7wSv+58iKzCC5PX9fgtfzNMLHkp7MQNfVwZvkfydKGthzS3st/PymP34PZrjkEFYmFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759318157; c=relaxed/simple;
	bh=J2KI+h/IbZeul8EvQ7hpwhQ5urJf7JTxEFMCF/VS73M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvzuslexYWQOgYxAw+NxfxIm/SwN0u7q2sE9Dmpb2Gai6Q2wHSSveTN3SKkV+Xcsy8CqZvKHV08Ylw5zFcPkVm2SWQzTni08b75IkXk76gQ3h8wiMeVnNSRhXTs442dv+Z5NshWI9Tjj5sOovgVWgCHYN1CI3UTRVXi3dRMeG/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CxxW67fb; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-363f137bbf8so67324041fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Oct 2025 04:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759318153; x=1759922953; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G2nQ0ZYGSkmH7zSth96+SXD5FBu7NWfoss8LUhcaao8=;
        b=CxxW67fbo/Mqwf4QI3GYmm6gUbCct47KNi0xCJ1URU9mDTnzA451anBOd4FwZLKbxY
         IpMp1SbN7WW990rBItZUmOYVn8TtEAtAaytj/GFwzqb2qUh2xrJFDvKbSuFXqIWB7NAt
         5uCwLqL3mTmAk1ffISDHRdxfL/3C0ZaOw+I7tydEKHAwvzvnmKdezzOo90rzwAKgRj9p
         3VLYkKyYNBbUNeesgfiVXkYE+Jg6LJu1e2e6gOdzIl6L0d5y1imXLZ185sKDIIJ5h8JF
         yAOFqd7+WrbhdOUSNYB6vIeo/R75JTx/tfuKQUAn69IPS794tOKCHvXvRJtJ9WP4JUEq
         vwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759318153; x=1759922953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2nQ0ZYGSkmH7zSth96+SXD5FBu7NWfoss8LUhcaao8=;
        b=rT7JutIjrovyCrX9e0e55PmMuEHj5t027pgjb0ipt6sdYDcW6e1n0wR1z+hAozl4zB
         Z+S8L2EKJnw+cJ3qJ8gGF1KoxTGKq8ZOkyjW921rt5VDLu/tWdROOSvjj/KsE6Rt4dvj
         BHJurT96VmevEnbMiZGEXxiYF0Ko+VljasiSDgmTiN42opKqGLJZwn2EqFheemhYz9TU
         0edPfLxoMnrUUPifSoeIUgSLUoCzwefgWVYhnzp8sB25hXsU5vsuTO6YIIE/0vCgtfQQ
         /Bcp3rNhwUPiSc/KX7BRVkc08bW4vhh8G6GGPSFyeJ2epVlhuwZmMwYiszJ8Lqyj8hfe
         Bceg==
X-Forwarded-Encrypted: i=1; AJvYcCU3x+yvUVvrMTSSEtmtLjC3IXJ7NtztvqKOJYmTuHlLmelOJ5PJSwxIFu8l92XNRJOjHPZXuOCd4oam@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ00Ho1jPodknbvrgsDPXTV0kjnUhrimnPGOugBa+iYnpeBMLg
	CJw/3j2Th7/TtwBgbXNZwQnzjk4GbvEHjXvUIwv3g3w0Fa/bvuiClV8Dn8ux1QXPBiFE/pHgQbR
	ov/QLBHs8zOJHwO6E4R1NuVRONBOrbufWQ9AJkVp4kQ==
X-Gm-Gg: ASbGnctgxosATJx2iZx5byf7B4gZGMXVdmbq8BmupQpw2l3k1NgY+f5jwH6R6t1TqQ0
	AGEBqBkswYFrtv/oVEXO9MN4PE8TFs5JdHuImz/Ngf69m7DGRwkuCFd3rDRmJ9N49guTc3NYjLF
	vrJxJWi7cHOY1TMV1+hNDH9Xb72eFGhWB9pmWXkS1S/sstpFVDDpD3Vu/fLkBVbZED0CSGNTmKQ
	5L+AxhZ/+EOV7BBVtDCknFECMeiiKc=
X-Google-Smtp-Source: AGHT+IED4sogAWZEcKAu88oZawMJSJACsVOtrSC9DrBuFS5cRrDnb3PP0Cs4igjnbwVY2shftrEtzR4Q8wzk/RxCXoo=
X-Received: by 2002:a2e:b889:0:b0:355:8c28:898f with SMTP id
 38308e7fff4ca-373a74c9e01mr8617321fa.44.1759318153366; Wed, 01 Oct 2025
 04:29:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-manpower-glacial-e9756c82b427@spud>
In-Reply-To: <20250926-manpower-glacial-e9756c82b427@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 13:29:01 +0200
X-Gm-Features: AS18NWAR63F2W80PhEf-5wDYsiYR8t0iqN2CJdxGLkq1AYZmNVnH06hAE4wzSP4
Message-ID: <CACRpkdYXh2MCs=vAif7BpxfYVRuDTkYYNwpV2t=J_ZRW+N4Vyg@mail.gmail.com>
Subject: Re: [RFC 0/5] microchip mpfs/pic64gx pinctrl questions
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

thanks for your patches!

looking at the drivers it appears to be trying extensively to make use
of the pinmux = <>; property to mux entire groups of pins.

pinmux = <nn>; is supposed to mux *one* pin per group, not entire
groups of pins from one property. See
Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml:

  The pinmux property accepts an array of pinmux groups, each of them describing
  a single pin multiplexing configuration.

  pincontroller {
    state_0_node_a {
      pinmux = <PINMUX_GROUP>, <PINMUX_GROUP>, ...;
    };
  };

So e.g. when you do this:

       spi0_mssio: spi0-mssio-pins {
         pinmux = <MPFS_PINFUNC(0, 0)>;
       };

We all know SPI uses more than one pin so this is clearly abusing
the pinmux property.

It is unfortunate that so many drivers now use this "mux one pin
individually" concept that we cannot see the diversity of pin
controllers.

I cannot recommend using the pinmux property for this SoC.

What you need to do is to define the actual pins and groups
that you have.

Look for example at
Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
drivers/pinctrl/pinctrl-gemini.c
arch/arm/boot/dts/gemini/gemini.dtsi

This is another SoC that muxes pins in groups, not in single per-pin
settings.

Notice that the driver in this case enumerates and registers all 323
pins on the package! This is done because some of the groups
are mutually exclusive and this way the pin control framework
will do its job to detect collisions between pin groups and disallow
this, and that is what pin control is supposed to be doing.

I.e. do not orient your design around which registers and settings
you have, and do not model your driver around that, instead
model the driver around which actual pins exist on the physical
component, how these are sorted into groups, how the groups
are related to function (such as the group of SPI pins being
related to the spi function) and define these pins, groups
and functions in your driver.

Yours,
Linus Walleij

