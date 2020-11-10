Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B2B2AD73C
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 14:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729898AbgKJNOR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 08:14:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgKJNOR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 08:14:17 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F322C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:14:16 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id s9so12873136ljo.11
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OUhMNrjSOQ+Bw1FD3c+VDosxzcBXOSZeX70sYKZW3Vw=;
        b=Gl67TdOApP+aifYxl9aCqaV0sEJJHN+gTaJqlTt6vVOYvI5z/Fc+k999rF8eRiJdKl
         WGESbb5Tv6PaovntOORurY/qUX2gqxIkWiJDF4ugogP8FLmkOd3ckWVi+usGL8ST065r
         Hr2bnQ/gHaxDppAifFNPnro68o8eF9TSW4I+q8VRaqcoEixwkSrTvoIcRYgPWXWeu2Kq
         gn0gU+GVmtwfxbIFSqgvjOW1TvH+urd25ME1WL+Y2/5WAbTVswhBkKqBZFyoAEWUss/p
         M0aDqefIPzZDknM8oVZhXYBQTctROwq/4oafexTBelBP6Jjj1ohNm44h5n5aUEFUjxWY
         Gtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OUhMNrjSOQ+Bw1FD3c+VDosxzcBXOSZeX70sYKZW3Vw=;
        b=KGNs6l4N4hQ5t1PUKBvP3EOdZfQ0kXYoTnZwtNFOjrxqhq1BeiQ/BL28fcvkV9gzVs
         1a9jDAiaASvgD4+RpKJ2g0HsOae1CuK/uIpyNnaPKJ1UKna3pl+eGBS3N+DhcASenLrs
         pnDCK1w9+2svT9BhmWQKBc8L5u4Tg6F3qu+y4/Xo1sRDmci748OX6dXMpiPrSI8cGLY9
         cfjWIG3XU++VfxgBYp4+XdkZG2kgZMy8p5bbKzSIHAghmUFB8zeHvNPAmW36AtkThbMM
         feBZldBrU4kBGj9Bv7qa9VYxLLtzzI52zKvhH4eqEgpF6oTIFtNtlqd5dijFURzIx8UD
         QPkg==
X-Gm-Message-State: AOAM5335KcE8P8TjZqiKPzg7TUEX9hDAKR+5/qv7sWCVhLZeZgCAOsTc
        417JCwX7CJflgo8fDirE2JMLDI447UCWFUqgZtIPYiuYdeWbjw==
X-Google-Smtp-Source: ABdhPJxHe6UIOOpPCGNH092WFyVKa9vEf2NU5ywJdxDBWfXhjVlbjsiNyayuspisEk+NsTiEMNsInaaX5gN8VEDlMuo=
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr8924536ljg.286.1605014055112;
 Tue, 10 Nov 2020 05:14:15 -0800 (PST)
MIME-Version: 1.0
References: <20201106142840.29730-1-brgl@bgdev.pl>
In-Reply-To: <20201106142840.29730-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 14:14:04 +0100
Message-ID: <CACRpkdaoGjA0-wVakz02VJqMzUknoggd5pwUYenkvjJZGuZy=w@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.10-rc3
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 6, 2020 at 3:28 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Please pull the first batch of fixes for this release cycle.
>
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
>
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v5.10-rc3

Pulled in for fixes!

I'll get this to Torvalds too ASAP.

Yours,
Linus Walleij
