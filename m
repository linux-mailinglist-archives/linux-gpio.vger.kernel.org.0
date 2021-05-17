Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29C1538250B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 09:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233706AbhEQHIx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 03:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhEQHIx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 03:08:53 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78DDC061573;
        Mon, 17 May 2021 00:07:36 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id cu11-20020a17090afa8bb029015d5d5d2175so2322454pjb.3;
        Mon, 17 May 2021 00:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OHsOhMkfdmLyNcJTSRWD0EukxlrM/gH9Vk6KCAfzBQI=;
        b=IyUhI2uu0zOZtjLN7fDarrmuuvNJPDXVOSid9BrbEfWTYF6oYJo8I9F7KqHUIpgYvy
         5muluH0L4+lo6AxpJ27QzBgctHIOh+fF46bbve7WjDl4exx+y/hJYOdGlj7yUHxReG11
         M1BIEB0+GHjTNcF01SJJX5Lb/CepTNq91BkoKuxd9oudtS9sWGVIzWNbTMpMZLr8Hrup
         ub8c9fOgYoejDODbHDKkaJE+gDDHLxw8ebLAx/b8Dis3HEkE6KTdIxW4pGZ22h0WEA3J
         /HYK4o6V7gMAfpBgTt82LEzGO0URobsXx/HHRGkocCH6hQMS23qxLtor7T/fihl2F8GS
         W4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OHsOhMkfdmLyNcJTSRWD0EukxlrM/gH9Vk6KCAfzBQI=;
        b=jbJLeD/AU4i80hoVmwUfk2rwRxvMOZfnzY07wDImWCg+UhZcHFSZ6jytzYvu50qnUM
         BbnTsjO0avniysXQcavI9j1aKvxScS4RQ30b8lTNT3z6MY3QvNrEQnScHnfpNXpxc/zU
         9gQSAVsgb8aoquTsbWeys6O5OSUEdlF71hgeAugQlPCgRmCaS0iMbpZbvPIjWt8JXaCG
         TjvzXwGKGQpIM5sBDgFhbAFu5oypLAE/eBdCkMmPgM7qboFDF/+TSeh+UNA13YbMm3P0
         1ZXwYrvNrVnPwrGShDhW/6dcOXYwY+g+1ORW8hg0BR7hzs+DWZFSi2fWwdXqMll2f71U
         4nfg==
X-Gm-Message-State: AOAM531KK4HtgbxIcTCmETVZEt6A4dvmfoqX+/qe/BWHjHBR1bTiYSPW
        lSJ+DI77+HlrD2G0ds3dDDPB8idG2qv/DcdZZJ8=
X-Google-Smtp-Source: ABdhPJxHPEJJFbEnsYM8mbhVJM0hD1ow9LoGY9OOIw1MhX82g4QacUB+hF685k8IhVw3bjAsplJezNGl8RaWF5OcAEQ=
X-Received: by 2002:a17:902:b20a:b029:ef:463:365a with SMTP id
 t10-20020a170902b20ab02900ef0463365amr53310022plr.17.1621235256269; Mon, 17
 May 2021 00:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210513085227.54392-1-colin.king@canonical.com> <20210514053754.GZ1955@kadam>
In-Reply-To: <20210514053754.GZ1955@kadam>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 17 May 2021 10:07:20 +0300
Message-ID: <CAHp75Ve-YWh_sfupwQV0xxL7Vk8GNObJ+6O29RqRMXCgAmemCw@mail.gmail.com>
Subject: Re: [PATCH][next] gpio: xilinx: Fix potential integer overflow on
 shift of a u32 int
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Colin King <colin.king@canonical.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
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

On Fri, May 14, 2021 at 12:26 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Thu, May 13, 2021 at 09:52:27AM +0100, Colin King wrote:

...

> >       const unsigned long offset = (bit % BITS_PER_LONG) & BIT(5);
> >
> >       map[index] &= ~(0xFFFFFFFFul << offset);
> > -     map[index] |= v << offset;
> > +     map[index] |= (unsigned long)v << offset;
>
> Doing a shift by BIT(5) is super weird.

Not the first place in the kernel with such a trick.

>  It looks like a double shift
> bug and should probably trigger a static checker warning.  It's like
> when people do BIT(BIT(5)).
>
> It would be more readable to write it as:
>
>         int shift = (bit % BITS_PER_LONG) ? 32 : 0;

Usually this code is in a kinda fast path. Have you checked if the
compiler generates the same or better code when you are using ternary?

-- 
With Best Regards,
Andy Shevchenko
