Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 490D1308B8F
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Jan 2021 18:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232420AbhA2Rbm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Jan 2021 12:31:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232579AbhA2R2t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Jan 2021 12:28:49 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCC2C0617AB;
        Fri, 29 Jan 2021 09:26:37 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id s15so5579645plr.9;
        Fri, 29 Jan 2021 09:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HA0gkxeHl86DkS/BFcIDueC3TPGHfYXzdAIAmf73Bt8=;
        b=Ce1iSdTHwgOtweIGJKZegnVu5wTWONPwek4Y2DIQUDoGF/uC4f7Ff8wCeleDGo8GZr
         1uFYzyYQh1hzQoz8hGqsGYZOedU98/mRIjz1Uy0dmvPuBKH0okoaQCRfw8D73nizbLit
         40QKm/f6JhxaAWkSoEI1vgKkSaAB3vs2sdeVm+8xjUzBd7cHLpzPu5A9zc/EXspraozq
         d5MQbkEF+3PkChkfIAOc1mm5D6wD94a0P2UvD/j0AJt3yoQ0DnYBGZzLsfycCqMMcxk4
         NZz80cLeaNlkldeNZ6Xj7O1Y+VE9XvHzx2eD6j7Ot7ZKEtIDVDKwnluFOa2H8xh1FJ7m
         M0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HA0gkxeHl86DkS/BFcIDueC3TPGHfYXzdAIAmf73Bt8=;
        b=cfAt51+GvSbLaL6JO9FfN44gAhWTfTeZt+jKa7NSB/+YnDk4J9Cxx7tglEILM7Eo3a
         0tlNj5QKTydaUuIQH/HyFxnKBkmqGvgNeIyMv7iOFZKRxSWK6ppYpfy/inPgl/40kLWx
         5MiJXJF1/QuTNwh+HNrRIVbKrSnYdJlvZ6Dpx8mCJiuqNntWN4Jz2+PHQfckaNv6qzO3
         Pl/2gLkWt/46KU1F0ECHxNeB2fUE3dLqH9IugXxX/39gQGUg5dk1U+ShVOj/KHagVHIE
         Nu+t/IRVFdCopKkhseyDWPJPq0tY9Ph8UH2x/BVrO4uBu6H5UGmfJnviYuowddRWG1MP
         heWA==
X-Gm-Message-State: AOAM531pf9zQTerS4KXXjDmDmatDYU1ZfV7GGkd+MQh9yDHtApgMs5Aq
        AZN0k5KgMBIaGU0GClGnlN2u9SuUtJ7+DH5POpc=
X-Google-Smtp-Source: ABdhPJxnCNKgX/GY/Kltp3Q5EoQdXTHYMYmCgt7yacocxFjuTFe0oTqKksmnik3Pk2Ljgx8q9bLLZz3G6LQX+HV5sYc=
X-Received: by 2002:a17:902:758b:b029:df:d1f6:9af9 with SMTP id
 j11-20020a170902758bb02900dfd1f69af9mr5276324pll.21.1611941197275; Fri, 29
 Jan 2021 09:26:37 -0800 (PST)
MIME-Version: 1.0
References: <20210129081917.1808218-1-quanyang.wang@windriver.com>
In-Reply-To: <20210129081917.1808218-1-quanyang.wang@windriver.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 29 Jan 2021 19:26:21 +0200
Message-ID: <CAHp75VemJWQDKFFrrCKWnUGHFiPhuh=4Aqhn8T6qF5yuMOCOKg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: free device name on error path to fix kmemleak
To:     quanyang.wang@windriver.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 29, 2021 at 2:01 PM <quanyang.wang@windriver.com> wrote:
>
> From: Quanyang Wang <quanyang.wang@windriver.com>
>
> In gpiochip_add_data_with_key, we should check the return value of
> dev_set_name to ensure that device name is allocated successfully
> and then add a label on the error path to free device name to fix
> kmemleak as below:

Thanks for the report.
Unfortunately...

> +       ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
> +       if (ret)
> +               goto err_free_ida;

...

> +err_free_dev_name:
> +       kfree(dev_name(&gdev->dev));

...this approach seems to  create a possible double free if I'm not mistaken.

The idea is that device name should be cleaned in kobject ->release()
callback when device is put.

Can you elaborate?

-- 
With Best Regards,
Andy Shevchenko
