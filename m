Return-Path: <linux-gpio+bounces-24537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C252B2BFF9
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 13:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83593189D8C2
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 11:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9071F326D45;
	Tue, 19 Aug 2025 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tLgQYOyH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85B425DCE5
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755602086; cv=none; b=GdP3+T8L5XHhcoixe9X+D+I2Iim4IwKyZsz7tuB/qlDYHQZOUP2J1gxnxitr0ObcoF73UKi65sMrmg9HI9GHX0MX/Wa0QZTp8T3BXV8h3qNB0IROCYVpvLlxQRwjBkqQO2qK8CzQSqwOQNF+LQNFSpBh6dHBEfe+vd2lNsplmEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755602086; c=relaxed/simple;
	bh=XiCiLZMTMIGVYEEPZg0XLJLdgFbKzAwyMzXWKKNIwBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WuXvhtwHbgYYBLqGYHnSA3qk/nOUpThLh0vH/+H3tOEj889PTXcRCrO4Fx5dCvBWj+XNr/XhEB01Y0e9YOfPrakfZE3ljm4/WJmT0EBf35t29CdmhWBrIJhRq3MIbFqDZIUwjfe9S/Idp0Fe10cA4eKTHd4mwmoTMSPQuUT4lug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tLgQYOyH; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55ce508cfe0so5024546e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 04:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755602083; x=1756206883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiCiLZMTMIGVYEEPZg0XLJLdgFbKzAwyMzXWKKNIwBw=;
        b=tLgQYOyHxVg9gCeL5SAJBVCYbsiQosbF5VhZ74DaomUHactUDQ1RpHDXpQ3xFS0MN2
         coRAW1ZGbRZd4k0sIBjqd3WZIhQXD2NXv7U3Ai+V8Fu4Qf3atrq1RVoA0ynReq9b+gcH
         HeLQX3VqUiIfjegDnzjBu2J/rzjJ1g0ZvH8FZOIKDeqz3ntwL9zxxiLYzRuZSsaDcQx8
         meJ7wryAFew9Qdut4FRNo/MtmpZC5O5cAI7uuelxD4wXKMD89OKC0+IMiEEP9Brxu8XF
         JUdPdUGFR9R7MvqmLH/+6KmUdx17JqmUXD2urrt5dN+WRA4+CCSzGhLDlnQt31YTyH4q
         I9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755602083; x=1756206883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiCiLZMTMIGVYEEPZg0XLJLdgFbKzAwyMzXWKKNIwBw=;
        b=rvuQ/RwM8Itxq+DiTdGYxL7nYfwGhD0g29M9j0eGEu4Z1GSIXl1nf8aE7xX0dovuw8
         ME5LwmwJKmQ9+xUW/A8KGLT07YBiqBQBWhg1x8h59iR566/+A+8S7M58yKq7Bb4wZ064
         roxyRLKU2z7zdDeKT9UW9W/rlSWrH7YkawKU22SaKR3QkQgD7Rq6lLj76a97ZIbBtiiH
         wkuWjmxm2NXuQbeDzffhK5KhtkvPlf1EY4bEb+XJYZzRgSrc80LtpvegYqmPpE03Wd/e
         lexPccMWweJQcJyY6+EAvhbkoSpEFpDuuj9yyT4OupEethdYYhMw1RfxHZpqa89eKuoh
         pLgA==
X-Gm-Message-State: AOJu0YwZWwB+zLqoi2+TY0PUiwvLHBwz03TZ9hQ7kpOrEIYlXeyRghUc
	WuePJPHVzZUujWL2dbMaIQ4fn6MYJsyapxEJ5cjd24D8UqYze6fWwD8JLxVitYO/xEMFgR9HpmN
	vHCnCbRTbQ0eyECWzkDgWov1wHHLJr1yVqRBnBusGag==
X-Gm-Gg: ASbGncs0Xc/H5DB3Kn5uOEKqaH7Rm4azGYxbp2xzyJ6dufjn3ikZzKf7uNUbon3y6tP
	IpXpU3YrKn7EPca0arQULGyWD2t7VKqLqBgIEauGiab4VaBZaFKmkR7pZapfu+OR+dIn7NQyJGQ
	QzMvBMInCIMC6OhfJd0JiUNuD8jSH8cfkniSZnPBypdDhMMaV5F+YDgU6BYKt8uSH4mcs0qO02a
	HT8rgM=
X-Google-Smtp-Source: AGHT+IEcNJsAoRLGIYk1O31Tn3tYAXlZSESSNuq0103JoREB2oE7y0pJlyv9CebmjIKG2ZunE2wkC6ewDUMk7VOPWhw=
X-Received: by 2002:a05:6512:2289:b0:553:a4a8:b860 with SMTP id
 2adb3069b0e04-55e006d9a7amr646510e87.0.1755602082715; Tue, 19 Aug 2025
 04:14:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812092618.14270-1-andrea.porta@suse.com>
In-Reply-To: <20250812092618.14270-1-andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 13:14:31 +0200
X-Gm-Features: Ac12FXxil8YtjsTlhDzMgU8jUOtSCxu9rddHrXDKIc4MXQ04x78-F2JvPaqcPxY
Message-ID: <CACRpkdY4ReSDB6p3a1yQSAsEX60tt41+syyXEQrs2SLkKMcV-A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rp1: Add regmap ranges to RP1 gpio controller
To: Andrea della Porta <andrea.porta@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>, iivanov@suse.de, 
	svarbanov@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 11:24=E2=80=AFAM Andrea della Porta
<andrea.porta@suse.com> wrote:

> The current gpio driver for RP1 shows only the very first register
> from sysfs, e.g.:
>
> $ cat /sys/kernel/debug/regmap/1f000d0000.gpio-rp1-pinctrl/registers
> 0: 0abe0000
>
> Add the correct ranges to the regmap configuration.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Patch applied.

Yours,
Linus Walleij

