Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C142D0DED
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 13:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727920AbfJILrO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 07:47:14 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46372 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfJILrO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 07:47:14 -0400
Received: by mail-lj1-f196.google.com with SMTP id d1so2106895ljl.13
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 04:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ItVpIOapVRKtGbdkJGyNyt48/Ay/iHdq4r9sHAbaRUw=;
        b=TB8THq7riDIX5LWCRtWVKEoLmjJZXE8XDaA1LKd2awB08MpXXRafIoNhkHyNYZNR9j
         DzKhXUVLH7Skd5Bv2FDJeXyhmOXGFAipNLQyz15yGDpc0zpkg16F3ExH/2WRv4gkX5ie
         i/Ww2eYQ27WyYhVJC/XB6NEU6qAO+B5oJR4I+wb4ZWr8aavw2wZWaDzqkayDkUpcO+Y/
         SsRstJiA5zUmRZEspc4DAM7q7ojm5kAquYfL5mVuKtK2pChq8etKYK9bPJv9LmJvU85x
         23HDxHX+QZezsFRCBLKlWr085bBhB+sFm/M9leH4pdIKqQKs7zjwYoRIzCqkjP/A8ieo
         ixzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ItVpIOapVRKtGbdkJGyNyt48/Ay/iHdq4r9sHAbaRUw=;
        b=LSeMf3eQyYas0OS4HI1/7MWBJYHuxnmvfnnyHPsQ/Pv1X+Tv24jhyAwj1cTZPZyzNW
         +eLz81WDNn7l0YTjpXDEbsaDRE0nIn7K1nIQd0Q+cDLfNEkmssr0NbHu93Wju1n1Ki03
         nxXibouF82Yqnl7VdYB3oSCjGRSK342x0gP82v/LLv4Pky/2AvuDJ/vJ4xrD8Hmw/Qe8
         1b80tZ31fgzzixlMwUqagroTHjc3wRVmbBiyLYzubdxrrgJLap+9inHAL7jpMNo8TAp1
         XG7JxXt15Al/1SkhkESWgYtCDH7HzEOq2wwQp0hqCVnzOoAM66Y9HJ/eAF3p3/6ArPYA
         VxFw==
X-Gm-Message-State: APjAAAWxIVW+RAxl0qaZSZ4nCcu5NMmQ2z31Bo1QUitiPlacWGaYa4WO
        sM9aTNL2/g2v07R1S2fPh4K290HLfheUby3lATc=
X-Google-Smtp-Source: APXvYqwgLmLb1mesJ6gMuTySXoz4P3+/s+jRJhFvBPhYt8g5LxREUklX/2xu7zfGRXwnN7MK13w5M3roPw5M2ZN+r8s=
X-Received: by 2002:a2e:7312:: with SMTP id o18mr2031158ljc.216.1570621630223;
 Wed, 09 Oct 2019 04:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190921102522.8970-1-drew@pdp7.com> <20191008061512.GA19956@sol>
In-Reply-To: <20191008061512.GA19956@sol>
From:   Drew Fustini <pdp7pdp7@gmail.com>
Date:   Wed, 9 Oct 2019 13:46:58 +0200
Message-ID: <CAEf4M_A11or2ixZ+wFJ+F51FL+KqUjDjuuFOCj3R_=qsijgEOA@mail.gmail.com>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "brgl@bgdev.pl" <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 8, 2019 at 8:15 AM Kent Gibson <warthog618@gmail.com> wrote:
> Sorry for the late feedback, but I'm still not sure whether this patch
> is on track to be applied or not.  I had thought not, at least not yet,
> but just in case...
>
> You have added the flags to linehandle_create, but not lineevent_create.
> Given that your primary use case is push buttons, isn't the event request
> at least as important as the handle request?  Even ignoring your use
> case, I'd add them to lineevent_create just to maintain symmetry.
>
> Also, is it valid to set PULL_UP and PULL_DOWN simulaneously?
> I would think not, but I could be wrong.
> If not then that combination should be rejected with EINVAL.

Kent and Bart - thanks for the review.

I've added setting the pull-up/down flags in lineevent_create().  And
I have added sanity checks to make pull-up and pull-down flags
mutually exclusive and only valid when the line is an input.

I tried to use "git send-email" to reply to your message but it
doesn't work seem to have threaded correctly, despite using
"--in-reply-to"

I have only submitted kernel patches before when I was completing the
Eudyptula Challenge, so I wasn't sure how to best post a follow-up
patch to address review feedback.  Maybe starting a new thread with v2
of the RFC?

thanks,
drew
