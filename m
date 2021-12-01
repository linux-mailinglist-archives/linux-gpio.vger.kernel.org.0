Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFC146585C
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 22:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236606AbhLAVcH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 16:32:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbhLAVcG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 16:32:06 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE5BC061574
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 13:28:45 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id w22so32845116ioa.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Dec 2021 13:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JU5TgDLS5GPcXgmJtmNE+t40b9mpN9pxEwofkeb2nlE=;
        b=jZuSujuwagfhvgalS9XYIXTkDDRnStrVv4NDR8LAk6crMDqvKFqWPWUucGa+ObJGty
         xL73Os/kTI01d+StjK/XmI3T44qfmJ8l2I0cDbPWZS8dfauW/aERTZZF/4yqAd4MUOam
         nzaD2isFr74y6GWUdfEhPQGYiq2Ctd98Pv6D3b4mimDSPvbeSSf+B38ZYby/WsZx1zk1
         YmiasE3+rHJLzuELQG7u9anaiBeYVMcvjEEurz/RzXshEYdBjpriT6dK/135l6GUtGC7
         jPSBfKVPoVPVSlsEAxjm5wtSNNHaS49HnQF1yVG0iNoBqMLNV2mvzc7iTq4VMURdbozL
         tu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JU5TgDLS5GPcXgmJtmNE+t40b9mpN9pxEwofkeb2nlE=;
        b=hr5tvH9TCpaj+hfEPyaP18QdQTvKaaL5m6eQ4dQxL8Abr9nC+TdUc9rnUrB55ppaWS
         kAZVnQTgEGTNE3QKaVFx4gLUHhtxwIiSI2UdB7BOPbQnC009iMeYqYr919HinYyzXJxl
         G3REC8seuKP5ldILhR8k385D8HJru2pqP6wrHhPAeFVWC+F69tRUEOz1VV3dMGNQcGdN
         k3Gp3DN7EMwvYSeBESk9Eit3cLgFn7+DIKuAuX2ozfvsObgKblMclsn/V90gQ1fqaMPj
         OMxH/IlAHcGXOToClle+rwe8i9TWxO2tBbFXzEo9TBBXlLTN4LfGqW+tHG05oxCwHYRf
         Jjlg==
X-Gm-Message-State: AOAM531gTkgnACIlfxXDOsuImdFFyW6mxQAy+pqFwmhpIcLgaPcFBSi9
        k7QVHVcpicwH5atEiMV7UU9N77GbN1vQ5zCGDKk82Wjs8Lzawg==
X-Google-Smtp-Source: ABdhPJxHZYLWn7G9DYIxJrfpYceqaeczeqgpVS9eew3s2JlxRjInT4EfPDV6hL8Wrz0S0mQ75s4FCN25TK/mTRBx4lw=
X-Received: by 2002:a05:6638:1695:: with SMTP id f21mr14594847jat.84.1638394124588;
 Wed, 01 Dec 2021 13:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20211109113239.93493-1-robert.marko@sartura.hr> <20211109113239.93493-3-robert.marko@sartura.hr>
In-Reply-To: <20211109113239.93493-3-robert.marko@sartura.hr>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 1 Dec 2021 22:28:34 +0100
Message-ID: <CA+HBbNGH9ih5RovU9YHL91osFxDJbWw2Qk=ed30GGQvndNJPKw@mail.gmail.com>
Subject: Re: [PATCH v9 3/6] dt-bindings: reset: Add Delta TN48M
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>, Andrew Lunn <andrew@lunn.ch>
Cc:     Luka Perkov <luka.perkov@sartura.hr>,
        Bruno Banelli <bruno.banelli@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 9, 2021 at 12:32 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
> Add header for the Delta TN48M CPLD provided
> resets.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  include/dt-bindings/reset/delta,tn48m-reset.h | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 include/dt-bindings/reset/delta,tn48m-reset.h
>
> diff --git a/include/dt-bindings/reset/delta,tn48m-reset.h b/include/dt-bindings/reset/delta,tn48m-reset.h
> new file mode 100644
> index 000000000000..d4e9ed12de3e
> --- /dev/null
> +++ b/include/dt-bindings/reset/delta,tn48m-reset.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Delta TN48M CPLD GPIO driver
> + *
> + * Copyright (C) 2021 Sartura Ltd.
> + *
> + * Author: Robert Marko <robert.marko@sartura.hr>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_TN48M_H
> +#define _DT_BINDINGS_RESET_TN48M_H
> +
> +#define CPU_88F7040_RESET      0
> +#define CPU_88F6820_RESET      1
> +#define MAC_98DX3265_RESET     2
> +#define PHY_88E1680_RESET      3
> +#define PHY_88E1512_RESET      4
> +#define POE_RESET              5
> +
> +#endif /* _DT_BINDINGS_RESET_TN48M_H */
> --
> 2.33.1
>

Does anybody have any comments on the patch as the reset driver got reviewed and
the bindings have not?

Regards,
Robert
-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
