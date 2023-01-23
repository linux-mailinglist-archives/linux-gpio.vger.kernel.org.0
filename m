Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0AF4677E7D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jan 2023 15:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbjAWO4q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 09:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjAWO4q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 09:56:46 -0500
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C7A19745
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 06:56:45 -0800 (PST)
Received: by mail-vk1-xa36.google.com with SMTP id i82so6067257vki.8
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 06:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/60pbTItUchquXjC1yYOCHoiY+b2FV2v95gbfuh/gOw=;
        b=K+/Py+reC94z02QyTLgvdpCMyGANBnN9X8oUAxGkB81hvB32ZzT+sIJzfUs1WxE2Mw
         Pz4eeD0UNGOkAWGXNyAw1C3rm84voeUkiQwtpVrsmFfj9Ujr7gUM5ttnpHWWFF7KlwkS
         FM7rxx8hrcCPuCOz8VlYHM4oPEZS3HOurXnmSzskxuIptVkb/LZXM3slnsCaQv7KdhzZ
         MMMEJEK2J6mC5HKf0B+dXQr71uIYu8O0ti7WFod7xgQf2jsDTleoVl7/m7xJTmy9lv7j
         fVSJ7/eQ4HQHJYduaUOR1rB5+3D7c3GuzXE/PivXDbypfxqZwdDJYRyMExzveEpJMs6E
         EnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/60pbTItUchquXjC1yYOCHoiY+b2FV2v95gbfuh/gOw=;
        b=C2Kqasdt6fXKYpNhgDn1kMrJar8/s2zOar/msgjZSgnjRTkJeH0PK7pOEp8X3UD+N5
         BT+PVR5qRtqiogNB+P+K+rr767d1OC0HKTo9JyiKbxs2wXT85k4L5sYay4SepvvEtT8T
         RyfotbdvqGaWmeajaKHkDsUtqdiNYHzcD8Z4FJ3d5Tylefo1rxQZYoAtLBKYKDfdWJfK
         Dpb56BYDqRi+rixnKGx8x298nDO2AbvDYzS1+oFLf9uvpMPVhHuwVunaUMTWQ90LcFuE
         4cePeah6yVmy2ZYzrvo/L1ZnJK61xouwECFIA2523C7voqKOMl4dhcA8/zC0aw9tzTYr
         zFyQ==
X-Gm-Message-State: AFqh2konz6x/Ed31PB1eBrh/xUVDMl21EKk9GbcI6Iu6GB3wwWJ18QpT
        pfdCSqqai+ccFfHF/Y1vWaYRc6FEg6GjXl949Jm8KMmfd38LIg==
X-Google-Smtp-Source: AMrXdXulpb51YAxij369HCV+xFZhnbveYQDicdYeXomTGlxbxwByyc30yyVA5jhRFLAhmA1acaE1vsb3zfq3+d4bB6w=
X-Received: by 2002:a1f:91d4:0:b0:3db:104:6d13 with SMTP id
 t203-20020a1f91d4000000b003db01046d13mr3229258vkd.25.1674485804304; Mon, 23
 Jan 2023 06:56:44 -0800 (PST)
MIME-Version: 1.0
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de> <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
In-Reply-To: <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 23 Jan 2023 15:56:33 +0100
Message-ID: <CAMRc=MeuHrC94WcOPEQu5BVptWwY4HNkO3dMWDrCAVHMH49UmA@mail.gmail.com>
Subject: Re: GPIO static allocation warning with v6.2-rcX
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     linus.walleij@linaro.org, shawnguo@kernel.org,
        bartosz.golaszewski@linaro.org, christophe.leroy@csgroup.eu,
        kernel@pengutronix.de, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 23, 2023 at 3:55 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, Jan 20, 2023 at 11:46 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > Hi all,
> >
> > I stumbled over the following warning while testing the new v6.2-rc4 on
> > a imx8mm-evk:
> >
> > [    1.507131] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > [    1.517786] gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > [    1.528273] gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > [    1.538739] gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
> > [    1.549195] gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.
> >
> > The warning was introduced by commit [1] but at least the following
> > drivers are parsing the alias for a gpiochip to use it as base:
> >  - drivers/gpio/gpio-mxs.c
> >  - drivers/gpio/gpio-mxc.c
> >  - drivers/gpio/gpio-clps711x.c
> >  - drivers/gpio/gpio-mvebu.c
> >  - drivers/gpio/gpio-rockchip.c
> >  - drivers/gpio/gpio-vf610.c
> >  - drivers/gpio/gpio-zynq.c
> >
> > According commit [2] it seems valid and correct to me to use the alias
> > and the user-space may rely on this.
> >
> > Now my question is how we can get rid of the warning without breaking
> > the user-space?
> >
> > [1] 502df79b86056 gpiolib: Warn on drivers still using static gpiobase allocation
> > [2] 7e6086d9e54a1 gpio/mxc: specify gpio base for device tree probe
> >
>
> The warning is there to remind you that static GPIO base numbers have
> been long deprecated and only user-space programs using sysfs will
> break if you remove it, everyone else - including user-space programs
> using libgpiod or scripts using gpio-tools that are part of the
> project - will be fine.
>
> Any chance you can port your user-space programs to libgpiod?
>
> The warning doesn't break compatibility so I'm not eager to remove it.
>

Oh and the drivers could use some updating. I'll take a look at them
one-by-one to see if there's anything other than sysfs that could
potentially break if we switch them to using dynamic allocation.

Bart
