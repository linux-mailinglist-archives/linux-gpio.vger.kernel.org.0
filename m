Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5B43328E1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 15:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhCIOpF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 09:45:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230446AbhCIOpD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 09:45:03 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF15C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 06:45:02 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id bd6so20568588edb.10
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 06:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z7cPUe6OpiGgg9pdWpzevNLk40pbl6JE13AQU/bZ3v8=;
        b=MganIBbRO7IGKoEuoVccoij+Wv/+3aOH7F3UWLU3mPTJH6E+K3iaLe7EbH/GMDI3s3
         LgKrgVjT7oGk5OxmYHTx6InoToEjzhidCwwoGgelhjzfwY5mO/4StAg7Ws7PEqX7v7q6
         vC1LKOKhK/IwCIhLCasdtxHcCd6n6/+eOdulCYQ6FCMV02VEz85iGswo9phAGsVqObOE
         o0N6dlEStLe07bi/PPBE3vMRV+BDDcU8eHY5LjgWpKgGpHKDmDo2GMPrLKnYuZnBdtQY
         TpRLTq/pP1ouJkFry04bbny1DxEMQ14Q2BzcOQtj7JOUv1v8QeGgTsNMUtt1O5EgPx0T
         p+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z7cPUe6OpiGgg9pdWpzevNLk40pbl6JE13AQU/bZ3v8=;
        b=moYP2KsKy6PDnLnKdCkEtKiIBrIbQm9/1+BUzjdKvx98oTGIr5Z7ldXQZ0YPfaTCl2
         Ufe7HXOrAW57Ykp1assihhuw7H99st+8OfyUOnKRowIeYJFXHgTgpV4VPIKC+x57SK0J
         rj0pe164qnsPSnNvpbxgkO6UcH9ZcENGKNVNN/pImtwJW3SRW44+aL7dDwFfTmk88fgl
         JMc1k7SO/8Fmqynyu/8m3wCrpU4GfXV+3xmpjP+zVOeCbVb/j19s3EFYIIugyXY7Exhx
         nRMcXlJB3BchHaR3Ybtsr3/+WdJpy9Z5HepLDRrXwgbNS9oJMFe4RAcS65lYSSlcNySc
         IM1w==
X-Gm-Message-State: AOAM530W1eVciC0lfxehUvyCTWnqOazj6NL8uOOe3+icuAH4UH8yxs5W
        EgvIv3NqaaHjnnI9EDp32J6fLrmzN9BfgFajhCbPWQ==
X-Google-Smtp-Source: ABdhPJzg1fajZ9DWjUm/eMv+Id4GYKrfIDnDcnYx9uM7tU0eHqqE174G+SOD5Q31WAyWGO53m+n6UULZqjIBCh+t7ZM=
X-Received: by 2002:a05:6402:17d6:: with SMTP id s22mr4467758edy.232.1615301101579;
 Tue, 09 Mar 2021 06:45:01 -0800 (PST)
MIME-Version: 1.0
References: <20210304102452.21726-1-brgl@bgdev.pl> <20210304102452.21726-6-brgl@bgdev.pl>
 <YEDZjM5kTJPgx1WU@smile.fi.intel.com>
In-Reply-To: <YEDZjM5kTJPgx1WU@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 9 Mar 2021 15:44:50 +0100
Message-ID: <CAMRc=MdGvPKi6fqUb4ASwaTAu8AYz3ddr1THfW7JuLTN3hbCpA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] lib: bitmap: remove the 'extern' keyword from
 function declarations
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 1:59 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Mar 04, 2021 at 11:24:45AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > The 'extern' keyword doesn't have any benefits in header files. Remove it.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> A few nitpicks below.
>
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---

Hi Andy,

regarding this patch and other places where you raise issues with line
breaking: I believe this is purely a question of taste. There are no
guidelines on line breaking in the docs. I will leave it as it is here
because it's not better or worse than your version, just different.
Same for exceeding 80 characters - I personally believe it's justified
when the line looks better but whenever it can be cleanly broken, it's
better to stay within the limit.

Best Regards,
Bartosz
