Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1F7E681579
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 16:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237835AbjA3Pqv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 10:46:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237192AbjA3Pqb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 10:46:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A058F41B79
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 07:46:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 50C95B81211
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 15:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97B2C433A4
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675093569;
        bh=zKsdQMLewvz5vpuyU1ZFhGmydLi3IRdSKCLooHlOcS4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nVFoRvIAmNzCAJqY9aSo6V+QH1N0WxdGSWLorIwEnnCCpGpbrq4nBc/WaXFZMbSqs
         BdKXk92R+jOMP5AoHuB8PTlY1HoAUuUhKheMglaQ3Q6a8PUTLlD9fvqlCuHWOTOi1J
         GVh9XlOoiWTRe8fJd2c40L20fRFOan9hE3OIeqgyuvRngAGuBz1Bh4zC6kUjDG7xm5
         uzxTwx+Hc7DAKgqkP2mbncNCveFxlpEN6T9UuYJQB/auIOqpxeRlyz4KS6WCEJYoT2
         wc8AmP+Atu9uze6CyY7w5Mof7AkLitsXqIdqFgaG4NgLNjmIC77tIBtVNR4AJDfhUp
         gQmvyuPuvYPgg==
Received: by mail-vs1-f47.google.com with SMTP id y8so12968082vsq.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 07:46:09 -0800 (PST)
X-Gm-Message-State: AFqh2kpKT/3zPLPw/E0HKj2izxyyKfEUQ0NLghjGH8gVEsYy6UIRVxJI
        8pGV2aphsP7lXlsaE/mY2fKWjd3MtTz5p04NVA==
X-Google-Smtp-Source: AMrXdXverKWwwTHPDzzPxjuuD3m1jhFXXlSgNS7RPOu6iYy+8Azs/XuTqXVaUe+stzB06j1Gs7eWEmk2jWagNKznCsc=
X-Received: by 2002:a05:6102:5490:b0:3b5:1fe4:f1c2 with SMTP id
 bk16-20020a056102549000b003b51fe4f1c2mr6818396vsb.0.1675093568878; Mon, 30
 Jan 2023 07:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
 <20230125093548.GB23347@pengutronix.de> <CACRpkdbcrTv+=7Ev750O=UO=V=afp5NnTT4znb0rzWLkom+_cg@mail.gmail.com>
 <20230126104927.GE23347@pengutronix.de> <20230129183339.GY24167@pengutronix.de>
 <CACRpkdYRynwJJZR5uCEn9rmE3c8p7R8SQdXC2FkzRUkBYRjErg@mail.gmail.com>
 <20230130110252.cnw4ex6g3gc5bl3w@pengutronix.de> <CACRpkdb-LbRrg0gwB6ArJ-=YdM5TtXVN3oZf58hPCppnt8ZUjg@mail.gmail.com>
In-Reply-To: <CACRpkdb-LbRrg0gwB6ArJ-=YdM5TtXVN3oZf58hPCppnt8ZUjg@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 30 Jan 2023 09:45:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJofZ5386oS1hkme2n_pbQVe3OAVxusQvs43wzKCM2LZw@mail.gmail.com>
Message-ID: <CAL_JsqJofZ5386oS1hkme2n_pbQVe3OAVxusQvs43wzKCM2LZw@mail.gmail.com>
Subject: Re: GPIO static allocation warning with v6.2-rcX
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Robert Schwebel <r.schwebel@pengutronix.de>,
        Sascha Hauer <sha@pengutronix.de>,
        bartosz.golaszewski@linaro.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        christophe.leroy@csgroup.eu, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2023 at 9:02 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Jan 30, 2023 at 12:02 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > On 23-01-30, Linus Walleij wrote:
> > > On Sun, Jan 29, 2023 at 7:33 PM Robert Schwebel
> > > <r.schwebel@pengutronix.de> wrote:
> > >
> > > > While this could also be done with a daemon offering a dbus api, this
> > > > would be significantly more complex. In a critical environment, one
> > > > needs to make sure that the daemon process never fails, otherwhise the
> > > > power of the DuT would maybe be in a random state. Then of course one
> > > > can add a watchdog, but with the current sysfs interface it's really
> > > > simple. Of course that would also work if the new interface would offer
> > > > a "keep this line as it is" feature, but adding a dbus daemon just for
> > > > keeping the state of a pin sounds overcomplex when the kernel could also
> > > > provide that functionality.
> > >
> > > One issue we face as developers is scaleability. Things that
> > > seem straight forward on a single board computer in a lab get
> > > really complex in a big system with man GPIO chips.
> > >
> > > One of the big dangers of the sysfs ABI is that it is dependent on
> > > probe order which the kernel sadly does not really guarantee.
> >
> > Does it? At least the drive I listed (e.g. the imx gpio driver) uses
> > aliases to make it reliable.
>
> I'm not sure that is the intended use of the aliases in device tree.
> (Rob can maybe answer this.)

The kernel community's position on stable device numbers for userspace
is quite clear.

That is how aliases get used by the kernel though. IMO, they should be
limited to a documented set of alias names, and GPIO is not one of
them. We replaced the whole GPIO sysfs API for this reason (among
others).

IIRC, i.MX is one of the worst abusers with aliases for everything,
most of which should be removed.

Rob
