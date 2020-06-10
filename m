Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355531F539E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 13:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbgFJLjI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 07:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728471AbgFJLjH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 07:39:07 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD082C03E96F
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 04:39:06 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a25so2050177ljp.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 04:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5IPZkixoble9/9wQuqUteSrJ1tRLpLsO87Bji6xJpJI=;
        b=Fs4o/drNCDx7tniQoQBWSActEQRqOUz2dcAPdTL8ZNB6WWRh5Vb0oWSZcFHgC2Ro1L
         l77l0k2o8qfaW0JtpfOS+13PHSX1m3+UmY2KzMHsA7vlQcKHtx2ivdOnO2r4QawtevaI
         7j9NkC9ArUFEuSZxtez1t766wQsYTsLWA6yTAR6HnvLINv576bZ1AUUwzlP0EMGPimvz
         vlETonQ4KcrWVftuNARhPQaa3Uf064dugjt7lulF4Tq1FQGBmVOmARQFnox41Xak5zrq
         vLgIYfsDXwZEpWYxWZe/hRyNgGTPN8KW6/vS4a6tg4+K0Y5llkYI3WfdJMFwkE0Oiky6
         +g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5IPZkixoble9/9wQuqUteSrJ1tRLpLsO87Bji6xJpJI=;
        b=DxMnPoGwGBuUKalkIsgkO7r2JcR1TwQ1OkM6gLqrT8lbOWu298P5+/w9Po7xWJAW4m
         dwJiDf0wCz4eqy6dVoOPVA/y/qaqzq6c2hjx+e2OhfTFu4PMh3R//D4ozSVOl6m0tyHJ
         8MIAVHCkFiHEkp6prUpYT+wTRhvt4u62ab7eUkvHMK0h+GFFI03GrNNnxmrkp88nb+MQ
         FYe7OFGxrplhi36HbSzwNr0Ywn04lJxv+i5nwmVwIrR5Xj4o64eU/Jjh+ZvPGPTHZ6nY
         jRKRlB9fItAsOcwlHVC4LkVbo5NmP7/LyUPvTiPv7qS8sHY8YeJcE5IhQT7zAtR6w8e/
         6OBA==
X-Gm-Message-State: AOAM533aQEg3lpqjKgpT3HDPLGzkjDiuaJMKZsugru8dJ3haCyH0NVJZ
        Li3T7TcBzmxJXbf28zpB7j1vny6Wpm4BjDVvXRQVUQ==
X-Google-Smtp-Source: ABdhPJyDxkVv5uj9TIQspAqLtGtK38kMojGoLpSgmJlWwiTCmhxbrSgDmp2/28EuUAD5oLtrm4fiDl9lAtxNPZSgHKM=
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr1674609ljn.286.1591789145161;
 Wed, 10 Jun 2020 04:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com> <20200608134300.76091-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200608134300.76091-5-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Jun 2020 13:38:54 +0200
Message-ID: <CACRpkdZer1bUSXoK4wZpQu60mA5pEST8FEFuTrvvoaZ2+1S=hw@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] mfd: intel_quark_i2c_gpio: Convert to use software nodes
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Mon, Jun 8, 2020 at 3:43 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> -/* The base GPIO number under GPIOLIB framework */
> -#define INTEL_QUARK_MFD_GPIO_BASE      8

OK I see this was around before, sigh.
So it's not your fault. It was introduced in commit
60ae5b9f5cdd8 which I was not involved in reviewing,
for the record I would have said "no".

It is exploiting commit 3d2613c4289ff where I allowed
pdata to set the base so it is anyway my fault for not
noticing :(

But me complaining about this doesn't make things better.

Can we simply DELETE this assignment and just set base to
-1 in a separate patch before this patch and see what happens? It's
really unsafe to hardcode base like this.

+       PROPERTY_ENTRY_U32("snps,nr-gpios", 8),

This is however fine in principle but just use the existing generic
property "ngpios" and save this custom property.

Yours,
Linus Walleij
