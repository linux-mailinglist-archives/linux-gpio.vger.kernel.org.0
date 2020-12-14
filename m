Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF2722D9526
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 10:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbgLNJZD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 04:25:03 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35405 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390255AbgLNJYn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 04:24:43 -0500
Received: by mail-lf1-f67.google.com with SMTP id a9so28376642lfh.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 01:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9123OAW5pYmjSDJewwPE10sYel6ybZNzWOIvx7/gACE=;
        b=gjPxXYZM5nzwAlDv8KG77mMR5nH4pzgHHgIgtJCiyzZqY8p6PJX81Xd7CGtszsj/z+
         +eMIIMYDZAtIfjHi+T/AGEEA4QRCcAKjw9v32+5uvKUL53UPp73dy1BOgF8MXBhx4ZcL
         eNWTuR85VPTsN9wkSOtEC8cZMPfEomDiL8SR4uxbBwgVkddvdirtXJeita8MeeQyQStv
         2xqlsWZkiH5+hPKgTDWKpVgKArq7YkjoepVPlLjHdm5HyGrkkHl6KZkGY+nApfe4NMj2
         xsV1yXkwD3hvJ//iblH3PutzBxOnCx52+7SORl/5KPuwpV4a2QpWV12Td4yRAJiYdU+H
         QxLw==
X-Gm-Message-State: AOAM530szF2nEvKwJWV9j2Gl81yxaoVGnPKtRKdyWmznL/h/ZOfy11Gz
        aiBHVRLvtgUOjm+V9KUU89A=
X-Google-Smtp-Source: ABdhPJx4D5YkdwNqzZxM/Lp+ep5J9Jbq16aOX9lgeRugsO7INcCeVUorLjlgZH5B9/e4OWYODQZckQ==
X-Received: by 2002:a2e:6c0f:: with SMTP id h15mr10791687ljc.305.1607937840674;
        Mon, 14 Dec 2020 01:24:00 -0800 (PST)
Received: from xi.terra (c-b3cbe455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.203.179])
        by smtp.gmail.com with ESMTPSA id y9sm1049689ljy.37.2020.12.14.01.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 01:23:59 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kok5D-0006Xt-0M; Mon, 14 Dec 2020 10:23:55 +0100
Date:   Mon, 14 Dec 2020 10:23:55 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpiolib: Disallow identical line names in the same chip
Message-ID: <X9cvK3M20tAj3GwS@localhost>
References: <20201212003447.238474-1-linus.walleij@linaro.org>
 <CAMuHMdXZft=w4JZz_xAJ2r3AVh1QS-OGrSuVjXd8mR8=Xhr+rA@mail.gmail.com>
 <CACRpkdaGQRHwVnXU6e9apKhxCFf_qWEfSF8ggodOCHjXDSCg1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaGQRHwVnXU6e9apKhxCFf_qWEfSF8ggodOCHjXDSCg1Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 12, 2020 at 01:51:59PM +0100, Linus Walleij wrote:
> On Sat, Dec 12, 2020 at 10:23 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> 
> > As the names are specified in DT, I think the biggest "use case" for
> > collisions is GPIO chips on expansion boards, if multiple instances
> > of the same board can be connected.
> 
> The actual case that happens in reality is GPIO chips on USB.
> For example if you plug in two FTDI adapters (these have GPIOs)
> and they have named their lines statically in the driver.
> 
> This is what Johan points out and also what I find from Googling.
> 
> So I would say hot-pluggable buses. Greybus would have the
> same issue I think.

But it could be anything that provides default names, such as some
controller connected over i2c.

Having the driver provide default names that then can (but does not have
to be) overridden in devicetree if you really want to make sure the
lines are unique (or just named for the particular application).
 
> > This is a bit similar to clock outputs, cfr. commit f491276a51685987
> > ("clk: vc5: Allow Versaclock driver to support multiple instances"), but
> > in the clock case, the name of the clock output is dictated by the
> > driver, not by DT.
> 
> Yeah actually the collisions we have seen in GPIO is the same
> type, where we assign the names in gc->names and not in the
> device tree (or ACPI).
> 
> But I think it is good to establish this habit already so we don't
> end up depending on having to support flat namespaces with

I think you meant non-flat here?

> several lines on the same chip named the same at least.

Right, enforcing per-chip-unique names seems perfectly reasonable.

The only "use case" of non-unique names that comes to mind would be to
provide some kind of grouping like "input"/"output" but then the names
can still be made unique by adding an index (e.g. "input0").

Johan
