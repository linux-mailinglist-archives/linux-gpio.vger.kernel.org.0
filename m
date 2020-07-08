Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB3721808F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 09:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729728AbgGHHOf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 03:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729702AbgGHHOe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 03:14:34 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCBCC08C5DC
        for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2020 00:14:34 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id k17so13471890lfg.3
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2020 00:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WH0DgEX1doSuthU1GvsRAiz7iRNbEa0pRy0hawnmsIc=;
        b=rtthwG7wiWOR1Qi7ORtIU4jnvQ9yZ/d0DFpgkczw4QvEK5Xp/6i53GrgMjbQEdtYCI
         K7Pr1Pimeo6eSz6SW3DJaeH3ePjBx4U80ixTw9EqJ5XuqIFUzVeeV2/7sLQsXJ+VvKWP
         ziJ6gxcP28rd2cYp8gnub8dNDiQDnbK/Zs6ekIPHApcWZTe9PUyIavwm58V0+kgpk2oO
         vvTIMDZXIN7AtmE9tHL+IwFOKA6oMmKgD66dzM/NxmbX3U8LPGddFi67S49XX9wv7GD4
         /SbeGYrAKigrSr1552XWfmZtwao5xB7hOctQftzX/855W/Dpwt01jTPBM7/MnS13ZP09
         RKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WH0DgEX1doSuthU1GvsRAiz7iRNbEa0pRy0hawnmsIc=;
        b=MdSaXv8v4hGH/WEIlvhQEtntFZPZpW5p8P6h4tbEpIuEQ5mLLgOnLhusch1KNRky4I
         Fl7SlL8CeRwhSajuKcSLP/1ONIgyYPndPXEl5HXYXR0usYXQ5otBdV1k9j6uXDYVN9nS
         xSSReHL/uv7tKn9y6w/159S2ZmeAfQhnXFquFNui/YnAjVkydqPf3oWivvNSsc/Xx06S
         IIhS/FP8UyKJ5NGTY1QpkVCjfATBTWgna3q+fMD5oXVTVSAwpmQxp6/YHOyfmk6mQg2x
         hsAgtIJrwCkXs8vW0Yq6/PhDh/sl+oflsOcmhrnKLGkromatFG7ixK93C28OnSnS+x/s
         FyvA==
X-Gm-Message-State: AOAM5310REAYwOm2fkP0dZB3jOjEPEps6bXFPGA1yDIkaIDnb1QQ84Eh
        btdQLZfXoj0dbMmgyh3bmHrPGaCAqEu4Muo1xezR8g==
X-Google-Smtp-Source: ABdhPJz+d2lLiVidW9bwPJZrRoLJK8yPDoBv0mfcvl03OB73UAC4v6nNwx4Fd9mVZhiUhmBKQzXOkXBIf7C4LV6QIRs=
X-Received: by 2002:a19:745:: with SMTP id 66mr35488731lfh.77.1594192472496;
 Wed, 08 Jul 2020 00:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200630133345.2232932-1-lee.jones@linaro.org> <20200630133345.2232932-2-lee.jones@linaro.org>
In-Reply-To: <20200630133345.2232932-2-lee.jones@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Jul 2020 09:14:21 +0200
Message-ID: <CACRpkdapTEkYSD_xY3JKHLDTFQ3qPFNMwntiTNWsQPD2ESGgCA@mail.gmail.com>
Subject: Re: [PATCH 01/10] gpio: gpiolib-of: Provide documentation for of_gpio_spi_cs_get_count()
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Anton Vorontsov <avorontsov@ru.mvista.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 3:33 PM Lee Jones <lee.jones@linaro.org> wrote:

> Descriptions for of_gpio_spi_cs_get_count()'s 2 arguments are
> missing.  Document both 'dev' and 'con_id'.
>
> Fixes the following W=1 kernel build warnings:
>
>  drivers/gpio/gpiolib-of.c:36: warning: Function parameter or member 'dev' not described in 'of_gpio_spi_cs_get_count'
>  drivers/gpio/gpiolib-of.c:36: warning: Function parameter or member 'con_id' not described in 'of_gpio_spi_cs_get_count'
>
> Cc: Anton Vorontsov <avorontsov@ru.mvista.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Patch applied!

Yours,
Linus Walleij
