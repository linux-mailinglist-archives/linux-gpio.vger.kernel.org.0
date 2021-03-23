Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A3B345B9E
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 11:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhCWKGw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 06:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbhCWKGX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 06:06:23 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9205BC061574;
        Tue, 23 Mar 2021 03:06:22 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id w18so22797309edc.0;
        Tue, 23 Mar 2021 03:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eBQID3v3SynTOiiBObe4JNz0JqVcgY5182dZdLXPMpY=;
        b=PIdoTXYP8Rii80/Nja8INUqF7so023eTX4U6Shw1kHORzVP6vvWDR/NKmQHJlEF9r4
         fA46CkySsO5xPBWLMmkzhXLv6WMReOEc9wOEvnWyo4HzyBpu8R3VLJd8zwdX4apCtoBJ
         /q7UzLHVVbBW2NJ2z9853FtVN6zMYEXuSqvQrstYaTpYQKOlTUkMsT4nkeynbOGrHjKi
         2zKR3LBIVPNCXpeGAgJfGbEDhWsKgRQFpTN19weL1XdSUlNID5BzsBSEVbiReLpb1k/t
         q3SB7NYz0Lrfj+qLXE7h8AjYAVRq8mpltsOfpigFMn3daLkEqqggxVciK88va0rkkGNe
         LbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eBQID3v3SynTOiiBObe4JNz0JqVcgY5182dZdLXPMpY=;
        b=rcZgstVt6CQYgVQMShF0NIV8RhwNyJi3/GqhUuiq90BidSbbVEFcDvLWvn4REp/6Ow
         aDSvaoS8NyYXFU4mPkFfv4bc8WaBDbsOhHRehxgbSQ19MXZYgJSXRHdRV/LDr3b7yaoi
         5T/N1z/PLflDLded+sNru8+KDdsyo7ccMJPcU271QWZj7+7D5IWu32ek935Lm5VU9MVM
         3Jrl5uPkABoAYtbBEa87UeL5LYrX2reccvAy2CCHC6WiknxEn5nNCSr0Im/CJ0cqWcQm
         9f31jGk+oZD8Abwe4cM2wS7S0z7I1JPNgER3ZwPbWxbw0TT1bjU1GGE0BElWqDNbw6im
         cVZA==
X-Gm-Message-State: AOAM533oEV1nHuurCFuMAlDaUMFMQhQsPi36ea8AY9BnKxunvTAOsIPY
        JauaVJ0r55KegQESAzMlUSs=
X-Google-Smtp-Source: ABdhPJxgK2I4mH7QlEvtnzuOcTArpQzrDM0aEzU3KifOFYIv9EZngVGdSileSp55WsMxFqx2Kp+2iA==
X-Received: by 2002:a05:6402:c88:: with SMTP id cm8mr3867647edb.62.1616493981292;
        Tue, 23 Mar 2021 03:06:21 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y2sm10919556ejf.30.2021.03.23.03.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 03:06:19 -0700 (PDT)
Date:   Tue, 23 Mar 2021 11:06:39 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dipen Patel <dipenp@nvidia.com>,
        Kent Gibson <warthog618@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Marc Zyngier <maz@kernel.org>
Subject: Re: GTE - The hardware timestamping engine
Message-ID: <YFm9r/tFkzVlYDEp@orome.fritz.box>
References: <4c46726d-fa35-1a95-4295-bca37c8b6fe3@nvidia.com>
 <CACRpkdbmqww6UQ8CFYo=+bCtVYBJwjMxVixc4vS6D3B+dUHScw@mail.gmail.com>
 <20210322060047.GA226745@sol>
 <d48fa7b5-8c17-c3d7-10a9-a9811c410a39@nvidia.com>
 <CACRpkdbkmwuAJzD-CpWKqmL3_n1xkvv_2M_DsNs+ZquiaRkKgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JLNxn6AUjrnLEyl3"
Content-Disposition: inline
In-Reply-To: <CACRpkdbkmwuAJzD-CpWKqmL3_n1xkvv_2M_DsNs+ZquiaRkKgA@mail.gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--JLNxn6AUjrnLEyl3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 23, 2021 at 10:08:00AM +0100, Linus Walleij wrote:
> On Mon, Mar 22, 2021 at 9:17 PM Dipen Patel <dipenp@nvidia.com> wrote:
>=20
> > My follow-up concerns on both Linus's and Kent's feedback:
> >
> > 1.  Please correct me if I am wrong, lineevent in the gpiolib* is only
> >     serves the userspace clients.
> > 1.a What about kernel drivers wanting to use this feature for monitorin=
g its
> >     GPIO lines, see gyroscope example somewhere below. In that regards,
> >     lineevent implementation is not sufficient.
> > 1.b Are you also implying to extend lineevent implementation to kernel
> >     drivers?
>=20
> I was talking about lineevent because you mentioned things like
> motors and robotics, and those things are traditionally not run in
> kernelspace because they are not generic hardware that fit in the
> kernel subsystems.
>=20
> Normally industrial automatic control tasks are run in a userspace
> thread with some realtime priority.
>=20
> As Kent says, in-kernel events are exclusively using IRQ as
> mechanism, and should be modeled as IRQs. Then the question
> is how you join the timestamp with the IRQ. GPIO chips are
> just some kind of irqchip in this regard, we reuse the irqchip
> infrastructure in the kernel for all GPIO drivers that generate
> "events" in response to state transitions on digital lines.

One potential problem I see with this is that Kent's proposal, if I
understand correctly, would supplant the original IRQ of a device with
the GTE IRQ for the corresponding event. I'm not sure that's desirable
because that would require modifying the device tree and would no longer
accurately represent the hardware. Timestamping also sounds like
something that drivers would want to opt into, and requiring people to
update the device tree to achieve this just doesn't seem reasonable.

This proposal would also only work if there's a 1:1 correspondence
between hardware IRQ and GTE IRQ. However, as Dipen mentioned, the GTE
events can be configured with a threshold, so a GTE IRQ might only
trigger every, say, 5th hardware IRQ. I'm not sure if those are common
use-cases, though.

Obviously if we don't integrate this with IRQs directly, it becomes a
bit more difficult to relate the captured timestamps to the events
across subsystem boundaries. I'm not sure how this would be solved
properly. If the events are sufficiently rare, and it's certain that
none will be missed, then it should be possible to just pull a timestamp
=66rom the timestamp FIFO for each event.

All of that said, I wonder if perhaps hierarchical IRQ domains can
somehow be used for this. We did something similar on Tegra not too long
ago for wake events, which are basically IRQs exposed by a parent IRQ
chip that allows waking up from system sleep. There are some
similarities between that and GTE in that the wake events also map to a
subset of GPIOs and IRQs and provide additional functionalities on top.

I managed to mess up the implementation and Marc stepped in to clean
things up, so Cc'ing him since he's clearly more familiar with the topic
than I am.

Thierry

--JLNxn6AUjrnLEyl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBZva0ACgkQ3SOs138+
s6HAYA/+NUNYhSdq6TYcOT+FW55Sk4Ckt2yxPhow5SdEDtx6GV0L9eYhJRYKazhl
9RCsfiTYfGUbMvF0USkiztgHeEydFWcvS2WoA93+EJCaPHskIaiU5CIKH2unemNS
pm3mK7IrwoqzaVmPa572SnszBv7F66TqLJ3CZI7pkppQ7u4vKGdKw91JOz2n2yQ5
e62may/Z6NlKTYOBa6jTyjc+ShQ6SENjEtscnl2bcNLg5RyIeX2GXuSLwqEqFYbc
Pmp2n4qg0wFsmqImjJha/M3oPjP/vtDc5zRY5pGn18wtW2+iKXBZT5UKqEf16Nuy
LeYTpFS1lEW4yePuXYgCeJAHs4XrMqj61bVD/lRZdq4+9cl7krxgQSIMug5WigDo
ABo0hYr0oTf9mIFzy+b2pZwxWRg4QSceu8zKj5rOv9J8ztbAABuzcefRojD0j+vu
pQmmI7gQYYb9//DHj/5YS81lVRRyqxyB5M4Q+wdKpkjXWEa3WOg9kfhagtenln7z
U0cdi6ljnCs0XQvIb5BkOQlNLQ15x6uyZH+nbvPidmJykGrHoDXj7iZKH5Jm0ZoQ
JUKcBRS3m2XWDNwI9UIjCrdSIT/djUQXm1B1Q6VRiRpOMKvaJisRDN7RWlsUvOaD
+cKFyNCo++BV3w8afo5O0h+DYKDpkVAOmNM1UlubN/YTwPYcr6Q=
=PGgq
-----END PGP SIGNATURE-----

--JLNxn6AUjrnLEyl3--
