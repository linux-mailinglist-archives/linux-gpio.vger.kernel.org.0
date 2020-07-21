Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8F3227C05
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 11:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgGUJqX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 05:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgGUJqW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 05:46:22 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA32C061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 02:46:22 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id u12so11305084lff.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 02:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eAq/5LUtzjm9hByndWmu/JdlO/PHjc2fHCwR1vSW0Ls=;
        b=TJoWY8b+ZcoWZOgvMSC3SFNBIlEixJxKML8Fx8/TrFwFyP/04alK/HfYxBL1lfWmX9
         2+7Iq1jTccFZeaGXWqwNIBILHIA6BRUHfs1uKyfnR4ASg8NtjXd07IdsoOD8iSj2oqHe
         5P94ZpILrncKRbbGe7n5VzDF6jvGryubEmh3RplAafuW/pJNXPASpKvfCgF8fH6W0myl
         BdF/jpHmSuFMDSPd1mAZacsJkP+rO970tjfFROIkin+yIDEzqI8PoSg4QaMmaotg4ceK
         mRcZzGRD+QUKMz6PFmIfu00jphFXoT0+xO9g62pOwhiIQYPWM/jUNDBhQOWWAeWuu/No
         Qhdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eAq/5LUtzjm9hByndWmu/JdlO/PHjc2fHCwR1vSW0Ls=;
        b=WbKReKvAe1Hdc9GUIWZO+RSj0mf8azUcbeeLZNzvTzm6JXEgCgv0pcZDHku0GhfPL+
         KPRth4Sj1uoFlQKrWjXR057O9e5PxB5z7zWeI79UVuRUhN/3RAoy5ZtBOYUDm4gioIZi
         Sbd2+OrhnytaYFX+dyYoQw8TSylROKw+cHoYxywcaN+05k19vAcxPpN7HkNqpMsy4ATX
         5WlEsU24wNkP0SAJlhB07xqn/GHxVlCKqKUcyUpguaBI1nqPdkqYA/6cRtfXEyo1MKJw
         FIBx3CIJxBVG+UA8Ce9bn7x3dJKDN3l0GEQb4Wx/ZDOKG3p3l0tTdeua7xDihernHbRQ
         pSEw==
X-Gm-Message-State: AOAM530OKKURxSyqUaDjxabtp8eB8cRdmfBlzzj0nWvH+D/3Lid5inq+
        A1ov24MZc2Lj1xfMsPQfjmJuQq+4RjFP42y9DPQuIHWJHBg=
X-Google-Smtp-Source: ABdhPJyddGEwsC4mNNF47VP5l+S8zVCB2pYo1hQApbROTYwKbZ1sVR8QU5v6NdTE8YUkPBcgx5yxxj70ySw6FOEAQjw=
X-Received: by 2002:a05:6512:3150:: with SMTP id s16mr13090870lfi.47.1595324780657;
 Tue, 21 Jul 2020 02:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200718212608.65328-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200718212608.65328-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 21 Jul 2020 11:46:09 +0200
Message-ID: <CACRpkdYxyJ3E5113SmGnZ6giD-L3HsQwUjN96Qiiwj5vUYSDnQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpio: aggregator: Further improvements
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 18, 2020 at 11:26 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Patch 1 makes sparse happy about locking and, in my opinion, improves
> readability, though increases LOC count.
> Patch 2 simplifies parser by using existing helpers.
> Patch 3 refactors loop in parser for better readability in my opinion.

I see you retracted patch 3, but patch 1 & 2 looks good to me, I just would
like Geert to have a look at them first, Geert?

Yours,
Linus Walleij
