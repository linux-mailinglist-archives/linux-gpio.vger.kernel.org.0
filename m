Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A861FB660
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 18:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfKMRZi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 12:25:38 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34922 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfKMRZi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 12:25:38 -0500
Received: by mail-lf1-f65.google.com with SMTP id i26so2644008lfl.2
        for <linux-gpio@vger.kernel.org>; Wed, 13 Nov 2019 09:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oAzSv2Mvk6IheJ/u8ODFQ1n8uf6WvVuBbeSIdLpuvlk=;
        b=QgbpGTNIAngMvYMFKXkjL2KfYegiXftTRpCysfp0Gw7ELXpofHs0KFgmQaW5y3xLcI
         SkvUuScK466eMzDRv7sLqmLlfZj3k8mIHA0JKRaVpTzdxwIQf5p+aI/CM1UbTo5ihZhJ
         JjhKR4Wm/Jxpj1EI7V66kbUomTNqN4VwMQOQyuN040GEzh+NhFnVKPVnv+a95sULh0ja
         kpW1YX/mTw31pxH+VZokIKLmI1GNCQ/o+3Rj12nETD14ClI+klwWIh9IJ9X+eql/CtXy
         SrF7ZV7whyyD42MJpIrZpXV89qK6gZidbwiLPQZzvvJh5PGwh1IXvFy+O3Bpp9QkvbqH
         y6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oAzSv2Mvk6IheJ/u8ODFQ1n8uf6WvVuBbeSIdLpuvlk=;
        b=tTw2nGEHFDVqp6X8jFbN3mkd6ZD2CN4Mo4HLPXL3X3s9Nsgah9cY1ls2V6TLvRQZ7V
         nBKytp2vAZ98qMJ3TZTZgFDAx+cKWFHD4DdaIytasbrwg2k4CWLuXbaaeYmMtWnsTgjt
         kr91BRHOISRBUECeJzpm/gegr6p/TR3/51r45odF/mDqD6A3tH8ry8akNGywX0BxFkXs
         VvKDEnIFCwD16/eNGVv0OxxmmV1U/oBBHS/I9meMcWkWuyIDv4WXvleTCuWFjCVyXau8
         6KsanKkgWbj2X9VS8lqHO8jBn4sSaGN1xlFYr570Tqop514a8t2BoqLGb2iVV36EXq6g
         RM4A==
X-Gm-Message-State: APjAAAUTjjUfIGBDU+ffLtFmOhOUfMKu/W7J5heOuogRTfSqQYxnoy6c
        lFA12V2vTYxq+4gkmZ4V9N+CUwXwh7uYxIPj7ExkvA==
X-Google-Smtp-Source: APXvYqx0O67z4KxCQGnc+urahDu3sinfbuvNffF+3f5qwX7GSe+K5hJrbOwEUWs2V7/Ylsk2cMSqj4x2BzLRtYU3/PY=
X-Received: by 2002:a19:855:: with SMTP id 82mr3489496lfi.44.1573665936526;
 Wed, 13 Nov 2019 09:25:36 -0800 (PST)
MIME-Version: 1.0
References: <20191105203557.78562-1-andriy.shevchenko@linux.intel.com>
 <20191105203557.78562-4-andriy.shevchenko@linux.intel.com>
 <CACRpkdZ9A+VjUX8kyOQ0SYWXu8VD+fVdthsgGbdZWLDzYuU_nw@mail.gmail.com> <20191113132203.GE32742@smile.fi.intel.com>
In-Reply-To: <20191113132203.GE32742@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Nov 2019 18:25:25 +0100
Message-ID: <CACRpkdaUhMRRHYbvs=K10V7f5BdRPMNJ=M_7hD-nrUA5b6YZ-A@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] gpiolib: Introduce ->add_pin_ranges() callback
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 13, 2019 at 2:22 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Nov 13, 2019 at 10:46:24AM +0100, Linus Walleij wrote:
> > On Tue, Nov 5, 2019 at 9:36 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> >
> > > When IRQ chip is being added by GPIO library, the ACPI based platform expects
> > > GPIO <-> pin mapping ranges to be initialized in order to correctly initialize
> > > ACPI event mechanism on affected platforms. Unfortunately this step is missed.
> > >
> > > Introduce ->add_pin_ranges() callback to fill the above mentioned gap.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thank you.
>
> > I also think DT drivers can benefit from this.
> > I expect this in a big pull request :)
>
> You mean GPIO library one? Pin control is the other one and it seems that part
> of Intel pin control (despite Lynxpoint case) will be split between v5.5 and
> v5.6 due to this very patch as dependency.

No need for that I think, we can just create some shared baseline
and pull that into both trees? (If it doesn't get too messy...)

Yours,
Linus Walleij
