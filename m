Return-Path: <linux-gpio+bounces-3936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D5B86C584
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5F831C21AFF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2B160912;
	Thu, 29 Feb 2024 09:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EYYRkh6Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD176087F
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199510; cv=none; b=rrQlKxbGbjc/JuGDDT/r5mLCRARtP4MMf/HSDvc8i9Oh7bsZkEwPP9cwND0BIpTDKhlRyNGDRUs3JjQPtyVGFPG4KOs/Zvqlu8+rA8+BVDtXxfhJl4TWaKjU2rcKfaESa1pCiXOEqWpPpaZRfghX/3Upopt3hz2sWg+RdcIqLkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199510; c=relaxed/simple;
	bh=ji0evMeodU7bNiEaX0y74fD8RtxAhbXOV6mH0WkgcmY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RwE/jTB7nSKa0t1RkEpJNpywsnxjCdQuim+0bwn/UQq8hJP5by4g9S4H6Mt/hYQs33b3pp45iQNVjyI6Vuque7N7QFnuFY7+VdAyOIGshlUPT2jMaLzZqhRulbuq933ouyx0+rmEkK+HcVKHvoQVZot2zoc4kjxnGVGPN/2Dt30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EYYRkh6Y; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-608e0b87594so7043727b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199507; x=1709804307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ji0evMeodU7bNiEaX0y74fD8RtxAhbXOV6mH0WkgcmY=;
        b=EYYRkh6YFvJprq0PxQoOtB2ny6Rb3DoEOA787lqXdLP2zlcm13be9SdFq4UtszcBly
         VJi6Ni3n5LYKslcVDuOw8QK/hH633HvsuR1XIPzjyesrgSROG77Y4g4C2E9obsxc4xo+
         GG2uVf3A0yMnMLWUDSa5OFJ38TAG64lvcQC1VM8rPO06nTCtF/E7QT3T9OujgNY/4UyR
         bTuLDZnq8E3StaGO4JLlaW+mfmzY3RAhySqacYmPJcOe74eX8yhBi7fx+z0oJOx6ijj+
         8sTrXAKh8HXKIfO00R4gzf5nd4CUxNY+9ax4loYf+7iRrfardiKx7TqOl19krmNSJPFw
         6zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199507; x=1709804307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ji0evMeodU7bNiEaX0y74fD8RtxAhbXOV6mH0WkgcmY=;
        b=Jltg8Gqqgdy3W63ilJlkP6CEEBQeyzxKJq7jPXEo00U6WEGONGw3ErNjPF1JLQLAvj
         TsBig+430gr0fi8UqATpelwV596VQkXaoE9uCHu7LhQg+nhcfq6Zj21aFOwKf77F+j0a
         XdDarREt5EhpEnDkVR4npEmbFluC/4VOhEywM+Z9zZXTQG6OBulf7YeD8rHkSKJIVSzu
         Xu/ZHkm6oOEWAp7p9L3BVMLqocer4lj6kecXgWrzXCUShrUfiL9sr4Q6d7x63XmB6N1i
         CZvcvmyT5F+RcLjIkpb7+/goqomSSMYiBRutVXZWX7IJNiwC883oH5/+8+bZaEBW73r3
         EKIw==
X-Forwarded-Encrypted: i=1; AJvYcCXcxFmghdmC8wAm9b7c53j0DS7KE6hBhI7vc1z7QkNYlGSPC/9SsPLPgQVKe2qdOVJzEF1tElL+HkyGw0LsS2yrIt6GlZv8r+6lGg==
X-Gm-Message-State: AOJu0YxrRLxF4KoZ3ufmzXvhi7m1VgoIyxfk0OxcKqEp8ko87Ji7DkTE
	4TrmzS6q1DDJUdyvWfZz91ABAvgW5KPf4gPLW1G10Vs+wpNttf+2Blv6m+WkY+yJrIjGiiQ+FHY
	LX+sB5SBo/PPpt2MB8IbG6Hmvo7wfSiD/BvC8fQ==
X-Google-Smtp-Source: AGHT+IHpUTC0tD4+eeNVpg7JVN9p3Nit+u2YhFzzaD2mD4WuXW+hkiH/3TUn0JnN4dt3kNq1EBKU3Os1w/KcVFMeNHw=
X-Received: by 2002:a5b:bc2:0:b0:dcd:26a8:7f84 with SMTP id
 c2-20020a5b0bc2000000b00dcd26a87f84mr1514094ybr.47.1709199507561; Thu, 29 Feb
 2024 01:38:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-24-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-24-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:38:16 +0100
Message-ID: <CACRpkdZpnHTNj7KUxk6WfSMzMsGk=c6Jzu=zy7UXpFjj_B5vMA@mail.gmail.com>
Subject: Re: [PATCH v2 24/30] gpio: nomadik: support mobileye,eyeq5-gpio
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> We create a custom compatible for the STA2X11 IP block as integrated
> into the Mobileye EyeQ5 platform. Its wake and alternate functions have
> been disabled, we want to avoid touching those registers.
>
> We both do: (1) early return in functions that do not support the
> platform, but with warnings, and (2) avoid calling those functions in
> the first place.
>
> We ensure that pinctrl-nomadik is not used with this STA2X11 variant.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Just as I wanted it.

Patch applied!

Yours,
Linus Walleij

