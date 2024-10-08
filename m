Return-Path: <linux-gpio+bounces-11032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA2B9944A2
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 11:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A098B1F23426
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 09:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58703173336;
	Tue,  8 Oct 2024 09:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DD60WeeX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0D1320F
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728380778; cv=none; b=bYiR+pkoaZDTfH0ElNKqeLqjn5Uml++DC+sI4gGIvlKKGtrfQpPizlZkYzJlb4cs1qjghNaBT3A4HRok+kBlI2EDm56SAV4gx1fcIMdT+A4ZmbXaPp5uA1G7pQMBCb3uKJ3Bbooid8i1nDnglgs/qMhAEblwNZ8N5zK9UWJZr18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728380778; c=relaxed/simple;
	bh=s4jJh1r+FyixAacuMNs5Dtd7m6EYNQNvXHTsv2bNlBw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dC57wyx5NbHT9yYDW7SLVMZ2/cRzutjlmHv0BPa61Qh/KHdT9etenE2RFASWbJvNctjK6EHdpH9SMt5pkOo2awK+2GtwV1ngPwIjZTE1lwnus3z4qtwaJXvRY0jJNmwQcRt9MgKeOW3PR2TPjr3D/NB30O+mDclY3ldmo+bCGk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DD60WeeX; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-50ce2aa412dso125426e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728380775; x=1728985575; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s4jJh1r+FyixAacuMNs5Dtd7m6EYNQNvXHTsv2bNlBw=;
        b=DD60WeeXstz+WP6TuRFx3nlYfSbGPOfAfHU2XKrL27Y5t5mLdlJ8L5oRI9xuAXnpac
         EJrUdug1GaE6FoRtHqxHmuCqXHIqW755EqoEB7+b0h1+R/TMcMDoXuIxtjmIQ0acTRQN
         qqCBZQsFU1FBh3A2IWLCdjGar3a+SH+vwb7rZtJRny5U9QQs0qd4VfYPVmCqMmH4RMmK
         JZUAjdojlDbuIATF/dP4WOlhRC2z+WCpHtTFeKJiG6jVPyBNF+QyVrPB5I08NW1mukgO
         lY6GHKSFJi+ywOnfqJNmcxwCOhviYlaQgUt31YridffGjc4dzr9cL4Kl1QOTMww0Ctf0
         Baqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728380775; x=1728985575;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4jJh1r+FyixAacuMNs5Dtd7m6EYNQNvXHTsv2bNlBw=;
        b=VLdHQFDuLeQmANwSRp6o4LjSTMbpjE+mSrWYFCyqhEbdGVVqSavJBGeDVSG5cIffQK
         +deIJ2PKBbwExHxlQBA6R8lpWJZRJhcIvlCEsNfCUf/dpqB5JKveHNGFcM9lZk/aI+2c
         AyF6J94UgOYIn/tGdYXYPWPuWd4kXURBaI2APUrndkNaOU4MWFr4AWNxisIWlUN44n0N
         oh6C61S/UiUWbxCusqn2ZPW3lTfpdy85Wiqbc11lAzUPyiX498E/vTQHLO5ABTjU7Zkj
         0/n8GJN13CsjLwk4+/7SFfqn69rd2OI3czLsjK1CLg/J7cBu8HIxhhtDD0GIP4pzIzL3
         IKzg==
X-Forwarded-Encrypted: i=1; AJvYcCXM/bamqs0tri/dKrsjK8Rcp9V6mOutvQFcv5VI1OV+M5/YMgb/acXwHK1QPCVNp0G4ul2ZSH4uCuGA@vger.kernel.org
X-Gm-Message-State: AOJu0YyO9jllBftQYMlGPZwDCh7A8c40L9086sTy2KkEwme6ZsfwoDf4
	Kj7QqgXbPjFH/e3aRTK067sDxyclhsHqLU6C0wgCGe8OEi2lKKIPTXIjZEOT+JzNzcrN+FoJh7N
	kbTbNpQjA/X0Aod844j63OHVqrNM=
X-Google-Smtp-Source: AGHT+IG9OBTyCsKcdoyER/5MhDCPilHj2N+TJh588EX2fPwqgTQWTLzt9kjpqptSFYaUifAfC8R4k/X9BDmqPjPEuY0=
X-Received: by 2002:a05:6122:30ac:b0:4f2:a974:29e5 with SMTP id
 71dfb90a1353d-50c85448840mr11671708e0c.1.1728380775490; Tue, 08 Oct 2024
 02:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Oct 2024 10:45:49 +0100
Message-ID: <CA+V-a8vxUjTWccV-wLgy5CJiFYfEMsx-f+8weCJDP6uD_dh4AA@mail.gmail.com>
Subject: [QUERY] : pinmux-pins GPIO interrupt pin
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi All,

When using GPIO pins as interrupts with the `gpios` DT property, it
follows the `gpio_request()`/`gpio_free()` path, and in this case, the
`pinmux-pins` sysfs file indicates that the pin is claimed by the
pinctrl/GPIO driver.

However, when the same GPIO pin is used as an interrupt with the
`interrupts` property, it doesn't follow the
`gpio_request()`/`gpio_free()` path, and the `pinmux-pins` sysfs file
shows it as `UNCLAIMED`.

What would be the correct approach when using GPIO pins as interrupts
with the `interrupts` property?

One possible solution could be to hog the GPIO pin as an input when
using it as an interrupt with the `interrupts` property, ensuring it
is claimed by the pinctrl/GPIO driver.

Any pointers on how we can fix this so that the `pinmux-pins` sysfs
file reports it as claimed?

Cheers,
Prabhakar

