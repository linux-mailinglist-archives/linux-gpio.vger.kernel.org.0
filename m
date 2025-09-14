Return-Path: <linux-gpio+bounces-26106-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB82EB5694D
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 15:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FE9E189D34F
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Sep 2025 13:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C81B247287;
	Sun, 14 Sep 2025 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlWfjIxh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B297A1E9B37
	for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757856306; cv=none; b=gKtEi+biCy5rmWBeVp5y9yhfbIohcKtVXh0pW8BPR+JQH2TibMQlwUiv0iX54SYIg5L2x33S5zTsBk2jImdlR77eGLSLT+tkp4yJDTvlgH+Y6EBt04V8DStcdYS+JCa9/uWGzaBAfrs31RbLejm8VBGH/tohNsS4976H+r2lkNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757856306; c=relaxed/simple;
	bh=c1ENNsggccsIqoTu/x1ARD82i45oCDooMzrY1x/lqsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AxA432hCmtc4maiClZEc76A8g9Q8YGuDqPTHsxkecvSxDI74S0SPnn+hY053dF/4EYfd4MYXjtEf7W8qk6nTISFz/Wj5rhoJ9vA8CsN+0652Pa8K+HstwiN9gg4ywvYRtypAJR4zCGrj4MhVpWttVx/74w1GHHFUEeV6xxJjiFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlWfjIxh; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b03fa5c5a89so511859166b.2
        for <linux-gpio@vger.kernel.org>; Sun, 14 Sep 2025 06:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757856303; x=1758461103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1ENNsggccsIqoTu/x1ARD82i45oCDooMzrY1x/lqsY=;
        b=GlWfjIxhRiIAvBLR/R8uPPV+fufB4SVhcrxZ+suAcN7TfjysgX5JF8dIQLrgOksJDl
         43KhdKSR4cmEAXNDAJe18YB8UeKW5Vi++ehcMHI9aFVKQG6qdF8rWx75WyHVGAsso+Zt
         U5imMGQuyOtSfTO8aZIltgzQ/4T6ClPF/fxj3Ngzz0wzi0cOGZTBxbfihK9mdOKTNR0+
         k9NXOHiRBe7dP8zK0+Tjgmf4gWySAucV3NjHpV4OPmPNQLuugI2Oazix4eQNTkaPWIOv
         imgqSvlm/9iTdkM2WSaNzcWYpf2VtNfqwZmmhqskmVURZv1OwIrbAaECUD/9J9+fsACz
         bWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757856303; x=1758461103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1ENNsggccsIqoTu/x1ARD82i45oCDooMzrY1x/lqsY=;
        b=fvR6/bzBqVTcLjG23vjxTvZ1YqNzzoT4OputtrCEd32AaBIofiE9oP0lVxtVzM4iwa
         mi+qNHPWtb/BdE7NhoCXqZYokVR7vBQ3G2mYiZZgt9LvSyd1ba2DLerUuA16F+kImtuY
         oMaLQLcHeLoA0x/2Kg/CiVRmL5zSx+FxLZVYDRMGCnKzm0pqHkL9ZeIVvU6j59IKvgJb
         v8jblLxi/f83PkYHYJkOdD2EiBcGwICzMnMQUY9ozfk3yMCDVzmQPVRm3Aq1j/rgu8+Q
         oukHeU9R7vxfMaIMO5N20Hkx056GVquwD/QNUY6NCYOBvQNqTsOWaKZAoRNRbfntkC3Z
         CTbg==
X-Forwarded-Encrypted: i=1; AJvYcCXV2ISwd6aaRYMoQbSdljbsdBQjk4U7gjUvMW+wykohSQMXtq2XsX14Ek0RlYA1nKQVA5TyM/2V1sz/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7a7uqsyeXOjTNSoYXG3e3vJOjwu5YCXUE1Q4wYsUmpaIqcYs+
	swwTOg7hKEJu3xoLSRC2wfwLHnZVxZUo6ebJe1cB2xulPiifk1O546cxbIUBenQAlUusUyB1srr
	FkTODdfnJsa2Ij2FkLI+4bQPtToNHB+s=
X-Gm-Gg: ASbGncssxWlRjs++jYA+OOlIkhsBSzycOmLv5I2YW0iU6dgdaD+KvRMrN5wSlocP0ue
	+T2aNMiUmRyGx4CTYRnx8h0rRCApoULJZm65IubXDb+MrXxCvbebMHkuoVEUZNsFBJZgXIxb75E
	LQxzRgp5jRjb9HAjVXbmUdWQHUxHkD886v9wKa3hs48mVa6W6OETuTh8wC6wGJyY9o0Q11FVzvG
	OmvOro=
X-Google-Smtp-Source: AGHT+IFWT10RqkjFYzbnJe0RmtlfLcxsUFP0lSqT6wIOhIEfFMe8hhsUjxJ7Lj1/NZxxB1LnsHHPWGst9v9QYT40wJU=
X-Received: by 2002:a17:907:bd98:b0:b07:e3a8:5194 with SMTP id
 a640c23a62f3a-b07e3a85443mr446254666b.22.1757856302956; Sun, 14 Sep 2025
 06:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250912221859.368173-1-hansg@kernel.org>
In-Reply-To: <20250912221859.368173-1-hansg@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 14 Sep 2025 16:24:26 +0300
X-Gm-Features: Ac12FXzFq5r7td9YdYFjXae8rJdLRnJ6tPPEUqTs-9VSdqmeEr-y5otDdTk8VmI
Message-ID: <CAHp75VeOAuhQC2xZxSJ_9hedNzGXdmmeAeoahnKBSR-K9UP3mQ@mail.gmail.com>
Subject: Re: [6.17 REGRESSION FIX] gpiolib: acpi: Fix using random stack
 memory during GPIO lookups
To: Hans de Goede <hansg@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2025 at 1:19=E2=80=AFAM Hans de Goede <hansg@kernel.org> wr=
ote:
>
> Before commit 8b4f52ef7a41 ("gpiolib: acpi: Deduplicate some code in
> __acpi_find_gpio()") and the follow-up fix commit 7c010d463372 ("gpiolib:
> acpi: Make sure we fill struct acpi_gpio_info"). The struct acpi_gpio_inf=
o
> used during lookups was part of struct acpi_gpio_lookup which gets
> memset() to 0 before use.
>
> And then after a successful lookup, acpi_gpio_resource_lookup() would
> copy the content of the zeroed acpi_gpio_lookup.info to the on
> stack struct acpi_gpio_info in __acpi_find_gpio(), overwriting any
> uninitialized memory contents there.
>
> But now instead a pointer to the on stack struct acpi_gpio_info in
> __acpi_find_gpio() is passed around, but that struct is never
> initialized.
>
> This passing around of the uninitialized struct breaks index based
> lookups of GpioInt GPIOs because info->quirks now contains some random
> on stack data which may contain ACPI_GPIO_QUIRK_ONLY_GPIOIO.
>
> Initialize the on stack struct acpi_gpio_info to 0 to fix this.

Ah, very good catch! I missed that field that can have garbage as we
don't file it. I'll take it on Monday and prepare a PR next week.

--=20
With Best Regards,
Andy Shevchenko

