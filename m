Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD481AC04D
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 13:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634113AbgDPLxl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 07:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634099AbgDPLxi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 07:53:38 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482C0C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:53:38 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id w145so5364820lff.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m8ZQeMlZwt4Luzk/CrzC0D37KaOrj1I1Zm2f8GE934A=;
        b=xuyhjCJNnvRgEB+JDis7XdLSadcTJyK9uVilGBmrq53lTLTBmX7XkYb6umQe8YK+nr
         fxGXOhvzNg4cvUdv81KMGbUcvKQRMZOS6Ff4T8GR9IPRmq7U3VKYJTp3Tu3PtlCH0Nuq
         KMLxip7oYzNL7+3YL6PVaUW13b1fgkzzQaiEjcitJGSl4DixblUV/RK8UwzSDf5gYdhu
         boMl3sGMmPDF//s1/2pV5w4k49fVPWKMqrGc8RJYfu3yBn0JNY4nkMiULGo9e0Xrw9j3
         zgej0c7d/1qd/TggB4iIkDa17CwrnXRHSSvYpe8/EsuLJQAKpP10Yb0FcETK0StzBxWn
         t0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m8ZQeMlZwt4Luzk/CrzC0D37KaOrj1I1Zm2f8GE934A=;
        b=sup4lguzanM/+LJ7gipNkXrSK59dPifLinzhF41+ikfW7vlEDKBPsLg1d0wiFmEp4q
         dAXEtERqGe73647S9g/GiWJRia6HTK/c5cQ18ZCONa3balS+vZVLGr/sAC71VEDi0S9V
         ejYWR8yU3CKFc580j4KftQeFAYFgCXgdO4ZW8aaoSJNHtX/OnH//Z8sNe3JwXDmlJdtL
         9A/4XDjIa+VsjF7dNdEyTM+gyZ4wb7nSpk5NovlmuDutSeaRLOxKGr2k2OlnAck0vu9W
         +IUf3GZmd2e/VFhPVyQpEgcxKAcEaRJEpuMyEhxCiD+4gRZM+egfAj07zaRsfN5BYWEX
         HYhw==
X-Gm-Message-State: AGi0PuYU2DX1oV8xBbJdu/Q2MHA2zGCU8veMRami5hDGLDEwAVe2Rci9
        sJel1CNugVpDfs0Z65PrufJDfN+Cl9EEC28HoS5KBA==
X-Google-Smtp-Source: APiQypLwJebkvpewjgmUDZ4bFXdTBWDUH7wGL9hEnXECiQww129uiHsEPRZGRuSm+dgP+CDFoSHw6jGbYOsM0Q/69C0=
X-Received: by 2002:ac2:5c4e:: with SMTP id s14mr5927482lfp.77.1587038016764;
 Thu, 16 Apr 2020 04:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
 <20200415141534.31240-14-andriy.shevchenko@linux.intel.com> <20200415163710.e26czil5abouujzu@mobilestation>
In-Reply-To: <20200415163710.e26czil5abouujzu@mobilestation>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 13:53:25 +0200
Message-ID: <CACRpkdaO8GMXOOMomzmzfhDqYfgdhjTq8XvQHXuGRmnrfk7bOw@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] gpio: dwapb: Use positive conditional in dwapb_configure_irqs()
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 6:37 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> On Wed, Apr 15, 2020 at 05:15:33PM +0300, Andy Shevchenko wrote:
> > The negative conditionals are harder to parse by reader.
> > Switch to positive one in dwapb_configure_irqs().
>
> Sorry as for me this modification is redundant. Yes, I know that if-else
> statement in some cases better to start with positive expression to make it
> a bit more clear, but in this case I'd leave it as is. First this rule is
> applicable if both branches are more or less equal, but here I see the most
> normal case of using the dt-based generic device, which doesn't declare the
> IRQs as shared seeing it is selected by far more devices at the moment.
> Second the non-shared IRQs case also covers a combined and multiple-lined
> GPIO IRQs (chained cascaded GPIO irqchip), while the irq_shared clause have
> only a single IRQ source supported. Finally If the code was like you
> suggested from the very beginning I wouldn't say a word, but this patch seems
> to me at least just moving the code around with gaining less than we have at
> the moment.
>
> Linus, Bartosz and other GPIO-ers may think differently though. Lets see their
> opinion.

I think I already applied all patches with the batch application tool b4,
without properly checking which patches you reviewed and not, sorry :(

However if any change is controversial I can revert or pull the patch out.

Yours,
Linus Walleij
