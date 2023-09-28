Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424177B28C1
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 01:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjI1XVd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 19:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjI1XVc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 19:21:32 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4646919D
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 16:21:30 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-504809e4494so5690331e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 16:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695943286; x=1696548086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkQcVwe9M7L9IpIFMavUWzzmZAq1l5yINAWR+c99PmM=;
        b=CV/OdIMHUzh6fsV7FNy3wOJAccnRp2f0RJAc8w//VzjAvp1WUGtqCmQI1wIo2Ho1XX
         qzfWs1bK+0qq3AgI8gqgctxI++j2r2AaWFtP2YKZpu1zWZQEd7LbOk2XqAAUiw0AwJKo
         QukAuASnmmtVOCIdQRsB3vv9IEvOtdAQYa1JM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695943286; x=1696548086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkQcVwe9M7L9IpIFMavUWzzmZAq1l5yINAWR+c99PmM=;
        b=ZaiaqhHSykwNYA14oY6jEsEojMUtEyOO0C22lEvJRzyea2Ych24OCvSmPoD8nWSyAQ
         j2NuaX3ZdUmOzKGKkrkECl97mahIVTide+8leRXdRHyIxpQ3svLLgc4fOQCHjD81Roe/
         UgVh7l85Xrgj7OCvXmew9fSG0TduBUH5atH6cBhSb6S/Su+IAJ4M6qzw3ibo0pSYrBBE
         H1dQrxzgP9lshdVIGVICxq1/u7CZWf/OWGmNOf+MhV//uj9Itjm6GctvDhc7wQsiKj6F
         ogroZVfbWjnjNHaK9ctgTYqqe4h56zx3q1IUsx50SkIdy2nZtANZz6wcSDg3eoTqLnqh
         CMtw==
X-Gm-Message-State: AOJu0YyyZhkpeQTCdsKjjZZYpQmacuQfE+kU2Xfduuwjj0BvW8yMYStq
        ynfa79rBhYtieM2i4MWaMWD2UuS5N6STOWgti827hjwr
X-Google-Smtp-Source: AGHT+IH5+gpPabN2W0llrgW4ylOpp8h1bEGl4umdhH2McHjRzkY/kE9/YWhdZ5yRk9rBd2UcP00sYQ==
X-Received: by 2002:a05:6512:1387:b0:4fb:9fa7:dcda with SMTP id fc7-20020a056512138700b004fb9fa7dcdamr2625122lfb.26.1695943285488;
        Thu, 28 Sep 2023 16:21:25 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id l3-20020ac24303000000b005032907710asm3207514lfh.237.2023.09.28.16.21.24
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 16:21:24 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50348c54439so1252e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 16:21:24 -0700 (PDT)
X-Received: by 2002:ac2:55ac:0:b0:502:d804:38fd with SMTP id
 y12-20020ac255ac000000b00502d80438fdmr280774lfg.0.1695943284350; Thu, 28 Sep
 2023 16:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230921102420.RFC.1.I9dddd99ccdca175e3ceb1b9fa1827df0928c5101@changeid>
 <CAL_Jsq+noP32-m5xdUCLFPFBXLxX9Ys1BNFM+9sga6KYTmDzqQ@mail.gmail.com>
 <CAD=FV=WXxGhX0Fw2nSS7PxYb1O-LUewAhoUVPn=2EpbSD2OeHQ@mail.gmail.com>
 <CAL_JsqKJyRJmwJzB1yew71Ld7BeMMat+rzhX9XtDtiFE8Dbvcw@mail.gmail.com>
 <CAD=FV=UgFzT0TW2WEV0Wmk05EXUad2EYhN2DcckAxE_Lw5gV1Q@mail.gmail.com> <CAL_JsqKK0tjeXNv=a8L3k0AjhCa15XOq1tPWqVod9mycsKXJHg@mail.gmail.com>
In-Reply-To: <CAL_JsqKK0tjeXNv=a8L3k0AjhCa15XOq1tPWqVod9mycsKXJHg@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 28 Sep 2023 16:21:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WCg==d=1uuuVrJZb_cqYK76Vw1QVBu5jV+mja15tFoxg@mail.gmail.com>
Message-ID: <CAD=FV=WCg==d=1uuuVrJZb_cqYK76Vw1QVBu5jV+mja15tFoxg@mail.gmail.com>
Subject: Re: [RFC PATCH] of: device: Support 2nd sources of probeable but
 undiscoverable devices
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Chen-Yu Tsai <wenst@chromium.org>, linux-input@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        andriy.shevchenko@linux.intel.com, broonie@kernel.org,
        frowand.list@gmail.com, gregkh@linuxfoundation.org,
        hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech,
        keescook@chromium.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, tglx@linutronix.de,
        Jeff LaBundy <jeff@labundy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Thu, Sep 28, 2023 at 1:12=E2=80=AFPM Rob Herring <robh+dt@kernel.org> wr=
ote:
>
> > > Perhaps then this should be solved in userspace where it can learn
> > > which device is actually present and save that information for
> > > subsequent boots.
> >
> > Yeah, the thought occurred to me as well. I think there are a few
> > problems, though:
> >
> > a) Userspace can't itself probe these devices effectively. While
> > userspace could turn on GPIOs manually and query the i2c bus manually,
> > it can't (I believe) turn on regulators nor can it turn on clocks, if
> > they are needed. About the best userspace could do would be to blindly
> > try binding an existing kernel driver, and in that case why did we
> > need userspace involved anyway?
> >
> > b) While deferring to userspace can work for solutions like ChromeOS
> > or Android where it's easy to ensure the userspace bits are there,
> > it's less appealing as a general solution. I think in Johan's case
> > he's taking a laptop that initially ran Windows and then is trying to
> > run a generic Linux distro on it. For anyone in a similar situation,
> > they'd either need to pick a Linux distro that has the magic userspace
> > bits that are needed or they need to know that, on their laptop, they
> > need to manually install some software. While requiring special
> > userspace might make sense if you've got a special peripheral, like an
> > LTE modem, it makes less sense to need special userspace just to get
> > the right devices bound...
>
> I did not mean do it all in userspace, but for userspace to save off
> what devices are actually present. For example, if userspace has
> access to the dtb, it could just update the dtb to enable the right
> nodes. Then after the first boot, boot time is faster. Or a driver
> could try to load an overlay with the config enabling the right
> devices. Though maybe waiting til userspace is available wouldn't
> speed things up.

At least for the ChromeOS boot flow userspace isn't able to make any
changes to the dtb so I don't think this would help us unless I'm
misunderstanding.


> > Imagine that instead of the hated "hid-over-i2c" compatible we were
> > using two other devices. Imagine that a given board could have a
> > "elan,ekth6915" and a "goodix,gt7375p". Both of these devices have
> > specific timing requirements on how to sequence their supplies and
> > reset GPIOs. For Elan we power on the supplies, wait at least 1 ms,
> > deassert reset, wait at least 300 ms, and then can talk i2c. For
> > Goodix we power on the supply, wait at least 10 ms, deassert reset,
> > wait at least 180 ms, and then can talk i2c. If we had a
> > board-specific probing driver then it would power on the supplies,
> > wait at least 10 ms (the max of the two), deassert reset, wait at
> > least 300 ms (the max of the two), and then see which device talked.
> > Then it would instantiate whichever of the two drivers. This could be
> > done for any two devices that EEs have determined have "compatible"
> > probing sequences.
>
> My point was that in the above example, all these delay times would
> have to be defined in the kernel, not DT.

In the case of using the actual "hid-over-i2c" driver and not one of
the specialized ones, I think we'd still need to put the delay times
in the DT for the individual "hid-over-i2c" nodes, right? The
board-specific driver could still have an implicit delay depending on
the board compatible, but if you set the "hid-over-i2c" node to "okay"
then that driver is going to be expecting to read the delay from DT.
It will use the delay it reads from the DT for powering on after
suspend/resume...


> > Ideally in the above situation we'd be able to avoid turning the
> > device off and on again between the board-specific probe code and the
> > normal driver. That optimization might need special code per-driver
> > but it feels doable by passing some sort of hint to the child driver
> > when it's instantiated.
>
> I think fixing regulators getting turned off on failed probes and
> having a "regulator on time" would go a long way towards providing
> that hint even if the on time was just since clocksource started.

You're suggesting that when a touchscreen fails to probe because it
didn't find the touchscreen on the i2c bus that it should leave its
regulator on? That doesn't seem right to me. While we might find a way
for it to help in the 2nd sourcing case, it doesn't seem right in the
case of a device truly being missing...

I'm also not sure that it truly solves the problem since the power
sequencing of these devices is more than just a regulator but often
involves several regulators being turned on (perhaps with delays in
between) and some enable and/or reset GPIOs. In the case of many
touchscreens the delay needed is actually the delay from after the
reset GPIO is deasserted.

In any case, we can talk more about this in my other response.

-Doug
