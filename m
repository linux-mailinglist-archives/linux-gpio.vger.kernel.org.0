Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B7E27CD94
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 14:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387543AbgI2Mpd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 08:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387539AbgI2Mpb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 08:45:31 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D41C0613D2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:45:30 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u8so5370389lff.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZHvIyjp/HjptDKFZ4oCKWaRPRXAjZeylbH6QYR0nkL8=;
        b=Ap5w2JEWZC58HriJWOs4n2ZnDkichjsVyC8xFiq2J8SswFqIFF+himI2Q6etMI5Tor
         0HAQ0uRCNVT/WCSSr80x6XAjFY/LQ4xwvOUMdklYKWopXOkbo6mG5pWiXGkjhL9AWhoR
         mkJd9fcd4WbUMOwMirSvxIqe90+JMueOwslLwTY1Cl1HLG6ybajV+IRsIMGc4lXQIPvR
         oBODo/qW8n02KjwwuwPp7JApZC1TKPk6oOBjT6/EC/0WfPQWnfnEONc9r+KHAJMXhd/6
         OmuxVY2iKAbQcjHOl6urR/ZSN2Q9c1vixSIZuVdgIvuQVlkxZJPRljV05LRqtXRwdHLf
         cC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZHvIyjp/HjptDKFZ4oCKWaRPRXAjZeylbH6QYR0nkL8=;
        b=p7RZkYoLXb2NAbFO9dKpYCUIV0C+lCELr5xMmkBIq/0tdDOK6dv5QzadJCS/N0ZC5I
         XTWM4YIA5sRXAGqEWg/KEAZfnMSb1fhvqqfS+hgJ19LioUrsRpyF3x7pQ6/ZMGSZcUM2
         XwuDeDjX+pS5gNY4orGcIoYCdL9kIBG98XseiWGIHIOjox4j1aC42MBa/3O4iAEpA4bF
         qkD2kD0wzcapuB+or33aRad+TFCcJ5FilPL4DVqvZfyQItvG7uYWNYxrfrx1i33DLcHx
         h6fM0wyQe+PAKYnUwlkv95jeB4pJzsaqMwb5nvQtCa1SuxXhdn0R4VkQz/8AWaUNk6Ab
         ZfuA==
X-Gm-Message-State: AOAM530o/cEx+LvCau3uEm6zpDOtw9wi5qdDf04F1yUiqLcD558VaK3a
        rwvIo/ZqDIkLM40WP6t1BPEbMOxOYuvEjcef4P86sg==
X-Google-Smtp-Source: ABdhPJxwNJVl7N6DgZU+9k9hMFwLmdKNKDwg3mdA4F/dtZ/iDwTOnDvzTa5ao9aFnFxXSFDsSjTTwZJlbUKTXKsnnAc=
X-Received: by 2002:a05:6512:20c3:: with SMTP id u3mr1062919lfr.572.1601383528944;
 Tue, 29 Sep 2020 05:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593243079.git.syednwaris@gmail.com> <CACRpkdYyCNEUSOtCJMTm7t1z15oK7nH3KcTe5LreJAzZ0KtQuw@mail.gmail.com>
 <20200911225417.GA5286@shinobu>
In-Reply-To: <20200911225417.GA5286@shinobu>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 14:45:18 +0200
Message-ID: <CACRpkdah+k-EyhF8bNRkvw4bFDiai9dYo3ph9wsumo_v3U-U0g@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] Introduce the for_each_set_clump macro
To:     William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Syed Nayyar Waris <syednwaris@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Robert Richter <rrichter@marvell.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-arch@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 12, 2020 at 12:54 AM William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:
> On Thu, Jul 16, 2020 at 02:49:35PM +0200, Linus Walleij wrote:
> > Hi Syed,
> >
> > sorry for taking so long. I was on vacation and a bit snowed
> > under by work.
> >
> > On Sat, Jun 27, 2020 at 10:10 AM Syed Nayyar Waris <syednwaris@gmail.com> wrote:
> >
> > > Since this patchset primarily affects GPIO drivers, would you like
> > > to pick it up through your GPIO tree?
> >
> > I have applied the patches to an immutable branch and pushed
> > to kernelorg for testing (autobuilders will play with it I hope).
> >
> > If all works fine I will merge this into my devel branch for v5.9.
> >
> > It would be desirable if Andrew gave his explicit ACK on it too.
> >
> > Yours,
> > Linus Walleij
>
> Hi Linus,
>
> What's the name of the branch with these patches on kernelorg; I'm
> having trouble finding it?
>
> Btw, I'm CCing Andrew as well here because I notice him missing from the
> CC list earlier for this patchset.

IIRC there were complaints from the zeroday build robot so I
dropped the branch and I am still waiting for a fixed up patch
series.

Yours,
Linus Walleij
