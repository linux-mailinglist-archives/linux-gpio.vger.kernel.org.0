Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E828D2B4ED3
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 19:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730534AbgKPSHJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 13:07:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730396AbgKPSHJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 13:07:09 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11476C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 10:07:08 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id d17so7267976plr.5
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 10:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KwmighqjU6PTeuGoIwFZ8GU7C19daH4vEQOL6ZihjKk=;
        b=NnbQdDVGqPJZpJavg0e67Bdn9MRD8HmAAGBRotKpmUO6vM2N7yWexSr4yBE2bB7M5f
         b0w5HHrkL/1CxIK3z4dwQPs5l9ERC+7WKBepS+gAfKbSLhzHahKq7mTo422Ylvs6Mmsi
         LavhWk3MRcpTp9VrRolq+mr+34Iv5z1ytUyiq13YXGgKzZdXrJQ/PBYgNnnYOr8ZxPir
         N6Dl0TR0dnIJSrRPSjksiyNzPQRrujCWy5MsKs2ga6/BMjaeu7O3pokEut+GIqsZbCEr
         f9NjdpOfM9O7hl6dAelQM/yMvzR9Gr1VvMsCNHp1IfJTJBvUMbE+HKwfJ7I/JnohO3YV
         3gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KwmighqjU6PTeuGoIwFZ8GU7C19daH4vEQOL6ZihjKk=;
        b=hmswmP+XSVrIobutyfaApip9u/VCr6tkX+Cf3Sje2Trgw9dBqp5/lTju3YYn9CU/jQ
         mpwfvoURcbyK/VOEin996ntJx8/LsyRdFmVppc/YXWAHN4Pr56mp1k8wxi0cV7RCiigt
         BzAUdqOqYEnzhw8T8BrrqgQ4s6SuMiRvK1/3TAOuv5xQIEyD6ZbgddZdHLBWxD/TdQ0w
         wnQxNFQzTke3US8BbOy2NtchMBDytoEVPiJd/VnMD01GpA/o0HnjKMFoICJf9XXCvugA
         PxY6Zc/PM7Pm4/9Dru8oKPFC38v5esG+xnoWpiFjetD/o0Hxuql7uYWxe5jWh2HmRO2c
         pkmg==
X-Gm-Message-State: AOAM530J9WCfHp40R6dN51JS9iCuw1o7hz/1d7ZXtO+EVkoBxA2rOkmC
        ARHNs5cLx3LrYrmaWoO9rIWKiU9CCQcY6I09/bZdcxnjeFU=
X-Google-Smtp-Source: ABdhPJzCNXxnEzPK771tPIarudQjNiYGiqGIOpKlor2itB8LRiBGPxwvlxkSUGubAr20UqWwHETpSx4Bo0UP/jyS0dg=
X-Received: by 2002:a17:902:bc4a:b029:d6:7ef9:689c with SMTP id
 t10-20020a170902bc4ab02900d67ef9689cmr14327135plz.21.1605550027603; Mon, 16
 Nov 2020 10:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20201116175128.4824-1-festevam@gmail.com>
In-Reply-To: <20201116175128.4824-1-festevam@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 16 Nov 2020 20:07:56 +0200
Message-ID: <CAHp75VdGGxMO_O-X_dfBTog0TG9Aurr6Txgq_nRwU40QvaQNrA@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mxc: Remove unused .id_table support
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 16, 2020 at 7:53 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Since 5.10-rc1 i.MX is a devicetree-only platform and the existing
> .id_table support in this driver was only useful for old non-devicetree
> platforms.
>
> Get rid of the .id_table since it is no longer used.

...

Actually I would rather add IMX_UNKNOWN_GPIO as 0 for enum and...

>         const struct of_device_id *of_id =
>                         of_match_device(mxc_gpio_dt_ids, &pdev->dev);

...use of_device_get_match_data() here.

> +       enum mxc_gpio_hwtype hwtype = (enum mxc_gpio_hwtype)of_id->data;

...

Another (and I think better variant) is to switch .data to be a
pointer to the corresponding struct, then you may drop enum and hwtype
completely.

-- 
With Best Regards,
Andy Shevchenko
