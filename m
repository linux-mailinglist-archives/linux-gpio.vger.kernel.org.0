Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873D7348B5D
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 09:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhCYIRP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 04:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbhCYIQx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 04:16:53 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3C1C06175F
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 01:16:53 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id b14so1216565lfv.8
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 01:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wqv+mJd/yA9gAXhianZae/dsnbx6UuOD+QrLDaMhtRk=;
        b=fVq82e+VWVzuGVVEGkCzUGHT10kKogZLvz9mlxXuyz5cQcPYIib7iG2c7FdCja7v/4
         r2rd7mOX3oBmGg1WjXu1cknJCAAA3U9AlqitM+7O7IeQhgEm2kYJvPQ8wJ5X67u4DIuf
         SOW+ERR1q2/R9NOwJJeG6atcgul0j0CuRsXidF4fHbxWdJGuVtNJ0GJ4N/tcbCw6LV3I
         2/tDO88d9O0sn2dApl1OCRmFqHB/nDejKALf0t7xqt2adzUlEJj/AtdMwMeTFnw4y9hd
         KEbVum9jA5nIpYe8YcY7vW2zvMYq4kwnB9gdBTHz2J/W/shQ/GbBCJVNB4R3pBPhumb4
         VKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wqv+mJd/yA9gAXhianZae/dsnbx6UuOD+QrLDaMhtRk=;
        b=KWTj1OndmRjI+YYz4e0jyzs8IGH2ipFukmg8G8zvg3uyS8sgnXrdxbWNvIm+ZpfFeP
         0bo6yG238+oZAxb6qZWlqyukD1a0It9SLivHeumF3gcZthTRl6pA619YH/gar7qt76cO
         rM2VwQyn/37D94wf9uRrVXAumdZbuBTJ1qtsL7WrBydnkIxEdBgBdgHhN1kPzUuM4Z0s
         cRwznUPfX0RXpfdu2I3rMuWje3AuCkEj9Fp4lB3Vpn7ZOM77TKv2YB6ubiv1FargQZLs
         p64v5RK+Zj9FmJyo9Mmk3LmrDGHerDwBijxkm+Y19CnZfC52ybp7h5Se+I3npclROfml
         rczg==
X-Gm-Message-State: AOAM533JIWzojzlhS9anOVpuL4a/XtrhWHSKmHA3kEkKHbq4AFQKErTU
        0b2C45QxX17CONvC8Fltl+BL5w+FSDN39GY6/8WsSQ==
X-Google-Smtp-Source: ABdhPJxvVeJgUu0O3xhLewVEaOBUd+mzRH+XmTPBOaLaRtuACuj0BDLPQ04xdBJmn9JFYlMmFTQ0rI4/j3gVXTbD4tE=
X-Received: by 2002:a19:6b13:: with SMTP id d19mr4163840lfa.291.1616660211621;
 Thu, 25 Mar 2021 01:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210317151928.41544-1-andriy.shevchenko@linux.intel.com> <20210317151928.41544-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210317151928.41544-3-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 09:16:40 +0100
Message-ID: <CACRpkdZNuu9h4aRsV5rSyxbS-4aN0BqbGJ=oYnDLAZT0D+csFA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] gpio: sch: Hook into ACPI GPE handler to catch
 GPIO edge events
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 17, 2021 at 4:19 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Neither the ACPI description on Intel Minnowboard (v1) platform provides
> the required information to establish a generic handling nor the hardware
> capable of doing it. According to the data sheet the hardware can generate
> SCI events. Therefore, we need to hook from the driver into GPE handler of
> the ACPI subsystem in order to catch and report GPIO-related events.
>
> Validated on the Inlel Minnowboard (v1) platform.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
