Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7D63D1020
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 15:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238619AbhGUNGn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 09:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238629AbhGUNGU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jul 2021 09:06:20 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13B4C061575
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 06:46:56 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 8so3218502lfp.9
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jul 2021 06:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MH3wH7GQIEv1Swdd+QIQdDVT9ekDsdelmOZ3OOsqFXc=;
        b=O+uSOLGTYQVTJhJjKKImWEMyxJwDpqN4zKz7eDGNQ/A77WZNoudpwEiukD7OmO2Xj7
         U95ec2u2G2F8l7GIV12R8oS2wAAa/LXlSWDJKu3YH9RJdmLDTxWgiHvurFYMDSub4LlN
         Toue1x8Aha/F4znxhb+sd0JCVzrAb4yMCSLY1x+IFmjg7iEQkHugUABIKM6d1dGok6AL
         SrGJAmmXPrqmTD3pgod7A583G3MPrHGv2sTV5P+dgkVChuDmFJ2LNxv8MN6AYfUv061C
         fRlNClzh+ap7Wy+4kF6RTOjoJSmol6qWBISeJWe6c9hA9lxl0Fy7VhGhelD+IrtBUtSQ
         Vo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MH3wH7GQIEv1Swdd+QIQdDVT9ekDsdelmOZ3OOsqFXc=;
        b=JlqyRbvrl3ffJ2h5hH1lAJUI7MGqdxRU50Rq4H+yLXFEVkkFfRY4DX4C0+aGEJV/6P
         DA3zv3A+onEKgSxUjy2fUc1Gid1V4QwUiGyTIwXtL8hJTLlAQBp6XpJATCltN+8BgNxL
         KnpAucduUHmpQJlFuyKkoxwpfL7XICA6LRvbKWoKhJzEpkJriG8pRiI50sNBwO8uWLWp
         42CUDiWfzpu4zVCJhnG114w+t/Xd/4yAZKg2ievTIPlR/Nq7EonIVsqiO9fHIAkcF5h+
         /TeLoh6vHZ5/6QhotREfHAtduZbFm5sjov4b2sToIZsX+bP2usvMghScpALZpRkIUY9/
         cBjw==
X-Gm-Message-State: AOAM531n6sCMlFVtpvqkmZ7bojwz7BuNjYdd+m0IYAnfrLrozgvLAGFV
        Sdyz83yZyvOzAi8sCudpC6znPpLLYQmDFL6VjhwEFQ==
X-Google-Smtp-Source: ABdhPJxggVBk4jRRVyxnHpG+PH0gwjJGx8TJ238oMPEiIZcFyaSi9jA3xt7AOz9j82glz6I5cVby7UkYbD6RRBYsgQ4=
X-Received: by 2002:ac2:5e71:: with SMTP id a17mr24993123lfr.465.1626875215112;
 Wed, 21 Jul 2021 06:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk> <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
 <YOWcCG9Pm/S+EXFw@kroah.com> <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
 <YOWh0Dq+2v+wH3B4@kroah.com> <YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com>
 <YOagA4bgdGYos5aa@kroah.com> <CACRpkdasOaNgBAZVx5qpKJdU7h41jHDG2jWi2+pi9a1JBh7RTQ@mail.gmail.com>
 <YOh/JC//dotfm5J9@google.com> <CACRpkdb1W=M5EJkGbSS4QxObU-Gd5yZ1qE439k_D4K=jevgcrQ@mail.gmail.com>
 <CAHp75VfW7PxAyU=eYPNWFU_oUY=aStz-4W5gX87KSo402YhMXQ@mail.gmail.com>
In-Reply-To: <CAHp75VfW7PxAyU=eYPNWFU_oUY=aStz-4W5gX87KSo402YhMXQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 21 Jul 2021 15:46:44 +0200
Message-ID: <CACRpkdbzAzwrSJmoiO8w5KPV2dL-qxgaeD+gSzL-Gg+cmajsOQ@mail.gmail.com>
Subject: Re: cdev/devm_* issues (was Re: [TECH TOPIC] Rust for Linux)
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Greg KH <greg@kroah.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Mark Brown <broonie@kernel.org>,
        Roland Dreier <roland@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 14, 2021 at 12:35 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> To me described scenario sounds rather like an object lifetime possible i=
ssue.
> In any case, shouldn=E2=80=99t VFS guarantee by a reference counting that
> gpiochip_remove() wouldn=E2=80=99t be called while file descriptor is in =
use?
> Or am I looking from the wrong end here?

What happens is that the GPIO device disappears (such as unplugging
a USB GPIO expander) while a multithreaded userspace is hammering
exotic ioctl() commands to the same device like crazy.

Under these circumstances (which should be rare, but you know,
developers) it could happen that an ioctl() sneak in before the
gpio_chip pointer is NULL if I read the code right.

Yours,
Linus Walleij
