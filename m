Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B242F7ABC9D
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Sep 2023 02:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjIWATp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Sep 2023 20:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbjIWATm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2023 20:19:42 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F630136
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2023 17:19:36 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-59bebd5bdadso37232007b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2023 17:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695428375; x=1696033175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HRUyGvs1uStGXLaQ8+ngHPFdyOarHkGjvDN3ml5t7g=;
        b=YUiDO23HCwY9wT+RC+d3+NdtiUWUrqwoU1x0JQsVoBESWXBXhspzxDMnO6F8h6jji2
         W9VoyiR0NZkla3PqNjE1v5pNPmgotS/QiLuDa7+HhIMTCwuSPN6k+E3rPaSvhRGbBv0F
         u9NLohoC75LZdi4u6YBKTpozA40wcIQNcT1/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695428375; x=1696033175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HRUyGvs1uStGXLaQ8+ngHPFdyOarHkGjvDN3ml5t7g=;
        b=XLQxFkkFh0VJC/rFOvYpraybngT1q7uTVmLkvlB4rAKdvvhMMCr+9QmpUrEhyqwZhs
         Vix6FNu038oGUXefvCuM4bqaIu65u/CJO5iJYs1CIVrVhO6x801VeaiwgAnOoB2HleKK
         erSCZjfJdMTRPu1nUspH2C7lDLyQvgp78CFCGJXk2Py6yIoGiDY602DhKowIlFTQ6FAL
         gzkhQag0Non6TTcQHy0LK8DbAkP2EYuHnZndebD5Imd9rIyo0LQ4DtMKajNdMaZXPOfy
         DEwlJlNaldCcxCopq2iTpxyuVqnxParh0RoDxg65xs8OHNSbR8MDMdl4T7F2Zvw9OxBx
         mhPw==
X-Gm-Message-State: AOJu0YwtR7qJvS7HLueUmQ0N+qV95HWLjhNFf+eLZ3XtuJlTLVOwb3eN
        97wWckZZ1fT3pXKOYQGGrlFsUwpF99A1XGZltwVxy/4I
X-Google-Smtp-Source: AGHT+IHK44Y5S8POerPREycqHRjRI6xAXBMxnhRNugidfmUN2u+iFTofgvDnz0j6HjaI4RxH4WRMHw==
X-Received: by 2002:a81:a542:0:b0:59e:7fc1:dba0 with SMTP id v2-20020a81a542000000b0059e7fc1dba0mr1143766ywg.44.1695428374707;
        Fri, 22 Sep 2023 17:19:34 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id w12-20020a0cdf8c000000b00646e0411e8csm1875830qvl.30.2023.09.22.17.19.34
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 17:19:34 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-415155b2796so71951cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2023 17:19:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa6:b0:403:affb:3c03 with SMTP id
 s38-20020a05622a1aa600b00403affb3c03mr97108qtc.10.1695427883461; Fri, 22 Sep
 2023 17:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230921102420.RFC.1.I9dddd99ccdca175e3ceb1b9fa1827df0928c5101@changeid>
 <CAL_Jsq+noP32-m5xdUCLFPFBXLxX9Ys1BNFM+9sga6KYTmDzqQ@mail.gmail.com>
 <CAD=FV=WXxGhX0Fw2nSS7PxYb1O-LUewAhoUVPn=2EpbSD2OeHQ@mail.gmail.com> <CAL_JsqKJyRJmwJzB1yew71Ld7BeMMat+rzhX9XtDtiFE8Dbvcw@mail.gmail.com>
In-Reply-To: <CAL_JsqKJyRJmwJzB1yew71Ld7BeMMat+rzhX9XtDtiFE8Dbvcw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 22 Sep 2023 17:11:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UgFzT0TW2WEV0Wmk05EXUad2EYhN2DcckAxE_Lw5gV1Q@mail.gmail.com>
Message-ID: <CAD=FV=UgFzT0TW2WEV0Wmk05EXUad2EYhN2DcckAxE_Lw5gV1Q@mail.gmail.com>
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
        rafael@kernel.org, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Fri, Sep 22, 2023 at 12:08=E2=80=AFPM Rob Herring <robh+dt@kernel.org> w=
rote:
>
> > > This seems like overkill to me. Do we really need groups and a mutex
> > > for each group? Worst case is what? 2-3 groups of 2-3 devices?
> > > Instead, what about extending "status" with another value
> > > ("fail-needs-probe"? (fail-xxx is a documented value)). Currently, th=
e
> > > kernel would just ignore nodes with that status. Then we can process
> > > those nodes separately 1-by-1.
> >
> > My worry here is that this has the potential to impact boot speed in a
> > non-trivial way. While trackpads and touchscreens _are_ probable,
> > their probe routines are often quite slow. This is even mentioned in
> > Dmitry's initial patches adding async probe to the kernel. See commit
> > 765230b5f084 ("driver-core: add asynchronous probing support for
> > drivers") where he specifically brings up input devices as examples.
>
> Perhaps then this should be solved in userspace where it can learn
> which device is actually present and save that information for
> subsequent boots.

Yeah, the thought occurred to me as well. I think there are a few
problems, though:

a) Userspace can't itself probe these devices effectively. While
userspace could turn on GPIOs manually and query the i2c bus manually,
it can't (I believe) turn on regulators nor can it turn on clocks, if
they are needed. About the best userspace could do would be to blindly
try binding an existing kernel driver, and in that case why did we
need userspace involved anyway?

b) While deferring to userspace can work for solutions like ChromeOS
or Android where it's easy to ensure the userspace bits are there,
it's less appealing as a general solution. I think in Johan's case
he's taking a laptop that initially ran Windows and then is trying to
run a generic Linux distro on it. For anyone in a similar situation,
they'd either need to pick a Linux distro that has the magic userspace
bits that are needed or they need to know that, on their laptop, they
need to manually install some software. While requiring special
userspace might make sense if you've got a special peripheral, like an
LTE modem, it makes less sense to need special userspace just to get
the right devices bound...


> > It wouldn't be absurd to have a system that has multiple sources for
> > both the trackpad and the touchscreen. If we have to probe each of
> > these one at a time then it could be slow. It would be quicker to be
> > able to probe the trackpads (one at a time) at the same time we're
> > probing the touchscreens (one at a time). Using the "fail-needs-probe"
> > doesn't provide information needed to know which devices conflict with
> > each other.
>
> I would guess most of the time that's pretty evident. They are going
> to be on the same bus/link. If unrelated devices are on the same bus,
> then that's going to get serialized anyways (if bus accesses are what
> make things slow).
>
> We could add information on the class of device. touchscreen and
> touchpad aliases or something.

Ah, I see. So something like "fail-needs-probe-<class>". The
touchscreens could have "fail-needs-probe-touchscreen" and the
trackpads could have "fail-needs-probe-trackpad" ? That could work. In
theory that could fall back to the same solution of grabbing a mutex
based on the group ID...

Also: if having the mutex in the "struct device" is seen as a bad
idea, it would also be easy to remove. __driver_probe_device() could
just make a call like "of_device_probe_start()" at the beginning that
locks the mutex and then "of_device_probe_end()" that unlocks it. Both
of those calls could easily lookup the mutex in a list, which would
get rid of the need to store it in the "struct device".


> > That would lead me to suggest this:
> >
> >   &i2c_bus {
> >     trackpad-prober {
> >       compatible =3D "mt8173-elm-hana-trackpad-prober";
> >
> >       tp1: trackpad@10 {
> >         compatible =3D "hid-over-i2c";
> >         reg =3D <0x10>;
> >         ...
> >         post-power-on-delay-ms =3D <200>;
> >       };
> >       tp2: trackpad@20 {
> >         compatible =3D "hid-over-i2c";
> >         reg =3D <0x20>;
> >         ...
> >         post-power-on-delay-ms =3D <200>;
> >       };
> >     };
> >   };
> >
> > ...but I suspect that would be insta-NAKed because it's creating a
> > completely virtual device ("mt8173-elm-hana-trackpad-prober") in the
> > device tree. I don't know if there's something that's functionally
> > similar that would be OK?
>
> Why do you need the intermediate node other than a convenient way to
> instantiate a driver? You just need a flag in each node which needs
> this special handling. Again, "status" could work well here since it
> keeps the normal probe from happening. But I'm not saying you can't
> have some board specific code. Sometimes you just need code to deal
> with this stuff. Don't try to parameterize everything to DT
> properties.

I think I'd have an easier time understanding if I knew where you
envisioned the board-specific code living. Do you have an example of
board specific code running at boot time in the kernel on DT systems?


> Note that the above only works with "generic" compatibles with
> "generic" power sequencing properties (I won't repeat my dislike
> again).

I don't think so? I was imagining that we'd have some board specific
code that ran that knew all the possible combinations of devices,
could probe them, and then could instantiate the correct driver.

Imagine that instead of the hated "hid-over-i2c" compatible we were
using two other devices. Imagine that a given board could have a
"elan,ekth6915" and a "goodix,gt7375p". Both of these devices have
specific timing requirements on how to sequence their supplies and
reset GPIOs. For Elan we power on the supplies, wait at least 1 ms,
deassert reset, wait at least 300 ms, and then can talk i2c. For
Goodix we power on the supply, wait at least 10 ms, deassert reset,
wait at least 180 ms, and then can talk i2c. If we had a
board-specific probing driver then it would power on the supplies,
wait at least 10 ms (the max of the two), deassert reset, wait at
least 300 ms (the max of the two), and then see which device talked.
Then it would instantiate whichever of the two drivers. This could be
done for any two devices that EEs have determined have "compatible"
probing sequences.

Ideally in the above situation we'd be able to avoid turning the
device off and on again between the board-specific probe code and the
normal driver. That optimization might need special code per-driver
but it feels doable by passing some sort of hint to the child driver
when it's instantiated.


> If only the driver knows how to handle the device, then you
> still just have to have the driver probe. If you *only* wanted to
> solve the above case, I'd just make "hid-over-i2c" take a 2nd (and
> 3rd) I2C address in reg and have those as fallbacks.

Yeah, it did occur to me that having "hid-over-i2c" take more than one
register (and I guess more than one "hid-descr-addr") would work in my
earlier example and this might actually be a good solution for Johan.
I'm hoping for a better generic solution, though.


> You could always make the driver probe smarter where if your supply
> was already powered on, then don't delay. Then something else could
> ensure that the supply is enabled. I'm not sure if regulators have the
> same issue as clocks where the clock might be on from the bootloader,
> then a failed probe which gets then puts the clock turns it off.

I'm not sure it's that simple. Even if the supply didn't turn off by
itself in some cases, we wouldn't know how long the supply was on.

-Doug
