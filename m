Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 349862833F5
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Oct 2020 12:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgJEK1X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Oct 2020 06:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgJEK1X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2020 06:27:23 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297E4C0613CE
        for <linux-gpio@vger.kernel.org>; Mon,  5 Oct 2020 03:27:23 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id ce10so11126910ejc.5
        for <linux-gpio@vger.kernel.org>; Mon, 05 Oct 2020 03:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qBPKP/opOolgwYHSNxxy/C3lY+HW+pxzWhS9oR7HeqA=;
        b=L522TC5eF0DNDc5EL+KtjnCVyi+J81kb+v8kOdCw6wRUXJAPA7aJ5EC2PtNN2oxONG
         6y28ZUCti7jxSNurq3PqzU/vTJ8joFo8nRKpseh+RGBzByCSUZNS0a2uXD5ibWm2ZhNc
         sS4pb9sTAFQwSBEY+7A+cF6yyoZmVQymem291A72jf2t01Z/5fZcCN6ZwJ7tUV1ylkRq
         9KNCSa8SS/73T5458qukh5kVN8PeDfikg89TqkYQyad6jbkGEd8FBW4qPSVqBRG7Obtm
         G0TRb93bAg3GXKS7eEi7pLYCxUZaCpkkI9oY+gDD+FYxIs6tUrynvaAE1+zl8kqj86Ms
         +n5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qBPKP/opOolgwYHSNxxy/C3lY+HW+pxzWhS9oR7HeqA=;
        b=ukBfKwua7Z8CluXgHQDb0qiH1bd0zz/EwwNxSVj0pKCuae9TZYuhMKE2LXTLhuWHOY
         zJl+R+5Ryzc0MKjegKu9jkd2s91BoOPxW6PtdGluuz/Q2A2/yUpSYj9qQUbUq82/Jeh4
         Ju0hYpJM4EfPI0EkMhVls1oY8MWas2WSHrZgXDiJ92jbPQNSpI13y4zMxzn3FxMdTAKA
         RY7FhZMnVhsUKEDK+748JVhWjD+VoHg4lJ9yzB4eRS3XaGexN6lyWEWMNLe+S4a4t0eN
         fmcBFwKdlrzq99YSaRn2lOguLxVRZG1DFvYgDhIYqIDFB7C4+0GqHzS78U5P+rbBzdxq
         UJQw==
X-Gm-Message-State: AOAM533fV5dA+5lbAvSUXGUu6FxH6+p3WNl6UwlK+x9cQbcWCVfbNuY1
        wzs/YRJWRpUCubbmi8bztiR9R45FFzCkanlSWDlwjQ==
X-Google-Smtp-Source: ABdhPJxsTQTpVkARgcmjrDr8L28v8XXb96LXwOoIn9Z+66RFHtqy715ommMxiO2qnWPO/KzhLJ50XATtXNdywSgYoXw=
X-Received: by 2002:a17:906:49c6:: with SMTP id w6mr14542169ejv.445.1601893641764;
 Mon, 05 Oct 2020 03:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201002063148.32667-1-warthog618@gmail.com> <CAHp75VfVDsxHDcnwdO5TL=wx-rB6=cuCWOxj0oP7+kpZvKuH6A@mail.gmail.com>
 <20201002160636.GA117143@sol>
In-Reply-To: <20201002160636.GA117143@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 5 Oct 2020 12:27:11 +0200
Message-ID: <CAMpxmJW+u35TYBiNru=bSJvuC+XJJos9zKqpgeG41u_hbaMjAA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] core: Basic port to uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 2, 2020 at 6:06 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Fri, Oct 02, 2020 at 04:48:02PM +0300, Andy Shevchenko wrote:
> > On Fri, Oct 2, 2020 at 9:32 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > Port existing implementation from GPIO uAPI v1 to v2.
> > > The libgpiod external interface remains unchanged, only the internal
> > > implementation switches from uAPI v1 to v2.
> >
> > Cool!
> >
>
> Not terribly - I needed a libgpiod-based testbed for my kernel
> changes, and this was the easiest way to do it.
> By happy coincidence that aligns with the path Bart wants to take for
> libgpiod 2.0, so here we are.
>

Indeed. I'll apply this to a staging branch for now called
for-linux-v5.10-rc1 and once v5.10-rc1 is tagged, we'll apply it and
make this kernel version a requirement on the master branch. From
there, we'll work on designing the v2 library API. I'm not giving
myself any deadlines - let's just get it right and it'll be ready when
it's done.

As I explained in my other email: I explicitly want to break the API
and ABI to improve the user-space interface. The question now is just
how to handle this. I'm in favor of keeping the library name as is and
keep the public header in the same place as well. I'm not too
concerned with two versions of the library living in the same system
really. I don't think this library is big or significant enough to
warrant dealing with versioning hell.

Bartosz

[snip]
