Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E8E350028
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 14:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235317AbhCaM0C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 08:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235289AbhCaMZe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 08:25:34 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1BEC061574;
        Wed, 31 Mar 2021 05:25:34 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so1068214pjb.4;
        Wed, 31 Mar 2021 05:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nlSwmQR7z7nXKO5xOIc5Ec9KXdJc63E0m3HQR6ieVKA=;
        b=Bi6JnjlmnEjidA2XuzPCIqgQBbrkPqm/2hEVdBkRKIIhEcbZi5Pwj8Innq+BK2TcP/
         zAWb1VR8mBc6XFFhwxoOG3qlYVOsPiydqMTGN6dNJYgswoCH9RKMMnXv8x3pMr1ahruP
         CrZp5b+OqfObBZgIIz2iTXPCuk5Zlz+jTI99CQ3+Og8B6Ny3dKZhXAMKMS3/sMrVrpGj
         T3ubFxVD+0FanF/XBrh63KOgfS1c70eceeVjMadeiN8GpjCLjgu44JwA4Dq4rU5xZBjN
         alm4sLhb+5oxFaMDtUJl7omHERHgM10CRVUybpGeqmzUKbeYHo4sLegBHKK+mp8ChFNS
         c40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nlSwmQR7z7nXKO5xOIc5Ec9KXdJc63E0m3HQR6ieVKA=;
        b=Im1yf7VEi3RJnVG3oaVxWNJIukPojkHY5oqSYExV+jb3GwsA4GwavTAnGI34pizvsk
         3Xzro7AbpLwAGI8b9ULeZi9ais3BQUktQ8unUcxI45SrHQbwwQCvyL5bYy8/4ayp2OKF
         GixC90vwLsi2FkQslbVW4suRXWLiFxXGw/jDagR046BFTflXTh56UFkFW/GFrOBclNwM
         v2271OBXArSD1q7HEiBLab0VNsWv3PotR8i5/jUypbsyUSbpLB0TPwAwLNt9XxUB0HzX
         PhYd2lXrksVwMEhLNyR8LteD9p0YmJPdqqn2kDY+jsz1ZsckeCDtr3x621EsxsCmPxqQ
         H7Ow==
X-Gm-Message-State: AOAM53044r6D2qB4alk77I5024Z7RShXiNHY/DMMALEPzhfILEnFv/s7
        m3hlpB5Dp0iJsBGZValf6vjCRm/tmVRMdScuE3Q=
X-Google-Smtp-Source: ABdhPJwuOiBj2ZeP5KD2rC4EJpdCkOH/CHFIYOELzDzY19/OGY4oyWw6yhY/Wsf1ZJ2N1dkGnW0294oAzgHZsZW72mI=
X-Received: by 2002:a17:90a:b311:: with SMTP id d17mr3319847pjr.228.1617193534108;
 Wed, 31 Mar 2021 05:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
 <d1ec9f4cb6dd9afcfbeecfa717e863d75e18133b.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
 <CAMpxmJVKmBp06_2Hd4XF-eL4KfgZFy1o+xUvvs6H=TaAnkmYhA@mail.gmail.com>
In-Reply-To: <CAMpxmJVKmBp06_2Hd4XF-eL4KfgZFy1o+xUvvs6H=TaAnkmYhA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 Mar 2021 15:25:17 +0300
Message-ID: <CAHp75Vcsw8uQOL9RAxOU3jeq4mGAiK3cNMYbKyWGe7F8Dz2dZQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: sysfs: Obey valid_mask
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 31, 2021 at 10:58 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Mon, Mar 29, 2021 at 1:41 PM Matti Vaittinen
> <matti.vaittinen@fi.rohmeurope.com> wrote:
> >
> > Do not allow exporting GPIOs which are set invalid
> > by the driver's valid mask.
> >
> > Fixes: 726cb3ba49692bdae6caff457755e7cdb432efa4

I have just noticed that this is invalid format for the Fixes tag
(luckily, haha, due to a blank line it's not recognized as a tag!).

Matti, I highly recommend to add in your .gitconfig file an alias:
        one = show -s --pretty='format:%h (\"%s\")'

Bart, there are real Fixes tag issues from another series. I will
comment there as well to let an author know.

-- 
With Best Regards,
Andy Shevchenko
