Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37CB52EFC4F
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jan 2021 01:46:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbhAIAqo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 19:46:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbhAIAqn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 19:46:43 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC38C061574
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 16:46:03 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id m12so27179342lfo.7
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 16:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mw14YzBgd2f4GqS6Ml6tp0mY465YwbvUOhYSkNusrc4=;
        b=u4AGIsz2ZIrp2McYVYJX3vPXdnObweHDpRO5EPmrHdnCSByUodK5p7mw4rmYQt11wl
         yDCeUyreJB8kFyzDyHME2Jus+TYq2cJ3EjqT9ImGXC82ZUe9P0vFNih8X1pbq+GlKQbr
         GxpLHMyV/OpTVnYkw0wzdBfQKBDCcug2bmn70c1KST92CienIY8HMXF8+KOqGcKl3y8+
         KcNLF43pg6A+9KDn7tF+MrADNgK7Sx6R838fK1Vv9bMTt0uvYgdRCgT04W+7ptKKE6hn
         AZtXMq4Qf1KvllXvZapyYldiis/g2KpwDfMDVWzcNj1Iserq8GEafATWocPOEb5hpfCP
         fOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mw14YzBgd2f4GqS6Ml6tp0mY465YwbvUOhYSkNusrc4=;
        b=g9KRVzkAxA4gepwoEsu/YfZZ/CgIhplFfa497v9TAci7DpCITHH/yIS7Dd6j1sC1AU
         5qlNizmj89xL5f0InWYfTzsogc5QM2VxS9PAxBOg5ecAKRtSxpmQ0qWXEgmN5nqcICsk
         u97cs81UtvgtFONZctnHtHppVkwZkgf+y7hQ7qK/ypk9AEt7lrAGT0jU1GrR9TJjuoTM
         S8yUcSwhz3o9Q4qzgtiXRuoh2MEa8G7taM4DaBIaoh9Eh5aE/RJAyxbW5TbrwzPfvdy5
         gttKoSbd/EhKojEJjQW5WyawYb3vHr7ZCdOs7WYlz5ZXN7X6EyppptcNqOyQh8h7BRPR
         Jx1g==
X-Gm-Message-State: AOAM533Q6ZU5i7IS8zjeDBUxWZUiAq2Jnx494Edd9zqqI5RNqlKcz+6o
        ikT4KGb9EeOjXgZ6E82H/OdB5KYb946O84D7NYIGaQ==
X-Google-Smtp-Source: ABdhPJxwbE4VMpwSQLOWkl1Ft/NOE4pAAt9s9j7XhgGCTf2jDv5iWwn6iR9DxhOtxZYEUXwockdfw27lp4/vbPA96u4=
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr2698689ljj.326.1610153161636;
 Fri, 08 Jan 2021 16:46:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610110144.git.matti.vaittinen@fi.rohmeurope.com> <e7c5919cc0d95aca09807a828fe3c0018af8828b.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <e7c5919cc0d95aca09807a828fe3c0018af8828b.1610110144.git.matti.vaittinen@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 9 Jan 2021 01:45:50 +0100
Message-ID: <CACRpkdb4CW0D86dmEOjtuFpTcO2oUZC50MhNQQtfoEQT7G_PFQ@mail.gmail.com>
Subject: Re: [PATCH 09/15] gpio: support ROHM BD71815 GPOs
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-power@fi.rohmeurope.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 8, 2021 at 2:39 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> Support GPO(s) found from ROHM BD71815 power management IC. The IC has two
> GPO pins but only one is properly documented in data-sheet. The driver
> exposes by default only the documented GPO. The second GPO is connected to
> E5 pin and is marked as GND in data-sheet. Control for this undocumented
> pin can be enabled using a special DT property.
>
> This driver is derived from work by Peter Yang <yanglsh@embest-tech.com>
> although not so much of original is left.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Overall this looks good!

> +       depends on MFD_ROHM_BD71828

I suppose this makes i possible to merge out-of-order with the
core patches actually.

> +#define DEBUG

Why? Development artifact?

> +#include <linux/kthread.h>

You certainly do not need this.

> +#include <linux/mfd/rohm-bd71815.h>
> +#include <linux/mfd/rohm-generic.h>

I guess registers come from these? Do you need both?
Add a comment about what they provide.

> +       g->chip.ngpio = 1;
> +       if (g->e5_pin_is_gpo)
> +               g->chip.ngpio = 2;

Overwriting value, how not elegant.

if (g->e5_pin_is_gpo)
  g->chip.ngpio = 2;
else
  g->chip.ngpio = 1;

> +       g->chip.parent = pdev->dev.parent;
> +       g->chip.of_node = pdev->dev.parent->of_node;
> +       g->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       g->dev = &pdev->dev;
> +
> +       ret = devm_gpiochip_add_data(&pdev->dev, &g->chip, g);
> +       if (ret < 0) {
> +               dev_err(&pdev->dev, "could not register gpiochip, %d\n", ret);
> +               return ret;
> +       }

It's a bit confusing how you use pdev->dev.parent for some stuff
and &pdev->dev for some.

What about assinging

struct device *dev = pdev->dev.parent;

and use dev for all the calls, it looks like it'd work fine.

Yours,
Linus Walleij
