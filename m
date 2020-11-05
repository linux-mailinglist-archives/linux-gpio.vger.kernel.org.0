Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604EC2A7ECD
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 13:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgKEMkY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 07:40:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgKEMkY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 07:40:24 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B3AC0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 04:40:23 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id g12so1363968pgm.8
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 04:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0djmq6osAtRnRgjNIXW2ehvf+TWflOgVOop7us24XYA=;
        b=Gvt+6EqU6WVemcaOExqg4x+N8Gi/ycXY8H4sjmIBl8ZftYzHwrUFVULr5Zvm7w1A1/
         jdxqy3rEO3tS63FNFwYvagRaVWMqOnaFjSauqB7yb8a0NrLimm02CBsS0R4p6lBwDZdE
         GDVmY0rC1ccNBJNyAhEBDrKvuFLKlrfzGIjVxEYvVBMyxMy0MaFg9RRqlUQgSMoynPdB
         TnziVs8DVP4I+gy4wg+9av1CGFky2B1c7/kJnniU7vZ1lgE3B1OyapW/MhaZuhSicect
         JLdOBdJbuBUKs/TYRCN663fZRORZ17yIlJ7xaxulREuAzgkrryYrjhNnTwM+GoaVXZ6q
         DxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0djmq6osAtRnRgjNIXW2ehvf+TWflOgVOop7us24XYA=;
        b=FHD4EPMerJ4WQZLsGXzvLBfP/NjAqcZK9lOsOk6vT5M36h7Q+3JuuoEBkwNioVlRBZ
         1JW4ae1PUdoyZnC8xIU9Vi+tWdBCnayAmI/EVpMA+mrG9E5eP6fSxpdukVP0LLGOKN6p
         c08a7lnTJCmPW6RBj3xIUjaPoJFFtLo6L39I/zI3AmSwZYimt77H2NLp++/3lvZ02BQz
         oyFlY8fAiAx+0Ph6ps0D7wgiDd5/VuAbCJUZjZGqvmoVzBZx50S4K/PDeZmcGx5hFa2O
         DnkgZK+xwMc+0zGmWHkHb54h/w3GA3lBqUrNXRMmGTjNA6cmtPTaE8DwdUINx23TCyAf
         r4bA==
X-Gm-Message-State: AOAM530wuXU3736i2v9lAVAOen77oTIIRBKNWHXkeUecL+sxMntT4XW2
        FcDlNIjmPaH5v6nPMy3KCkEQ9yBg/MR/NmW+Poc=
X-Google-Smtp-Source: ABdhPJyhmtgXTb0BEn5lLvgVlAl3ZtuGtJPqkVbYxu22Q8PgGcVEn0l3imUMliSHmyM8AQzscx34TRjHMhtJupONwX4=
X-Received: by 2002:a63:4511:: with SMTP id s17mr2230657pga.4.1604580023518;
 Thu, 05 Nov 2020 04:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20201104230703.21466-1-coiby.xu@gmail.com>
In-Reply-To: <20201104230703.21466-1-coiby.xu@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Nov 2020 14:41:12 +0200
Message-ID: <CAHp75VcczvAHE8wztdFkGE=9QKbPFCJ0wxnE9CGjqayi+oZp=g@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] pinctrl: amd: debounce filter fixes
To:     Coiby Xu <coiby.xu@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Missed mailing list.

On Thu, Nov 5, 2020 at 1:07 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> There are three fixes (and one improvement) that fix the debounce
> filter issues in pinctrl-amd.
>
> Changelog v2:
>  - Message-Id to Link and grammar fixes for commit messages [Andy Shevchenko]
>
> Coiby Xu (4):
>   pinctrl: amd: fix incorrect way to disable debounce filter
>   pinctrl: amd: use higher precision for 512 RtcClk
>   pinctrl: amd: print debounce filter info in debugfs
>   pinctrl: amd: remove debounce filter setting in irq type setting
>
>  drivers/pinctrl/pinctrl-amd.c | 56 +++++++++++++++++++++++++++--------
>  1 file changed, 44 insertions(+), 12 deletions(-)
>
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
