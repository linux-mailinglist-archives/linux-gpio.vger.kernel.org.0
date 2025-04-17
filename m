Return-Path: <linux-gpio+bounces-19006-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9E9A915C7
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 09:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0022C3A9D99
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Apr 2025 07:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160132222A2;
	Thu, 17 Apr 2025 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U6S7w+50"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2063A221F38
	for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 07:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876450; cv=none; b=HFHUluuoAJZ4UgZ+fgmo07spQhnVUohLiWe+5a1tdUHsEx2zCBhEkKQJ5cJER6pIYEVsnmSS1mpFcufO/KTSGjaDUWGMs4qMjYjnjU/D0+CpFwZtgBLcm+knew5itAK8CtdNcXZIMW/vINMpRO1pbQ5HpIOBrfdRnY3Ei4xfs28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876450; c=relaxed/simple;
	bh=ut5rPT2VTUeqW60+O7hiE+vw8MaCcc2eRCHNUKfWsRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Er+mBH1/W6SviCDBCvHq8FUf+bL4QyPfuCR/+1uwhx1WnUnMoYVaZxtS4OgRllk3Fw0GghWFIOlCV8MJVO4ELWTx4ExoHBb4IbplxKmbyKKNa1pLQHxQFlTpDJXnWh6fX/yxHjNF6I+saP1mi+VznR5sdZu3WD/iengKpRVLV1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U6S7w+50; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30c0517142bso4196181fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Apr 2025 00:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876447; x=1745481247; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ut5rPT2VTUeqW60+O7hiE+vw8MaCcc2eRCHNUKfWsRQ=;
        b=U6S7w+50aosanKK79VgLpQqNpCp9dWcSINzBIP0Wa9LqjGeWQ7f/NMfvcBCurMgzaF
         wDFZ8eo3waQ/trQha5DnR9YXw5FmTgj4VZYeFaAxEn4ZiEs7JAZbzNsk68PV4IXBlFWj
         ztxkEJiLyFqZho3evWftCunVIJ+vU3586TKzVcBXemxfkL2wgv2CDRM/mYdxH1N+wSFC
         rwkXGH18NH/uBMe64SnhNy/OM7hJi1rPEYyrZ/8uFo6c/SDKIPhR5aLcbBRsEB/mDTma
         IiWVSVKiaCqNVl9h4RGF6QcwMfnAXsPMhq0rTyiw9gnOjhfGO3RDTLtSjkI+jgEQaO83
         BzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876447; x=1745481247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ut5rPT2VTUeqW60+O7hiE+vw8MaCcc2eRCHNUKfWsRQ=;
        b=vyQK3NKKBfS1PKstYIF6Nqbo5c7tDZD/AZ1YqZtGAifYDHI7AB/OBRlwMHVLE+MdCL
         qzjVCFE15QN54citM7mQsdE2hAeyBi1i+h/w5xMiPZVu+XyNnrzjMNLgBQYUpwccMORc
         DKl2cN+cMrcSjJbz8YzF6nO8ZlOJViRW9pfe9TPPfk/bxTjP+u6gjrdmcwAvAGeQHiRZ
         5XEY8G5wbO04GHobQxG+MwN49VaSMaBsekhPjPta1+bqicFN9vlRtrhxljj80CwqWQpR
         O2nPqDVj87XbYE8bYeonVth6bJWd14OaRc+KmTJE5DFvK1ipy/5NwL+a9ps/Ra0QJYPI
         +mcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlAxKpL6Ib7GCeMXYdv+fyxB6++dnB2J+oX+wN+gyhEInngAs5hOWjc46Kvf+nkFEhErZyz0nLseoy@vger.kernel.org
X-Gm-Message-State: AOJu0YyHlwD6LUysNnnC4wwl+TbzdmJGl0j1iisnGWLmIsr7dGzmPR32
	dqxoSydmicQv56rP86KBJ+yJ0NiTjsOVt+bed/Q/KL5oC+qNLfcV0CWoQhnTJ3hXdCeFPjgBtcZ
	a2XcKEMUYLq6PncZY8SuWAAJSOxqS+bfGWP0XvbAAUvUzJE2evE4=
X-Gm-Gg: ASbGncseYmjnNjqniIf/nG+CQUUkGHEViP5OgfqYfJx/3Yj4WNRHBXMXd9OWhQ789YZ
	CAlUIrUUNjQgfjaOHJ8Lkdc1cjRCPgkJh4zKtCFNmoAHryZXENij7AWpR7RQ0YPb3UXNK98gUHX
	XWYU1Ifbel9bZcJK8XZsrJDQ==
X-Google-Smtp-Source: AGHT+IHjZpDAVRSAtSwdk/A8DsM8HVBC/wxFZxvv3n/7a1hMa9/G/fFzrK6BK83uA5wxj6J6AevNW2f8vm5mvi82fkw=
X-Received: by 2002:a05:651c:221a:b0:30b:b908:ce06 with SMTP id
 38308e7fff4ca-3107f6ce066mr16224881fa.19.1744876447216; Thu, 17 Apr 2025
 00:54:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-1-f40776bd06ee@bootlin.com>
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-1-f40776bd06ee@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:53:56 +0200
X-Gm-Features: ATxdqUGIgZDMDaG2VPyNwkFLSsmA3QDAeOH0re9zu9lZkKpcDM2AWa8KpN9XBUk
Message-ID: <CACRpkdbHybj9kZ+X2mdKHPyvcLqxiPfyNjrusjTWAP5Vi4iWaQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] gpiolib: add support to register sparse pin range
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:08=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Add support to register for GPIO<->pin mapping using a list of non
> consecutive pins. The core already support sparse pin range (pins member
> of struct pinctrl_gpio_range), but it was not possible to register one. I=
f
> pins is not NULL the core uses it, otherwise it assumes that a consecutiv=
e
> pin range was registered and it uses pin_base.
>
> The function gpiochip_add_pin_range() which allocates and fill the struct
> pinctrl_gpio_range was renamed to gpiochip_add_pin_range_with_pins() and
> the pins parameter was added.
>
> Two new functions were added, gpiochip_add_pin_range() and
> gpiochip_add_sparse_pin_range() to register a consecutive or sparse pins
> range. Both use gpiochip_add_pin_range_with_pins().
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

