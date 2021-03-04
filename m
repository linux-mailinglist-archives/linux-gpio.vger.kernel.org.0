Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4423332D666
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 16:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbhCDPSo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 10:18:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233598AbhCDPSR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 10:18:17 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785AFC061574;
        Thu,  4 Mar 2021 07:17:37 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id x24so1922984pfn.5;
        Thu, 04 Mar 2021 07:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sxVbtoQsXQDe11hhOz1TVuXTQQ5ZkWtO1kophxoFGFc=;
        b=pAQF62ogIOlgEnkywomfkpQyDH2eSFebRZ2yVqdaCKteJC9+By8P/aNx8Je8tR4s3J
         X2dWPesN7WpIdzpjQKW695pXK7vVYqIx/znPXcZQPalsOxArp4VZzBpfwzUgbaGQYDNF
         aY1o797QUQnkiv+vUZ3hVjsLJY3qw7GPlV7zAOZceU38bBjSXPOyPpLGpRPJCssz91xa
         BCzoe5rlzxRGrTt6MNujTgpOUytKS7Bp7ZTvFxLn4nkTl4LpfZVwqlJko3vyjiq+inQh
         4o9maxL/B4K3kdCjRD6QOM+W6/6B+tkSJHlewaBMno0E/vDrFK1bXNDzoVhsk777T2jP
         1Kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sxVbtoQsXQDe11hhOz1TVuXTQQ5ZkWtO1kophxoFGFc=;
        b=fN3E/MulGtYgmqrEbdSTefkYGbI1fMUKg0Xfa3cmGxovOu/znXiC3Pdz7gIFiYvWsZ
         Wuyy6FPkPBgPPMFBFUXD3mv/87PAmkRSS0nW2UCr6egYjTOOdm23fkeRKw33S2f6g+N5
         Xa4EKjCGJ3b+lZFr9gdFoi4UdRgcfWSOBP7JnCfo9zjs4oAGDY2A0I6GfSdQWM7M3UFm
         /HO5sx6WXHuibqUFDYP/u2icx8IFpd9sD48WIWqV4/YSMKguI5+6MC2WQoqB0gTHqsbC
         jTkr0L3GnKLRyE/TExtoa21Vy3v6LVhv8p5dHya+UulypAxv1cR4+IDoIXldbiBXe2tP
         YJuQ==
X-Gm-Message-State: AOAM533pzsaKGeM9G5oHopjbfOOx7KrWsSBHMGiTg93fdga6OppO5Pr/
        BzNVCfHB7gKEkF3IYXyZ+BYhNIMuG4F3OklBY6w=
X-Google-Smtp-Source: ABdhPJxhW2rb0JC4hUG5acmfnDoD9X9xcq6doTKUHJvS+2IeYHRq/ngcT6naLwv8uMpfMvXaGygK9ekXXqeGjtTBOZw=
X-Received: by 2002:a65:4c08:: with SMTP id u8mr3969555pgq.203.1614871056923;
 Thu, 04 Mar 2021 07:17:36 -0800 (PST)
MIME-Version: 1.0
References: <20210304085710.7128-1-noltari@gmail.com> <20210304085710.7128-3-noltari@gmail.com>
 <CAHp75VcpGNaQDR5puEX3nTGOQC0vHNjCje3MLLynoBHdjEi0_w@mail.gmail.com> <9A8A595D-2556-4493-AA96-41A3C3E39292@gmail.com>
In-Reply-To: <9A8A595D-2556-4493-AA96-41A3C3E39292@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 17:17:20 +0200
Message-ID: <CAHp75VdJGh=Vy=kJr2CemPbSa-amYykNoYd0-jaz0utdC_bkbg@mail.gmail.com>
Subject: Re: [PATCH v4 02/15] gpio: regmap: set gpio_chip of_node
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 5:06 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:
> > El 4 mar 2021, a las 11:35, Andy Shevchenko <andy.shevchenko@gmail.com>=
 escribi=C3=B3:
> > On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> > <noltari@gmail.com> wrote:

> >> + * @of_node:           (Optional) The device node
> >
> >> +       struct device_node *of_node;
> >
> > Can we use fwnode from day 1, please?
>
> Could you explain this? I haven=E2=80=99t dealt with fwnode never :$
> BTW, this is done to fix this check when parsing gpio ranges:
> https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36dba3=
70f797/drivers/gpio/gpiolib-of.c#L933-L934

Use struct fwnode_handle pointer instead of OF-specific one.

Also here is the question, why do you need to have that field in the
regmap config structure and can't simply use the parent's fwnode?
Also I'm puzzled why it's not working w/o this patch: GPIO library
effectively assigns parent's fwnode (okay, of_node right now).

--=20
With Best Regards,
Andy Shevchenko
