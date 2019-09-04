Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7A5A8D24
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 21:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731479AbfIDQ1p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 12:27:45 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37668 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731466AbfIDQ1p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 12:27:45 -0400
Received: by mail-pg1-f196.google.com with SMTP id d1so11510512pgp.4;
        Wed, 04 Sep 2019 09:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h04RkzjT3hXLTqVi3hxMYt7+XgkxZzlEb0BXvzdW1Iw=;
        b=u96W3i3h8EyeOAeUHfKxUJeZZrPcR78dwH/TA9Q0gcEBy2fX0/RospEgR+NpW6qmL8
         x7Cw14anhZMC/3swXtc5wbpMZ+zCJqv4YzAVxVQuTkU+2IspzSnhZM3Gv5klXmNda5mw
         wVF9asAXOiNpj3HEIMkNLKBdRy6DO8xyWZEufSISyBoqV0U9AFhOxjXiRaF3BcQWN0kq
         zWWkmevlB+++8fGIjUZFmXsFgLzRrXmjtPLiUiaPDrwTQ3LzcfaJ7vq2GqaVRy5rrt5u
         b4hUoaq7bsGZDSpHsgo2hT8e70WUzAVYai9e+pS1NGd+erk4+IDj3tcPJyGAyEfYLupO
         Z28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h04RkzjT3hXLTqVi3hxMYt7+XgkxZzlEb0BXvzdW1Iw=;
        b=R8Q+rky9+5LrBKssdJLVWb27mU5rjkGoPITDPc8u1ejqc9Cy8jEcXJI1cB957BlvnN
         KA+tV2Dw8azbpVyySdg3aJhDb8l5Pd6yQZ8lTpECRSE3+AxXeQcHL63pJdjYV0jUM0VR
         VWJLxmpcerR4Wksc89qGKlCcjg4fPwSOHOCvYicIbkiKkONxJMK9ZMI15h36RVDmxGB6
         3DvMnGbfEIhkdSD3/FeMZa7fsdQViqO1mqD1tmUPMFenp9z+bGXumVZdoIYZI2l/fRrh
         lBLIEoSGlDvYmvW76QZCGWDPk3Yib0eDTOQ9Lpgn2uyxYqfHMC43JLhNvn4ERjQRxSXe
         xPSQ==
X-Gm-Message-State: APjAAAV5E43VNKW7YG1jtkhMg2eZ1Z1c6OD2fp93GJXLGx2Qb0LETaR9
        NIbjMB6lb1RjC9Tu3LS5MdmtoABKkPnnqyhUIPY=
X-Google-Smtp-Source: APXvYqzS8bxdeH8zm+j+hxb1ouuCS1ZUvEOMUS0WH79z6S5Qndoz6KZ4UIiuE9srzqOavs3O1cbyfUGHH5iUYCJJZFI=
X-Received: by 2002:aa7:93a8:: with SMTP id x8mr14577315pff.151.1567614464501;
 Wed, 04 Sep 2019 09:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190904061245.30770-1-rashmica.g@gmail.com>
In-Reply-To: <20190904061245.30770-1-rashmica.g@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Sep 2019 19:27:33 +0300
Message-ID: <CAHp75Vd_6Rpt5=BjzV8YFCiFP7qsRrYHHo7+=gWwnZH-zT9jNw@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio/aspeed: Fix incorrect number of banks
To:     Rashmica Gupta <rashmica.g@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 4, 2019 at 9:14 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:
>
> Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

>         /* Allocate a cache of the output registers */
> -       banks = gpio->config->nr_gpios >> 5;
> +       banks = (gpio->config->nr_gpios >> 5) + 1;

Shouldn't be rather DIV_ROUND_UP(nr_gpios, sizeof(u32)) ?

>         gpio->dcache = devm_kcalloc(&pdev->dev,
>                                     banks, sizeof(u32), GFP_KERNEL);


-- 
With Best Regards,
Andy Shevchenko
