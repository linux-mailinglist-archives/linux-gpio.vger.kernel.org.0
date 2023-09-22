Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB8077AB802
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Sep 2023 19:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjIVRqw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Sep 2023 13:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjIVRqv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Sep 2023 13:46:51 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F4CB8F
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2023 10:46:45 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9ae7383b7ecso343086366b.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2023 10:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695404803; x=1696009603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0nzhfFMBIaN0jk+ueWNm7W+C6jSfBGTglmiswQsQ04=;
        b=FxcLZmcpv9z4ZUUOpFmZ7r4/8BJv7dvhEweMRBlgWb+R64sd8fTLDcNYjJKSDFhTxb
         4PoW1f+2O0KGi8OKVxontYv8GPwnWq3FF/mJi3dYqUqKnATjMBzgiOxHQa3Ap25YHA2k
         Uk/4/AaV6cEKmPT5bg4qt5PtHXQKw4Bv6Wu2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695404803; x=1696009603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P0nzhfFMBIaN0jk+ueWNm7W+C6jSfBGTglmiswQsQ04=;
        b=nWeJE2PyYi0FxrWedFja5blPkmCshZxkJ+rdcTGZzdOW3eMv5DBuu3qJsy4eQCxLWm
         seYoposnWcf1MzS0YPvoOK08B4spneYbXfsad1LiBrau6EovZxPWZZxzOIFAJRLdNhuY
         qmJ7N02iNf/XY6MbofuLa6h1VnnBenJpJ+3xAme8lOa0gLSOBNmen5LFTHSh6ZlzCsii
         8LtjPu/6cRLPA/16K2L7LePMgjawGy1L+F7zq9cbp1J8I+MBbTlZLPxKSZ61uU6I01WE
         vylvx/zLJ55Gc1c9oWEVQPqrFzkTJdhpFxps4YXNgIb4Iawupon0QYxyz9LtKrYzH3YD
         5+Cg==
X-Gm-Message-State: AOJu0YzKRALLMSUvvfKIgd2ULbHDU2HGsdXXH5fu8eQ6RNZQcvI4cnLi
        oH6BrhL93+QKTb63Uzw+Rp8kO1DJux5rTjx0hcID431m
X-Google-Smtp-Source: AGHT+IEI5I8OpQDxvvQySod9201oNFbO4ik0t0Hb3SESbGa9KLYoXRAheFxpzWmvwd4inI6tJfhMtQ==
X-Received: by 2002:a17:906:301a:b0:9ad:b046:bc50 with SMTP id 26-20020a170906301a00b009adb046bc50mr571050ejz.10.1695404803212;
        Fri, 22 Sep 2023 10:46:43 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id l9-20020a170906230900b00993004239a4sm2991818eja.215.2023.09.22.10.46.43
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 10:46:43 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-405459d9a96so8665e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Sep 2023 10:46:43 -0700 (PDT)
X-Received: by 2002:a50:f61d:0:b0:52e:f99a:b5f8 with SMTP id
 c29-20020a50f61d000000b0052ef99ab5f8mr6207edn.7.1695404424779; Fri, 22 Sep
 2023 10:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230921102420.RFC.1.I9dddd99ccdca175e3ceb1b9fa1827df0928c5101@changeid>
 <CAL_Jsq+noP32-m5xdUCLFPFBXLxX9Ys1BNFM+9sga6KYTmDzqQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+noP32-m5xdUCLFPFBXLxX9Ys1BNFM+9sga6KYTmDzqQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 22 Sep 2023 10:40:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WXxGhX0Fw2nSS7PxYb1O-LUewAhoUVPn=2EpbSD2OeHQ@mail.gmail.com>
Message-ID: <CAD=FV=WXxGhX0Fw2nSS7PxYb1O-LUewAhoUVPn=2EpbSD2OeHQ@mail.gmail.com>
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
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Fri, Sep 22, 2023 at 7:14=E2=80=AFAM Rob Herring <robh+dt@kernel.org> wr=
ote:
>
> > Let's attempt to do something better. Specifically, we'll allow
> > tagging nodes in the device tree as mutually exclusive from one
> > another. This says that only one of the components in this group is
> > present on any given board. To make it concrete, in my proposal this
> > looks like:
> >
> >   / {
> >     tp_ex_group: trackpad-exclusion-group {
> >     };
>
> Interesting way to just get a unique identifier. But it could be any
> phandle not used by another group. So just point all the devices in a
> group to one of the devices in the group.

Fair enough.


> >   &i2c_bus {
> >     tp1: trackpad@10 {
> >       ...
> >       mutual-exclusion-group =3D <&tp_ex_group>;
> >     };
> >     tp2: trackpad@20 {
> >       ...
> >       mutual-exclusion-group =3D <&tp_ex_group>;
> >     };
> >     tp3: trackpad@30 {
> >       ...
> >       mutual-exclusion-group =3D <&tp_ex_group>;
> >     };
> >   };
> >
> > In Linux, we can make things work by simply only probing one of the
> > devices in the group at a time. We can make a mutex per group and
> > enforce locking that mutex around probe. If the first device that gets
> > the mutex fails to probe then it won't try again. If it succeeds then
> > it will acquire the shared resources and future devices (which we know
> > can't be present) will fail to get the shared resources. Future
> > patches could quiet down errors about failing to acquire shared
> > resources or failing to probe if a device is in a
> > mutual-exclusion-group.
>
> This seems like overkill to me. Do we really need groups and a mutex
> for each group? Worst case is what? 2-3 groups of 2-3 devices?
> Instead, what about extending "status" with another value
> ("fail-needs-probe"? (fail-xxx is a documented value)). Currently, the
> kernel would just ignore nodes with that status. Then we can process
> those nodes separately 1-by-1.

My worry here is that this has the potential to impact boot speed in a
non-trivial way. While trackpads and touchscreens _are_ probable,
their probe routines are often quite slow. This is even mentioned in
Dmitry's initial patches adding async probe to the kernel. See commit
765230b5f084 ("driver-core: add asynchronous probing support for
drivers") where he specifically brings up input devices as examples.

It wouldn't be absurd to have a system that has multiple sources for
both the trackpad and the touchscreen. If we have to probe each of
these one at a time then it could be slow. It would be quicker to be
able to probe the trackpads (one at a time) at the same time we're
probing the touchscreens (one at a time). Using the "fail-needs-probe"
doesn't provide information needed to know which devices conflict with
each other. IMO this is still better than nothing, but it worries me
to pick the less-expressive solution for the dts which means that the
information simply isn't there and the OS can't be made better later.

Thinking about this more, I guess even my proposed solution isn't
ideal for probe speed. Let's imagine that we had:

  &i2c_bus {
    tp1: trackpad@10 {
      compatible =3D "hid-over-i2c";
      reg =3D <0x10>;
      post-power-on-delay-ms =3D <200>;
      ...
      mutual-exclusion-group =3D <&tp1>;
    };
    tp2: trackpad@20 {
      compatible =3D "hid-over-i2c";
      reg =3D <0x20>;
      post-power-on-delay-ms =3D <200>;
      ...
      mutual-exclusion-group =3D <&tp1>;
    };
  };

With my solution, we'd power the first device up, wait 200 ms, then
check to see if anything acks an i2c xfer at address 0x10. If it
didn't, we'd power down. Then we'd power up the second device
(presumably the same power rail), wait 200 ms, and check to see if
anything acks an i2c xfer at 0x20. It would have been better to just
power up once, wait 200 ms, then check for a device at either 0x10 or
0x20.

I guess with more complex touchscreens this could be more important. I
don't know if we need to try to solve it at this point, but I guess I
could imagine a case where we truly need to take into account all
possible devices (maybe taking the maximum of delays?) to ensure we
don't violate power sequencing requirements for any of them while
probing.

That would lead me to suggest this:

  &i2c_bus {
    trackpad-prober {
      compatible =3D "mt8173-elm-hana-trackpad-prober";

      tp1: trackpad@10 {
        compatible =3D "hid-over-i2c";
        reg =3D <0x10>;
        ...
        post-power-on-delay-ms =3D <200>;
      };
      tp2: trackpad@20 {
        compatible =3D "hid-over-i2c";
        reg =3D <0x20>;
        ...
        post-power-on-delay-ms =3D <200>;
      };
    };
  };

...but I suspect that would be insta-NAKed because it's creating a
completely virtual device ("mt8173-elm-hana-trackpad-prober") in the
device tree. I don't know if there's something that's functionally
similar that would be OK?

-Doug
