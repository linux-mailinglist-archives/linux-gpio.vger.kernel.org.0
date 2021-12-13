Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7E1472DC0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Dec 2021 14:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237911AbhLMNsS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Dec 2021 08:48:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbhLMNsR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Dec 2021 08:48:17 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35536C061574
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 05:48:17 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id t5so51957706edd.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Dec 2021 05:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wu/ZxCGSsJ+oivX8kkncERiBTBwcaObKtaxtxVxyM6E=;
        b=Hd9RksSv2OCCKj1GLzBeT3a30JYz5Savl/39eqYLE/ED3ZHJk+/+Pea/sj0tHNnf+o
         Qu2gZI9YgCWCiTKIgzzEX/E413jC0KZCgLx6oCA9nH68us/bh2W5TvM5E7pNRNAH2J1w
         V1k+kNyv3U8Q5c2h8lnMvx9UDYrPoyxT59zFfXz+fFBgMV+6Y+lX/q5Tf3DpkXE3mjx6
         r4p8n1NUdM+XroD4eMysJWUh8ceZ+8c250s2iHf9Bfw+EZWbVai/H/GxAM9REIAHJq7E
         Nq3pilBVU8weqHwC/j/ibaxqk8hL3CYbhsbcCmg1zquQCL8wkiMRg0aXIC8PfSV87p1g
         1g1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wu/ZxCGSsJ+oivX8kkncERiBTBwcaObKtaxtxVxyM6E=;
        b=VunUsb6iy85pwNeBwqcXm+aTY+ITMml/tyFiBhhPmdIUiVYMBKdUV0yI0SMt2uplFu
         odMb9b8ApEuXOPmXwutkUDr2dy8yoz4XvKDZC59GTy8SSE/pd/hhaogYHz8xc1ksoK5h
         mKu7mjGNc8APHMZ4GXrDo7hyQqS6uVBeDDcs1cWA3Rz2xUxkrq34Vp5+VYLsI6Wr2BX5
         /94CmPaIPUczhD8dCD/vzVRxL4OXnxzSM83D3duBLeOWlzQ1IYwHHj7w/5EzKupugIJa
         nIIz1ORTb8qY+rnyh4QUb9zrh56RcaKC3tNQfcz0a6oA3ICLw1q39WQLl06AWQt9iDAg
         h8bg==
X-Gm-Message-State: AOAM532NW/eFyhrawrOXSStksFhqMcNRk4kETO6GxYcEmFRG8opeUize
        sbFWKYjF0JkS2Zf5i7RVkfmd0rsXX5JmgqyhgYTWX9N2jiw=
X-Google-Smtp-Source: ABdhPJwOijd5WgV9me5Rti0PSTtwawWMernnmcAkVkEktGsVjkReg4dg+5XeNqBVRLChj0pbMbguqeQBWLObtqbjcvY=
X-Received: by 2002:a17:906:4787:: with SMTP id cw7mr47479334ejc.311.1639403295706;
 Mon, 13 Dec 2021 05:48:15 -0800 (PST)
MIME-Version: 1.0
References: <20211212031335.36369-1-wangborong@cdjrlc.com>
In-Reply-To: <20211212031335.36369-1-wangborong@cdjrlc.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 13 Dec 2021 14:48:04 +0100
Message-ID: <CAMRc=MfT72KJVQKCRqdToPSf1kysyu=8RLktmB7Dpbv8dDB8ZQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: sta2x11: fix typo in a comment
To:     wangborong@cdjrlc.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 12, 2021 at 4:13 AM Jason Wang <wangborong@cdjrlc.com> wrote:
>
> The double `all' in the comment in line 327 is repeated. Remove one
> of them from the comment.
>
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>  drivers/gpio/gpio-sta2x11.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-sta2x11.c b/drivers/gpio/gpio-sta2x11.c
> index 392fcab06ab8..e07cca0f8d35 100644
> --- a/drivers/gpio/gpio-sta2x11.c
> +++ b/drivers/gpio/gpio-sta2x11.c
> @@ -324,7 +324,7 @@ static int gsta_alloc_irq_chip(struct gsta_gpio *chip)
>         if (rv)
>                 return rv;
>
> -       /* Set up all all 128 interrupts: code from setup_generic_chip */
> +       /* Set up all 128 interrupts: code from setup_generic_chip */
>         {
>                 struct irq_chip_type *ct = gc->chip_types;
>                 int i, j;
> --
> 2.34.1
>

Applied, thanks!

Bart
