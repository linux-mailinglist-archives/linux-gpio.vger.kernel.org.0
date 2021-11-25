Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1650845D7A9
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 10:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351371AbhKYJze (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 04:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354334AbhKYJxd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 04:53:33 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85BA0C0613E1;
        Thu, 25 Nov 2021 01:50:17 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id o20so22822046eds.10;
        Thu, 25 Nov 2021 01:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=n5Wf9BQyo6FYoctvlwglENI9zvaw7nRwVtTBUMkFJ6Q=;
        b=NJZRzqryQtbc9EOyrmaVFPS5ff9tWNGZvXhxda518Yuw95cTXMAOepGDSAJMEB0wJR
         mrIVpWCcnzmuAZekibqfPQAcEUE2XfzJQeRQHH48n4JdzzpJTnWGGa8/K/h6LcFXSeOb
         FVblfXVcVbsiPJJnnRPwzxftLWK28ggKjdDTZgGpCy6TSpheq042649lkHOUvDm/9W/5
         121dYQzXb6I6NUo24hQxd5skBoFmWjz/LS0yZy80/Ijhf0n9ch5Vz4EdpslIaymwVI5T
         L3YDehB/dRwX9j0WQXvSSLK6zj0eecLLaNnKT7NsB/ruvqspBPkoZZSjtIhSQxGRMB3g
         0ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=n5Wf9BQyo6FYoctvlwglENI9zvaw7nRwVtTBUMkFJ6Q=;
        b=mR1Mc0tLtChJauhiS80tcUD9KdDTHUGn1cVXhns4TB5uIpHABa5ZFCQoErLxcsS+lZ
         MMTQZflejAoK2PDpw0uxxXKmAS5pI2CVt9anYCigbO+5s3gZcdOBeZyVDaKSlISVn8//
         5FT6JHyRM6aUlllCsNfq+CtT6Hee4Ll7nvucO15XcCZykxcOhzzIoYfmQQx4EJ4jm/wa
         1R9piFDKS3qn5kggm/2GdVrV439/dbSeKD7fCNEzEPzgLRjvl1OIDLdXUq6rBPMFFHBf
         HLW7jTbR4W5t3AwCe5AzqXNFa73+eUK/BDeOV1WsTfo4vYMZ16O6VgRUENBCG4ur7zXm
         91MQ==
X-Gm-Message-State: AOAM531Bo5F9vLJbNcS3Iae8+MNXN4wMGFtmLk186wdId8Jj8cMV9XgR
        a7Ca4h7lvCtSwNULpwujTnkIxDcNic4N7DsMkkU=
X-Google-Smtp-Source: ABdhPJyfZ0exQwQZRq+G5hjG8/AGd5PHsxUAFgNjuxGD4H2PVKsZVU7xYc0D1MrScEOZgpoalpxp0pb/PIdCdcx4nQg=
X-Received: by 2002:a50:fb09:: with SMTP id d9mr36568200edq.283.1637833815690;
 Thu, 25 Nov 2021 01:50:15 -0800 (PST)
MIME-Version: 1.0
References: <20211124230439.17531-1-zajec5@gmail.com> <20211124230439.17531-5-zajec5@gmail.com>
In-Reply-To: <20211124230439.17531-5-zajec5@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 25 Nov 2021 11:49:39 +0200
Message-ID: <CAHp75Vev-Q+Xod1gcTyK27hpCkSrDRV5nVbnc58-U7KOHLbf+Q@mail.gmail.com>
Subject: Re: [PATCH V2 4/6] pinctrl: support reading pins, groups & functions
 from DT
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 1:04 AM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> DT binding allows specifying pins, groups & functions now. That allows
> storing them in DT instead of hardcoding in drivers.
>
> This adds support for DT as data source to recently introduced API.

a data
the recently

...

>  int pinctrl_generic_load_pins(struct pinctrl_desc *pctldesc, struct devi=
ce *dev)
>  {
> +       if (dev->of_node)

Again, it's a layering violation.

> +               return pinctrl_generic_dt_load_pins(pctldesc, dev);
> +
>         return -ENOENT;
>  }
>  EXPORT_SYMBOL_GPL(pinctrl_generic_load_pins);

>  int pinctrl_generic_load_groups(struct pinctrl_dev *pctldev)
>  {
> +       if (pctldev->dev->of_node)
> +               return pinctrl_generic_load_dt_groups(pctldev);
> +
>         return -ENOENT;
>  }
>  EXPORT_SYMBOL_GPL(pinctrl_generic_load_groups);

>  int pinmux_generic_load_functions(struct pinctrl_dev *pctldev)
>  {
> +       if (pctldev->dev->of_node)
> +               return pinmux_generic_load_dt_functions(pctldev);
> +
>         return -ENOENT;
>  }
>  EXPORT_SYMBOL_GPL(pinmux_generic_load_functions);

Have you thought about making ops structure (or ops inside existing
structure) and all above will be something like

  stuct ops *... =3D ...->ops;

  if (ops && ops->METHOD)
    return ops->METHOD(...);

  return -ERRNO;

--=20
With Best Regards,
Andy Shevchenko
