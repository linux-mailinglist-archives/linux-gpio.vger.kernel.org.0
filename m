Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAD93824F2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 09:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234905AbhEQHEr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 03:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234274AbhEQHEr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 03:04:47 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB86FC061573;
        Mon, 17 May 2021 00:03:31 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso3145522pjb.5;
        Mon, 17 May 2021 00:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kso+u5oDEUI6hC/TpN6G+VEPeqtVt8JMKDkpe0hvQw4=;
        b=NEbHNwThWEj/g23crYRi7RqFA8QTN7P7vSE8qulvyTyQ6IEA61lbeLgBIMLxpkA5kZ
         ugEXfzy15FDU6bAn2yycy1il8SfAeERdmFfccsen7A2kODq5Zn/w4FvX3wlsdKrU+8u9
         a5RfT7u8xCwzH96fptkWr3fGInei2PDt1l9JfMIdwsktQ2Tl149U+R07krzvwhkl/iY5
         HAGionsDO3VG4dnaLIokeyFqrTBmQydqVgclx0qJUoLbm/BQycSSeAHfJF7YkxQPzVz1
         IF4DXfGjlsuH2IOQ5ETXDc2Kia28lut6eHhyLpVZzQtXKD2MyEw8puW1psx4VfHsiJ13
         SfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kso+u5oDEUI6hC/TpN6G+VEPeqtVt8JMKDkpe0hvQw4=;
        b=AhHFJq6bxUM/lRkmY+mOBtlLQ9k/rNYWYJRA3970rlhd4CVjr1rSM5Ys6rdWG6uowf
         coPQO9t1pV6ZvBnNwvCcGk+UFhlKi8uyN1RP7Kgzks9cByS2oo14PpYt3cHCeVDEPl6R
         ljWaMGJn1crzJhxcOQt/GBFlUdcI91O/TMOY6cZQdj2e7uT6xriouBlYPSViEmIn7CyK
         P8ZBq+AoKTow40abOsKJECtPYS1Eyj9BhcT7vFtmGcMu8vToIK6YZ3wRgK9GSfCJAc0w
         b7p7uUnQ4PwX0EGqF7D+My8VQkAQ7qw2BdwUQ0IGPGP2Ibm5xCAs6d7vV8+Gk6QVQk4N
         yphw==
X-Gm-Message-State: AOAM533G446OIKOH39jxCKjk31pU2vU/MHLxw3D1BN0po/TYaidLU2Wc
        o3CgxIbnYbgbRBQOAFnaVz61tuu/ebjGs3+oSZE=
X-Google-Smtp-Source: ABdhPJzEYwkmCqhc0PcoCvbscW8cdar0csJ9Ro1rhG3jcTsBopXsi87oK+hq4MY+OFYFMaVphW4HofSxoxS8Snj4u4Q=
X-Received: by 2002:a17:90a:d184:: with SMTP id fu4mr1421945pjb.129.1621235011120;
 Mon, 17 May 2021 00:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210513085227.54392-1-colin.king@canonical.com>
In-Reply-To: <20210513085227.54392-1-colin.king@canonical.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 17 May 2021 10:03:15 +0300
Message-ID: <CAHp75VdvZEhdmui0+1eS0BXvxBs60=uB0zOPex_TTDTrK7ewnQ@mail.gmail.com>
Subject: Re: [PATCH][next] gpio: xilinx: Fix potential integer overflow on
 shift of a u32 int
To:     Colin King <colin.king@canonical.com>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        kernel-janitors <kernel-janitors@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 13, 2021 at 12:12 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The left shift of the u32 integer v is evaluated using 32 bit
> arithmetic and then assigned to a u64 integer. There are cases
> where v will currently overflow on the shift. Avoid this by
> casting it to unsigned long (same type as map[]) before shifting
> it.
>
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: 02b3f84d9080 ("gpio: xilinx: Switch to use bitmap APIs")

No, it is a false positive,

>         const unsigned long offset = (bit % BITS_PER_LONG) & BIT(5);

See above, offset is 0 when BITS_PER_LONG == 32 and 32 when it's equal to 64.

> -       map[index] |= v << offset;
> +       map[index] |= (unsigned long)v << offset;

-- 
With Best Regards,
Andy Shevchenko
