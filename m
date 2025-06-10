Return-Path: <linux-gpio+bounces-21292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3213AD458B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 00:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AE3F189A3DB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 22:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AA52857D5;
	Tue, 10 Jun 2025 22:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="darL0WaF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F322853E7
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 22:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749592923; cv=none; b=blMdrhjpY7szMTETZXITTNgYE76/DI2TqWkOfcofW4NxngqClqE+SHclY3hHpvUBIr8STY0rwoxKGeZ0ZJtGekG3pCX9+y5G57JxopqiRmgRtXmLy31fZ4a4Gh/ydjUdEaNRHV85EXhfbwg9oluO0ihMEBdsaC4MyPR3FA5YBFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749592923; c=relaxed/simple;
	bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bnQbkJ4UsoXp9KzSKwWuZBFDOMkDM7Cvjz6CiFAobyOPpD4McH2DB4kRSzOyE5wjnTdxgfeBXnmi3H0TZNx4gCgObzwwvvOdmFlZ8xb5FtTiXZ2rOPAG6uNE/R9nxj+oeFKuD/0mLxN6qDgYBWSjms4pk/NftwVTzBGD1wnQpqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=darL0WaF; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55324587a53so296714e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 15:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749592920; x=1750197720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=darL0WaFnqXsN60//KyNJtt83dkUlHHZa7TiQytwBwMfvg8t0Bs5VmCa4OdUdkOKcK
         3KCxkXaBD/KLi+JQ8KUhosrpIA1k9+tlptkt2QwxVgNGib31KzwFfYdc2jVqcLPN3JMC
         hP0QjgBAIU2VbTSnTIzbG3f4boMFIPDnGka2gTEuLgpGhfUu+R4cPQLV1EeXJlSFf/j9
         GAYJ6POlPW+B3Zzd4rbTI83BVhQi/WQilVQVuDz+adCtIPFVrjao3dJV7fA/zQrn/AL0
         NWIPHwvEiRgeyNdi3Fs7eMMlnR2nVCFdGstfo0b/HPtgr5+I5ostEaAmybKca7b7g+Y0
         kBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749592920; x=1750197720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEjoFKJq1fwhLjJL/1LIboVF8pYHP56Xq9jI3aQ+dvM=;
        b=lIEEUGdooh6XtSMBuW7ShknO2OPUwR1ezQUEjdUjbL52CMt3o93yBf23mQ0229Gb3T
         aN0dLIxDrYU71TA0xeT0gzAh2wIgjLxH9ad82xkQhLQUjg8btEUAWnFGFYnbFuWFJ7hV
         57ORd0izraBEMaNazyXIv2iE7al5d5mnXGUiWj7sttoowYXIxR3ybDE8LmyzEp1W1f5u
         9GbOB0wQt+ZGDR/XHoegXuKXYgPjO0Kj3o8izXGzYylFD4BoUTqBIwdPK3e8saB6r9i6
         +LPClBRgL7aCF0JMo8nCMUb1YMMSZVoiORKLIsMIBEOTyyyPPHWdGHHHC6Oh48N5PmGb
         PGPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMUiV1upf79I+dsm+o0efbpQlhHST3Gl4V0ucCHnGFENkfNFUTW1HVeM770AgBP7Yo3pAEbS/eBqqB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7UzhlB7WWmdM+Leqv25OJpo7B19UPXrfSij/2iXzkyrf0lZkd
	Cbl6fyAn8Ou4YvVztitSaPfwba3SRngXnvil+n3ukSl9x81pADeLY3Is3f5KOvnoJVou8lGDmrX
	N8r58YP20hlHNoQue/FW9S9/3n2WBz5mWXzTRrmbG5w==
X-Gm-Gg: ASbGncsEo1/GVeaTo0y+4s5CCL7iz48pCxdaJod8VToPDplmJGyLPWGov8QY7jXL+Bi
	gdbvdkfSdO2wIyTwCHrB/XIh1tG64cyE0nhvGjoHcjhm5Cb+cHrTJRZnjVuamqTOyHBGWq77/8/
	xVqrt1K8cQxwAvRhX7P2fwGfuXzJbc1JorUd9+NRH+4RA=
X-Google-Smtp-Source: AGHT+IHHOhOUj30OWDDSx+2F42g2fLc3I9bcRSXhW2UcQzuablZdDsnZ46Wc3GihsOmkn7ZczCyHo2K03K0tk80OU04=
X-Received: by 2002:a05:6512:1504:10b0:551:f166:bbb with SMTP id
 2adb3069b0e04-5539c5ff09amr174150e87.13.1749592919907; Tue, 10 Jun 2025
 15:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org> <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-2-3a9a3c1472ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 00:01:49 +0200
X-Gm-Features: AX0GCFufuH4LiWDSgWF_9h-zk6BcvJ0Do0hqFlGAZPq_9bZnp7tz4BcqtgZHIfw
Message-ID: <CACRpkdaK=Ua0=Jgnff4xXxVx9W=LcLg7RykR7CozhqtAb+8XQw@mail.gmail.com>
Subject: Re: [PATCH 02/12] gpio: mm-lantiq: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 2:33=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

