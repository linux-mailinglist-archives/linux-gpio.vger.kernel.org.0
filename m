Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B89ACCBD1
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2019 19:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbfJERuh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Oct 2019 13:50:37 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33226 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729608AbfJERuh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Oct 2019 13:50:37 -0400
Received: by mail-wr1-f67.google.com with SMTP id b9so10703886wrs.0;
        Sat, 05 Oct 2019 10:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=woGdLkObfzRFeLoqI5/c5x/iMFT/HmZsLV4Tr4PA8q8=;
        b=YvJJ/RH+r+ZNGn9DmsmptGvTw/7fkvvLkknt1pqKNRNe5BXRwLtSX8S/5z/xoR3qDo
         oq/6xk/dbnLworgzGxomjTtks8z+QS940l0iPOh6bhLv9Y/fISBam6Z04vamu+7w7VaF
         /q7/UP96FQrjCgSScsAOtqpdWk+RMBKlEnTCnRsPgCfA6IftthJgyMpQQZk7975d6aFn
         aSK0WGRYJ3M/Xh+HFiZ2miQxFtmgXwHhS1YmJKaGWCVOR4hKenqO+DDUpxseZg5XI8Cr
         03+ShYJzWNErice6Ykt9nYRSKqH4iOle+XuxyPFMwDHbTaVSH4bAVc4Du1jFNu1NGg5L
         NI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=woGdLkObfzRFeLoqI5/c5x/iMFT/HmZsLV4Tr4PA8q8=;
        b=QupYWYWcXuAunkzOivtrdu/xbadazEBHIMUg24c7ilr0yl4OOwD7zWvWZeSL1yJoB/
         bs7p6V0zUK6qXZBljwmMluf7XLwMxuAMGCyp20phlwGkgP8miHxFJuYQ6UOUMnBlir43
         Da/tZ13WZjKdwZn4uVIIHKxkB0NkiBI93DclLRXxk1i2pIF3UsBdQMa4YvYw23YWs9J0
         hVbBn3wRoJ2Ow+DP374T3NqX097Q2s/RX+gUv1lx4l/pzHvZvU88kGFYg4gRgdDbWwhf
         Gg5WM26+WGOB1zPsGXEg2aBK0QzrHYWUvxjo93+NEJqeIbUUFcBHES6/bTwKFp8vHTTT
         Mleg==
X-Gm-Message-State: APjAAAUplk4IG+LrtJigp6mlYySAtVrXSsnQQ+HTtagySY9CcjqG2Mgt
        /oF32eHhZO6KY0SFpkn3bx8=
X-Google-Smtp-Source: APXvYqx3PzUHgdYRUSlZN9M0EPBeF+W+0e93Y2j5mVMXv8fWHuZVnS+5zd4oHSYnQYPi9EGQzPE2Yw==
X-Received: by 2002:a5d:6885:: with SMTP id h5mr16449681wru.92.1570297834128;
        Sat, 05 Oct 2019 10:50:34 -0700 (PDT)
Received: from x230 (ipb218f546.dynamic.kabel-deutschland.de. [178.24.245.70])
        by smtp.gmail.com with ESMTPSA id o19sm17222631wmh.27.2019.10.05.10.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 10:50:33 -0700 (PDT)
From:   Eugeniu Rosca <roscaeugeniu@gmail.com>
X-Google-Original-From: Eugeniu Rosca <erosca@de.adit-jv.com>
Date:   Sat, 5 Oct 2019 19:50:24 +0200
To:     Stephen Warren <swarren@wwwdotorg.org>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Warren <swarren@nvidia.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Phil Reid <preid@electromag.com.au>,
        Enrico Weigelt <info@metux.net>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH V4 2/2] gpio: inverter: document the inverter bindings
Message-ID: <20191005175024.GA25394@x230>
References: <1561714250-19613-1-git-send-email-harish_kandiga@mentor.com>
 <20190925165133.GA4164@vmlxhi-102.adit-jv.com>
 <06a1acab-fcc4-7b3a-697b-4d253c354513@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06a1acab-fcc4-7b3a-697b-4d253c354513@wwwdotorg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Stephen,

On Fri, Oct 04, 2019 at 01:07:23PM -0600, Stephen Warren wrote:

[..]

> I think the DT should represent the device that's attached to the GPIOs.
> That way, there's already a clear way to represent the GPIO polarity, as
> described in the document linked by Eugenui in [2] below.
> 
> If for some reason that's not possible, then I think keeping track of the
> GPIO polarity in user-space is entirely reasonable, and is the correct
> approach. To claim that tracking GPIO polarity in user-space is too much
> burden, yet to also allow user-space to control GPIOs at all, and hence to
> know exactly which GPIOs must be controlled, is an inconsistent assertion.
> 
> Put another way: If a piece of user-space SW controls GPIOs, it must know
> which GPIO number to use for each logical purpose. This information
> presumably varies on different platforms, so the SW must have a list of GPIO
> numbers and GPIO controller IDs per platform. Additionally storing a
> polarity bit along with that information seems entirely trivial to me.
> 
> Is there some other issue that I'm overlooking?

Based on the discussions so far, the user who requested this feature
intends to (in fact already does) "mark" the userspace-relevant gpio
lines via the "gpio-line-names" [5] DT property, implemented by Linus
in v4.7 commit [6]. By keeping track of "gpio line name" both in DT and
in user-space, apparently the user is able to accurately map the
"line name" (visible in userspace) to the corresponding gpio chip/name
and gpio line offset in a "platform/board-independent" way.

Do you think this is unorthodox?

> If the list of GPIO IDs is retrieved from DT by the user-space SW, I could
> see an argument for storing the polarity information in DT along with that
> list of GPIO IDs. However, I don't believe there's any standard way of
> representing "a list of GPIO IDs for user space use" in DT.
> 
> > If we hog a GPIO pin in DTS (which allows specifying its polarity),
> > userspace no longer has access to that pin. There isn't a way to define
> > GPIO polarity by means of DTS without affecting userspace access
> > (can anybody contradict this statement?).
> 
> GPIO hog doesn't seem like the right approach; its intent is to actively
> configure the GPIO in a fixed state, which is logically incompatible with
> user-space control of the GPIO.

Agreed. Thanks for strengthening the idea behind hogging the gpios.

[..]

> > [1] https://marc.info/?l=linux-gpio&m=139204273132477&w=4 ("Correct meaning of the GPIO active low flag")
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=51e8afc1c43c75 ("gpio: document polarity flag best practices")
> > [3] https://marc.info/?l=linux-gpio&m=155721267517644&w=2 ("[PATCH V1 1/2] gpio: make it possible to set active-state on GPIO lines")
> > [4] https://marc.info/?l=linux-gpio&m=155713157122847&w=2 ("[PATCH V1 1/2] gpio: make it possible to set active-state on GPIO lines")
[5] https://marc.info/?l=linux-gpio&m=155712945922102&w=2
[6] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fd9c55315db9
    ("gpio: of: make it possible to name GPIO lines")

-- 
Best Regards,
Eugeniu
