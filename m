Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D57952BAF26
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Nov 2020 16:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729086AbgKTPha (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Nov 2020 10:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728987AbgKTPh3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Nov 2020 10:37:29 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 425F2C0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2020 07:37:28 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id o8so1875433ioh.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2020 07:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yYfn0xrqxXA4qCufDcYzGrMAJusooLXO2UBf9nW7f6w=;
        b=AttRXot9z8jkfsY73VFI7OxJDUvYwz4d0VCk06GjwvKj6CSq6D+pS00Po4qC0Vw54L
         CIN757xr9TpHAIkuCaSsiqSeOJNVxybtKaEj5QrwHfg6eBeOM1tychfM9MW+WR15/7i2
         HVeVx1I5c0kWpe1B5vCZ3fYYan8oeyPWz4izlm5h2cu+E50EQS/xPt5Jz9Uc2uPsZf11
         twK/o+Ru6QcLSF7BJGJFDs+zchUvLbn/UKt89zaToiU9nKazHfYS+d+6ZFjZBJFRgaHA
         tMz69on3pMWUQZj58+NBa183iuuIiHZYxZZJQemQ3GtjG/vxRUMHpFQbGRh9arER5U4u
         LytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yYfn0xrqxXA4qCufDcYzGrMAJusooLXO2UBf9nW7f6w=;
        b=T6/TIy84gYRAf1KchYp/dQ19LVXuaOmxuLXtTkNMu79iIKal3c4SuqoPqwvdE8apdo
         kJdnp/VXZ3EIw4pZ+VYWTRO75BSYPz4hl83UffwoHvmV83kbM9ZeVPD6/itdJkwaA9JA
         Izi5kTeYnWM98WlgnDs5DPcAQy1VhQtw09oQnceHSLtgMTjiNaNk/LHzUYOH9hVa0If1
         2/MG6i1dNQFuIBP2yDJjDCs3ahSnLQqK43uVeH3QOaLyp9AQ1fWHOrf2RZsRlq+7fiO4
         TZJEthwNBTBFgFcZnqfzU1nQo1IjJJdOxgmz/CaluLiiepcgZylAE5TW/+C/gkmU6pfC
         AGRg==
X-Gm-Message-State: AOAM530T4hxP/5+mKPc9ha6qoUZkVvWZ7qyNNLxYHoDxU4gq6S0s5yd8
        8bsSPjCj0SqbySqNTck92YTiJWo5FOFRMIoRGCf2x0y1coI=
X-Google-Smtp-Source: ABdhPJzPZrwQd2s+0RPNUp5Ob0OQ4L27fSfeMzGrucn59cDaAHAowA7+e7w/VMkT8+2JdzaCGOF616OSIKNgacYkEF0=
X-Received: by 2002:a6b:c582:: with SMTP id v124mr14506411iof.13.1605886647651;
 Fri, 20 Nov 2020 07:37:27 -0800 (PST)
MIME-Version: 1.0
References: <20201120141539.11025-1-brgl@bgdev.pl> <5fff-5fb7d600-1-776b3000@96844491>
In-Reply-To: <5fff-5fb7d600-1-776b3000@96844491>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 20 Nov 2020 16:37:16 +0100
Message-ID: <CAMRc=MfbGGuwwauPji13SBink1Rqgr7rmyH3kxSYQfQJxN6H1Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] build: allow building with pre-v5.5 kernel headers
To:     Michael Nosthoff <buildroot@heine.tech>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 20, 2020 at 3:42 PM Michael Nosthoff <buildroot@heine.tech> wrote:
>
> Hi Bartosz,
>
> On Friday, November 20, 2020 15:15 CET, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > libgpiod v1.6 requires at least v5.5 linux kernel headers to build. This
> > is because several new symbols have been defined in linux v5.5. In order
> > to allow building with kernel headers v4.6 and on, let's check the
> > presence of the new symbols and redefine them if needed.
> >
>
> In the Buildroot Package (for 1.4.x) you set the dependency for headers to be at least 4.8. [1]
> Could this then be lowered or is there a mixup?
>
> Regards,
> Michael
>
> [1] https://git.busybox.net/buildroot/tree/package/libgpiod/Config.in
>

No, it's my mistake - it should say v4.8 in the patch, not v4.6.

Bartosz
