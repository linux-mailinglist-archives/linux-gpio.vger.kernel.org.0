Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D216A526BD5
	for <lists+linux-gpio@lfdr.de>; Fri, 13 May 2022 22:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384521AbiEMUsn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 May 2022 16:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384541AbiEMUsm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 May 2022 16:48:42 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED0325BA44
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 13:48:40 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id e12so17209204ybc.11
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 13:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OTCIkj90NBygwp7HNsQRRk847EEs9xR8am/5uzEVKWw=;
        b=pBmjymeLQcAMkCc+0EjuC2mm5QmV/BKUBjVyTqWUgDufAx8EPG9llPN2jbimesnfTT
         DGJS2arqGu4epwSKb44DY8dIZpC/Pxl8bTgMS0ROcumvV7bYPJgaXVOZ/1y9PY+XRp72
         fxnhz5CFbIJyYzSXuZsH7AQcdo1UbSBX4s8Qal/ODPUn39UOutPJQDYfN+oR2LUZVK6E
         0ggMQOJ8Xdua4bG45woVaCHB2gjNunAnCuEqd3J5BU6+VjeM57AvVz3CvmoYbF6BSQ40
         EojNTOmbAVv4RHVkSUo4y2X68v1EIJrJvRF+csdmb8Dh4UsqDTP+mz0GD8IQQ2TO8rmj
         KGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OTCIkj90NBygwp7HNsQRRk847EEs9xR8am/5uzEVKWw=;
        b=zL0eQBTYLt6KNQz8CwRG6rtdXHz6iWfS4eRb3TpSoh1bKpI79sTuxHgidZ1INo1csk
         2CmBWY1TqyXfJXvuLHfuZpKXRpA4dU1LIBKmsjvJWk9bLQqfBQcxSgaAhJGbcC9OJW1q
         OQB/GdAChOW5pFDpVVMl134FQPYsFvdtTigqAbt7IVLYi+co/j4WNDwjxF6qCFZKZMbk
         bVcc0ba9vvVn4G8xwkkbN9EnDwQUwEiLiqB1S3kskLLYOHtVJ1l6tLdtolkttwPBsrQq
         HRP2O0tDPHu6RWE9q6JZDzie1cPpxbjS9+8bAESW2QftvMmtQ/gugSVbRbpjHFh1k2SR
         Medw==
X-Gm-Message-State: AOAM5306XWLKcG9NQb8TiG/azJPE1o8wsL8sIroiCoVJ4OGiZIEYomB4
        M2s79R0UOTTPMP7zZ2ZFa062tArz6Kw0Oty099KKoA==
X-Google-Smtp-Source: ABdhPJy1oub1wqNIL+dXWPPAo7G+hsM8kiG6sIqtPN0UqKiA5aDptON108TZ6VrtImzcKpAqrVC3ooWmlESPKuZgCSc=
X-Received: by 2002:a25:2c82:0:b0:64d:62a1:850b with SMTP id
 s124-20020a252c82000000b0064d62a1850bmr138311ybs.291.1652474920207; Fri, 13
 May 2022 13:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220511205959.10514-1-mosescb.dev@gmail.com> <20220512071415.2786-1-mosescb.dev@gmail.com>
In-Reply-To: <20220512071415.2786-1-mosescb.dev@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 May 2022 22:48:29 +0200
Message-ID: <CACRpkdbuf7t8obNZi9peyx0ku+EHMW1waL3jvJHYCstXztFw0A@mail.gmail.com>
Subject: Re: [PATCH v3] drivers: gpio: zevio: drop of_gpio.h header
To:     Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
Cc:     andy.shevchenko@gmail.com, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 12, 2022 at 9:14 AM Moses Christopher Bollavarapu
<mosescb.dev@gmail.com> wrote:

> Remove of_gpio.h header file, replace of_* functions and structs
> with appropriate alternatives.
>
> Signed-off-by: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
> ---
>  V2 -> V3: Add missing return in front of dev_error_probe
>  V1 -> V2: Move gpio_chip member to top of the struct
>            Use dev_error_probe instead of dev_err
>            Minor style fixes

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
