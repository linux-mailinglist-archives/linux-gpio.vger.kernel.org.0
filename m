Return-Path: <linux-gpio+bounces-22785-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFB8AF8B50
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 10:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 088BC1891544
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 08:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EA12FF483;
	Fri,  4 Jul 2025 08:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IVfgHXpt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996A22FEE11
	for <linux-gpio@vger.kernel.org>; Fri,  4 Jul 2025 08:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616338; cv=none; b=e0ESu8Ib9qhRFJXpNCGi3ucZ60Tw9QgzEOh4IDYVewMlSnyfN5TCda/3gdfNvxNw4LpbJPNy716amY+FaUDh8ugesMYzLBRsuSK4T6ApaDJxuM1ub4YZ+Wk9N2kAqoAcKu3SF6j3xW9o3cOdYoNqSPu8IOlNYLhHG461l2SVK9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616338; c=relaxed/simple;
	bh=gLSnd6giDnfbWcxYXT2wcpNKMruUI8d8nbGjFJ7L3e8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WyVRAL0wPqMGwJgMaTzSU2yaOIXWSdQgH5NfX+voIMxEWurla1Xde3Et1h5Hpx74aRJYj449Jk5tiuf8bQIYlGYBmdDhd0rk5LjMEAxnYCPT9oirCdBKzwFg/HvEt9fzN7+m6X1iGxhNadUATW3z/yDolnzk2nRXy+l5XDZq54A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IVfgHXpt; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32add56e9ddso5949991fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Jul 2025 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751616333; x=1752221133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLSnd6giDnfbWcxYXT2wcpNKMruUI8d8nbGjFJ7L3e8=;
        b=IVfgHXptx3+ju7va/qniKcTy30vstmHwSGutSFL+XdxVUJUqloDkJyoHfJ/hXDDRwx
         cFq/Cl1AJyywMKM2ykx21EyhEbygSfQTOtIY3JmKJnCNDcjr3orJfGfpZbWS5MGAGJoc
         uiCGqcrO3xO/YrgaFKR2mKZI02P1+jmtnRoTdIJarVZrxyalDIeAmDd6g52EF+p5vH6T
         DL1UtS3kQ2rgZ1yUxe0pDJJz/WEfdeKH5yaP2Hq5Ye7f7j3aOTONOYN86Ooc7no2Cws+
         zbv67o13LZx0gh4Ea9j4Ad/7qdh8Pm6X2tXcwDf2YM64bVSzNrm/ijV79CSiR846Hz2D
         ICxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616333; x=1752221133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLSnd6giDnfbWcxYXT2wcpNKMruUI8d8nbGjFJ7L3e8=;
        b=vUJvgC8Z7wiumwODNcBrcTKvfBPae0GpASTqlEWj4uL9+KvJHrFY5mMxdRStky/hq5
         Xo328S81Sjss0IJGjM2aF5BZTQtbz4Hg79I4IwM0Fki0lpV7krX951dYo5FjKJ+EKFPr
         9l3GKBm8CHa2QVYfN1p1gkxMDZpHEsY9XT1eaEGGCmS58OZCPvgBh1uQiKfxouswe/i5
         ugF3g9uURPbywpv7ba7tH6zYAmAqE8oOs15MWst6Om6vjpY6Pz2mWY1dJjpuT/tyF0E1
         JGs9e5b3AqH95t82D9WqCqQzPQ+xaB0rx2crbn2wwQMEqtFaqMIcvI/DoI/T9k7mHf7d
         RmtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoE9w1pmfalW0It+HMUMFxoTqxBw5y9N9+ee86gOEs/U62RfAgBygLcCkMxuIbGeraQauOPzDZjD9X@vger.kernel.org
X-Gm-Message-State: AOJu0YyAHIZl44rXcLpSxlBllsCiNE5zmsH+2H1e7d8mM6OPuaSrLTBk
	cFSs2CsQXw2yIYAetPktEpLBM4Gtbgdlksb19TmjptQBTck7WC/NEzONVH6YL+E5hVLAbxnTiV1
	ChUGCUZW6+KRyE40KZULucYvnMuRZjrAlamll7M/JVQ==
X-Gm-Gg: ASbGncvEK3bczFbWq72MPqG1s7SWtri116FEN4dPour2G7jEW2hrnjNYneXl6fETXK1
	z+sxvL4dFy4XNRZNnr2+OtHi4MqBPBzrOn73SKZOegzlN13rpS/13F92SDhwm5n1XPDc6PVWPCR
	iQ5RLLMCSgcrXANhX04KI9FNWx/y4SXkj/pdUeHdIffPY=
X-Google-Smtp-Source: AGHT+IFctPLcSJg4ykfhGL/MZ+g9vuXZvLZVkJpJyt2M2asLefjSEl5BwFpp7OuvBfV1YT/bzHqI/PtScrnLd3/qkSk=
X-Received: by 2002:a05:651c:411a:b0:32b:488a:f561 with SMTP id
 38308e7fff4ca-32e5f5992cbmr3352351fa.18.1751616333296; Fri, 04 Jul 2025
 01:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org> <20250630-gpio-sysfs-chip-export-v3-1-b997be9b7137@linaro.org>
In-Reply-To: <20250630-gpio-sysfs-chip-export-v3-1-b997be9b7137@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:05:22 +0200
X-Gm-Features: Ac12FXwBzNCj1y-ZrLdw9OXFh5sOrrWzfZ4fOjTViVGgzsj5minz_lC6w5id4wM
Message-ID: <CACRpkdY0DcuXD5sY-RSa_uCbHFcOB=CRoiTdENM7yQg_oQssPQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] gpio: sysfs: use gpiod_is_equal() to compare
 GPIO descriptors
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 2:37=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have a dedicated comparator for GPIO descriptors that performs
> additional checks and hides the implementation detail of whether the
> same GPIO can be associated with two separate struct gpio_desc objects.
> Use it in sysfs code
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

