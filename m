Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 627E8D67DF
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2019 19:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729997AbfJNRAu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Oct 2019 13:00:50 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:33110 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbfJNRAu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Oct 2019 13:00:50 -0400
Received: by mail-io1-f67.google.com with SMTP id z19so39520855ior.0
        for <linux-gpio@vger.kernel.org>; Mon, 14 Oct 2019 10:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3Qo/Rngbmzv/JQLKRN5mfszKl+pmOqlkv8HxjEnWgeo=;
        b=pnVS1FBths47MtpPcxS4DdClp5FPDvZy7aCOHsuW1mAKRb32FKa/fuIAqVGaPNK3Y5
         Q02s+CZJBuMEvY7NoLSvZ5opOn5xCZDLg+4otYKa1uPA7lmFy36Xr/GezE0Yhr2mko1F
         sIM6g03UUf/hTl7Scvlxj8LFLv7b+LbcrvwsYtcYASEJPtGoCKsD0AsXeUnv9f2lvne7
         B5sdFU5fJ2xln1M1xcgupXXceYvZXYoZku+ecQM7WkxR7Gg4W5+O6lNaUDGymta6B6G8
         08IjM88VY4A6dt/3/AjyT9ZIF+pe2ilHAzFh4X8KyJxOMQRccPJhrkPaW5njkeGfNwpX
         BvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3Qo/Rngbmzv/JQLKRN5mfszKl+pmOqlkv8HxjEnWgeo=;
        b=hQwbHrIga1yN5yv2E5QNOpf4EizvJb2tvqIwcj3m9jRWwzumLu7+y4Uovh5iT5t7b9
         yoxVTcMhDZbGZlfseN6lWW5YTh9pPjOMRpZLG+0QcokO0tdG5aFD3ccVMztyfeGlsSGK
         4tUm+Xsu4jEK3reLelAoxdOOYWhepmdQN++egFDIrJr5U3o/2WtY0y+LhgNyeaIkKDju
         kk8xnBpTfB8fN8sv2kiJthmzYoQ7bA4PlIRAoR6La7oRIymi7lrPHVfJaooaIkWh6W6G
         2CTi2JJ4/oTbl5HumkqgEiropa7Pe+3b8uyju1ZN8SZXcXPHiRwMOIdy0Spa9cfGOXtJ
         x5rA==
X-Gm-Message-State: APjAAAUdf6TT7k84IZPbj9q5Yk9gCA4hN8JCXh0+rdMCy7acOY7PyKUi
        z+Yma71XnSoPI272M5yKEG/rH8Z/gP4FRTeSKDP52g==
X-Google-Smtp-Source: APXvYqzt9HnRInrXASNEIqFTCAL4G7VKbIg6qJCfthJxKhIiTOiHWbZZrKJvbJ5JEfq6LoyhrV7WUQIU7roBYZp/xSw=
X-Received: by 2002:a6b:7d4b:: with SMTP id d11mr37068700ioq.40.1571072448385;
 Mon, 14 Oct 2019 10:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191012015628.9604-1-warthog618@gmail.com> <20191012015628.9604-5-warthog618@gmail.com>
 <CAMRc=Me+u2brQVo2HwLS+gSDSZWXvsjT59qP75aKRi3PHqMbvg@mail.gmail.com> <20191014125457.GA28012@sol>
In-Reply-To: <20191014125457.GA28012@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 14 Oct 2019 19:00:37 +0200
Message-ID: <CAMRc=MecXd4ZgpwreMKYBjitp75sifQpAKW25HU9EznRL=wxaA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] gpiolib: pull requires explicit input mode
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 14 pa=C5=BA 2019 o 14:55 Kent Gibson <warthog618@gmail.com> napisa=C5=
=82(a):
>
> On Mon, Oct 14, 2019 at 02:38:38PM +0200, Bartosz Golaszewski wrote:
> > sob., 12 pa=C5=BA 2019 o 03:57 Kent Gibson <warthog618@gmail.com> napis=
a=C5=82(a):
> > >
> > > This patch prevents pull up/down flags being applied to as-is line
> > > requests, which should be left as-is, and for output mode for which
> > > setting pulls is not currently supported.
> > >
> >
> > This again looks like it should be done right in patch 1/6 instead of
> > being fixed later in the same series. Or is there some reason to do it
> > this way I'm not seeing?
> >
> The patch series adds full support for pull up/down in stages - in order
> of increasing level of controversy, at least IMHO.
> That way you can drop the more contraversial components if you disagree
> with them by rejecting individual patches, and most likely all the
> ones that follow.
>

I will not - and I think Linus will agree on that - apply half a
series when it addresses the user API. We need to be very precise
about what changes will be merged and the patches must be well
organized logically.

For instance: the commit message of this patch makes me think that it
fixes an issue introduced in an earlier patch in this very series.
Unless that's not true - in which case the commit message should be
reworded - it's not acceptable.

Bart

> And I certainly wasn't going to bundle everything into Drew's patch.
>
> Cheers,
> Kent.
>
