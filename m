Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10D2768177D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jan 2023 18:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237826AbjA3RVg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 12:21:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237802AbjA3RVe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 12:21:34 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB7D42BD5
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 09:21:32 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id s24so5882046vsi.12
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 09:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMtwa+ATKER70w262A9egq2E2RxiFwq6Yi89Lqdc3H0=;
        b=OEBxRy9NGBvAYTrtsCwJ45pAIECbQV7YKg4umj7au+vQzLSXcTK8y4fabDw19Jp22C
         31Ee6uPj4Pvro69XDa2mfq16S2pnkwOO7BiyUaOz+lbDi0HiVG2cgXNzbUcxEfGWdjq8
         YzA4YPV4ZCbIJ6bkoocEI1Jv2NAG1uwjNE4bAqlIULStEVcLE5rHSaWKoP3Mb2/PfblZ
         YyNB5iXorg1yQiWdV9tl/QvIjwQO42ea5thT42qP2KsPgLsxnjBHr10M+4IwXLc5A2Pb
         uAlUb3gDth2d4cMLSL0KWd+GWXO6cK5hYfpvbnkHWQrudZPJlxiXHnmvZyo+WRMEF7My
         rGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMtwa+ATKER70w262A9egq2E2RxiFwq6Yi89Lqdc3H0=;
        b=koRcu+ekMTDVPTjIyROFPlUxtNvaeL8Qf4XS9Gmm3If56xbsoGqc75e1nSmuVQ0qPa
         nWaF2GLtVKlNRrBJs7EV/0vtfTxwK/Lm5H3bqKz9Wxuh1t1RR2vdvQrVIucdTSUj+EG1
         9ZRdX2q23KeENOUTWubwkY1YNZkFlSoV7awYpOgDHAf6QRfhW/QrfkDeVCQAHi+YMj44
         PSqOqZDc7T2CRbyf60HrNKr2sAkMV3oXu5k/M/VjcuHkaMhnyuSPulOZQndu9rIVT7yF
         D7yVPXhrbfdEldct6vIEsg0ADrBFTTVPsGxms1jytwlfoEQdbi21qzvhdQdC/8RgqLHw
         I2Uw==
X-Gm-Message-State: AFqh2koAmCeanbcLNgIgR0kwPhXVl5kxa3r75GzTJTtdm3C0lHwTNcG1
        PFlQsCPKcXGWXMV8WtCdtmBrsdaDrDS6S94Tm8H5FQ==
X-Google-Smtp-Source: AMrXdXsorGbqXtXzRSJiKYScI4p0NAn6+tiDK6j70+Yd6yAFisPLtKd5Bde23J2onU1mLeomApvlcE70Nw7uypFNhMg=
X-Received: by 2002:a05:6102:3e08:b0:3c5:1ac1:bf38 with SMTP id
 j8-20020a0561023e0800b003c51ac1bf38mr7615665vsv.78.1675099291454; Mon, 30 Jan
 2023 09:21:31 -0800 (PST)
MIME-Version: 1.0
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
 <20230125093548.GB23347@pengutronix.de> <CACRpkdbcrTv+=7Ev750O=UO=V=afp5NnTT4znb0rzWLkom+_cg@mail.gmail.com>
 <20230126104927.GE23347@pengutronix.de> <20230129183339.GY24167@pengutronix.de>
 <CACRpkdYRynwJJZR5uCEn9rmE3c8p7R8SQdXC2FkzRUkBYRjErg@mail.gmail.com> <20230130164835.eteteji2vy7pbwtz@pengutronix.de>
In-Reply-To: <20230130164835.eteteji2vy7pbwtz@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 30 Jan 2023 18:21:20 +0100
Message-ID: <CAMRc=McNeLBt6VtixCESdgR4Yw1cTo_=6zO6H5K2McNYLOzOjg@mail.gmail.com>
Subject: Re: GPIO static allocation warning with v6.2-rcX
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Robert Schwebel <r.schwebel@pengutronix.de>,
        bartosz.golaszewski@linaro.org,
        Marco Felsch <m.felsch@pengutronix.de>,
        christophe.leroy@csgroup.eu, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org,
        Sascha Hauer <sha@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2023 at 5:48 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> On Mon, Jan 30, 2023 at 11:19:11AM +0100, Linus Walleij wrote:
> > On Sun, Jan 29, 2023 at 7:33 PM Robert Schwebel
> > <r.schwebel@pengutronix.de> wrote:
> >
> > > While this could also be done with a daemon offering a dbus api, this
> > > would be significantly more complex. In a critical environment, one
> > > needs to make sure that the daemon process never fails, otherwhise th=
e
> > > power of the DuT would maybe be in a random state. Then of course one
> > > can add a watchdog, but with the current sysfs interface it's really
> > > simple. Of course that would also work if the new interface would off=
er
> > > a "keep this line as it is" feature, but adding a dbus daemon just fo=
r
> > > keeping the state of a pin sounds overcomplex when the kernel could a=
lso
> > > provide that functionality.
> >
> > One issue we face as developers is scaleability. Things that
> > seem straight forward on a single board computer in a lab get
> > really complex in a big system with man GPIO chips.
>
> This is the point where the discussion took a wrong turn.
>
> Yes, there is awareness that the sysfs API has a downside (here: on some
> platforms the number allocation is not stable).
>
> But the problem here is that the alternative (i.e. using the newer
> devctrl API) also has a downside that makes it unsuitable (or overly
> complex) to use for some workflows.
>
> Just an idea: Wouldn't a nice solution be to make it possible to opt-out
> of the reset to the safe state after use?
>

This is a misconception though. There IS NO safe-state. This is
entirely driver-dependent. When you release a line, its state is no
longer defined by design because it SHOULD be driven by the user of
the line for AS LONG as they keep it.

Sysfs interface is in fact just an in-kernel user and in that regard
is no different from a user-space dbus daemon or interactive gpioset
except for existing in kernel-space. It's no more immune to code bugs
either so I find the argument about the daemon crashing invalid. Your
program setting sysfs entries may crash leaving the line inaccessible
to another valid user. Sysfs code may break - especially as it's no
longer maintained as actively as before. When you unexport a line in
sysfs - its state is no more defined than when releasing it using the
character device.

The so-called safe-state is something that apparently comes back every
3 years (according to Rob) for both user- and kernel-space users but
so far nobody has figured out a good way of implementing it. One of
these days...

Bart
