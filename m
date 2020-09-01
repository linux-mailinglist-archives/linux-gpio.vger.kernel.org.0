Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823DD258B8A
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Sep 2020 11:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgIAJ2b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Sep 2020 05:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIAJ21 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Sep 2020 05:28:27 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBCF6C061246
        for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2020 02:28:25 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id l17so742532edq.12
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2020 02:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9TRrfrtWJpn3UPxhfThM2WtZ1Z3NAfZT2bbeVL0QD7I=;
        b=QCbjyQoG4cjmtVAlXC7Wqgz9DdbNiU3uLC6LAWi8VAN80ODsX1vDhfZOFa36eXEu7V
         aruofWUZFzkcjmcss+y8rMe9ltxGTLmMT7uqxzV7sGnGd7dguTsrXyidVLRc1w7Ewz6x
         ckkjb28PidFK39fYNXQs3ye0r2B18Tu4NqTd5p3BjOEIYCy8nw1RcgSf3DQouZMtZ0BT
         gKm+nEFlYc5BrEe0wcVvHoHRks0sY9/OVrQzQDPpp24DQf+sGB/dis0x//diDGVeO56H
         MO7JyEaKTwRUl5wbTwA0WNUfECKrhE3oE87UQhI+oMxvDKClLi1qRy1Ul399bSkP7yvs
         SnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9TRrfrtWJpn3UPxhfThM2WtZ1Z3NAfZT2bbeVL0QD7I=;
        b=Aa+NnQjNc4SNC2Q++bqblkc8KctZgEU/JZWSpuMXOlBirL+8RGSSgrETMnllMwQh13
         JLwChjZqQa4mmI1kCra+5yeX9YVihF656f/gY7mgvbFjogSrehkVi8McHJ8l3fEbfyCF
         miQPCxikwLAdE+Cd9e+/4M2XxqxAOtQXVwC6Kk6EkZLDyiymC7R9oItoYTGm0iK8B8VX
         UlCATue4voAS+eMrcGnXVUyuQRTL54VZzuu0JHw24uBOrCeHXI+clWXNY7g2RVGPp+UM
         1Pj+vHyxQrigEcmqDRt4krTZoe/oW9Zs89wvXfMujR5B68FVmYsEQNAWCOLOrGtD1v/B
         IZSA==
X-Gm-Message-State: AOAM531SxzpjyHbI1qak1PcJGt0NA2WYx1jC3rffE2HTy2Vt9Jt/l6VX
        XOcNQ8BvFxd8SrXqZqN9dpQhl4emK1PpKN/pByrNRg==
X-Google-Smtp-Source: ABdhPJyInbvYLEIE1vAaDbYCzpnM1nCrwbyC3G5zPjqo/nAE5ZWCuCwTjsUH2N6vFjqaAB7ipnaxFb3LmUSlYgNlfyI=
X-Received: by 2002:a05:6402:b72:: with SMTP id cb18mr886610edb.299.1598952504343;
 Tue, 01 Sep 2020 02:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200827140020.159627-1-warthog618@gmail.com> <CACRpkdZZMbfpKy4gcfAzNq53LkYLcL9wm3Qtzyj_K8vkUW9RfQ@mail.gmail.com>
 <CAMpxmJXRY2wqqN3SzfJN+QTWAHYSYz4vEjLKWU82Y=PAmcm=5w@mail.gmail.com>
 <20200827224742.GA3714@sol> <CACRpkdZroNFFsHoBHUFTUUQij7nOcPQiXP-567+fH-Xerv=L4w@mail.gmail.com>
 <20200829013532.GA5905@sol>
In-Reply-To: <20200829013532.GA5905@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 1 Sep 2020 11:28:13 +0200
Message-ID: <CAMpxmJWjPzueMeKopo7qFke05CEePVD4YGbUiN7b_STKoYt0ZQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/20] gpio: cdev: add uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 29, 2020 at 3:35 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Aug 28, 2020 at 04:37:19PM +0200, Linus Walleij wrote:
> > On Fri, Aug 28, 2020 at 12:47 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > > The particular use case I am considering is one I had been asked about -
> > > changing a requested line from input with edge detection to output, and
> > > vice versa. Losing interrupts isn't really an issue for this use case -
> > > it is expected.  Yet the current implementation requires a re-request.
> >
> > This is possible to do for in-kernel users, but I don't know if that makes
> > sense for userspace. It is for one-offs and prototyping after all, there
> > is no need (IMO) to make it overly convenient for users to implement
> > all kind of weirdness in userspace unless there is a very real use case.
> >
>
> Fair point - in fact it is the same one that made me reconsider why I
> was so concerned about potentially losing an edge event in a few rare
> corner cases.
>
> Another point for this change are that it actually simplifies the kernel
> code, as it takes as much code to detect and filter these cases as it
> does to include them in the normal flow.
>
> I had a play with it yesterday and the change removes two whole
> functions, gpio_v2_line_config_change_validate() and
> gpio_v2_line_config_has_edge_detection() at the expense of making
> debounce_update() a little more complicated. I'm happy to put together a
> v6 that incorporates those changes if there aren't any strenuous
> objections - we can always revert to v5.  Or I could mail the couple of
> patches I've made and if they seem reasonable then I could merge them
> into this set?
>
> Cheers,
> Kent.

I personally like v6 more. The code is more elegant and we've also
tried limiting GPIO chardev features before and now we're doing v2 so
let's not make the same mistake twice. :)

I'll try to review v6 in detail later today.

Bartosz
