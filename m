Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFAF579E977
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Sep 2023 15:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240952AbjIMNgv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Sep 2023 09:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239451AbjIMNgv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Sep 2023 09:36:51 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829CA19B1
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 06:36:46 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2bcb0b973a5so110301991fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 13 Sep 2023 06:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694612205; x=1695217005; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzaLlzB69jnefmiMUmRm9hUyjxglCWHpETR7rLQZ5/k=;
        b=h5E+dKSlvm19GFxpYp41fFKCiHjNYiHFygPRHmOO0oYxix8ZHsOxwysBRyxMjl1eVA
         yCb0JTSxyKXLAhJ2Xp2TOByB6SHAKxwICf2+O2Q7w7YrQ2j6lBbEXV1xisj+JDx6WdTU
         nuc+HE4ejqai2IJ69DCqxY1ug1YRPaLE1DezBl2Iu6oLSwJrKYogvNEHuFobntiI1+4c
         vK6Kxzkt4huaoxs0iy1tz5MitFFwIJ2ut9SzNfO1s9f/Brnst2/hNycRQtwakqzobuOf
         pJFaBMatCYOSqtwUODqD2aYDhDs/D96mfkNVE3utRUj9dS3hDjz+9nnmERxX6SApEACY
         MO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694612205; x=1695217005;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uzaLlzB69jnefmiMUmRm9hUyjxglCWHpETR7rLQZ5/k=;
        b=i4wbL9nrRibgEnunf/vIshTL7OfOwD/erA/xy0RTRE0TsU+kQhQv3Jo1U4d87Ad38h
         gNFhy+gqmh8dT3A1p3To5XOZFcw45nioSXOaj6fESA9y4WcRzw9+BrogWxkoQpoNjBer
         pvvPWtekkeDmxq6beN+dHGZOVTVR4xteeqihwCen3sYOyA4rNnQKaiD8urCRH2ldTgm4
         uDOhmMybKGGEwK66Wsf/1LjITMx7tEVeIiYdH06b1aT1kHoOatEcJP3wyi7U9FsjO3Ex
         Y96QoO3R0yLA0YtkI7xPwDjO/+Y0m5p97OaATsKUi3qqwmbx87UBSOuUc5DSeH31GUMK
         GSMw==
X-Gm-Message-State: AOJu0YwbVdc+tzzcT4zz4QZCAzn+SIhn0eh1cnb77S9+Ytnk+mWS0zeY
        3Xhl0rAsh03G/Ge36ZgNpoGcBioYPWcZLF7q1Xo=
X-Google-Smtp-Source: AGHT+IEi9C35lFhcE1ivtOzjyKfKgcgwkhtWGoZqpDAG43LfdQkyk/02pj1DdE3kuRKjtbsT3HH1OQ==
X-Received: by 2002:a05:6512:3e0a:b0:4f8:e4e9:499e with SMTP id i10-20020a0565123e0a00b004f8e4e9499emr2387168lfv.12.1694612204729;
        Wed, 13 Sep 2023 06:36:44 -0700 (PDT)
Received: from localhost (i5C74380B.versanet.de. [92.116.56.11])
        by smtp.gmail.com with ESMTPSA id d10-20020a170906344a00b00977cad140a8sm8413401ejb.218.2023.09.13.06.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 06:36:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 13 Sep 2023 15:36:43 +0200
Message-Id: <CVHTW377HBYV.1CKNHXYC75Q5N@ablu-work>
Subject: Re: [libgpiod] Thread safety API contract
Cc:     <linux-gpio@vger.kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
From:   "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <CVHO091CC80Y.3KUOSLSOBVL0T@ablu-work>
 <CAMRc=MdMKd+6-P-ma0E0f5yBTOGS_zVaBJD6wEywyjZ7JVE2YA@mail.gmail.com>
In-Reply-To: <CAMRc=MdMKd+6-P-ma0E0f5yBTOGS_zVaBJD6wEywyjZ7JVE2YA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed Sep 13, 2023 at 2:03 PM CEST, Bartosz Golaszewski wrote:
> On Wed, Sep 13, 2023 at 11:47=E2=80=AFAM Erik Schilling
> <erik.schilling@linaro.org> wrote:
> >
> > Hi all!
> >
> > Currently it looks like libgpiod does not document any kind of thread
> > safety gurantee. However, the Python bindings tests
>
> Indeed, the library is thread-aware but not thread-safe. Just like
> what is recommended for low-level system libraries.

Just to confirm:

I assume this means: thread-aware in the sense that all created objects
(chips, line_requests, ...) together may only be used by a single thread
at once? So line_requests of a same chip may not be used across threads?

> > (test_request_reconfigure_release_events) are using sequences like this=
:
> >
> > Thread 1 creates chip + some watches
> > Thread 1 creates Thread 2
> > Thread 2 issues a request_lines on the chip
> > Thread 2 reconfigures the line direction
> > Thread 1 joins Thread 2
> > Thread 1 closes the chip
> >
> > Implicitly this depends on a couple guarantees:
> > 1. Calling chip-related functions does not require synchronisation
> >    primitives (other than keeping the chip open).
> >    -> wait_info_event, read_info_event and request_lines are called
> >       concurrently
> > 2. Requests may be modified by other threads
> >    -> at least reconfiguring the direction is done
> >
>
> Well, this is just a test-case that's meant to trigger a line state
> event. Now that you're mentioning this, it does look like I should
> have used an entirely separate chip object. Good catch!
>
> > Looking at the C implementations, it indeed looks? like this is a safe
> > thing to do - with the current implementation.
> >
>
> No it isn't. That is: maybe it is but it's not on purpose. There are
> no thread-safety guarantees.

Right. Thats what I was trying to suggest with "- with the current
implementation" suffix.

> > My question is: Is this an intentional gurantee that will be guranteed
> > in future releases? I am trying to figure out whether the current
> > contract exposed by the Rust bindings is correct and/or may need to
> > be extended. So which guarantees are provided by the current and future
> > C lib?
>
> None. Except reentrancy for all functions.

Thanks for clarifying!

> > Currently, the Rust bindings are advertising that the chip may be `Send=
`
> > to other threads. This means one thread may forget about it and another
> > thread receives it. In contrast, a request for a line is currently not
> > allowed to be transferred to other threads (it is missing the `Send`
> > marker).
> >
> > While in C and C++ thread-safety is typically not enforced by the
> > compiler, Rust has mechanisms to do this. But I would like to document
> > the C lib's situation before inventing rules for the Rust bindings :).
> >
>
> I cannot help you with that but whatever rust does, it needs to keep
> in mind the C objects need to be synchronized as they offer no
> guarantees.

I will think of something in a calm moment :). I think we may need to
prevent the chip from being moved to other threads while leaving child
objects behind.

Thanks
- Erik

>
> Bartosz
>
> > Trigger of my question was that we glossed over these details in
> > vhost-device-gpio:
> >
> > https://github.com/rust-vmm/vhost-device/pull/435#issuecomment-17172056=
20
> >
> > - Erik

