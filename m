Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2183733C356
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 18:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234788AbhCORGt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 13:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234773AbhCORGT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 13:06:19 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139F9C06175F;
        Mon, 15 Mar 2021 10:06:18 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so14737723pjq.5;
        Mon, 15 Mar 2021 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V7IMmjZ2ome4sKp2EWacQS62zqJ+CHMpQY1RgLXOEn8=;
        b=RWstzBctQjzNlskjf25HMDG8FuSbPRmreqUDL8nLvOZqOShocJCmVa5j2lJuWoQEvm
         cVPaJOu+o9x4duK9xCpJjRJu7+EEPmAZQb41FuwNa9BzpA2zQVR1F3T8u1PHNomoK2yY
         rNWtzOaFFZAETSjiNAiFrKNkfCAoRZx8Rd3yRVq6XBrJWmzNu9q3u6AXm7MZaeEQJbBw
         6eVU9cqu/OPB8tXk5zPTyU+dKYNuYkXsTHqHahDYPjOoGMXleMYkSNvjSNSJbJL2p8jg
         tSxjUWUGgZ66EzQNQ4LOOZUpWds2YEY9Kkm+aAo9dnBm4lvvg5s44umWo9uOCUxQZYxN
         zffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V7IMmjZ2ome4sKp2EWacQS62zqJ+CHMpQY1RgLXOEn8=;
        b=nRBxT20pcbBNbJivfCTvK0A1BvDcjwEO17YYyuy9P2iEf8x2Q3qaGNkv/E7/aphfcX
         ph5+2B4q1QE+PeLl+ltgjpiskd0FV8Wzgj6c0LN6ta1PSeLLFknSlgBbEb+bUcZoLnk+
         7GlYRCnRWkDF8rAzmTS1d9JpTWyWHH1YuN0PLDYQ4N0J7AS+YE+0Ziz+EHEsmHjf7miE
         1UuSoqMDpd+32Q3T1EYGwgSBHwgRVDG5+8ZBoZTsDk24CG/mNGbs1YX7s4TbpB9CCFYF
         J9gjDOIG6PHqVaUEd02OMSv/yr4HDzXzDI4W9Jsb7oA/f18luH7mb7eSiUccWdPwr8jy
         RnLQ==
X-Gm-Message-State: AOAM532Rc+nCxx7XMGBt8gxndO/NYPaHig2p6LiGk/zqVOxdsiK/9GA6
        G+xjSFCFDLbWTsfu5aHtB2V5oPrYZuJjiDu5A4r62/db2rWKOA==
X-Google-Smtp-Source: ABdhPJwokREzA5Kz3WMcEdCsj14E7nTUPnlAIe9WUeNdjUp5oJiT1aycDnGrpWKlL3l2x3i9SAWaR5c/bEbQniz+r0A=
X-Received: by 2002:a17:902:ee02:b029:e6:5397:d79c with SMTP id
 z2-20020a170902ee02b02900e65397d79cmr12525321plb.21.1615827977610; Mon, 15
 Mar 2021 10:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210315165940.90055-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210315165940.90055-1-andriy.shevchenko@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Mar 2021 19:06:01 +0200
Message-ID: <CAHp75Vcr86EPO2MX3z7z_mpiE=RrMHVN=1YCfzoYUh9Kcfnxzw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: mockup: Adjust documentation to the code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 7:01 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> First of all one of the parameter missed 'mockup' in its name,
> Second, the semantics of the integer pairs depends on the sign
> of the base (the first value in the pair).

>          This parameter takes an argument in the form of an array of integer
> -        pairs. Each pair defines the base GPIO number (if any) and the number
> -        of lines exposed by the chip. If the base GPIO is -1, the gpiolib
> -        will assign it automatically.
> +        pairs. Each pair defines the base GPIO number (non-negative integer)
> +        and the first number after the last of this chip. If the base GPIO
> +        is -1, the gpiolib will assign it automatically. while the following
> +        parameter is the number of lines exposed by the chip.
>
> -        Example: gpio_mockup_ranges=-1,8,-1,16,405,4
> +        Example: gpio_mockup_ranges=-1,8,-1,16,405,409

Just a side note: it was always like this (I've checked the initial
gpio-mockup.c code). I think you have to add more test cases.

-- 
With Best Regards,
Andy Shevchenko
