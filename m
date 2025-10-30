Return-Path: <linux-gpio+bounces-27861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BAEC1EF1C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 09:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B194B34B174
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Oct 2025 08:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D56334363;
	Thu, 30 Oct 2025 08:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OQ3M3YWW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE127337BAF
	for <linux-gpio@vger.kernel.org>; Thu, 30 Oct 2025 08:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761812354; cv=none; b=Oh0gMEEs5a7tTsFvi3ygW4d4W7I2IZRi6QALgTxkcryfUoyfnHa4F7Xr8IGa/QQI6lHkSrgrc3ssKFCX4zgw4ojs1na3b5m+za3v429cUgqv3Q1zZ2lq6o6ohL+32EUgii0xwJILMakwqwxtFTb4n9aW/C9+zvYLJvnHjlGNFvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761812354; c=relaxed/simple;
	bh=n8kXk/u9Pag8wMhc1UkF9e4Fd9yQ8hjWefqsOJiE1/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q76bJkfSXT+EH5TiDEu46wBPE7UHwgEynrw63DjuirZS6AwE1A0/X5oqwm2A4om83Go32GC67Vq4LlHW7nACe6aL302PKQL4VkmC1COar543/BglXEEbvziighJNariwAQrIExYzTbz1NHTIsUK5gcx21Ycw4M+0YhjTPc3uYQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OQ3M3YWW; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-592f600acb3so1050107e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Oct 2025 01:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761812351; x=1762417151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZSc3Yfohy0GneZpcaYTXUsRgt/OPg+2FZgItitcnEM=;
        b=OQ3M3YWWCxVC4oBfW4dIRx1rAVGduCLvuca0PAFeJ1Lk0yMVSAld5UuGx2me5Q3wKs
         fH6Np/o4ZyEaw/UC1kJUX83pQaZWrkVEX7dgwI0frBv6+g3CxyFlbR6hlG9wl6Z8n63D
         qYmJrEQRpfUFS5VleYTSTPrclBBegwzF11e3K3wm/NuSjO4qj+wBNFV7WLvE76GUTP0K
         YsLBdefP9yKg9M8bSj/bNptKdZ6oC7qDUj6vcnUFnKAtvILzV0HwLt+TfTTdoMJqVYtM
         yG3gKhuuA6bt8j0w7/InGOCOu6J/3+k55tgb1+S/XR/omK7opJKRpPvlgK/yhNbhqxyP
         IGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761812351; x=1762417151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZSc3Yfohy0GneZpcaYTXUsRgt/OPg+2FZgItitcnEM=;
        b=j/9cVu0MV/rOURLvvClBXqYY1j35NUuFtR37tDrDS7xEZbqL54InOtpG7jAcx+f0hR
         Jrczpo/icrKvELqkhs6w0aBT8BxM6zoX20IvmJWhTgLWu8XY9qPqxQj4Y9G8o3InvuhM
         GtOajDaqgT1q6oXrGU3mW4HZRKe+Ai7uCmeXn7qInr33uC1cNO77FY/5TKjh0VKd76d2
         uyR0II9EnOnmMEgruY7BKHJDBmATLw4EEDu/Xt7uGXXMH89fO2eiW/XB3mavfGmgUryV
         xIi5RIeQerExas6S9VwFjUjRMPAt4oUdRxoUUM6FXu5uKNqPc//lHjkZcuUYl+Usyifz
         iXVg==
X-Gm-Message-State: AOJu0YzWdfuqkV0Xv7/HaFyACARy+NfMxhoUaAsZn9y6E64rpalrl4yj
	KV7gihpdW0yAbaRgAvT653Ok/Gm/NQ9PqAwekjZlIkS1/VS9vIRpaewfrDCohRHv05x+FYLi5AC
	vZ8D9Kzba+nZZ+HA76p3z087vLoT/XKiGyOt1sTOAGw==
X-Gm-Gg: ASbGncuX9vJ8Z1CSbNOwk1ImMMfkXzryoG54rdcY93cam1zoyIa31H81N70auPKXIaU
	axT2kEge01kCB9NMqgs0ZfsiL06JR4SISjWNVZzLPXytnES7gV4JpQBlWoDVK9ebotXttnaHHje
	y8835WsP4oyG8PsOYdUOxD3G0NPK8ujiMu4Tt2dqM+SqrTYfJdoqFAFtcXi5BTU2qCxPWWegrBd
	SdMj8yXx3BuXBSKlK/xkJyv8iib/jcFMTQTuE99ONCfW6DCPvoaJE0mb1Yv
X-Google-Smtp-Source: AGHT+IFpU5SfD5f6aYsrY94jW2ThyTJxMXRujbccn17De50s7ThAJI6lRpfdtUVW5umqLgWUYZ7hiZL74+1ScUCScAU=
X-Received: by 2002:a05:6512:3989:b0:590:9a11:9c2f with SMTP id
 2adb3069b0e04-59412c4d006mr1997751e87.50.1761812346100; Thu, 30 Oct 2025
 01:19:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-isolation-shield-b66aea79a9a4@spud>
In-Reply-To: <20251029-isolation-shield-b66aea79a9a4@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 30 Oct 2025 09:18:55 +0100
X-Gm-Features: AWmQ_bl-lBgjTxJAyqBuCSaVQyLLToyI0K2Q3rw5bzF0J-trmHFQhxiymB76HMM
Message-ID: <CACRpkdaEwa_HMTQ9gOyKh+i+gU1oAqGrPwV7VKF3+W58BMbNZA@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: mpfs-iomux0: fix compile-time constant
 warning for LLVM prior to 17
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Nathan Chancellor <nathan@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 4:30=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> With LLVM prior to 17.0.0:
>
> drivers/pinctrl/pinctrl-mpfs-iomux0.c:89:2: error: initializer element is=
 not a compile-time constant
>         MPFS_IOMUX0_GROUP(spi0),
>         ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/pinctrl/pinctrl-mpfs-iomux0.c:79:10: note: expanded from macro 'M=
PFS_IOMUX0_GROUP'
>         .mask =3D BIT(mpfs_iomux0_##_name##_pins[0]),     \
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
> \#define BIT(nr)                 (UL(1) << (nr))
>                                 ^~~~~~~~~~~~~~~
>
> This is a constant, but LLVM prior to a change from Nick to match the
> gcc behaviour did not allow this. The macro isn't really all that much
> of an idiot-proofing, just change it to the same sort that's in the
> gpio2 driver, where a second argument provides the mask/setting.
>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Link: https://github.com/ClangBuiltLinux/linux/issues/2140
> Fixes: 46397274da22 ("pinctrl: add polarfire soc iomux0 pinmux driver")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Patch applied!

Yours,
Linus Walleij

