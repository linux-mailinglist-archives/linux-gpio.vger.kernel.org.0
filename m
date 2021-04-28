Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 226FA36D619
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Apr 2021 13:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238802AbhD1LIM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Apr 2021 07:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbhD1LIM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Apr 2021 07:08:12 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A56C061574;
        Wed, 28 Apr 2021 04:07:27 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id b14-20020a17090a6e0eb0290155c7f6a356so1871796pjk.0;
        Wed, 28 Apr 2021 04:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TWzMixBU9b3qY5j7u1hNxPCMWPyaXVl7xVpNiQvun90=;
        b=qY0QAECy62MtToJ2Uyah5EjS/NqxzBUrJWCHl6LX3Bx2O+eH8EKayLU6vjlFRKJhVe
         7IiLgq+vHDGuJ5A286WZQML9A8d4ptOe/4maii48dGFzgbQ9iSNPtTg5aep+0a58/ess
         hTWSB5Jpkl332E+fPux5tjnpqOsWUoQzkFVqhHSpFiN33cHNjU9Ad07D9X0DM0wa1ha3
         hjvrndJjSxpWpVe2dVsAuqgMQsLKdzYl5b/e6UROvDuWhNBDZ1l0qDuCqv23SkdyqM36
         KXBvOSJ+IR9vlB8p0jiMyF2YXWaKGiWoUIyaxVketwrwG/tVP8uzQY/q8VwpIJxSzvls
         oV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TWzMixBU9b3qY5j7u1hNxPCMWPyaXVl7xVpNiQvun90=;
        b=I2k6dabw8ULso2KUGbMJJjArO83yZEUtPfota6TfoLjFdX4e/3X04VCL4cMfIhxmhT
         YMTDdYFjHzNm+Dqi7fulQMymogDmaSq9odHGGkVWuC4hSBo1XBARD2ndVdjXTIYgSVtP
         o/drbXY16w/dM2gUH1B9YPVqjrd89LhYZ9Oz7m8h23u/X8Xc8X4jFRVTA6SrarZzac6A
         EWixWcHuouCscUnt5w20qoME0ok9hqEy8ZWoSNO8wX9ToKyrNOW4HoQcEVtpSJfp4G7W
         uGyQKBsX0LNYYKsrkgr5ggzS1H/7RsAhP4gENx5Z4EneRe60zulGnp/svipsp7jqOQdj
         FmKQ==
X-Gm-Message-State: AOAM5321rW6T4W2nRpNDv0UWt+D3DjPtjObMiXKPFlK5K7sIIdtO0o+J
        H4MgQ2dTSkoIWus1ZBfZXu2CYVv3HSYt+/4IRJo=
X-Google-Smtp-Source: ABdhPJye+opW+1GV2Gv9oKqnDknl7Ebgbxb6IGMaQ7QIfn5q4j0ZwMLVhoDKIxaK0J6vss48EYkYo/9ySM3/fwWb7Po=
X-Received: by 2002:a17:90a:bd13:: with SMTP id y19mr3567911pjr.181.1619608046944;
 Wed, 28 Apr 2021 04:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210426095426.118356-1-tsbogend@alpha.franken.de>
 <CAHp75VdRfPPj2pu4GOBVG4+bGUsCRLXYPsFjMwFOYfUTZuvJaQ@mail.gmail.com> <6f6bce2f070998db49acca2f6611727b@walle.cc>
In-Reply-To: <6f6bce2f070998db49acca2f6611727b@walle.cc>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 28 Apr 2021 14:07:10 +0300
Message-ID: <CAHp75VdmTxvQBU4X8s-6csYgwM8ACth9Ao0GYjUH7+0Q0tyFyg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
To:     Michael Walle <michael@walle.cc>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 28, 2021 at 1:51 AM Michael Walle <michael@walle.cc> wrote:
> Am 2021-04-26 12:29, schrieb Andy Shevchenko:
> > On Mon, Apr 26, 2021 at 12:55 PM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> >
> > 2) there is gpio-regmap generic code, that may be worth
> > considering.
>
> This driver uses memory mapped registers. While that is
> also possible with gpio-regmap, there is one drawback:
> it assumes gpiochip->can_sleep = true for now, see [1].
> Unfortunately, there is no easy way to ask the regmap
> if its mmio/fastio.

I don't see how it is an impediment.
Prerequisite patch?

> [1]
> https://elixir.bootlin.com/linux/v5.12/source/drivers/gpio/gpio-regmap.c#L257



-- 
With Best Regards,
Andy Shevchenko
