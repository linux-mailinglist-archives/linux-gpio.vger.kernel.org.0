Return-Path: <linux-gpio+bounces-21333-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFB4AD4E14
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEB0B3A35A9
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55542356D8;
	Wed, 11 Jun 2025 08:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NCpW+Prg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C3423643F
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 08:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629814; cv=none; b=TR40/TBIqFa38o4pJZeIqaRsfarhjMNtMfS196WZ46nZRlqeubjHWIWcKq+R3LTqKjw75qlEuvhVyJmyLuuGyTLyBzYr08oSUWUlPl/IRyI+W/aHplCDiULEXxz+w8ngM+NicffVoel1yleym9g88htGHPu1hIfbsUO7siBmkI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629814; c=relaxed/simple;
	bh=pkg2Pjff5dEci+aIBjwWvWXk7Y+zgrK1MnC1KUliVYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NLCx0uARYEvybaiBhFrj1A23uGWadpK8xg8fMC/Rvi3y/7tOuXasq3jfs6cppFr0ern9KF82T9A1RVOMixSQQS4Iv4ks8UX4DRabIs6spEU/mEgHFBrWoL3BN4UvQnwyogKiqSmZGFuNhEzMZGnm8D/875OGFPuKCYoMYRzOnDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NCpW+Prg; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5535e35b059so644630e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 01:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749629811; x=1750234611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkg2Pjff5dEci+aIBjwWvWXk7Y+zgrK1MnC1KUliVYc=;
        b=NCpW+Prgxtqnj1e5/AuOx+cMiy9yVGBH6XXRWHs9fsgYAtqX4E+fWGXkDxfgT7PWGR
         rw+/s0aM8lLp21M6627wBGkGWS6PWLY4rGPXmipy1BERC0cG76SUbl5yHPPo6OLyv1qe
         edz8b+XMeNWJaoOg2Il4xx+SNXE0aRj3dKSIp4buEZiJegtT/4SQ/3RgZfbmO5lgtLHU
         w2kMUJcwDw6/vJCCe1OGoarK/Qz7/0eQYDO1vMh1zPoN65bKAoJqFh3T+ucNlQ1TB8dB
         Hb/NUvlXUSU2yNP5dw/PeY6SerzG9BMYDeCwXMD6sslh7d49ONU3IkpmUWqddeScwlg2
         nRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629811; x=1750234611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkg2Pjff5dEci+aIBjwWvWXk7Y+zgrK1MnC1KUliVYc=;
        b=ViVcGmFNyxaNkOx7ikJJ3Rext8Syh19th7M6bJnlBZv4ci/49nfofUvFpH+iCWPMqL
         IZZ2jMenAjbtFxgTS98d3ewJdRssX0prZW1BnKRQ+obYv4LXZuEdT3XDMWM5/leZ/IxE
         jvubLthiE3VfU/4JC0gOsuXua9XXs6c79+zLStzRXoCPou66qpfwsjgZHwR6G64V3hSZ
         EhphQ03S54UGJB+7Akr6wvYWriIUfWSkg6LNOQ7RNsDvh1pgSABmYy6lNXCu0dfPSX4s
         2LuKqrx1cx5VlzgsKL5oo+2FaQBMfMnhymNJrbAPcrNWwtLErlR6+rFSy43b7lyktr7V
         k3Tw==
X-Forwarded-Encrypted: i=1; AJvYcCU+76Qhy4PTdBd1+3WPVFD8AwMW0lOVpkP+5bJ0QNOqrv1gYhKVFXrm+C+LWDR4+CCO6qwK0CjGtP1R@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8IbGfhQIwwP3VROp8ebkPriynzPtm+pmp+RhMKspXDnHCC+wR
	heWKowXZ9W6AtIyKa4IAabCnpzwifJ4T+B2NZxcqpMIOP5xa18zTuVKDF7y8ShKBiLfv5CseiWR
	L6vIu2l7xgWiEmq9OJg8W48n+766XyaivacYiCAiFuA==
X-Gm-Gg: ASbGnctbYeJiP6yvymDhgdZY+sZKCo5jbxHc65R2dILwrkKHL/WwqJ2PO0CpQW0RuO9
	KKO5iGWKKba1FXSrTxo3eezdUDunuv9ngWLyYc+skrGfOwoPa+zb8BzATxT2PKuPsJ9jqLdg6h9
	L/e8KLyuDk6Lo/kOObH0KluA4HS7yj2imhR/2GD2M+P7VAKK9PqCDeUw==
X-Google-Smtp-Source: AGHT+IHNr640cJb2CBOePz/tU8TNVbkrFYUyovCTZz6rsK2wWDFZwATyEafUTJCBR1mNzrhVsyuz4bNlwkqu7hO/Eog=
X-Received: by 2002:a05:6512:39c4:b0:550:e692:611b with SMTP id
 2adb3069b0e04-5539c5d43d6mr747274e87.16.1749629810966; Wed, 11 Jun 2025
 01:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org> <20250610-gpio-sysfs-chip-export-v1-4-a8c7aa4478b1@linaro.org>
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-4-a8c7aa4478b1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Jun 2025 10:16:40 +0200
X-Gm-Features: AX0GCFsY-c3Tax6ExEM8lJdclAQQKPToqmkyjue72Taa9Ufzo5FT8Qipljux9j8
Message-ID: <CACRpkdaOLOgnRiVHGXtmJqLPTSBWHORK73cC5ipa5+QPCf=wxg@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 04/15] gpio: sysfs: refactor the coding style
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>, 
	=?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, Marek Vasut <marex@denx.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 4:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Update the code to be more consistent with the rest of the codebase.
> Mostly correctly align line-breaks, remove unneeded tabs, stray newlines
> & spaces and tweak the comment style.
>
> No functional change.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

