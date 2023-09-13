Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7DD79EC6F
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Sep 2023 17:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241606AbjIMPS3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Sep 2023 11:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241765AbjIMPSF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2023 11:18:05 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19B6CC3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 08:17:55 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-7a0254de2fdso2439422241.1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 08:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694618275; x=1695223075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPmSfZUnEk1fSO+UfruiRwzSBYigAA/HrsqLK9/Kel4=;
        b=sjIgyyuSCGltVHa9/NuplRKgp99zPBOT2154luVJ0s5W31gEflhNsfpmBHzg4urGmB
         JF5bi0uUaP3QJuirO6rLDHMKlNy1Wc5XaMBHuIVjNkh/Lrh1L3ZOnZwYkZJdRQPh66Dp
         37QG5JgVwJmMMbQGfVWYMZdB0gAZ+7i5btrDLYXR7fP3uxlxjI5aP8Yu++qZSvOrNnRh
         zywMyzwbFY6lK/f6F6t0j5U5gQfTWOG8fVYYMjgiwZIsK1p9GMxQZVzm+KL+qBGX/MqZ
         TzpI4MIymKpvr4xsfMeikCJZ1gIlIOzyYgTQ/0xalLy9y4HxP//i7Mz0q09ZERDifXSa
         OLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694618275; x=1695223075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPmSfZUnEk1fSO+UfruiRwzSBYigAA/HrsqLK9/Kel4=;
        b=SCC0aqL3s2yP2sE3GcKYnhO/g8X/1vVgjGqd5wu+1egykXConyu8hmxFD2CrL021nK
         ws4lfPNYCfPWMMt1nftPsgewF1qHVpMhwzcEo15ZNQp4WO0oZESLrTHvD3jJXVzbtcX0
         AY8BbQ456OE49aG0Vrxc8K9IEkkBvnVIP6a0rIsZIVhjwgp6tFNsDzRCNE1jKubiygcS
         e8JNWWTnJ/TohahQApqNOtxouFgxuKDor1zuH19A9PQ/PhqjBeZEMBUlTsalrC6XDnBG
         Q6K7AfeVYhrmTUAAERdCcjgH1vbhsne2R1LvgKVJUmSvq59ntDl2BwrLbeRoz3c9hEUB
         88pg==
X-Gm-Message-State: AOJu0Yxpr+2glni3qZgOEEJ5f5qdIPZ+9TJzlzYjGyeBV9WNxjRQM2w9
        3pYTfxONFX/TCj3gv6LVTdlXRLk6j7KtOOoumRDZ7mxuZEtMB6D5
X-Google-Smtp-Source: AGHT+IFJXKYfP6F3Ijh6EZTurKE4/qx2XmqfHxa8nl+p6P8gG+Xnpwl7zftm5wcjX+4Dp4IYqllcJwpQ436C2L7Tnb4=
X-Received: by 2002:a05:6102:1da:b0:44d:5c17:d06a with SMTP id
 s26-20020a05610201da00b0044d5c17d06amr2361933vsq.35.1694618275001; Wed, 13
 Sep 2023 08:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work> <CAMRc=MdMKd+6-P-ma0E0f5yBTOGS_zVaBJD6wEywyjZ7JVE2YA@mail.gmail.com>
 <CVHTW377HBYV.1CKNHXYC75Q5N@ablu-work> <CAMRc=MdR1coB9p1gvG2razQUeuwUJCaeDrTTm5o1ND+LJZ1SOg@mail.gmail.com>
 <CVHULP4LSR1M.U8ZIY7UL0OU5@ablu-work>
In-Reply-To: <CVHULP4LSR1M.U8ZIY7UL0OU5@ablu-work>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 13 Sep 2023 17:17:43 +0200
Message-ID: <CAMRc=Mc4F_PKk3doS-MQUE0_=iRdQtJoWXO+mkhWcMBcudh--w@mail.gmail.com>
Subject: Re: [libgpiod] Thread safety API contract
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 13, 2023 at 4:10=E2=80=AFPM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> On Wed Sep 13, 2023 at 3:45 PM CEST, Bartosz Golaszewski wrote:
> > On Wed, Sep 13, 2023 at 3:36=E2=80=AFPM Erik Schilling
> > <erik.schilling@linaro.org> wrote:
> > >
> > > On Wed Sep 13, 2023 at 2:03 PM CEST, Bartosz Golaszewski wrote:
> > > > On Wed, Sep 13, 2023 at 11:47=E2=80=AFAM Erik Schilling
> > > > <erik.schilling@linaro.org> wrote:
> > > > >
> > > > > Hi all!
> > > > >
> > > > > Currently it looks like libgpiod does not document any kind of th=
read
> > > > > safety gurantee. However, the Python bindings tests
> > > >
> > > > Indeed, the library is thread-aware but not thread-safe. Just like
> > > > what is recommended for low-level system libraries.
> > >
> > > Just to confirm:
> > >
> > > I assume this means: thread-aware in the sense that all created objec=
ts
> > > (chips, line_requests, ...) together may only be used by a single thr=
ead
> > > at once? So line_requests of a same chip may not be used across threa=
ds?
> > >
> >
> > They can be used across threads alright. Thread-aware means: no global
> > state in the library, IOW two functions won't get in each other's way
> > unless they work on the same object.
>
> Sorry, I did not phrase that question super well. A (hopefully) better
> try:
>
> If I create a chip and then open two line_requests from that single
> chip. Can I use these two line_requests concurrently on different
> threads? Or do both of them (and the chip) have to share a single lock?
>
> My assumption was that everything derived from the same chip instance
> must not run concurrently.
>

Ah sorry, I didn't understand your question. Actually using requests
from a chip concurrently in a different thread is perfectly fine. The
two structures are independent from each other in user-space and their
work is synchronized in the kernel.

Bart
