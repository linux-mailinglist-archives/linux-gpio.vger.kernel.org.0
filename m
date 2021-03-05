Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF92C32E526
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 10:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbhCEJpe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 04:45:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhCEJpG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 04:45:06 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8ACC061574;
        Fri,  5 Mar 2021 01:45:04 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id y67so1784287pfb.2;
        Fri, 05 Mar 2021 01:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/UcxhiEkfccqsDr9yQQr2scZAanKlqasnKIOowcaKCo=;
        b=Zavc3YVUJ2VHnvMJDlyxudjYrwJv+6yWogOYN+mJW/svEBETf0TnMHYniTCyuG9+Ua
         pgV1z26C8wwRk3BAgjYAa379mcdvXCqeY4ayvVF21SnPP/QI1Kz2szzLIExRem1A7Llr
         PLyvcF2fRAJ71XxTD3Pxz11+9Yt7V5Z8ng3ZbmZeRnOxfJO8BZ2obobgXNKiX0eo5jqz
         v4sD9zPaIdgCAAlcKY9s4CZbPYto1rw7h6v9pD/u5qUiisj/KytJkUms70O96BE2C8OA
         KM5JsWkikIB2FeF5COy2VpuTtkQ6Sz1oEJRj7bft+WAae33vcg1pp3Xb0eH3ZOVq8qEm
         J7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/UcxhiEkfccqsDr9yQQr2scZAanKlqasnKIOowcaKCo=;
        b=GhBAcQXuQOSiOT/JScYlTv/ZRRYdrJuSpEWxbiVQu5kMp6TVO4Hp2NxOecLfS0sQkK
         B2IVLNNMfox+dKgyOaLLeeDkltOpKgyDtLhglzliUbMW4xNzpJTo3FciDaZoIiCVRiJN
         aHc+JoRyYqBCMKfcH/5KMQ/zBETS0nkUIXzuOGOqjBRrya/e/bGyAdzTgr+kuMpenYlj
         H8Z+roXgP3uo+y0GcJoqQ8fUpY/YE4Sf/tgLHYvBz/QQotMQA2MLgTRmi5vmctgBX8Yr
         T0fK3UQzruSG30L4F0jTFctxgwHE1OxZIGmLByKvQaCCaERSEF+Bru065OxTBqbjHFuf
         2i3g==
X-Gm-Message-State: AOAM533W088wWihAOdYJzXd4Cl1yPc+OA5lbFpWrNMMBwi7eWtDNFhw7
        am9eE00RuRGWTeQ5+ejkva29AEb+LKau6lh+0Qb7yv9kefFzUw==
X-Google-Smtp-Source: ABdhPJx97tw7a65MIzc72su7Bv0bGiXPG8gMCT8Mo4SxkoI98C/0nDR7Tvt3WHExo4l9dKkgsHMeq5cqlXt7b3QSkNM=
X-Received: by 2002:a65:5ac9:: with SMTP id d9mr7646277pgt.74.1614937504035;
 Fri, 05 Mar 2021 01:45:04 -0800 (PST)
MIME-Version: 1.0
References: <20210304085710.7128-1-noltari@gmail.com> <20210304085710.7128-3-noltari@gmail.com>
 <CAHp75VcpGNaQDR5puEX3nTGOQC0vHNjCje3MLLynoBHdjEi0_w@mail.gmail.com>
 <9A8A595D-2556-4493-AA96-41A3C3E39292@gmail.com> <CAHp75VdJGh=Vy=kJr2CemPbSa-amYykNoYd0-jaz0utdC_bkbg@mail.gmail.com>
 <0504ADC2-0DD5-4E9E-B7DF-353B4EBAB6B4@gmail.com> <CAHp75VdkCxBeh_cWwN9dKRpEMntMp22yVjWRCuYumhMzrWi+SA@mail.gmail.com>
 <68F60F3F-33DD-4183-84F9-8D62BFA8A8F1@gmail.com> <CAHp75VdJ0=EewuHW2Ja5MQ=e9q0njGun8iN5Q6JWUxe=CLB=MQ@mail.gmail.com>
 <CAHp75Ve9uW6+kpNmsG2BaaOymoAKXPdebNCfRnxUpAZoQnfZ0Q@mail.gmail.com> <4839e31730b22004f1ebe9510d3823ce@walle.cc>
In-Reply-To: <4839e31730b22004f1ebe9510d3823ce@walle.cc>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 5 Mar 2021 11:44:47 +0200
Message-ID: <CAHp75VcQ4H_+A_JrVH+trBzDFctUGoNr7KfgQ-Og_eH3YzxVFg@mail.gmail.com>
Subject: Re: [PATCH v4 02/15] gpio: regmap: set gpio_chip of_node
To:     Michael Walle <michael@walle.cc>
Cc:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
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

On Thu, Mar 4, 2021 at 7:24 PM Michael Walle <michael@walle.cc> wrote:
> Am 2021-03-04 17:46, schrieb Andy Shevchenko:
> > On Thu, Mar 4, 2021 at 6:33 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >> On Thu, Mar 4, 2021 at 5:44 PM =C3=81lvaro Fern=C3=A1ndez Rojas
> >> <noltari@gmail.com> wrote:
> >
> > Let me summarize what we can do this independently on any of my
> > patches and be okay with.
> >
> > In the regmap GPIO configuration you supply struct fwnode_handle
> > *fwnode.
> > You can you fwnode API in the actual GPIO controller driver.
> > Inside gpio-regmap simply do this for now
> >
> > gc->of_node =3D to_of_node(config->fwnode);
>
> If doing so, can we please have a comment saying that config->fwnode
> might be NULL in which case the fwnode of the parent is used?

Good comments are always welcome!

> > The last part is an amendment I have told about, but it can be done
> > later on by switching the entire GPIO chip to use fwnode instead of
> > of_node.


--=20
With Best Regards,
Andy Shevchenko
