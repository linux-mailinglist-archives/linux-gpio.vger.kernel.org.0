Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4402D8679
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 13:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438879AbgLLMwx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Dec 2020 07:52:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438878AbgLLMww (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Dec 2020 07:52:52 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C920C0613CF
        for <linux-gpio@vger.kernel.org>; Sat, 12 Dec 2020 04:52:12 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id r24so18387492lfm.8
        for <linux-gpio@vger.kernel.org>; Sat, 12 Dec 2020 04:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vrw4A8+qU5SFd46mLOZmDzd5Ncb2O1fPpwc/d/T5jSo=;
        b=k5s5T11KcOv+QsENv1AXN5Bbcl07KDzZ+ts4kG4qDaGkohzLXH2BAnb02ABeolPkzi
         vP9UXKGSuZ6PRqSu7q82opl0Pe69yMTjrEYvknaMI1Ukh+eTkOFomyNi58M7wIJz1bNY
         m1t/xCja+oGFHYGxdqEj2hTKlkLyNZ2JYbWwcEk9xyLMEYjvwbt6/qTXWdApgRraDFIB
         Zw4H/ndkk6QABi08FjsUSQwTHkpZJ8BqyyXEo6dDNWtvd5Fd+nPyQI6llvE0kS0ulaK/
         A1CTZ3ZxL/kTUccZkdfqSwgqVR8Ad9o7gr7VDuhDnbZmovqkAFJBxgfi6dpvIcbNY8So
         o5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vrw4A8+qU5SFd46mLOZmDzd5Ncb2O1fPpwc/d/T5jSo=;
        b=ZEjPeEn3g6xPh5wa1aMc0T92+jrl/0Q7JJzgMGe4wB1Qf8OithhcbSXeYaBcZtshOY
         WNbCDg3PUC1jx2mkIYMT1L6TE4iLyEK4qkW8XT4bJn9tOp6t3pm9VcFG6Zzn9ma7hekZ
         kS1/priw2RC++TKmtEFec4/2l3NFP/VuiJAoJmCBBX86B+FE3Lki962wqOv+/UzLrry4
         U3BDrj+K2P9jb94usg6Hb+jjdTbXrfSSgXg8RIRH359EsgmCJ2ZyCpRzrknFOzLAmPxK
         NlmbRKJ+GA0KDwDDp0qRtxBzqx8lvPRf9/BjS8vEt3cdetg2WdsqDEnHJeYqG6eKdosq
         aF4g==
X-Gm-Message-State: AOAM530mlua8QuQ3kUlTLPSx+WfhiHZvGW+Zdyh61QObUFD+kpqJQCiz
        WHkzCxav+6Z+YpbGd0h5EllirMfyXz6oT//Xb9vQCQ==
X-Google-Smtp-Source: ABdhPJwVynjGPb6y+1O4DC9DGzEFv7nsD4Y+LCV6DGeOXdeIwhJMHEYE7hftP+r/8yNhJzn16XKORgWckoYY9FeMZL4=
X-Received: by 2002:a19:8384:: with SMTP id f126mr5813971lfd.649.1607777530886;
 Sat, 12 Dec 2020 04:52:10 -0800 (PST)
MIME-Version: 1.0
References: <20201212003447.238474-1-linus.walleij@linaro.org> <CAMuHMdXZft=w4JZz_xAJ2r3AVh1QS-OGrSuVjXd8mR8=Xhr+rA@mail.gmail.com>
In-Reply-To: <CAMuHMdXZft=w4JZz_xAJ2r3AVh1QS-OGrSuVjXd8mR8=Xhr+rA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Dec 2020 13:51:59 +0100
Message-ID: <CACRpkdaGQRHwVnXU6e9apKhxCFf_qWEfSF8ggodOCHjXDSCg1Q@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Disallow identical line names in the same chip
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 12, 2020 at 10:23 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

> As the names are specified in DT, I think the biggest "use case" for
> collisions is GPIO chips on expansion boards, if multiple instances
> of the same board can be connected.

The actual case that happens in reality is GPIO chips on USB.
For example if you plug in two FTDI adapters (these have GPIOs)
and they have named their lines statically in the driver.

This is what Johan points out and also what I find from Googling.

So I would say hot-pluggable buses. Greybus would have the
same issue I think.

> This is a bit similar to clock outputs, cfr. commit f491276a51685987
> ("clk: vc5: Allow Versaclock driver to support multiple instances"), but
> in the clock case, the name of the clock output is dictated by the
> driver, not by DT.

Yeah actually the collisions we have seen in GPIO is the same
type, where we assign the names in gc->names and not in the
device tree (or ACPI).

But I think it is good to establish this habit already so we don't
end up depending on having to support flat namespaces with
several lines on the same chip named the same at least.

Yours,
Linus Walleij
