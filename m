Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19F36285BFA
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 11:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgJGJne (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 05:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbgJGJne (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 05:43:34 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5775C061755
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 02:43:33 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y11so1537854lfl.5
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 02:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JDiLcwMpwkayN4Rc4w6Y6pIyUXsKEXgJhxnw/U7Lqac=;
        b=T6qgLUCgHh4ukgQdiXyxirVSV8WH3AlyLwLNBgKvIuGsMeDyH0N+8bemAvoY7IH76S
         mUXHBxit19xeyiC2EfcGpXZTi09+4/eIE9nrxmb+WQHwPeSNbG26RLeAm7qlmG/8VINq
         dJrHAzgy5fBhIOsmhb2CNk+VQ9U+Rv6ms/XHrKRDmxwkFPGtsVIb6lobh8scg2EGarBD
         9Z+9/5OayJI/v7/SWilAp580Y5hx8SEnX8mSSImybHRY/gfSZ8yRvU1NppG3K3tUW/YY
         BWgkybkimfzxag5P+NwjkxmRbzl8zpZzfBD76pj2VKlvU8F0nt/p/dxF9VQGGM0tfdpt
         zlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JDiLcwMpwkayN4Rc4w6Y6pIyUXsKEXgJhxnw/U7Lqac=;
        b=dhroveSlaZSSswwb1kRax4CKL9w7rjp2vCkDGLY5xIenqYSyHnvUGZf3JceoD3urV4
         2CK8VNV4yUTvLzUqQLu59XLAapCvc39BkcFuEpUSNCs+Q+aW8rvgeSU9J4f4HXLiMWny
         nGZ5SNOmAQPyRmrlLsZcuvZ6YGzTM/D9Eu8Kevk8uBIsdfAmDX15CWMqCRleLv/pxDw2
         6sy2iOEFbCQC8v0DDzsmz2ljZcw0U4r6lTOQVhik/UNonTzhqeZAtmUc+Ucc3TeeZpLI
         ci+Oat3b/uN+Op6eWBnH/6AuRoN4BIHyHl7foZf3Mz9W9hJGMcWy8U3aU5hGNqtRgBce
         IxDg==
X-Gm-Message-State: AOAM530d4WpJZZdpXUgaWUSk9g2r0n2yEl1DqBcWbo7th4AbDYhV9G1P
        0cbQuRrrnNM0IEVigBkApIYt/UAnbvbO3aJSK0/3ug==
X-Google-Smtp-Source: ABdhPJyqQtJ1QbgnjTU+1b7NCq3Ge3BrMF3pB+gI0+wV15+Ohj3t94o/oXMPKVsYeEmjsNDAHvKAQw1Pz4L4XZIjf9I=
X-Received: by 2002:ac2:42d8:: with SMTP id n24mr620406lfl.502.1602063812197;
 Wed, 07 Oct 2020 02:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201005095622.73616-1-andriy.shevchenko@linux.intel.com> <CACRpkdbtZVRk6TeHLgtPvix2AmrR+auwfqs8gFyW5P3eLGCy0w@mail.gmail.com>
In-Reply-To: <CACRpkdbtZVRk6TeHLgtPvix2AmrR+auwfqs8gFyW5P3eLGCy0w@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Oct 2020 11:43:21 +0200
Message-ID: <CACRpkdbRPjkwQW1ScksMtOJS6=4Wy-eNEMujhDD6Usy7889y-g@mail.gmail.com>
Subject: Re: [PATCH v1] gpiolib: Update header block in gpiolib-cdev.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 7, 2020 at 11:39 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, Oct 5, 2020 at 11:56 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>
> > The dev_t is defined in types.h while struct gpio_device forward declaration
> > is missed. Take into account above and update header block in gpiolib-cdev.h.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Patch applied with some fuzzing, thanks Andy!

I noticed I do not need to fuzz it if I simply apply it to fixes....

Yours,
Linus Walleij
