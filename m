Return-Path: <linux-gpio+bounces-5072-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C70898455
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 11:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31EF5B25B03
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 09:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A9B76023;
	Thu,  4 Apr 2024 09:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KkMfr0dj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7B574BEF
	for <linux-gpio@vger.kernel.org>; Thu,  4 Apr 2024 09:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712223380; cv=none; b=jPGiOWDl/I1obnWKVBSFcj+8ifZaxjLg1w9dFIx4YuhCjFCzdaPEh7r53deio5yluIaAM7KLWUFjG8saw3bfbEhju2iGYU/OHHNqYvvw8WJpENfLYH39UtIwPHUxmhZcUzsSDJ3NO4aJIBMCGXk1xBoVR7ZZZQFMqZxS+l175KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712223380; c=relaxed/simple;
	bh=o0u6Hrdo3yjilxzf27+PrAemJHdRikqTOYkOWtLZWHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REX59B0LCgY+jHaXuwrrlNkvSBY/QXyzoHL8MNc4ymNPSaAQRVkxYSRybDyXDOsOKJidUVL1BubmKPqR+R3bjuOQHlApCx3arotYW7m1ggHW+eZWq/YYaDmAgPkDx0AH57o7nC7aLTdKie2QHxYWHQiZ9BlZcTKjaxlLGkhyYsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KkMfr0dj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516a01c8490so1699652e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Apr 2024 02:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712223376; x=1712828176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0u6Hrdo3yjilxzf27+PrAemJHdRikqTOYkOWtLZWHo=;
        b=KkMfr0djFuwVIMod3gpq4g+EX8yiVouB0rSwJjofKS54DWFMJbWJgo3uzbY6mDewI2
         Km+n2zSOc3chJE5zn6FbXKQ1RujUyk3Ie4aXMmetdj/w11hZ6KLKdldo+EQf8GYu7N4r
         N3Nr0mY8FIziO+C+1iSIOeBxf1Uuzn/2Hhn9hBJAZGdIV3jDtdz+lYrztWaICiX4qXs+
         qj8+Y9IaXCUjSNoTJNY7f2atVJka757rvqsPIATWPUJxkgG0rN4SNSJeuDdtYIpvLFZk
         VLv2l4TtAYjbRz3lh8Ch9PsijuAwG8fcBwpFl9GVY4vy+2hXsBPZ5KgVAgL/gOLanlO4
         cwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712223376; x=1712828176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0u6Hrdo3yjilxzf27+PrAemJHdRikqTOYkOWtLZWHo=;
        b=kndzKylP6G4L4oyLJXTGfAiE5XoauQAR55fnpn76+SiPxZDtzyrlSm0MUZU26MLM0E
         /zm/IdledwP47J+ufQsHanNsnykX9P/YgzEeC8WdiQNmJoL6973/cTy84v9j5TSxMtqq
         YgDBZalpW7ZRCx99wM1A53NcdIuaGLL1xasjPuUTxrVrCnJ9Hfc+xRqJTFun0qiQVpFS
         F8vVIHcDLhBAS1+jM1XpyCWC/gvWKHM9g2fvP2RCaiAahcO1cIh7CgUBKgCjgSqE47y3
         J4hE6XrReatUpYaFJRT2xvbUBIW/ETvgV3Z5GtlK4/4Fe9PQf2RASrVDN9ZY7U6f/gbm
         Vz8g==
X-Gm-Message-State: AOJu0YzuYxtGjbKa24Djkvy4aTqk434mnS8p+ggIkwi20caHsPYEsV6K
	Ginrw2AJlrFIVxtoD5UHH4ClG2yyUxFCGF6NmZ4OgvG+yRY/VpxP00qmdWxBFAuIw3Lzd4GQiPh
	oODeYcg8EgOjsfSDaxE/hLBNo9IsUg64AmYKVnw==
X-Google-Smtp-Source: AGHT+IHYegzG44G7C3aHvq2picZ77QE4YXJ/haZqskfmLMY5asLrS5438QmeNIW4yd0tV0NZbfwrMLblTHcWcyIRXTE=
X-Received: by 2002:a19:ca1d:0:b0:516:ccb7:df0c with SMTP id
 a29-20020a19ca1d000000b00516ccb7df0cmr353671lfg.11.1712223376566; Thu, 04 Apr
 2024 02:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404093328.21604-1-brgl@bgdev.pl> <20240404093328.21604-2-brgl@bgdev.pl>
In-Reply-To: <20240404093328.21604-2-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 4 Apr 2024 11:36:05 +0200
Message-ID: <CAMRc=MfNanTC5kY88Nvic2z9MPdiyFOO5YPUwAgDnRs4=C6K2g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: cdev: check for NULL labels when sanitizing
 them for irqs
To: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexey Dobriyan <adobriyan@gmail.com>, stable@vger.kernel.org, 
	Stefan Wahren <wahrenst@gmx.net>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 11:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We need to take into account that a line's consumer label may be NULL
> and not try to kstrdup() it in that case but rather pass the NULL
> pointer up the stack to the interrupt request function.
>
> To that end: let make_irq_label() return NULL as a valid return value
> and use ERR_PTR() instead to signal an allocation failure to callers.
>
> Cc: stable@vger.kernel.org
> Fixes: b34490879baa ("gpio: cdev: sanitize the label before requesting th=
e interrupt")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/lkml/20240402093534.212283-1-naresh.kambo=
ju@linaro.org/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Tested-by: Anders Roxell <anders.roxell@linaro.org>

