Return-Path: <linux-gpio+bounces-4147-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D96A5872522
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 18:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 161421C25DCB
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 17:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5E812E7E;
	Tue,  5 Mar 2024 17:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnFf7UNv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB9614AB7
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 17:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709658374; cv=none; b=RvoPIrXydsQeOI8e+gAzW4JCoFsZVQMk5p2A3ylM4+8DtgmE2gTlpTCOuY3uvqOp1zH2EYAssrlRWvOPoENpCkIJcOvm1qvwt6NaKU9Nk3b+KYdTdRK3lwFpUuZuWqk9lKBnR00xogVo0JZpnX5+UKbYDWwf/RWt7gPv8izlT0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709658374; c=relaxed/simple;
	bh=0hminNxXoIHZSvJRwDYLCiahWXwdQNjjcEQAS2qC4tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pwFqKDL2kWMxa3yhTSEzZOZnwZ6po+KDgDDyvTCUadbQrDTadNj7zrWUlE9/NZMoLBnaQXEse4yaxRk/6XCdqoN9nEW1O0xapSAmBgDnemToVfqjIeLSUiB7V8DSqN5KjRC85Ist3oTAbOdv/PM0A9/SWam2lChhL1I05W2PoMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnFf7UNv; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a4499ef8b5aso456246666b.0
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 09:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709658371; x=1710263171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3RCPt656OAzcYu8Kr2cQtg8fhNHo4q3LTJdEyKE5iU=;
        b=BnFf7UNvx4S5ShlsiRGvKkf8isM4Hpe5j9T2BRrRWzisV8nmkQymK83TFVMpoAO3AM
         gfy2L86L0QN3YgQd+wm189LQDGrlK+2bDOZ1UsgD5a+7qSXPS25v0t3v7R2GnaxoNNOb
         mvknyhfpRK+6fJT7+yKjx3TuhDKecwSlRREIzTpxUxsmpjsgKQv9xylxXScl8SC2eF0q
         +B3bc5mh1+znwQTyL+30PsKXVUaZ4hF9ltqfx7G8/BpgTpbXGQ92hsPFph4+fMOuzBea
         CeUgX21qlkktAH9yvzeszAIlhJQvStpI+LIebp7FUxJdVPLIud/fJYggnSUlIF498yQb
         TpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709658371; x=1710263171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3RCPt656OAzcYu8Kr2cQtg8fhNHo4q3LTJdEyKE5iU=;
        b=REAGqCIKBkhONVodAbqSamo/SXnOrt/Y40TkQtr+0Ynq1rxfKVJrfYZCqMnpwh/8Hc
         nFSGQT2h+5E1HUeyuYELnqVtUNRfQwxhAgjmqROUGXm3X8/fBnY99M5nweRW0Wn26gUm
         tqWebuZJPZfgxS51zxnHr6SUtJOFiHHwCIsGsP97SaykVNMNaIXRcgMZIPUGUj6hvsOe
         OiVg4evRgVjr39NOwPdbISNSbfIl4MSHAPouZRHcfAVY5w+dBM9JuO+YQmQZqxk/M64F
         CHPDb6xS4IQ9q9NHlFlAXKD5OqOUSqL8B77gJ9nRMwqXvyMmYitTFGBKG0TQTw8lym6T
         f7Eg==
X-Forwarded-Encrypted: i=1; AJvYcCURpg3TYvdjNC2WAkhNtJMEPd6OlC9oxAuLDSAHad4YutUebMIbdFTUWtfJ/DTnmmXh34uDpUS5Ef1jRrjOVPX7tk90JPawjicVlQ==
X-Gm-Message-State: AOJu0YxIuiWEDcrY0hl7vkB1ulew2wW8dIDyNvdb0j5dXDNXNrbu/hav
	B22IiTcesRjL/ownbR4pociglm9yqqe/DzLCXBWtsE0PMNwbqR8HiEvVpo6Y2tD6N7MBOcwzNSv
	mWPbMdTsdzuJVXY7mU6CdEwZLP5s=
X-Google-Smtp-Source: AGHT+IHyUvQceDUiCVTUfDyIwMw8yPxdiCcwfjAT/niW7ncSbXvlLz/3zL2EKvt1jIYYVBbpN0j3eqLphhPjMgdyts4=
X-Received: by 2002:a17:906:54c7:b0:a44:44ff:5dd5 with SMTP id
 c7-20020a17090654c700b00a4444ff5dd5mr8783782ejp.21.1709658370540; Tue, 05 Mar
 2024 09:06:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305-fix-nomadik-gpio-v1-1-73162e3a388e@linaro.org>
In-Reply-To: <20240305-fix-nomadik-gpio-v1-1-73162e3a388e@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 5 Mar 2024 19:05:34 +0200
Message-ID: <CAHp75VdoRQvPhgcV1vP5FzhywqPhzzfFwmDQ9d2LtDYfQr-WQg@mail.gmail.com>
Subject: Re: [PATCH] gpio: nomadik: Back out some managed resources
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	=?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 10:26=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Several commits introduce managed resources (devm_*) into the
> nmk_gpio_populate_chip() function.
>
> This isn't always working because when called from the Nomadik pin
> control driver we just want to populate some states for the device as
> the same states are used by the pin control driver.
>
> Some managed resources such as devm_kzalloc() etc will work, as the
> passed in platform device will be used for lifecycle management,
> but in some cases where we used the looked-up platform device
> for the GPIO block, this will cause problems for the combined
> pin control and GPIO driver, because it adds managed resources
> to the GPIO device before it is probed, which is something that
> the device core will not accept, and all of the GPIO blocks will
> refuse to probe:
>
> platform 8012e000.gpio: Resources present before probing
> platform 8012e080.gpio: Resources present before probing
> (...)
>
> Fix this by not tying any managed resources to the looked-up
> gpio_pdev/gpio_dev device, let's just live with the fact that
> these need imperative resource management for now.

...

> -       clk =3D devm_clk_get_optional(gpio_dev, NULL);
> +       /* NOTE: do not use devm_ here! */
> +       clk =3D clk_get_optional(gpio_dev, NULL);
>         if (IS_ERR(clk)) {
>                 platform_device_put(gpio_pdev);
>                 return (void *)clk;

> -       reset =3D devm_reset_control_get_optional_shared(gpio_dev, NULL);
> +       /* NOTE: do not use devm_ here! */
> +       reset =3D reset_control_get_optional_shared(gpio_dev, NULL);
>         if (IS_ERR(reset)) {
> -               dev_err(&pdev->dev, "failed getting reset control: %ld\n"=
,
> +               dev_err(dev, "failed getting reset control: %ld\n",
>                         PTR_ERR(reset));
>                 return ERR_CAST(reset);
>         }
> @@ -588,7 +594,7 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct f=
wnode_handle *fwnode,
>          */
>         ret =3D reset_control_deassert(reset);
>         if (ret) {
> -               dev_err(&pdev->dev, "failed reset deassert: %d\n", ret);
> +               dev_err(dev, "failed reset deassert: %d\n", ret);
>                 return ERR_PTR(ret);
>         }

Yeah, but you forgot to update the error path as it needs to unroll
the changes, no?

--=20
With Best Regards,
Andy Shevchenko

