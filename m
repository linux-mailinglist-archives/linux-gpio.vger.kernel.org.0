Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E04764E3DF
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Dec 2022 23:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiLOWof (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Dec 2022 17:44:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiLOWoe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Dec 2022 17:44:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 110CD58BF2;
        Thu, 15 Dec 2022 14:44:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 85B3A61F7E;
        Thu, 15 Dec 2022 22:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4482C433F1;
        Thu, 15 Dec 2022 22:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671144271;
        bh=IKQVicmZa+NzOsuQkbhrI43xXaW9dkSeiyKFaMHEXGU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=reu6ORIBDjmj+NaI2VPlphQ1C3rw7uE6UQ/3umykfULW4+zOdFR8bn1G6XU5aKn7c
         LyCEP9epwFzPVmAQYdfwzks20mJwP7dAmpzUnrAWp+rKThPR3JbP9695dnfmRy9UKA
         aO9Pa/ADt6HFFkO15QWdACXUKKfUttM8ocuvc8CTzHrvQP+igjNDFBMD5tUfyVZpkj
         IHGVy+mGkDJunHP5bACHs9e+2//Xor9wehDzJ5qxyygOTLrG7gfElURDyjpOtvw1le
         kjET3Uo9l+Dt0iNsGoETi2xGccaSY4jl4ZouSmS6paYnDBplbt+iyrHdEeRS5kecOb
         x3xlEQLTrjkmg==
Received: by mail-vs1-f51.google.com with SMTP id f189so674944vsc.11;
        Thu, 15 Dec 2022 14:44:31 -0800 (PST)
X-Gm-Message-State: ANoB5pmzp2z/QMVVUvEkqcf6jlPVd6tg3jh/GcG5ozDCpwTREx1BoF7R
        Tunn0QQFud6YDOHT8Yd6zWfe3Wg9KsJWf2eC3A==
X-Google-Smtp-Source: AA0mqf7Xah6bJe8jpBmSQL7qsXrIKt2VijdrpF+vYJKrUW0CAcsDtzGS/id29S+KLpaBByrGk09scmFt9JwIS9GyenI=
X-Received: by 2002:a67:c40e:0:b0:3b1:4b76:5b44 with SMTP id
 c14-20020a67c40e000000b003b14b765b44mr11475861vsk.53.1671144270853; Thu, 15
 Dec 2022 14:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20221214095342.937303-1-alexander.stein@ew.tq-group.com>
 <CACRpkdbPy0krGYDdR4-Ga7tE=Wd6d2_KQ50b94VUvV=Zv=iBvA@mail.gmail.com>
 <CAL_JsqJ0xY5e6mZB_smTCNm0HfsPTF64d0YgikmRx8FPzjxKCw@mail.gmail.com> <Y5uRBPsa4YCsAbj2@pendragon.ideasonboard.com>
In-Reply-To: <Y5uRBPsa4YCsAbj2@pendragon.ideasonboard.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 15 Dec 2022 16:44:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLjA5AKJuNCDwBVsAoBmxBdcqf_LBHBwF9ObckUEr=epw@mail.gmail.com>
Message-ID: <CAL_JsqLjA5AKJuNCDwBVsAoBmxBdcqf_LBHBwF9ObckUEr=epw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] gpio: Add gpio-delay support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 15, 2022 at 3:26 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Dec 15, 2022 at 12:21:33PM -0600, Rob Herring wrote:
> > On Thu, Dec 15, 2022 at 7:16 AM Linus Walleij wrote:
> > > On Wed, Dec 14, 2022 at 10:53 AM Alexander Stein wrote:
> > >
> > > > thanks for the feedback I've received. This is the reworked RFC for
> > > > adressing a platform specific ramp-up/ramp-down delay on GPIO outputs.
> > > > Now the delays are neither specified as gpio-controller nor
> > > > consumer-specific properties.
> > > >
> > > > v2 is a different approach than v1 in that it adds a new driver which will
> > > > simply forward setting the GPIO output of specified GPIOs in OF node.
> > > > The ramp-up/ramp-down delay can now be actually defined on consumer side,
> > > > see Patch 1 or 3 for examples.
> > >
> > > I really like this approach, it looks better than I imagined.
> >
> > It seems over-engineered to me. So far no comments on my 3 suggestions either...
>
> I like the idea of handling this on the consumer's side, possibly with
> standard foo-gpios-ramp-{up,down}-delay-us (name to be bikeshedded)
> properties as you mentioned in the review of v1.
>
> > One is to just use some GPIO flag bits. Say 4-bits of GPIO flags
> > encoded as power of 2 ramp delay. We have to pick the units. For
> > example, 100us*2^N, which gives you 200us-3.2s of delay.
>
> This could probably work too.
>
> > Anything less is short enough to just hard code in a driver.
>
> In which driver though ? The whole point is that we should avoid
> handling this in particular drivers.

Okay, make the range 100us-1.63s and the minimum delay is 100us. Or
50us-819ms? What's a small enough minimum that no one will care about
the extra delay?

One thing we don't want is DT authors putting a device's delay needs
in here. Then we'll get coupling to the OS implementation or double
delays. Something like this should be clear:

#define GPIO_THIS_IS_ONLY_THE_SIGNAL_RC_RAMP_TIME_100us

;)

Rob
