Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40722ABE09
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 15:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730738AbgKIN7a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 08:59:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729697AbgKIN7a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 08:59:30 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8045C0613CF;
        Mon,  9 Nov 2020 05:59:27 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id f38so7232495pgm.2;
        Mon, 09 Nov 2020 05:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zd8LqA4AvziCIC3LVVI5CDJXP/RwRW09TDwr3WHSIkM=;
        b=Z+jnaxEQ3CiyUWVlSfYghQzqYoIeYURKS4e3afZe7gQikjEfqRpP0HtUepHmqK3euV
         m8NpMD5bwO+eLZ0UTZH2uroxZEcxkFf2Px1Z3uAuNnNsrBa+dhcaaUx82AGim6d9hncH
         FROHCxCxNd0MfX3Kl17nvFDXLx5F7qaqoVsC+OaZHbmcqCFiBUBHkkJN7BdL4OqftzE9
         1XQAvc6kkoYWnux3M4LCBjQpU/GFNEvC0kfz++ozefctxirbl5af7C2wzyv0B34qy62G
         8Ogr/FhkYCTaEsVvuw16l6qXHOgFgBH0r3bQZoWL5qmfm16tXqymkfATTCnxJmjtOuvx
         +czQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zd8LqA4AvziCIC3LVVI5CDJXP/RwRW09TDwr3WHSIkM=;
        b=mK+pbUjNgkqNq8IaH5LHGWE23E/mz/RaETpiOhtttGx2+Zohj4dfbAitJNef1mtyQX
         Bhq8PR3UfsZL1nhp86TTwIqC3Z0zreotncreE89oMEYU2jJYYHvCMV4WhrhWqZUH9R+7
         VB4Ip6iwKkR0hmxFhtTvOxJK2C8qbFfWhl0HXtQwoEW4USPBLrjnhs7i5KCTqkpqTeTF
         AC0klLEroIADmcEF+EAr5NSx7Wyu9Sk+87Ht6xY8h2iyIumylrepDfJvcjH5u9lhP1h8
         JnQs18hDGjb30yzlMPcnK3wA/AX0E4+RKMOmSbvLQRoDPTY+NyYMGK/meuYDnPNVDwwH
         by3w==
X-Gm-Message-State: AOAM531yZNiU7HsNcW+Ut3qTovpeFSXoO2aD3PjzP4dEYWFzSucv0C//
        HuatSlvJENHOIsCtMG2oOKTeslaD7dBdGzA6Md6ycHO1TaQ=
X-Google-Smtp-Source: ABdhPJya5ocOqVzr/IsQwH0RKfu6x+cnUxaTtxoNr0cNw7bTQm+3u7A+SU9B+0Trg6LYgGaPveIKJPkYbHv8BKxoelQ=
X-Received: by 2002:aa7:942a:0:b029:164:a853:f0fc with SMTP id
 y10-20020aa7942a0000b0290164a853f0fcmr13471964pfo.40.1604930367398; Mon, 09
 Nov 2020 05:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20201029134027.232951-1-lars.povlsen@microchip.com>
 <20201029134027.232951-3-lars.povlsen@microchip.com> <CAHp75VedcNP5x72PN4tqZ_0HhbCyd666T=AWn+TFr7Fp8EEs7Q@mail.gmail.com>
 <874klyg2dg.fsf@microchip.com>
In-Reply-To: <874klyg2dg.fsf@microchip.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 9 Nov 2020 16:00:16 +0200
Message-ID: <CAHp75VeN4jKjOA=WO0mgkSAbWZUMUfkrX3yV83y0iYnh1rp84Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] pinctrl: pinctrl-microchip-sgpio: Add pinctrl
 driver for Microsemi Serial GPIO
To:     Lars Povlsen <lars.povlsen@microchip.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 9, 2020 at 2:07 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
> > On Thu, Oct 29, 2020 at 3:40 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:

...

> >> +#define __shf(x)               (__builtin_ffs(x) - 1)
> >> +#define __BF_PREP(bf, x)       (bf & ((x) << __shf(bf)))
> >> +#define __BF_GET(bf, x)                (((x & bf) >> __shf(bf)))
> >
> > Isn't it home grown reimplementation of bitfield.h?
>
> This was answered in the aforementioned mail.

Perhaps it makes sense to add functions like field_get(), field_prep()
to that header?

...

> >> +       /* Calculate port mask */
> >> +       ret = of_property_read_variable_u32_array(np,
> >> +                                                 "microchip,sgpio-port-ranges",
> >> +                                                 range_params,
> >> +                                                 2,
> >> +                                                 ARRAY_SIZE(range_params));
> >> +       if (ret < 0 || ret % 2) {
> >> +               dev_err(dev, "%s port range\n",
> >> +                       ret == -EINVAL ? "Missing" : "Invalid");
> >
> >
>
> ?? Did you have a comment?

OF vs device property API I think.

> >> +               return ret;
> >> +       }
> >> +       for (i = 0; i < ret; i += 2) {
> >> +               int start, end;
> >> +
> >> +               start = range_params[i];
> >> +               end = range_params[i + 1];
> >> +               if (start > end || end >= SGPIO_BITS_PER_WORD) {
> >> +                       dev_err(dev, "Ill-formed port-range [%d:%d]\n",
> >> +                               start, end);
> >> +               }
> >> +               priv->ports |= GENMASK(end, start);
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >
> > Doesn't GPIO / pin control framework have this helper already?
> > If no, have you considered to use proper bitmap API here? (For
> > example, bitmap_parselist() or so)
>
> Past reviews suggested using an array form. And as the binding is
> already reviewed, I would like to keep this as is.

Yes, but you are using something like a,b,c,d which corresponds to
[a..b], [c..d] if I'm not mistaken. And I believe that there are
plenty of drivers using this approach for some ranges (not
specifically for GPIO). And it should be an API available which does
all these checks and other stuff under the hood. I will be surprised
if there is no such. In the latter case, add one and use, many will
benefit from it.


...

> >> +       i = 0;
> >> +       device_for_each_child_node(dev, fwnode) {
> >
> > Ditto.
> >
>
> Don't sure I understand this comment, but device_for_each_child_node()
> is from <linux/property.h> - this should be OK I think.

Yes, either leave it (as you have done), or replace it with OF centric one.

-- 
With Best Regards,
Andy Shevchenko
