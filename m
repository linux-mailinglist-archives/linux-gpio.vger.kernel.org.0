Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C38A37AB667
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Sep 2023 18:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjIVQpW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Sep 2023 12:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbjIVQpV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2023 12:45:21 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91DE8A1
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2023 09:45:14 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50437f39c9dso1624159e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2023 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695401112; x=1696005912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81baCZiZBsWWLVdud7GS4ITUOINrrEDd6mAWv0/+4bI=;
        b=GvTBK4lSiXDRZZM7CGzjycxEQxMXalAwtoIaXdDOVikEWcknFhMipHJNOcuf+YC37m
         hz9a/UYgvLWe7AK36dx05GMmDQkMZrplP0BeLey2zd9iw/X8xe0Xmhhqnl8wpOZLLVKh
         QB/0SbJrXKM/GfnkZZpQga9RVJs70TY1oQhZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695401112; x=1696005912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81baCZiZBsWWLVdud7GS4ITUOINrrEDd6mAWv0/+4bI=;
        b=dSbMVncxN4nUPgj07TvWesJiAongMVj2VZ5GuWGaweQWGTNzGpvbosLMXNuh4E6NJs
         AUXOSSYP/AofNwjlAK98BJxq9AteF7fya4ah6XtugrJdt7Q49zGwlohj9vRmeVmeVu8M
         PfXkMSGj4d7mOnL8st/iBJXqw5Dr2Am4X+DG+0IwCieHbLkRltEEo4xXL5FqiNzkmftP
         LHmGJiqh5K1JejfD6JroSBK87eTgo0M7fffB0J3HFUIlSqF3+lRVxS3vqAQL/G3Q6mgB
         fmTJbL92rQqEE5JpC8HS1COK6YwFYVjGIDprMLEVFgzyTV6okvmr6jw+qSofCPrqnIQU
         SR+w==
X-Gm-Message-State: AOJu0YzAHSpqM6IKRKqigVBUc09d119knrDbF9XtrqvylDbasNbRCXdo
        3VfkXEHj9vVOn2k7zkh/9M+BziNUB2TujXNjlaN5r5Y/
X-Google-Smtp-Source: AGHT+IERKHJ5u640wAbUe9Rdeu0U6lToNtw/weqZf0jjvgg8uLUVeQN7SrJkfVfLzwd96c76OZcQaA==
X-Received: by 2002:a05:6512:694:b0:4fe:2d93:2b50 with SMTP id t20-20020a056512069400b004fe2d932b50mr86639lfe.31.1695401112368;
        Fri, 22 Sep 2023 09:45:12 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id l28-20020ac24a9c000000b00502e6c9a733sm772667lfp.231.2023.09.22.09.45.12
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 09:45:12 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50348c54439so32e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2023 09:45:12 -0700 (PDT)
X-Received: by 2002:a05:600c:6021:b0:405:38d1:e146 with SMTP id
 az33-20020a05600c602100b0040538d1e146mr723wmb.4.1695400679482; Fri, 22 Sep
 2023 09:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230918125851.310-1-johan+linaro@kernel.org> <CAD=FV=Wfwvp-SbGrdO5VJcjG42njkApJPB7wnY-YYa1_-O0JWQ@mail.gmail.com>
 <ZQlIveJVdvyV2Ygy@hovoldconsulting.com> <CAD=FV=XBG7auVVyHn5uvahSZZxp5qBfp4+A9NwFqahdN6XrbZA@mail.gmail.com>
 <ZQqemN8P2VKgxhsV@hovoldconsulting.com> <CAD=FV=XK87TZuPy+d2r2g5QhowmghE-m9pGHe9-X7jnXAw9z1g@mail.gmail.com>
 <ZQ1Zm6ec9NuBvqpl@hovoldconsulting.com>
In-Reply-To: <ZQ1Zm6ec9NuBvqpl@hovoldconsulting.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 22 Sep 2023 09:37:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=USBJRzqxX9kBP8pp4LKRGpBee+jkHL=KmeQvyfBk2CVQ@mail.gmail.com>
Message-ID: <CAD=FV=USBJRzqxX9kBP8pp4LKRGpBee+jkHL=KmeQvyfBk2CVQ@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: fix handling of unpopulated devices
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        LinusW <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Fri, Sep 22, 2023 at 2:08=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Wed, Sep 20, 2023 at 08:41:12AM -0700, Doug Anderson wrote:
> > On Wed, Sep 20, 2023 at 12:26=E2=80=AFAM Johan Hovold <johan@kernel.org=
> wrote:
> > > On Tue, Sep 19, 2023 at 11:15:46AM -0700, Doug Anderson wrote:
> > > > On Tue, Sep 19, 2023 at 12:07=E2=80=AFAM Johan Hovold <johan@kernel=
.org> wrote:
>
> > > As I alluded to in the commit message, you probably want to be able t=
o
> > > support second-source touchscreen panel followers as well at some poi=
nt
> > > and then deferring checking whether device is populated until the pan=
el
> > > is powered on is not going to work.
> >
> > Yeah, I've been pondering this too. I _think_ it would work OK-ish if
> > both devices probed and then only one of the two would actually make
> > the sub-HID devices. So you'd actually see both devices succeed at
> > probing but only one of them would actually be functional. It's a bit
> > ugly, though. :(  Maybe marginally better would be if we could figure
> > out how to have the device which fails to get its interrupt later
> > unbind itself, if that's possible...
> >
> > The only other thought I had would be to have the parent i2c bus
> > understand that it had children that were panel followers, which it
> > should be able to do by seeing the "panel" attribute in their device
> > tree. Then the i2c bus could itself register as a panel follower and
> > could wait to probe its children until they were powered on. This
> > could happen in the i2c core so we didn't have to add code like this
> > to all i2c bus drivers. ...and, if necessary, we could add this to
> > other busses like SPI. It feels a little awkward but could work.
>
> There may be other device on the bus that have nothing to do with
> panels, but I guess you mean that this would only apply to a subset of
> the children. In any case, this feels like a hack and layering
> violation.

Right, the idea would be to only do this for the subset of children
that are panel followers.

It definitely doesn't seem ideal, but it also didn't seem too terrible to m=
e.


> > > I skimmed the thread were you added this, but I'm not sure I saw any
> > > reason for why powering on the panel follower temporarily during prob=
e
> > > would not work?
> >
> > My first instinct says we can't do this, but let's think about it...
> >
> > In general the "panel follower" API is designed to give all the
> > decision making about when to power things on and off to the panel
> > driver, which is controlled by DRM.
> >
> > The reason for this is from experience I had when dealing with the
> > Samsung ATNA33XC20 panel that's on "sc7180-trogdor-homestar". The TCON
> > on that panel tended to die if you didn't sequence it just right.
> > Specifically, if you were sending pixels to the panel and then stopped
> > then you absolutely needed to power the panel off and on again. Folks
> > I talked to even claimed that the panel was working "to spec" since,
> > in the "Power Sequencing" section of the eDP spec it clearly shows
> > that you _must_ turn the panel off and on again after you stop giving
> > it bits. ...this is despite the fact that no other panel I've worked
> > with cares. ;-)
> >
> > On homestar, since we didn't have the "panel follower" API, we ended
> > up adding cost to the hardware and putting the panel and touchscreens
> > on different power rails. However, I wanted to make sure that if we
> > ran into a similar situation in the future (or maybe if we were trying
> > to make hardware work that we didn't have control over) that we could
> > solve it.
> >
> > The other reason for giving full control to the panel driver is just
> > how userspace usually works. Right now userspace tends to power off
> > panels if they're not used (like if a lid is closed on a laptop) but
> > doesn't necessarily power off the touchscreen. Thus if the touchscreen
> > has the ability to keep things powered on then we'd never get to a low
> > power state.
>
> Don't you need to keep the touchscreen powered to support wakeup events
> (e.g. when not closing the lid)?

No. The only reason you'd use panel follower is if the hardware was
designed such that the touchscreen needed to be power sequenced with
the panel. If the touchscreen can stay powered when the panel is off
then it is, by definition, not a panel follower.

For a laptop I don't think most people expect the touchscreen to stay
powered when the screen is off. I certainly wouldn't expect it. If the
screen was off and I wanted to interact with the device, I would hit a
key on the keyboard or touch the trackpad. When the people designing
sc7180-trogdor chose to have the display and touchscreen share a power
rail they made a conscious choice that they didn't need the
touchscreen active when the screen was off.

For the other hardware I'm aware of that needs panel-follower there is
a single external chip on the board that handles driving the panel and
the touchscreen. The power sequencing requirements for this chip
simply don't allow the touchscreen to be powered on while the display
is off.

One use case where I could intuitively think I might touch a
touchscreen of a screen that was "off" would be a kiosk of some sort.
It would make sense there to have two power rails. ...or, I suppose,
userspace could just choose to turn the backlight off but keep the
screen (and touchscreen) powered.


> And if you close the lid with wakeup disabled, you should still be able
> to power down the touchscreen as part of suspend, right?
>
> > The above all explains why panel followers like the touchscreen
> > shouldn't be able to keep power on. However, you are specifically
> > suggesting that we just turn the power on temporarily during probe. As
> > I think about that, it might be possible? I guess you'd have to
> > temporarily block DRM from changing the state of the panel while the
> > touchscreen is probing. Then if the panel was off then you'd turn it
> > on briefly, do your probe, and then turn it off again. If the panel
> > was on then by blocking DRM you'd ensure that it stayed on. I'm not
> > sure how palatable that would be or if there are any other tricky
> > parts I'm not thinking about.
>
> As this would allow actually probing the touchscreen during probe(), as
> the driver model expects, this seems like a better approach then
> deferring probe and registration if it's at all doable.

Yeah, I don't 100% know if it's doable but it seems possible.
Certainly it's something for future investigation.

Luckily, at the moment anything I'm aware of that truly needs panel
follower also doesn't have multiple sources for a touchscreen.


> > > > Thinking that way, is there any reason you can't just move the
> > > > i2c_hid_init_irq() into __do_i2c_hid_core_initial_power_up()? You
> > > > could replace the call to enable_irq() with it and then remove the
> > > > `IRQF_NO_AUTOEN` flag? I think that would also solve the issue if y=
ou
> > > > wanted to use a 2nd source + the panel follower concept? Both devic=
es
> > > > would probe, but only one of them would actually grab the interrupt
> > > > and only one of them would actually create real HID devices. We mig=
ht
> > > > need to do some work to keep from trying again at every poweron of =
the
> > > > panel, but it would probably be workable? I think this would also b=
e a
> > > > smaller change...
> > >
> > > That was my first idea as well, but conceptually it is more correct t=
o
> > > request resources at probe time and not at some later point when you =
can
> > > no longer fail probe.
> > >
> > > You'd also need to handle the fact that the interrupt may never have
> > > been requested when remove() is called, which adds unnecessary
> > > complexity.
> >
> > I don't think it's a lot of complexity, is it? Just an extra "if" state=
ment...
>
> Well you'd need keep track of whether the interrupt has been requested
> or not (and manage serialisation) yourself for a start.

Sure. So I guess an "if" test plus a boolean state variable. I still
don't think it's a lot of complexity.


> But the main reason is still that requesting resources belongs in
> probe() and should not be deferred to some later random time where you
> cannot inform driver core of failures (e.g. for probe deferral if the
> interrupt controller is not yet available).

OK, I guess the -EPROBE_DEFER is technically possible though probably
not likely in practice. ...so that's a good reason to make sure we
request the IRQ in probe even in the "panel follower" case. I still
beleive Benjamin would prefer that this was abstracted out and not in
the actual probe() routine, but I guess we can wait to hear from him.

One last idea I had while digging would be to wonder if we could
somehow solve this case with "IRQF_PROBE_SHARED". I guess that doesn't
work well together with "IRQF_NO_AUTOEN", but conceivably we could
have the interrupt handler return "IRQ_NONE" if the initial power up
never happened? I haven't spent much time poking with shared
interrupts though, so I don't know if there are other side effects...


-Doug
