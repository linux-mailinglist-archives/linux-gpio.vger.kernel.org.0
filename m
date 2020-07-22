Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D24C22932B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 10:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728299AbgGVILD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 04:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726807AbgGVILC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 04:11:02 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D59CC0619DC
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 01:11:02 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id 88so974705wrh.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2020 01:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L+0qNosp+qbvFerQDb4sog2QQlEVT83lp6nympGJ2JM=;
        b=j9bRZcEbg8UI+nQer1+XOuz0n2+b+AjZvjKwMBGdWa1XGO0pwTfIoZP0RKRq0afFRK
         FXrSyp0Aia8ZBlMhTKx/TXgF6LJG7eW5XgK3U3pW0OKjtM1rwMwKMnm3nHsvXa0yamT6
         gPKbyH8cZM+sbjwvNWIuuX/LxLYdj+lksdUM5Q0mDdlRXDse93ZKcDSH6B4OtsMJ4Maq
         6PV20/xXY5uciFbZyzVa2CTK9JKWVW74Khyw50j+p8xKh1oeeZ8uvSvXRaQvFamsqncM
         u9r34Vo+8UbbK9NNXhCBu0RuuxOLhP34BL7ii63mhcXaKo1hfK+DGFq23XyzMkFZgw6+
         pQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L+0qNosp+qbvFerQDb4sog2QQlEVT83lp6nympGJ2JM=;
        b=E63g5mCvyVhkaGyIKVXue2o9fLSCiut80XS7l48DCjtO28hBQ36r8jtWobg6eCG5/+
         VaPD3Ojt2izamDiCdj/YyWNpTcK3Ev97OC8AqMtHjEcwdH+yBFsR/4SFOVc63PVPM9CX
         o4ypoSLpU8+Ba4PBeyfcuJZPwh2xw2qxNrBH0QiOQXPejJlexGmRL/pk9IxHa1++ZZsv
         C26vHBxBQnwC7t88SsAahyne1dzXqoho5/QqY0wNttgV9pxhZRcUWdIcdemD8E91VlHT
         dWTsWUoX5blj+Qu6TlN8szgVZwXFFA8Srt6nSdCvk5LEOrWQcFs862lyk39scnK7DKo7
         vdZg==
X-Gm-Message-State: AOAM531GR/KtuJPYWaoIITKGZX0zt2Ph+qUnxI6v0KwqtgkXCRVMhecD
        qhSxf+5zodyWCt9PD4yJRleZd2NJLWngF5Yx3Sw=
X-Google-Smtp-Source: ABdhPJw87b1CLEJnCRq0YlA66lLXpoKVZjrjubP+puUQDxmoPusmPOLIxywNJ10qm4+gSGUCAlsJYA9PKn3UONfAFTg=
X-Received: by 2002:a5d:420e:: with SMTP id n14mr31821077wrq.164.1595405461269;
 Wed, 22 Jul 2020 01:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200722073426.38890-1-linus.walleij@linaro.org>
In-Reply-To: <20200722073426.38890-1-linus.walleij@linaro.org>
From:   Daniel Baluta <daniel.baluta@gmail.com>
Date:   Wed, 22 Jul 2020 11:10:49 +0300
Message-ID: <CAEnQRZA7PKNAP1oswO3mGMTh42YefLE_AwSMSBu9NvaWq_L4QA@mail.gmail.com>
Subject: Re: [PATCH] gpio: dln2: Use irqchip template
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Octavian Purdila <octavian.purdila@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 22, 2020 at 10:36 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This makes the driver use the irqchip template to assign
> properties to the gpio_irq_chip instead of using the
> explicit calls to gpiochip_irqchip_add(). The irqchip is
> instead added while adding the gpiochip.
>
> Cc: Daniel Baluta <daniel.baluta@gmail.com>
> Cc: Octavian Purdila <octavian.purdila@nxp.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
