Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4C533EE40
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 11:26:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbhCQKZo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 06:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhCQKZX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 06:25:23 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 361F3C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 17 Mar 2021 03:25:23 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id bm21so1716615ejb.4
        for <linux-gpio@vger.kernel.org>; Wed, 17 Mar 2021 03:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dqPWZVXLmFy02PuOKcULDEk9+uDMlOTgp4Uc7OBSurA=;
        b=hWUUnb7+cCjXnVlBzK0QLHokiQOWBbbmJu4agdXGiTve1kMkf8a6XITT2KQnhQY2kQ
         k2wLQM0vvH49oND41Tu8ZfBVJey/0tQAiBEk/DJk0j7js7zMjNbNhwPy5i4y+QCjX6fD
         tgKbGpxvveOVSoJN/5riUxFQM9WbVBrmu1oDo3aqIr9tlrDuKM76Zp7tp7CWCQwkMqkA
         i203Z0mMDjJXKiExh885/CpIVEyTjyWUGicFnaIn/3vD2l1A/yRV7ximEwWFmbe/q+EJ
         3Fx7Qpcc848N3GZZFppUWa6XYgtZ1/ZE/4yn7hvqtJ62x+amRkfRIYatNpG1D99YGIL/
         0I3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dqPWZVXLmFy02PuOKcULDEk9+uDMlOTgp4Uc7OBSurA=;
        b=OkkssprQwTva3YyAgNaH0f9mfzOHaT/jPBYsmmaGJWaGQ+ncnywRHKkHGg4y+wEaor
         3P2igVQLwUK9htkfj46fCsLLg2nlcpLJJoGZNCSrcb+G1GiXzXYwwe+muUmwc4Vr1MGz
         /6QwxqRaENgtzzcu50SwA0AZpJ4/1UbO3hGF23pXJnUChqb3bcM8CSriGDz4gee0VWuq
         8NIlfJjleCOPMRQanq4ZYFkZZj7NWCJ8uEWRcDEauVS7DY9xtxsFNhW6yw9mIkkqbrrn
         oQap/ujkwb4EGvrfwrXJbzucc9xz+UslIiaYKXf02jAruYDeFyx6U2ijvFPAIAgbprxb
         7xIQ==
X-Gm-Message-State: AOAM532zDcPxwJigJTWWdEppNtOSHGuv57tUA6w5q5jOK+3AMtgJ03vk
        6DvZ3SxLEZnUNjQ0oSjX7q3vBJMtDgQbZ5AD2eStKCBOoR0=
X-Google-Smtp-Source: ABdhPJyKIZPTVzkxMiMNoxAqWZGq4tcAWnCUa98Zk0no6NFVWiYzT0ioHaLAdDdxmPMU44SAkhn290seL0cGAYXlnnA=
X-Received: by 2002:a17:906:c0c8:: with SMTP id bn8mr34153553ejb.445.1615976721983;
 Wed, 17 Mar 2021 03:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210309132639.29069-1-brgl@bgdev.pl>
In-Reply-To: <20210309132639.29069-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 17 Mar 2021 11:25:11 +0100
Message-ID: <CAMRc=MesUk9cssFRhrftwwa49hW3rQObLuTBo9pUe_ed6xtj8A@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/6] treewide: another bunch of cleanups for v2.0
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 9, 2021 at 2:26 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Kent suggested I send the patches for v2.0 API in smaller batches for earlier
> review instead of dropping a huge patch bomb that will require more work from
> my side and may later be negatively reviewed so here's a hopefully the last
> part of cleanups that can go into master already before first patches with the
> new C API will drop.
>
> The idea for the new C API is this: all objects are opaque and refcounted. This
> is why the chip was converted to reference counting. Lines were removed and
> their functionality split into line_info and line_request, this is why I'm
> reworking line lookup to return the HW offset within a chip and not the line
> object. Other patches are mostly cleanups and cruft shave-off.
>
> Bartosz Golaszewski (6):
>   treewide: simplify line lookup
>   tests: remove line bulk test cases
>   core: switch to reference counting for gpio chip objects
>   treewide: remove is_requested() and is_free()
>   treewide: kill line updating
>   core: hide the GPIOD_API symbol
>

If there are no objections, I will apply those soon.

Bart
