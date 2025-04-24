Return-Path: <linux-gpio+bounces-19254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A5AA9A70C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 10:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C489E1888E8E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 08:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC068227E8A;
	Thu, 24 Apr 2025 08:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EVV6F8V1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B245521FF3D
	for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484683; cv=none; b=NvTxwVkfov9euJbZl7hsXCMKUaRZQFgNf0r67V3zaPepQJxgLNgCTx7lAwZb17XkWq8A4H6vFR2vih+s5lEBMjp7fa2PPrV+0zxgF9q4L4eYp5kqrWQ/Nl+/yf7gXyJ1oHt3H7f/3hkQfncXezDMqRelbEItIJI8suSvaaOCX4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484683; c=relaxed/simple;
	bh=WTjakC4kAWMQ2xS/yccnwI529/S0/2AvLYfyLQS5TVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QL4Ku2o/aUXYcc6CgRBmXNp+OcGZGOlnr1xD/5+kWJn60tP7K9LNf3u7oiGZE/Q0yDzc5Z+mOJtwU52QDqIYj2QnhQHjqpZ0WbacxO+ZelIK/ezegW1Un2WAvXPJ0a+NzR2JmHjrbWPuRcDfmZA3ExnvL7Jne70MuC7L4FDRMKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EVV6F8V1; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so8425611fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Apr 2025 01:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484679; x=1746089479; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTjakC4kAWMQ2xS/yccnwI529/S0/2AvLYfyLQS5TVI=;
        b=EVV6F8V16wA/YF7LAuKZs4BxHwPIt6sB1mPWC/guD5RcoZOuMtxW/jo/+WFavvXhAu
         SaXtLeRvpYnQAqiiF0GIojHPwXOpFnXscIpEG+Brn6cqwR46c5yRw2LgphPSkwKiiHKI
         uuANMD+BmeEmX1cStdaboKJO6hh+hRWBH3LxZsvWPVAxAF1HGjZ2o+sh1lXb51C6UDxz
         DPKDzojpxr9p+VJcHXnDbXygVHn4b9qcbeDFAMrL7Qj/CzRqjuDEfw1ubpBYQJLMRkDn
         TgcVwFBpxqKFscO5zmM7+TS36EPxcNTt2ZVMTtXd31fExPnwagUGTYyTE7yp76zvFvmY
         fUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484679; x=1746089479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTjakC4kAWMQ2xS/yccnwI529/S0/2AvLYfyLQS5TVI=;
        b=msxgwR+SBfSitQwprQDAMgt+RRjjBfXrcCfyRbEzv69x25JuokyJVcDvn3O1Jvqum/
         Zn8V2P45ChzCcsr5WZzoakaFIxbEhJU0yGPnXCXJS1EyYophWwwEZJD1StYAH8zcX4F0
         K7ijkJow00gJ9eY2ABq48HrBdP1MzlK3BxG36eOAaw4cDMTIrdcNUgqnSq9AQ9yHhe31
         DewL7vxUEOutACgSf8ABkMCSwGdZTbdHlaxswwp9EWalvwBwFTkJ2SDE4six0liBIz7x
         N4tHcaJd9yS7Z37rb5XwBrM0YrUkE5R4X5D/xAox0Q0KnXOW65CJao82bZ9IcsQVyUy/
         bNKA==
X-Forwarded-Encrypted: i=1; AJvYcCVM6XZ00DEQP8x42RxRU/U5hdqz0SYgrLWREmguFaSn1LIbEsLxT9pRYXLLf8KvuzWNEQKcZQ82R7aF@vger.kernel.org
X-Gm-Message-State: AOJu0YxL7QJdInla/iZK+qfVm/XeXNoRsi/aETOBLBlpl6YU+U/ZV+xh
	0/m1AMPA7GruZtabl3xvqeBoYPxVCL3+9f3T+RXxDdw0xbW44CQtWsadbaZBc/2CcYEHvliL21q
	gdWzjk+TGFHelCkilywUqdU604ItBd90Fugpkrg==
X-Gm-Gg: ASbGncthNRry9kxwdV3/6q41Cz23OTUhCG0/2LTNBx1I30tt5zTdibsVwhf77wN7dli
	ZLg5bIKKYNVLO2dbimf6q1o9kseR65xrUZl47bX222z058AaKtVh3xcKahHH66aI664bl4E35Od
	WLpHBPibpxc2XdyW4cS13GlQ==
X-Google-Smtp-Source: AGHT+IHVUjEPXYrY3sHIef5LKhQER52yuzf898RP4j9oF4QvMsHg66AhVu0yfj0NhwOcjO4n0yujHvjloTqfizgTfb4=
X-Received: by 2002:a05:651c:b28:b0:30c:12b8:fb8a with SMTP id
 38308e7fff4ca-3179bd52581mr6677701fa.0.1745484678572; Thu, 24 Apr 2025
 01:51:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424062017.652969-1-uwu@icenowy.me> <20250424062017.652969-2-uwu@icenowy.me>
In-Reply-To: <20250424062017.652969-2-uwu@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Apr 2025 10:51:05 +0200
X-Gm-Features: ATxdqUHVq_nL22G9xrtOjqSrYO8fC8-z8I_XXvLVBIP2wzvRpiBlPgb7WiVSR5s
Message-ID: <CACRpkdaX0hTJSsZN6YNXASY3noZw=JsOSXzFBbxKegJ6A+2usA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 8:20=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> wrot=
e:

> The JH7110 SoC could support internal GPI signals to be routed to not
> external GPIO but internal low/high levels.
>
> Add two macros, PAD_INTERNAL_LOW and PAD_INTERNAL_HIGH, as two virtual
> "pads" to represent internal GPI sources with fixed low/high levels.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

As per my other reply in the previous post, I think this should be
handled internal in the kernel instead using a tighter integration between
the GPIO and pin control parts of the driver and utilizing the
gpio-specific struct pinmux_ops callbacks.

This solution looks like software configuration disguised as hardware
configuration.

Yours,
Linus Walleij

