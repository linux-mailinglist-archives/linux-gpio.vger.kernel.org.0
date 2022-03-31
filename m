Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 659234EDBA4
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Mar 2022 16:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237490AbiCaO0j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Mar 2022 10:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235463AbiCaO0j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2022 10:26:39 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5521CABE5
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2022 07:24:51 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w8so23560759pll.10
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2022 07:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M8UiF+eOvN676KkedJKqoXrw8V2XeWwWjDOh42jHLWE=;
        b=A/k9flWmlg/wenGo+mfAKhUB1SWwFLwlGgA+RTTcYzsKs9eajGKPzx6Hq5ZakD+r3J
         CVNBmPALRH6BWnzP8zdJS8KpzWmCgi+nrx/WvVXXRs5lP24UgnqoAs3M43gl5zKCO8wn
         PuyLMpZLFP427iW3DB8S1Lsr0Kz71/BCG4jXQAH6y5bsgjsgf9jDmDGRTWJRYty+DTog
         pMaSLRUjxE7rqSNXXMkU/Q7KMFMJO0BXp26j89UWMEtOuzSHdGjfrU79UddSda/rkfSy
         yeZWMFkgShFrpiWoL/AM0U2qsMHw6prFgUtU8t580CM6OqaqnPig0n5fFvo6wduLr+HY
         +z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M8UiF+eOvN676KkedJKqoXrw8V2XeWwWjDOh42jHLWE=;
        b=f5HZiU1bv0hCc1yUAq4UM0IpWTHQ1SsKuYH0g6m6nSftxijmY/DMB4athGtHRBpsRi
         fO54mKcNURbxMfLCNcSgs4ZfElxQGpDHGUU7/FhQHnU+i0sUWU0T+DoWwSiZuAdqJHbd
         +fv+FLDjT0nW3PwxhUTV5++iDmtEClvhSyitm9SvtZr60Owm5MAyYTmNuQ0YlF2GWDbg
         x6GqJQLa5V5fjTy/xoBH7DmvgQbDfR7nJ7B7PaHf/36bAhFBxn95aV/f6NyRQKyCj/ur
         0dGy2p7mzVpL+10jjAIaNCrEKSpeVxEeYmA2AvoGGRx27/+tlcpM4oOP1c+E4on8tOHn
         FFZw==
X-Gm-Message-State: AOAM532UQfQANoxxZIsNBNdOaExb0zbAmf7ENab1Aeq9zLzZmvsI0KAH
        iQI3SoVvLxbNxbCWcTt3FfONC7CY7I9VKFER33f2z7dGgicbAw==
X-Google-Smtp-Source: ABdhPJzzowr25buee4hbcbd8HpoVeSuhTgAedKWNkzKGvZeC3UrRyMKC2ZZby+rdd/FX+TtKtVB2zM2iaXydDSx9UtE=
X-Received: by 2002:a17:90b:1a87:b0:1c7:3d66:8cb with SMTP id
 ng7-20020a17090b1a8700b001c73d6608cbmr6415393pjb.142.1648736690828; Thu, 31
 Mar 2022 07:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220318121233.7215-1-joey.gouly@arm.com>
In-Reply-To: <20220318121233.7215-1-joey.gouly@arm.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 31 Mar 2022 16:24:39 +0200
Message-ID: <CAMRc=Meo-Gos7=+x7jKnGknvd1eBR_sp2z_p8Bp9O-o2jh=JhA@mail.gmail.com>
Subject: Re: [PATCH -next v1] gpio: Properly document parent data union
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        nd <nd@arm.com>, Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 18, 2022 at 1:12 PM Joey Gouly <joey.gouly@arm.com> wrote:
>
> Suppress a warning in the html docs by documenting these fields separately.
>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Link: https://lore.kernel.org/lkml/20211027220118.71a229ab@canb.auug.org.au/
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/gpio/driver.h | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index b0728c8ad90c..98c93510640e 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -168,13 +168,16 @@ struct gpio_irq_chip {
>
>         /**
>          * @parent_handler_data:
> +        *
> +        * If @per_parent_data is false, @parent_handler_data is a single
> +        * pointer used as the data associated with every parent interrupt.
> +        *
>          * @parent_handler_data_array:
>          *
> -        * Data associated, and passed to, the handler for the parent
> -        * interrupt. Can either be a single pointer if @per_parent_data
> -        * is false, or an array of @num_parents pointers otherwise.  If
> -        * @per_parent_data is true, @parent_handler_data_array cannot be
> -        * NULL.
> +        * If @per_parent_data is true, @parent_handler_data_array is
> +        * an array of @num_parents pointers, and is used to associate
> +        * different data for each parent. This cannot be NULL if
> +        * @per_parent_data is true.
>          */
>         union {
>                 void *parent_handler_data;
> --
> 2.17.1
>

Applied, thanks!

Bart
