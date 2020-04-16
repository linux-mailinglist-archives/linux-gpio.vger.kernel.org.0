Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35AEE1AC23C
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 15:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895163AbgDPNWJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 09:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2895032AbgDPNV5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 09:21:57 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B56C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 06:21:56 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id y19so1757508qvv.4
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 06:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=avRb3vLQGDTEWZLFL5bXMrEXh+qhpxFWoqH669TEkSU=;
        b=J5nuE74uERUTtbCQhaVb6lN2px7tBz8nBjdjaloWli9LlHu86qVRpxY/XKDMJdmjzG
         BeSYOHoRovGTYnDivdxWRpzCmemE0pWWE+2H9dPutd9ZypvWa3HQNBMY0HQAgcUf/t5V
         /w5JBp99Bjfo0qsf6b45nXUuz4iCaJSrV7u7yqck4690fCBJwt1Iqxsnuz+qTGMtzoIx
         6djHp0kOGO/Z0KcGacj1hcSg892w9wkl+SS+Wgmt0AwNhbiia5M4d8itueuP4UAbIxcu
         fxIYS3tOhzeIzfdjerKNpK7W9BXiB4bc8hwDndGYyCYxVjJ6PmBlfZBCd+L0pt4TaKU2
         Ni0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=avRb3vLQGDTEWZLFL5bXMrEXh+qhpxFWoqH669TEkSU=;
        b=bHEtUtisPyPtTehrRHPlpu+SG8n0Me7vM2KdrB/37rq2QVlrwwRHMmfGmT4nJXkW/S
         opzYipDfK8AUTsIEdA0XhkJ5uMqmlCatSytMMslDjxK0IY6eTYU/BSFndMg8ExSzS5MD
         bAdwGrqwVuMH+yF/4kLWeyuxxyzja9NjJhWqElIhM6+EQFLWmCPeItzGlzDIXJIXIs5I
         4kh9DX9XTbGxYGh0k/TSJrrWd9T8+s97AXDok3jvbiIJAcC+SuyI36HVRnyk3iibs289
         ljandFEvD6i8aoVzhisX7uImt0vcFTKb6wxUrNckwk6QHkZQYwon8uJLavTbFO9eJR9z
         XDbw==
X-Gm-Message-State: AGi0PuaUXsZqivgFxQ6+p7DNeb2AzFx+c2bvazDJqjb2VCM9U/cc8Lc3
        J6u6+L6suowtEIiC8IcAy4SO2A6OGCu1tUVL7Vi8lA==
X-Google-Smtp-Source: APiQypJWh/fFacLzkG78hbwLnxl5+BCUaI/XcNkBeTLfNrmfcZs6wqz1Gez3UoQW17XmSn3R7x9XVhg78QA48w/zWvQ=
X-Received: by 2002:ad4:4951:: with SMTP id o17mr9910253qvy.76.1587043315884;
 Thu, 16 Apr 2020 06:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200414152843.32129-1-pthomas8589@gmail.com> <CACRpkdaPc-rxNmdq7KFKZ-Qi7Tqy2RJ5Lkcv-8bTAh0GX7VygQ@mail.gmail.com>
In-Reply-To: <CACRpkdaPc-rxNmdq7KFKZ-Qi7Tqy2RJ5Lkcv-8bTAh0GX7VygQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 16 Apr 2020 15:21:44 +0200
Message-ID: <CAMpxmJWZEhKho0+6zf=Ca8tif=Z7PcdNv2=tAsDnOUzeZLYqLg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: gpio-pca953x, Add get_multiple function
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Paul Thomas <pthomas8589@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 16 kwi 2020 o 13:22 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
>
> On Tue, Apr 14, 2020 at 5:30 PM Paul Thomas <pthomas8589@gmail.com> wrote=
:
>
> > Implement a get_multiple function for gpio-pca953x. If a driver
> > leaves get_multiple unimplemented then gpio_chip_get_multiple()
> > in gpiolib.c takes care of it by calling chip->get() as needed.
> > For i2c chips this is very inefficient. For example if you do an
> > 8-bit read then instead of a single i2c transaction there are
> > 8 transactions reading the same byte!
> >
> > This has been tested with max7312 chips on a 5.2 kernel.
> >
> > Signed-off-by: Paul Thomas <pthomas8589@gmail.com>
> > ---
> >  changes from v1: rebased to 5.7-rc1
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Since I know Bartosz is queueing other patches for this driver I
> let him pick it up.
>
> Yours,
> Linus Walleij

Patch applied. I removed the last line of the commit message since I
guess you did test it on v5.7-rc1 after all?

Bart
