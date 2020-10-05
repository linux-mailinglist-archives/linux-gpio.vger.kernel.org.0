Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFEA8283498
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 13:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbgJELDK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 07:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgJELDJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 07:03:09 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE77C0613CE;
        Mon,  5 Oct 2020 04:03:08 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 22so1826356pgv.6;
        Mon, 05 Oct 2020 04:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dYeyiSzGDL8r3GGJzisSsLBifbWtft3PUKYtO3vucTg=;
        b=q69KEnkreeWEaYAps1uLSbmI4fQ06XNnQHwHmGe+rOnllcl8ZDYBQHVhiUJf4T4prA
         4lL6VNfKg3b+SHot/WCbhUiM9Zo0dX9aztSYW+fSqvKLx/Tx5fVtJ1zTGog36okYLtN+
         BSPFM/x8hPSt8U9qBMmfX8TR0R8Lk2sGJpdff20ohlhW/t4FM2eALT+9JrVJAJW9lkhO
         tiVv0aPMTZqCdVuItxHW+cX4Hl2KxuO8s7IB+uupweuAJS6w96fkq1je1GWvLV5zVdiI
         4cnOtLOxA4iMoIWDlEiSiezHji7QovTfVEW+ifT5ZL/tDU3XX7knSNv4APGlM+UFEq40
         X64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dYeyiSzGDL8r3GGJzisSsLBifbWtft3PUKYtO3vucTg=;
        b=KzPXoaNpYmwRrTsOZ4U7Z2DicMKfRJyGrErIMP2FUyf61seywEEyy1cVCNlqcrdzNU
         5rqbayYo2wrnbv6AQOq3YBWnX5rKo9WVHYA9vDFj0P8CIQzqyJhnUFPwtcOzgY6BO6RA
         zJAVwfg9OyDHVxA2ZCFkpH+Rm/rWiqCgVkIabAqvXCbgSBA7wkpRedojW7aFt1NBuQ47
         UuKC+PHmJjSYcQ1qmdtnZ2Oxs+luyT0H5UjUfu1WG1ealUDxWf08Xfsd13Ws+O9dPhDA
         eyfCakRhdrP0F+l41l7AoxKwcLDMceOZK17ickYIyndUhBb18ggPfFcifskCExiQ53yB
         y7dA==
X-Gm-Message-State: AOAM5300FWUSsxgdOVNV3MgsXFi0hYyTihMgMVEkeXAYTIGdQxdU6myr
        w2C4UrCV3nJTTjVcYWpTeqI1qQvND585KYNQ014=
X-Google-Smtp-Source: ABdhPJxGWZcV25laJk6Hi441NAFggGWGUjaGNCTGkdt7bPEpoaA9mMhLgaAC5jrFFW4aUVkdZ7NicAkYB1DEVsXRMn0=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr13687560pgj.74.1601895787957;
 Mon, 05 Oct 2020 04:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201005070329.21055-1-warthog618@gmail.com> <CAHp75VcJYwysrb00TGSpu_cFf7_-mAhu871VM8Of3y8FB_+m3A@mail.gmail.com>
In-Reply-To: <CAHp75VcJYwysrb00TGSpu_cFf7_-mAhu871VM8Of3y8FB_+m3A@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 5 Oct 2020 14:02:49 +0300
Message-ID: <CAHp75Vcf_wDEM2ErQ=YQs-t5yCWJfsx_-vXJ=dAayyKq65+X3Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpio: uapi: documentation improvements
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 5, 2020 at 2:02 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 5, 2020 at 10:04 AM Kent Gibson <warthog618@gmail.com> wrote:

> Patch 5 as well in case you agree with my comments and goind

and going to address them.


-- 
With Best Regards,
Andy Shevchenko
