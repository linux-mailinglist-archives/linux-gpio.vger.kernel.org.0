Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34689572F57
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jul 2022 09:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234595AbiGMHiE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jul 2022 03:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbiGMHiE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jul 2022 03:38:04 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45473E3C08
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 00:38:03 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id bp15so8084850ejb.6
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 00:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZlY3VXM/QHzKvU9o+3MNd2IiJhLzdLo1xoINNsP4UTs=;
        b=LB7Y3psQVVEiOl2wnU1xWwm+mTj7HaqJSzK5Y8tJZ8U4jz7z7+3R+o8GMnsOAAjhtw
         nXD4wzj55zC5Yz8Wrb14/cm4hmZ6hSmT272bBMkMefJVMd3DW6Xb/xDrQD5OgLCG1/t0
         svYqgyHqfWQmExcgFCssubphWfZwVJJftNeE2dxPXazfmf84jWmyWL2/Huaw0/ds2WKD
         HWVwSsprP31zdxbgFjLYAzmPQv5nMSeV/gkWrhYxDVSdrBnA199csc5EI0m4M9YLdBEq
         0EMuPrVaytCtcWv3rKgXwbLqU0woI5P4hNUXsS/f/sUldYtD8vZi2qgVCUBztw+2Wu5w
         Nk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZlY3VXM/QHzKvU9o+3MNd2IiJhLzdLo1xoINNsP4UTs=;
        b=E9TAj/ivbndkBlaz8CvULUpxTc6ORvCKLyjzPQmQeos+KQ+edHSOi57Q+2eswjiNO3
         ERtOmD2ZXoGZi13U1sCA5ZxdLrV3xC0PNhw1Isevj0f5MgrkCKMGgTemrGGyvX4Vjm7n
         jIQdqZn1cXs2TAPc8Of/cPq47nax9aukxBNWfY+rDsbsJMgGcpvwtDg/5skpQPOeiZxI
         rSQaRey+HDCQ8B5QfAXkpLQcm3QcVfTs841Eme9V0DZc+k9lNngzAxLPkOQQ1D2t8uuR
         vv0mDFYe12rF+rYWsBNxTwE+tjeK9NEGmsfOAj/ARfe2obPcBIQZSJlMMzKSwv+mtVFF
         LCIA==
X-Gm-Message-State: AJIora+lRmRHDDAWwlVx4bOfLPpO+DIYT6DvyOP/l4hQa1M6PJTZ1A6Y
        iT9SX+tIqCS5NwMaduYX1k4JJ29Wu0OtPqKpSJyzfaEv5eY=
X-Google-Smtp-Source: AGRyM1talQC7qA2uYMm1I+tSsqNtJ8wetRjtoOUdNOeXBd1ccqb56IY9Ru1CB4OPrwcdOJUN+qucVhR6iEQKAm/oL+A=
X-Received: by 2002:a17:907:2c4a:b0:72b:5b9b:9c50 with SMTP id
 hf10-20020a1709072c4a00b0072b5b9b9c50mr2145734ejc.636.1657697881725; Wed, 13
 Jul 2022 00:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657216200.git.william.gray@linaro.org> <6be749842a4ad629c8697101f170dc7e425ae082.1657216200.git.william.gray@linaro.org>
 <CACRpkdZn-PV6H+uBcoONt=SThGBAODy-YG=rkx5OX-rcpeE+aw@mail.gmail.com> <YszlP1+sBhxvz3Fo@fedora>
In-Reply-To: <YszlP1+sBhxvz3Fo@fedora>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 13 Jul 2022 09:37:51 +0200
Message-ID: <CAMRc=Mc0=nL_t9Fwmb1uNbsa_v4L4M5BJm2y-vZ8PV47Ryk+Sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] gpio: i8255: Introduce the i8255 module
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Fred Eckert <Frede@cmslaser.com>,
        John Hentges <jhentges@accesio.com>,
        Jay Dolan <jay.dolan@accesio.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 12, 2022 at 5:06 AM William Breathitt Gray
<william.gray@linaro.org> wrote:
>
> On Mon, Jul 11, 2022 at 03:02:10PM +0200, Linus Walleij wrote:
> > On Fri, Jul 8, 2022 at 1:16 AM William Breathitt Gray
> > <william.gray@linaro.org> wrote:
> >
> > > Exposes consumer functions providing support for Intel 8255 Programmable
> > > Peripheral Interface devices. A CONFIG_GPIO_I8255 Kconfig option is
> > > introduced; modules wanting access to these functions should select this
> > > Kconfig option.
> > >
> > > Tested-by: Fred Eckert <Frede@cmslaser.com>
> > > Cc: John Hentges <jhentges@accesio.com>
> > > Cc: Jay Dolan <jay.dolan@accesio.com>
> > > Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
> >
> > This chip is like 50 years old, but so am I and I am not obsolete, it's about
> > time that we implement a proper driver for it!
> >
> > But I suppose you are not really using the actual discrete i8255 component?
> > This is certainly used as integrated into some bridge or so? (Should be
> > mentioned in the commit.)
>
> Interestingly, there are some PC/104 devices out there that use actual
> i8255 components (e.g. Diamond Systems Onyx-MM with its 82C55 chips),
> but honestly the majority of devices I come across are simply emulating
> the i8255 interface in an FPGA or similar.
>
> I'll adjust the commit to make it clearer that this is a library for
> i8255-compatible interfaces rather than support for any physical Intel
> 8255 chip in particular.
>
> > > +config GPIO_I8255
> > > +       tristate
> >
> > That's a bit terse :D Explain that this is a Intel 8255 PPI chip first developed
> > in the first half of the 1970ies.
>
> Ack.
>
> > > +++ b/include/linux/gpio/i8255.h
> >
> > You need to provide a rationale for the separate .h file in the commit
> > message even if it is clear
> > how it is used in the following patches.
> >
> > Yours,
> > Linus Walleij
>
> I think I'll move this to gpio/driver.h as per Andy Shevchenko's

I don't think this is what Andy meant. I think he suggested moving
this header into drivers/gpio/ because it doesn't make sense for it to
be publicly accessible for anyone else than the GPIO drivers.

Andy: correct me if I'm wrong.

Bart

> suggestion. For now only a few drivers under drivers/gpio/ use this
> library, so it probably doesn't need to be separate just yet.
>
