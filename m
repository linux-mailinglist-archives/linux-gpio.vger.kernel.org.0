Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89B5C1134BA
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 19:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728921AbfLDR6q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 12:58:46 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38621 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728892AbfLDR6p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 12:58:45 -0500
Received: by mail-pf1-f196.google.com with SMTP id x185so212309pfc.5;
        Wed, 04 Dec 2019 09:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3qnc/DourAqKXGB8UexuKZfhfQtrrL3DnO6ZS7E2dpQ=;
        b=KKSjtAbgjQCv82EVwdoro4f52/90n5yCUHxG8IULoz7ohvN4vitOIY2YSHRadcioVL
         BIx+JrM+9MJlNmNjQuA/RN67FTuo0sYlbWtkZo2bfsg6qvGGcxQ5F8dey72dHgkmHYwW
         VtmZRVrET/ylJX9oXmurT9Cx+dEVeY62RqvToYx5CjVDVll96NQMQGJob8pJblBjjT7w
         1intd91Qos7FhYBFac5baWA48xYNs2HD02o7JwGS0oNvV0JSW7E/9qZQzcdeCAKqRArI
         FSDunxb2dGWah1ARojP2gj0ck+vplzcoSE1mE2qXyfsYWQlTz4ZfSTnZaTEdbvr1s+4+
         rxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3qnc/DourAqKXGB8UexuKZfhfQtrrL3DnO6ZS7E2dpQ=;
        b=CmpdCMUsJq7iJVcIh9h5Wy9k1b7VDlEh2r4J2VGZwpqgj9BEzP6XR5aFoUD7L/9pDD
         a1XCSixNhGwl0KtRqFhrsJuFkL6WQJNveU8Mw82tq+nShhzOsePm2AcFIQRexrJP15YG
         65m+vf4giy9YEHDy4iy1LWHFNOP4USZHNNgyF0xBikRMZVjjv8Ywwnp0V/lSHdJTpAd1
         CX6+VkuspLgSNAY0xFmISy9id5geIqQX2JMvzix7OXdUY47iGS9Ys9CjBBy1x4OI1ScV
         75WpXzuI+ORFTTYjEa8Fo71kIvejQcMKUk/VCM+I5/kPcDkC9SRuFQr1n/wATKHekezz
         b1uQ==
X-Gm-Message-State: APjAAAVaNsoPY0dT6hgdcCN4PpEnTwVa5wSnG0vCJZgzXB3Y4OUtlPrH
        RZ9mA4ar2G1fi8IrEvi74KpgnqVAhfUyj8CMpGjW/xd9I5o=
X-Google-Smtp-Source: APXvYqz0Dsrj0gSyIghA8gf8j2wFq83ExJKRTKEdu92Mm+R3nl5Bdz56n1irUdrVmavcZVcLUaaCkkqZRR5Ia5Tf2l8=
X-Received: by 2002:a62:1944:: with SMTP id 65mr4859751pfz.151.1575482325114;
 Wed, 04 Dec 2019 09:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20191204101042.4275-5-cleger@kalray.eu> <CAHp75VdQ6VooLVAfA1z98-bBcfQuR7AomaO8F19AGRjeBtByEQ@mail.gmail.com>
 <1988869450.95325741.1575471003953.JavaMail.zimbra@kalray.eu>
In-Reply-To: <1988869450.95325741.1575471003953.JavaMail.zimbra@kalray.eu>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Dec 2019 19:58:35 +0200
Message-ID: <CAHp75Vc6oU2nNkKT8N+6RomSxHVXu0AvwoZVBKvTERLQ68Kz_Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: dw: add pinctrl support for dwapb gpio driver
To:     =?UTF-8?Q?Cl=C3=A9ment_Leger?= <cleger@kalray.eu>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        "open list, GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 4:50 PM Cl=C3=A9ment Leger <cleger@kalray.eu> wrote:
> ----- On 4 Dec, 2019, at 13:43, Andy Shevchenko andy.shevchenko@gmail.com=
 wrote:
> > On Wed, Dec 4, 2019 at 12:12 PM Clement Leger <cleger@kalray.eu> wrote:

> > Can't you split adding pin control data to a separate patch?
>
> Yes even if the first one will not be buildable.

It will. Just split it wisely.
I'm preparing Intel Lynxpoint conversion (you may see the approach
here [1]) and I stumbled over similar problem.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git/comm=
it/?h=3Dreview-andy&id=3Dddbf10ea98c1c96de98fb5878ca0d0042e912f6a

> > Can't we generate these lists dynamically?
>
> Indeed, these list could be dynamically generated. However, since they
> can be shared between all pinctrl instances of this driver I thought
> it was better to keep them common and simply restrict the number
> of pins at pinctrl registration. But as I said, I can generate them if
> you want.

OK, let's wait for subsys maintainers to comment on this.

> >> +       ret =3D pinctrl_enable(port->pctl);
> >> +       if (ret) {
> >> +               dev_err(gpio->dev, "pinctrl enable failed\n");
> >> +               return ret;
> >> +       }
> >
> > Not sure why it's needed at all.
>
> I saw a comment over "pinctrl_register" in pinctrl.h saying:
>
> /* Please use pinctrl_register_and_init() and pinctrl_enable() instead */
>
> So I switched to pinctrl_register_and_init + pinctrl_enable.

I read the code and do not see any evidence you have to use above.
Do you plan to do something in between of those two calls?

> > Can you use new callback for this?
>
> Do you mean the gpiochip add_pin_ranges callback ?
> If so, I will look at it.

I meant ->add_pin_ranges() which is part of GPIO chip structure.

> >> -               .name   =3D "gpio-dwapb",
> >> +               .name   =3D "pinctrl-dwapb",
> >
> > This will break existing users.
>
> Ok, I will revert that.

You may fix users at the same time.
Either fine with me.

--
With Best Regards,
Andy Shevchenko
