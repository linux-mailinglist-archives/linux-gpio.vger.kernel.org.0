Return-Path: <linux-gpio+bounces-35460-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7W9uIAIi62mjIwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35460-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 09:55:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE9745AFAF
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 09:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8D1330210FE
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 07:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1807C351C2A;
	Fri, 24 Apr 2026 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTC+iHVI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8260336D9EA
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017296; cv=none; b=rpxDdryCc5lOeA/86I75/Grt7TL/Bxjes5jEmdefvWoehmPtxUaw6lDsrPaXhm64A1AhTV3BKVw4wmIs8C/G0CtzhVo1sqtASZIkDX/a9BCETjeBSGrILG0UIZvLCgXMV8ZP6q4CZzS12SBZ4EEgQRMUa5SQJGQpZ0nvTqenQM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017296; c=relaxed/simple;
	bh=g9Ia9AQkqIb/ztY4s7TTlNjI7b7+nksnVzYqlknRFTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ruQnxtG0Eco5tW7QUDwCK2CDSlWhg5h9cMEvW4WKW8QzU77xDDE6sUYy7w9Lmt6TBQ7qL2G+EQIjcOnIkSCbL8+WIuXdgTDTvyvf70QRpxvNNI5n3NA5S0aOZDVlgMAu8hC/sZ7l3NnXsJO+KQqXgDJwPASRQWZ7QaiIPH7AXuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTC+iHVI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D476BC2BCB4
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 07:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777017295;
	bh=g9Ia9AQkqIb/ztY4s7TTlNjI7b7+nksnVzYqlknRFTk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kTC+iHVIpacsO/tvVGoMyteE961ak0UowwF5iSa0kf/Qepp6vtX9Nw15Xr2Gu6dgD
	 VJDFUmbapXsW0g8nYx26dNBJ8qEUuALuUqA0EaLn6tl5xjhUzvtQbyPOtcvjrXeIRq
	 akWb+IXFxrKc5AYx3VTUTJ4qPX3YZoiFcUY2ZxVOWt9sznOKDBNuVXad72T0fShuND
	 +8NZ9rPyqUlc8uJa2pUSzH5N5vGVikmb55n78X2ElRZvd+8bK3y1I3xxNRO40MQGUX
	 Ej/3qw2EmGExesJC8S6CuZaM7aYm27hcSLKPrXV4D9oWBBhE5+dmF3CygIhJ9UD+yu
	 A1oC845P9f7Jg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so8058530e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 00:54:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8qqizYZkAt2k9Xalsbgkj0uN4LaTISuFy4JhL7eKBP7t0Av2iEC+YOh4epkburvg8pbN5Uvxzvd3jU@vger.kernel.org
X-Gm-Message-State: AOJu0YwMO8+91UNx3dLWQjtB6dZauOH+yfsUVEYcmXVQqOiRjz698UWU
	RG4AgpeSt48mUQp+A9tt737m2GU2sfDL5pBV/9iqm+kwBOelUTZ6onqTvD3ZikgU5oIDLmsLFk0
	HdKbVX2p79Vtxs5rnV6HfFMYesMlttBBuKV1eX6u/tw==
X-Received: by 2002:a05:6512:4142:b0:5a4:e6:8fce with SMTP id
 2adb3069b0e04-5a4172f609dmr7740788e87.38.1777017294511; Fri, 24 Apr 2026
 00:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423223230.47001-1-m32285159@gmail.com>
In-Reply-To: <20260423223230.47001-1-m32285159@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 24 Apr 2026 09:54:40 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdQHKbs-Q9TWqoSa=NLk8c=m-afCMZ2EqGByPg0TE51HA@mail.gmail.com>
X-Gm-Features: AQROBzCvZ_XsVQjiGQ0HPe6ZzmVFtHKCeYp2kCq62XsGvjmnytQbHoVSi9Ua7Go
Message-ID: <CAMRc=MdQHKbs-Q9TWqoSa=NLk8c=m-afCMZ2EqGByPg0TE51HA@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: Remove intermediate pointer variable and
 harden function
To: Maxwell Doose <m32285159@gmail.com>
Cc: linusw@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: CFE9745AFAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35460-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Fri, Apr 24, 2026 at 12:32=E2=80=AFAM Maxwell Doose <m32285159@gmail.com=
> wrote:
>
> Remove the *pdev intermediate variable and directly dereference the
> pointer. While at it, replace sprintf() calls with sysfs_emit() to
> harden the driver.
>
> Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> ---
>  drivers/gpio/gpio-sim.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 13b87c8e6d0c..3c230f94eea2 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -691,15 +691,13 @@ static ssize_t gpio_sim_device_config_dev_name_show=
(struct config_item *item,
>                                                     char *page)
>  {
>         struct gpio_sim_device *dev =3D to_gpio_sim_device(item);
> -       struct platform_device *pdev;
>
>         guard(mutex)(&dev->lock);
>
> -       pdev =3D dev->probe_data.pdev;
> -       if (pdev)
> -               return sprintf(page, "%s\n", dev_name(&pdev->dev));
> +       if (dev->probe_data.pdev)
> +               return sysfs_emit(page, "%s\n", dev_name(&dev->probe_data=
.pdev->dev));

Do you believe the code looks better with more layered dereferences?

>
> -       return sprintf(page, "gpio-sim.%d\n", dev->id);
> +       return sysfs_emit(page, "gpio-sim.%d\n", dev->id);

sprintf() is safe here as we cannot possibly exceed PAGE_SIZE with
this format but if you really want to do this, than please send a
separate patch converting all configfs show callbacks in the driver.

Bart

>  }
>
>  CONFIGFS_ATTR_RO(gpio_sim_device_config_, dev_name);
> --
> 2.53.0
>

