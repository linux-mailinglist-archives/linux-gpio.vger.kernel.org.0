Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E78F1926F2
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2020 12:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgCYLQg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 07:16:36 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33658 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgCYLQf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2020 07:16:35 -0400
Received: by mail-lj1-f195.google.com with SMTP id f20so2028957ljm.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2020 04:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ByYYkQkX4e+La3B895nfCGfrVXv0LtwE0DAHSJeDkl4=;
        b=mAlKDkJWDSPYgt33/yqh4jr8oQ5FIBpIP9q6VV01ZKgGMGbc9wzj1sjvF6U6ng8FVt
         iVkQ9955nL0bTQtOFpfBZnu2ir9V5TiBgTOby5FPVIQv2ZVLwF1I66SKKl0c0uZNNiph
         2xam+zHgSyhCzCdNMZyyJYvup7LRRV5foF7q5Ee0DR5yzA1Ww+znFTpsu9Pt45xLFfr4
         0qroiqy9+sh2zb/ygsQFjQhA/1hf6wvFqo0LoYoL0OHf0NtIQAkvSz8oxvSn0mJuIUYh
         p/9gztExAYRiu/+l7fmoRLQ8Cb8dIfVx+a1LkTuKKoF05uStErBD6ppSEmsyap9XRUjG
         m2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ByYYkQkX4e+La3B895nfCGfrVXv0LtwE0DAHSJeDkl4=;
        b=fnCUGcThFativq1p3djjaT2sb/8yfDLWPzF4ASy0n48ZRpfajAGKwR7AzWDnLxN80b
         RKwSQ/W/xWkANtFFUXOKLRItTMpGRlqpk9futtvzM0h2ieiK0f3eFMekpA35jwuP0PaH
         VdSCbr6odUlTYeHD9NNsblpAlBmVv/nzVs6e8f84CA862ruK3SPZDDAnTZmVELWomiJd
         tZrY8ocqPlE0BleIAYw5yOthekvgJ+KGcCH/xpImRGVy4KH3PF7y7yESvOeEgXJLF4HG
         AknqxQJxSouUXjFfnLmUz1zz5RZemRnOd1knVay2EgW3pfavdcDhRPkpnVGW1aiPtZZ9
         Tz0Q==
X-Gm-Message-State: AGi0PuZZKX5IFvAILBhHnguwdgsCzADVidbaijeZBj5hO0PlwEnW3cGf
        TTSUHPmNpUiQrOqNDQm5OCDUp6mDm9vHxWdtnYe27g==
X-Google-Smtp-Source: ADFU+vuujs/pw3YyZfWBg23PhzvaUqCrIr0VSH3VGvQvcvwTn/DRb85RcnlKPndnNXs6oF36y2fKPgZVUEIONdXJ5l0=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr1610818ljh.258.1585134993207;
 Wed, 25 Mar 2020 04:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200224094158.28761-1-brgl@bgdev.pl> <20200224094158.28761-3-brgl@bgdev.pl>
 <CAMRc=MdbvwQ3Exa2gmY-J0p8UeB-_dKrgqHEBo=S08yU4Uth=A@mail.gmail.com>
 <CACRpkdbBCihyayQ=hPVLY8z4G=n5cxLnUmaPpHRuKedDQPVUyQ@mail.gmail.com>
 <CAMpxmJX_Jqz97bp-nKtJp7_CgJ=72ZxWkEPN4Y-dpNpqEwa_Mg@mail.gmail.com>
 <CACRpkdYpers8Zzh9A3T0mFSyZYDcrjfn9iaQn92RkVHWE+GinQ@mail.gmail.com>
 <CAMRc=MdLYD3CeFtp4jF+-P+4kSmt1sAezrkPFk5rK4=whNEWuA@mail.gmail.com> <CAMRc=MfEo6=im5EPHYtht3xN83k+rcRgQDSOB=Ucs52M8RWirg@mail.gmail.com>
In-Reply-To: <CAMRc=MfEo6=im5EPHYtht3xN83k+rcRgQDSOB=Ucs52M8RWirg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 25 Mar 2020 12:16:22 +0100
Message-ID: <CACRpkdY1u2xEFzJPrat73me11wdY9uGCK=FWWWzLkBY505JrUw@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpiolib: use kref in gpio_desc
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Khouloud Touil <ktouil@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 23, 2020 at 9:44 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Hi Linus,
>
> what is your decision on this? Because if we don't merge this, then we
> need to make sure nvmem doesn't call gpiod_put() for descriptors it
> didn't obtain itself and we should probably fix it this week.

I'm simply just overloaded right now, things related to how the world
looks etc. Also Torvalds writes in Documentation/process/management-style.rst
that if someone ask you to make a decision, you are screwed :/

Your decision is as good as mine, I'm not smarter in any
way so if it is urgent send me a pull request for the solution that seems best
to you, I trust you on this.

Yours,
Linus Walleij
