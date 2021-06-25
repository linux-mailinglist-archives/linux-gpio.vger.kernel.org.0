Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE5643B4199
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jun 2021 12:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbhFYK1i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Jun 2021 06:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbhFYK1i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Jun 2021 06:27:38 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A7BC061574
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jun 2021 03:25:17 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 8so3874069ybn.9
        for <linux-gpio@vger.kernel.org>; Fri, 25 Jun 2021 03:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h9NxxCCi1SnK8epUTb+3wH/5NIOQp8AMPXJWAcTLQLk=;
        b=L+yZsM/eK3QfpDRh81Rdivg6bC7LECetcCkwmH0He6InnfknY0bWMR/tTpdRtrnJ5G
         DtyCJDMb/KNmo6iVuWrvzsAUGY2GpOVnJKM7PuXF4AT0B2v50y+PIJJ0viNhq+Z8erXp
         ab/KO1oxAbu452sBYAdYYuZdUj1Q/Ckb+OYOmqKk7dA8owFqmALEYoD9b7KK9gey/eLX
         6C8IyLrbXAy6Y727+bRYJD24jlaG+B6CKVRLKLpoCk/UluRnmn1SS8VjI6+Kd3RQiPAv
         94CoS6/KQTFBKgYxJdhwjNh7hjAyEbykufzXTXZrkuQRqqFzTCnbs58QBFR3fBQPrzMP
         pisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h9NxxCCi1SnK8epUTb+3wH/5NIOQp8AMPXJWAcTLQLk=;
        b=EaIDP6HdOEs1s1ZRPe57FJatYFIOfZfQbJLs01AiYpDGkbJj9t5bgfazZpD4uKI8Kk
         QhOTQLugfaTOdHgskg7hV/Ya1QVmFg6PghrW6bjAmq4YxU4z0oU7ZoThN8mlMGBWeZE1
         GJEdy+Amn2bm4ii5Eiz7DQQYD3c889NkLRGNz+omv1ebgetRz38PbgPFhgzU+H8Jh+6m
         4tiSqTmO6wxQCfyo7M1NqB7DvNcYkFEg/hD8MMR5a9UuJeCyOfibK74VH8KKcecUquCn
         NIigJLV69fjP6lJJuV/HuO0FIe3tXxH7yhx2obQX9TdNMDe13rXIdNPvGfbg5vx5Fj8u
         BhWw==
X-Gm-Message-State: AOAM530Jl1lu076y+budeUvssIDx1CQq50BOkxXUcIhjhhAJZ6WvYj5g
        StcruTcYxrVzuzdcqNkyuA6ZPOHRGXnsOzc10IGK6VE5Pos=
X-Google-Smtp-Source: ABdhPJw6kHOcpNvM54h0UmsIjcrCOi5tvJEVybYG8szJQFWoelErfL32xNIXU7RdcGV8fZt84y/wn2A0poT0b+pGsSw=
X-Received: by 2002:a25:acc2:: with SMTP id x2mr11543923ybd.312.1624616717110;
 Fri, 25 Jun 2021 03:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210615145903.634565-1-linus.walleij@linaro.org>
 <CAMpxmJXqGgPiXqR1kq+nts-=HBkxSP_7Cqzn=N5-EmKWADh0CQ@mail.gmail.com> <CACRpkdZwcd8jznvzEvzO0rmF7ug3o_TxC=xUeCPYgfhg00rEQQ@mail.gmail.com>
In-Reply-To: <CACRpkdZwcd8jznvzEvzO0rmF7ug3o_TxC=xUeCPYgfhg00rEQQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 25 Jun 2021 12:25:06 +0200
Message-ID: <CAMpxmJX3OcRMG6bn+u1MG-6YjnzjeqPp-8fGVf_4cdoCiE56SA@mail.gmail.com>
Subject: Re: [PATCH 1/3 v5] gpio: pcf857x: Name instance after dev_name()
To:     Linus Walleij <linus.walleij@linaro.org>,
        Sekhar Nori <nsekhar@ti.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 25, 2021 at 1:52 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Jun 22, 2021 at 2:58 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
>
> > This makes sense but the i2c names are often not very descriptive. How
> > about adding a DEVID_AUTO/DEVID_NONE like mechanism to GPIO labels?
> > Nvmem has a thing like that precisely because labels can repeat.
>
> Yeah :/ it feels like the subsystem should name the device properly
> though. Like we're solving someone elses problem.
>
> In this case the other patches provides .names in the I2C
> board info so that the dev_name() ends up something
> like "i2c-u2" and "i2c-u15". The u2 and u15 are common
> names for components on a board so from an electronic point
> of view that naming makes for good topology.
>

Right. Alright, Sekhar can I take just this patch and you take the
ones for davinci?

Bart
