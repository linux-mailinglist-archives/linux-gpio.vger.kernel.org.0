Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8353632D677
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 16:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbhCDPXc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 10:23:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232106AbhCDPXK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 10:23:10 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D381C061574;
        Thu,  4 Mar 2021 07:22:29 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id t29so19154340pfg.11;
        Thu, 04 Mar 2021 07:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=atSELy0kJkaLfPDLN0I+MRUbpt/zMrHl2Liz6NDMJ8o=;
        b=PrNMM0+YxgepB8MISEqtpdazT0tpSXEz4/gop4d9Kyl1hEGe3NtyYr3rR+4fzI1MTQ
         xb6b8Yjg/5RapHQTMjkeIa3vlSHC92/1xQJ/JVFBt3N3JZUWzxrhLqhWLz2QlVXuvMY6
         c4vyjweT+SQ+VfpMgC55gAxQzNFdvzE/ysD6o3S9u9iLfhsROC/zco1TeeNYrlH1O3GZ
         V7KC9GGDoXHsneBZpJrO3yp98EsVnBolCVYRLPaT/8LmPX1l/hZEjUr43TsiJkJXd389
         GMIU9vPw/hYhEZ+Sm5G9ckYgqGQtLpnz7GCQUCByThqx0biTLLzDaOh396Twb70uJHDa
         8ZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=atSELy0kJkaLfPDLN0I+MRUbpt/zMrHl2Liz6NDMJ8o=;
        b=EAQ9Uy+D7yeOG3Qhh+PZnIdYlj20aWCxOAgcEuN3I/if43xF4w6Zat3TebbFDRzERC
         cnH5Plm+my3Xa2PZTfNsWH6/AhF8Tf9cX4zyi0yWFE+EFDURH5fK6Gv3c5ZnyNM+nbig
         ixMNlCmqHYWmVUhBIZm7Lbw2mkZC61Z5IBcMscfBj/X08jtfhTHh4gQZ6I2NAU7mDsVk
         +VgDSXXcG2q+T6T9FoZNKmr1V8403BxeXgltAGQhtywihOXQvqNiUm7pWHOSO81ndVKL
         9IgFHBu9nJfw3KkGPpn5oMkWTEOVoloIufeXetn9OotUWax2hOqktDdbbbM6CKHM9gqy
         cwNg==
X-Gm-Message-State: AOAM533CS8oDFqvbNN1NeJE8HjjNDgB/vmo0cipI4jS6REd5vfjMnEJ/
        iIbuSiz3Z4XScBaEJ9jyNN1pUzwrGkbYHhbbttVx6UxYJj4+5Q==
X-Google-Smtp-Source: ABdhPJyZG617gGSQmcyprwXC3l7R47IPORVt4MrdXvU/+i8H2Dsobr3f5z0HJD2uaACxT1kspDzeshhPyDKmNyDjxUA=
X-Received: by 2002:a05:6a00:854:b029:1b7:6233:c5f with SMTP id
 q20-20020a056a000854b02901b762330c5fmr4295129pfk.73.1614871349267; Thu, 04
 Mar 2021 07:22:29 -0800 (PST)
MIME-Version: 1.0
References: <20210304071506.18434-1-noltari@gmail.com>
In-Reply-To: <20210304071506.18434-1-noltari@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 17:22:13 +0200
Message-ID: <CAHp75Vc6azROSAc=ZUjY+VhAjZDMsukr2ZY1fQHMFwncL7_AbQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: regmap: set gpio_chip of_node
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 5:18 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:
>
> This is needed for properly registering gpio regmap as a child of a regma=
p
> pin controller.

> +       chip->of_node =3D config->of_node ?: dev_of_node(config->parent);

After a closer look I have no clue why you need this patch at all.
The second part, i.e. assigning parent's fwnode, is done already in
the GPIO library core.
The first part, keeping fwnode in the regmap configuration puzzles me. Why?

--=20
With Best Regards,
Andy Shevchenko
