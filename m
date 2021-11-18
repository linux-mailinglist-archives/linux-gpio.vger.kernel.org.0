Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47FE3456060
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 17:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232488AbhKRQ0J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 11:26:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231667AbhKRQ0J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 11:26:09 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB1FC061574;
        Thu, 18 Nov 2021 08:23:08 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id u3so28650406lfl.2;
        Thu, 18 Nov 2021 08:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g9e5yveOYu7jcCAfB59G6xwAYMb7QkIvs920KpASDMs=;
        b=RlCj0SRl7BI5R8rMvDji5E1HZKnJHzON53D4Y6ADXcNBKIn79H3BwNCtfKDsDdlSzO
         ciBS9Ud2o4W30ZeVzCZu9T9GewVPjvpFPSIYL3LIUpD/geJsyklylZ7T4qo8uonrrmI7
         thpBoyJUhBiBk73MEgMv3WT9psc1GY38ehYBXDvbUvLXW0lH1oi7wbSsOjAfxv8a15qW
         1eM/WyOAzZKBs11Npy2dk9+lBxsOg2VhFLcQe+eZr4ArGtQzVwDrrRWmvtdmFT0AHo5K
         mYdcKahYg1xA5E4Irds9olEZa7FV8w6/Xb+yOgcoUnJiRF+5Aw4kMEdVjcsy9mEt3wmT
         Hlpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g9e5yveOYu7jcCAfB59G6xwAYMb7QkIvs920KpASDMs=;
        b=qQilnnRZi6bMKR1nfHxTdHJ170AVaBs2XlX90iz7StHUiFlp7QvlgCCpNNPD7XKv1c
         +kRQ6Pduhp8UAeRJz7+QpPQjOARy2OjyH6eQHxWt2a8mYX2i9xa2KX74swX/opFmN72l
         k2vswJML9sKOkiSqBMI6YaAUqCOj++wGvPRBTPO1Val7HjULtnVsfDD43xmvm+Fy1t6u
         XXobip7XNKzRMR35pAKOOLW6UQsuEJqxvsqw3h1Vc0tMgN+7ypfusfDjIYHQgIxu4w6R
         ZZqX0w57RujXo1RXcfL7pIOhqOKZ1+EdDNZHiY2Wgxe6jXu7dRxQQm+kLUVO1HdrfPBY
         d+nQ==
X-Gm-Message-State: AOAM530NnwtRjP0KpHnZVfvf8s9eaFL7KtSAnF7IuKO+STp6RdOHnAzN
        mHF8u3YaBMabcbBa3XJUi9oDb73kZ3TCWITL/io=
X-Google-Smtp-Source: ABdhPJxHFGEKvnOmU7JD5o0tsFJCLNiCm8pXA2LHtL9V0wGO4W1sOLK6qnaBGL+pNaWy54ZTTl8b/05NKVVz0BLkSHA=
X-Received: by 2002:a05:6512:110c:: with SMTP id l12mr24680124lfg.224.1637252586002;
 Thu, 18 Nov 2021 08:23:06 -0800 (PST)
MIME-Version: 1.0
References: <20211118132152.15722-1-zajec5@gmail.com> <20211118132152.15722-4-zajec5@gmail.com>
 <CAHp75VebQKsSJYxK9Fi0wEhGfpR=1HZfDsVuqV8BCG-UrZDtVg@mail.gmail.com> <82405573-8c3b-0c43-6388-6e0891af4ae6@gmail.com>
In-Reply-To: <82405573-8c3b-0c43-6388-6e0891af4ae6@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 18 Nov 2021 18:22:23 +0200
Message-ID: <CAHp75VcMhBdAvHORqjZfvkLiGG-eK-4SYF9Ds+_5eq-3h5x=_Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] pinctrl: add helpers reading pins, groups & functions
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

On Thu, Nov 18, 2021 at 4:17 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
> On 18.11.2021 14:57, Andy Shevchenko wrote:
> > On Thu, Nov 18, 2021 at 3:22 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.c=
om> wrote:

...

> >> +#include <linux/of.h>
> >
> > I don't like this. This shows not thought through the design of the ser=
ies.
> >
> > What I rather expect is a proper interfacing layer that you fill with
> > options that can be provided by corresponding underlying
> > implementation, e.g. DT.
> >
> > Moreover, before doing this you probably would need to refactor the
> > pin control core to get rid of DT specifics, i.e. abstract them away
> > first.
>
> Ouch, it seems like pinctrl got into a tricky state. As I understand it
> we need some abstraction layer between DT and pinctrl but noone is
> working on it?

Seems so to me.
To be more specific, I'm talking about these:

  struct pinctrl_ops {
    ...
    int (*dt_node_to_map)...
    void (*dt_free_map)...
  }

and this:

  struct pinctrl {
    ...
    struct list_head dt_maps;
 }

In the latter case it is almost related to renaming dt_maps to
something like fw_maps.
In both cases it is about decoupling DT stuff out from the pin control core=
.

So, with something like pinctrl_fw_ops to be introduced, the DT stuff
moved to drivers/pinctrl/devicetree.c.

> Does it mean we should consider pinctrl core frozen until
> it's refactored?

Solutions which are related to pin control core without keeping non-DT
providers in mind will be NAKed by me, definitely. Of course it can be
overridden by maintainers.

> It's quite inconvenient for me as I'm not sure if I can handle such
> heavy pinctrl refactoring while at the same time I'd like to add
> those small features to it.

Which effectively means "let give somebody else even more burden and proble=
ms".

> Can you point to an example of extra interfacing layer that could be
> used as a reference for what you expect for pinctrl one, please? Some
> solution in another Linux's subsystem?

GPIOLIB decoupled this.
Another example (not sure if it's good enough here) is the fwnode API
(see fwnode ops).

--=20
With Best Regards,
Andy Shevchenko
