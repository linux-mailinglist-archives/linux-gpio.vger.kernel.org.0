Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D27A0681F9B
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Jan 2023 00:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjA3X0o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Jan 2023 18:26:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjA3X0n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Jan 2023 18:26:43 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28D0B771
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 15:26:42 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-510476ee20aso74325347b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jan 2023 15:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1IBAqSy8wtf5Jix/Rds0S8evB7QfrwGL4k3bDD7gbM=;
        b=dXjYLvVg6PGOLbHp693IhO+eqv3U4alFec/05Z7E1JpRDbZDBIerLgSczyXuuYMv7t
         ZXUX5CBtu3lKhl6w9Pb1MIjcUKpYSoM7Ys0vHJfushhSfMalAhO7HmEZllxUqW1PAIVW
         U8S3vCCCKptrn/ImRvzH94NntoR1JhLFbOeVZPd/fKVlNowd20NFCDaskzAKdUTW7Ai4
         wHnw9NO26sjmS3LMR7CjVPEmSOgmxqSkMYA5zVmezn+EBufKj7N0mjxoyaPV3hbSuIdV
         /y55n7RjeRWNPUk6gx3YFKh/ZM/MENjXdXdgTBiQgDwJkBPURpWOhU0ucYBJ4hzWt/9O
         hQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1IBAqSy8wtf5Jix/Rds0S8evB7QfrwGL4k3bDD7gbM=;
        b=Y9dHGnkjcet9khbgw6QKjiJTiOn2NnQY1+0r1pg4S+HAJ9tJB3D14b3JozZBuLLD/7
         XRnlhroouj/AKibK9Sc04qByueqXRQByZQcMrqH7JMJl0aCV20trWzW9etNxtciCm5xH
         rumukMHCmzPa96TTvnP6ito/KaxMzEg7bjV7XkP2Kzf5650ok6c1pyqcgAmrYuyrLeQj
         xf6ncTPCAv03eQWb3XQehlBiMMpswTAMQuRcL/xuw9ACf6Iz4VSIJNKmfJLPg7hs8axD
         mW/9A+UBlpi069oj+htU+zAar/y21udBnErrYFX13vHy5U+gLLoAdWC+uNRPDufzJMtQ
         Qg4Q==
X-Gm-Message-State: AFqh2kojSPZRVuY2UCki2SwLv3R5NvAM/yEvX+qce9OSQ9zVFX1dyA26
        DxJWR3L9EJe1y6aRrlXzcVN2P88ks66taT02hcSDaQ==
X-Google-Smtp-Source: AMrXdXsS/bRpwSrf+SszpPb+XkwFnsjVv2uhKWEyoJX8kptGDGcBUHARSvA1F5YQELFnOhlaOaNYLg6U/X2uvGQg9P0=
X-Received: by 2002:a81:6842:0:b0:4ff:e4bc:b56f with SMTP id
 d63-20020a816842000000b004ffe4bcb56fmr5162592ywc.488.1675121201953; Mon, 30
 Jan 2023 15:26:41 -0800 (PST)
MIME-Version: 1.0
References: <20230120104647.nwki4silrtd7bt3w@pengutronix.de>
 <CAMRc=Mdo0tvJUJ2G+9BGfyVYBwUQKRZU36JEUZdxVVnXETZHLg@mail.gmail.com>
 <20230125093548.GB23347@pengutronix.de> <CACRpkdbcrTv+=7Ev750O=UO=V=afp5NnTT4znb0rzWLkom+_cg@mail.gmail.com>
 <20230126104927.GE23347@pengutronix.de> <20230129183339.GY24167@pengutronix.de>
 <CACRpkdYRynwJJZR5uCEn9rmE3c8p7R8SQdXC2FkzRUkBYRjErg@mail.gmail.com> <20230130164835.eteteji2vy7pbwtz@pengutronix.de>
In-Reply-To: <20230130164835.eteteji2vy7pbwtz@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 31 Jan 2023 00:26:30 +0100
Message-ID: <CACRpkdZsKAHx9KVTAF0-VBSd5QOSzP+Li_dyWETPY+_FpC_Cmw@mail.gmail.com>
Subject: Re: GPIO static allocation warning with v6.2-rcX
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Robert Schwebel <r.schwebel@pengutronix.de>,
        bartosz.golaszewski@linaro.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        christophe.leroy@csgroup.eu, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org,
        Sascha Hauer <sha@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 30, 2023 at 5:48 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
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

That should make it possible to use my suggested debugfs facility
that provide the same, but does not use the global numberspace.

People who don't care about the complexity involved with the character
device certainly will not care about the downsides of using debugfs in
production either. (Such as interfering with any chardev users...)

> Just an idea: Wouldn't a nice solution be to make it possible to opt-out
> of the reset to the safe state after use?

As Bartosz says there is no reset to any safe state, whatever that
would be. The state is kept in hardware just like with sysfs.

You can even set up the state from sysfs and then read it back
from the character device or vice versa, after freeing each
hogs resources.

It's really just the .get_direction() and .get() callbacks on the
gpio_chip that read the state, .set_direction_input|output()
and .set() sets it, like they always did.

Consider the example too tools/gpio/gpio-hammer.c
that I wrote. It reads the initial line values of the GPIO lines
(from hardware) and then start to invert them. It doesn't start
from any specific state?

Yours,
Linus Walleij
