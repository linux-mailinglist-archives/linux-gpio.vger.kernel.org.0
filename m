Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2C81382501
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 09:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhEQHGf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 03:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbhEQHGd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 03:06:33 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CE9C061573;
        Mon, 17 May 2021 00:05:16 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id gb21-20020a17090b0615b029015d1a863a91so5015471pjb.2;
        Mon, 17 May 2021 00:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BAtgXmEjVS9Lr7QYLFCDa/lR4136fUKXGdOTU6CO3Nw=;
        b=E6+zNoW1SSwDyM4BKK6Pnzxx5XYNQDFpK7dmVLmF/0Pf1DiC2PDCjbzk88GxxHrpaz
         ui4QZq0PdvP6zVfucMscsz31lAID2ge2pKVjUzO0WN9c3wTBy43p3SRSYuCMpRoKPVsb
         dqiHXJ22ggH4AZz1yoVN2Wnp+3DoBLqPICjgUtl4K0s1lrPdcnXaa/p9GqhIxt95CRjT
         hvX2wcz3HFHSf6f0morebBrDTshKbQzJzbDJ96xNdxSE8ITbtyhHpjr/t/rIra2+wCQG
         6an7GLkS5TBHqL4dy5EyPlfwTtiFhQEUWMmq61Y+/+OU4vOcTuDFAYc+fNrprGVItpjl
         x+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BAtgXmEjVS9Lr7QYLFCDa/lR4136fUKXGdOTU6CO3Nw=;
        b=tGgq6YPDG5Sv8kxAgh3zPWIq17L7flAUk5YfW+M4znsKGfgIA69UR86IR551YmBdXX
         7FAlIRXaOImvHEZmUOlqeM6M4yWxyCRbf+GFQeSRmP8la8tanhrBeDvEi5Tf4Wa2D79U
         me9+vOcXyuh3kkwddJLQR3iiQPuLEToro3H18krgjgyItGdoPp9rvwy+vZZUQK9PoKRv
         /PAnIPbjkPdmigdsnscgX8hHhpKOOqaoZFEca4Jk0nMUYO07ptRzK9XuaWz065HZgZwK
         ChBJAD5u/H6TAyDIys1HFgHl2rYxShZiCc/2wpG8scVnwFMCriAEBIokq0//GNBj7R5u
         ZA3w==
X-Gm-Message-State: AOAM532I4gxd4zq/e7U86zJHKVPNxtgilf1955EGM/PM3EBCRRPxQw0C
        qRK6FoAw7V7bcazE7lcNfSfTXYuqC9CTQvOAgNblI8VSaXc=
X-Google-Smtp-Source: ABdhPJyqF+o+4ZWFScsTFOEr20R8wR/0TlcoXAxKSDuSS7Rjs6Cx8+b+97X2qPXnsj1fWbgSc87SFcC/xvmpOvExbmU=
X-Received: by 2002:a17:90a:6c23:: with SMTP id x32mr30213143pjj.228.1621235115869;
 Mon, 17 May 2021 00:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210513085227.54392-1-colin.king@canonical.com> <ca5918c4d9a240bc80bad1ad16d929f9@AcuMS.aculab.com>
In-Reply-To: <ca5918c4d9a240bc80bad1ad16d929f9@AcuMS.aculab.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 17 May 2021 10:04:59 +0300
Message-ID: <CAHp75VdJ9n6Sm2HQYE_bfg-5vXceA3aG5aXOfCctxDjzhLVXpA@mail.gmail.com>
Subject: Re: [PATCH][next] gpio: xilinx: Fix potential integer overflow on
 shift of a u32 int
To:     David Laight <David.Laight@aculab.com>
Cc:     Colin King <colin.king@canonical.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 13, 2021 at 1:04 PM David Laight <David.Laight@aculab.com> wrote:
> > From: Colin Ian King <colin.king@canonical.com>

> > @@ -99,7 +99,7 @@ static inline void xgpio_set_value32(unsigned long *map, int bit, u32 v)
> >       const unsigned long offset = (bit % BITS_PER_LONG) & BIT(5);
> >
> >       map[index] &= ~(0xFFFFFFFFul << offset);
> > -     map[index] |= v << offset;
> > +     map[index] |= (unsigned long)v << offset;
> >  }
>
> That code looks dubious on 32bit architectures.
>
> I don't have 02b3f84d9080 in any of my source trees.

Can you please be more specific on which code is dubious on 32-bit
arches and why?

> But that patch may itself be very dubious.
>
> Since the hardware requires explicit bits be set, relying
> on the bitmap functions seems pointless and possibly wrong.
> Clearly they cause additional problems because they use long[]
> and here the code needs u32[].

-- 
With Best Regards,
Andy Shevchenko
