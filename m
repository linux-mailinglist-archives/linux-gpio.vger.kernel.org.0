Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9541347039C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 16:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242584AbhLJPTl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 10:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235353AbhLJPTl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 10:19:41 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015F1C061746
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 07:16:05 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id o20so31377218eds.10
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 07:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5OH9qBbqvt4WBvP8D0eDsTshfx6d4drjBogVvdSBDcE=;
        b=GI2pyajyICRQT9VHZY7NCbccijp4sX7SAS0Z5qayxR4B2b/jcMeYn0PHhTO8a/UaZL
         xObP2o0SBGpkNCQXMBGyYZpHpyhlAliFuwtcWXISq81fih2mqy86vEtqlP13DfWzDNNt
         fhfbchHZHFKtc8iWSw/F6TfL6eXiC/1CkDyk69VaSkD6NKyMv1B9FjyOvUyucLxh0H/o
         1X+85NSUs/zt19eXsGdTzZoGm6Au3DM+FvDqGBpeUa3TLyz3fUEP6syAp3YMXp7nDVzK
         QWbNGPtwXTymSkxRQUIPLHL0Cq41CDTc34ztYY5aOF5yvlQ446PG95+5O0JXRNHbsC7Q
         VgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5OH9qBbqvt4WBvP8D0eDsTshfx6d4drjBogVvdSBDcE=;
        b=yF1ekD+byHSoWsBR+eRIlU1wUPtcJ87dTnYnoOjvDwzYghK0RlhriN02v7dLh913nJ
         8lIDTvwD89JpQVFm74u+gxGNveaj4ws28+/HPmhiVIHkPVaCtLm+0CDMYkIBpzEsSQQl
         7iKJw/i5ZG/ELoLdrqWj33Q3BIgRAeBwBR0/QoJ9MYpq3P5RsAYAVTBA6arkETs4INd6
         /OWSU/VhjvV99hNHvQTBwbSKmaF7T5A3+VpgIeBlXCahIw3NMYDvjE5xwbczaLbqPbp8
         9XFqEYRvX5pSYcVzRQUP9YaCRDZCd2sZcRqNO3f1lEwy6K01aLrE7XkjhT2EJr1hjSy7
         Xllg==
X-Gm-Message-State: AOAM530W0fhZblsRYm4xga0SfdbqLSjtRjPfNjb5SdLHB32wyIhIRjxK
        3AlCUcFjMuDEf7FX/RXcg4OEzpI8bX5Ne6K4DWQRpPMTPT4=
X-Google-Smtp-Source: ABdhPJwaKMUGD0FGA66KUbxvK8xcaa++SfvuFpQu6VS59cWGuJmpxlG88gtXPqegmq1EHGV5YbZVuCHkJ8+BSvnRHJ4=
X-Received: by 2002:a50:cdd9:: with SMTP id h25mr38332780edj.0.1639149336711;
 Fri, 10 Dec 2021 07:15:36 -0800 (PST)
MIME-Version: 1.0
References: <20211204171027.451220-1-iwona.winiarska@intel.com>
In-Reply-To: <20211204171027.451220-1-iwona.winiarska@intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Dec 2021 16:15:26 +0100
Message-ID: <CAMRc=MdBp6HOKtV2QDrGYrqneXMbJZs6zbXCGnq_B9a4JA2i8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: aspeed: Convert aspeed_gpio.lock to raw_spinlock
To:     Iwona Winiarska <iwona.winiarska@intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 4, 2021 at 6:11 PM Iwona Winiarska
<iwona.winiarska@intel.com> wrote:
>
> The gpio-aspeed driver implements an irq_chip which need to be invoked
> from hardirq context. Since spin_lock() can sleep with PREEMPT_RT, it is
> no longer legal to invoke it while interrupts are disabled.
> This also causes lockdep to complain about:
> [    0.649797] [ BUG: Invalid wait context ]
> because aspeed_gpio.lock (spin_lock_t) is taken under irq_desc.lock
> (raw_spinlock_t).
> Let's use of raw_spinlock_t instead of spinlock_t.
>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> ---

Applied, thanks!

Bart
