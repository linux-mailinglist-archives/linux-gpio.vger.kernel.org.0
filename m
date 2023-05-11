Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFDFA6FEE17
	for <lists+linux-gpio@lfdr.de>; Thu, 11 May 2023 10:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjEKI5A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 May 2023 04:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233814AbjEKI47 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2023 04:56:59 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAEFC211C
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2023 01:56:57 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-44f98c344d3so2920033e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2023 01:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1683795417; x=1686387417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3w5BdOaIeLBl4PV1N4KLfFJ78i36vvbHzXi1/M5IM2g=;
        b=dYS2jkdjtfSQUdzL3nxGtvlym/p4Kl6Dbx/cKLoDh24jQoc5mSNE3RVelKWlfHfq1e
         R7rXKNFjZ0QeN+rbACTRA+XZGQp+fyFMB9ATKzCEwdH1DtyM2xD8uFo26cWJubmGtpsj
         jcCbWBSqOZ2ydiAzDO3lnRkp5uII67JBPVTkVW2xJfi5yZZgMOxCqnkhhdrq0abWjBRe
         zb1y8EG+jmp/CpU3oZe70tXFPYXTudUnHRQ1L0vLv9xgqZIbhWBH/6Gm9NcXayVMOLCT
         yrQEHUoRlQ6xDa/gTGsHOwOm4NC+/QMDZOTRnpUHXi6CRlRgXqAUR2/D1Htea4+Garwi
         Uzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683795417; x=1686387417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3w5BdOaIeLBl4PV1N4KLfFJ78i36vvbHzXi1/M5IM2g=;
        b=GyX8KfLCACxkFDkgdDjtv6IewzRh8O+/byrDJsYlYzkindfnLXnUsF7nZ31328Yc2a
         6CL2rHNFk7NaQ38Qwbe4eJFqZgn32axyjCn8JTSoxVcCD+BMKXFQdTJhcD8j6d4ppDOC
         MIy6K2720sQAlLgTwl3ktRnqUtzqSZJPqZcOX67WV1x6IoYMuobLJS0L1OXJuiUrN4YV
         k7JZgabRVsxYEF+D6TCvXHNlWGNf28AKCPUoHvIPpTG4i3lsqVnAtHORsLCm8o3VzYOq
         q1wVSEPTpLOfrnGO6huKB2tZlp2bW0ZQnzVD9Op1eu3fafioYzj/+6RqsTNbMwyyti47
         FO3g==
X-Gm-Message-State: AC+VfDwYSKNmGMrahbD0JuJ7ASQEMwQ6ZQDQPhsFryS5zsf69YFIVRAB
        Bggmm48ll0ZQir67x6+VYZf6934sO7BUaAK9E18tmQ==
X-Google-Smtp-Source: ACHHUZ63PQwfW6LVMyp89j4xqrJ6XjsIFjVjMqGiEe2iGK1JWeIG7RjXsUWBdCR9Cc+Z07rdKEoOW0VNyQb+0TJTt/g=
X-Received: by 2002:a1f:c882:0:b0:44f:a64b:479a with SMTP id
 y124-20020a1fc882000000b0044fa64b479amr6272988vkf.2.1683795416784; Thu, 11
 May 2023 01:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230508131848.142602-1-milo.spadacini@gmail.com>
In-Reply-To: <20230508131848.142602-1-milo.spadacini@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 11 May 2023 10:56:45 +0200
Message-ID: <CAMRc=Mfp8YKUtqumYAz4Q4N=Z-o5YpNgQiGrK7qutkajg25J+A@mail.gmail.com>
Subject: Re: [PATCH v3] tools: gpio: fix debounce_period_us output of lsgpio
To:     Milo Spadacini <milo.spadacini@gmail.com>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        warthog618@gmail.com, andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 8, 2023 at 3:20=E2=80=AFPM Milo Spadacini <milo.spadacini@gmail=
.com> wrote:
>
> Fix incorrect output that could occur when more attributes are used and
> GPIO_V2_LINE_ATTR_ID_DEBOUNCE is not the first one.
>
> Signed-off-by: Milo Spadacini <milo.spadacini@gmail.com>
> ---
> V2 -> V3 add signature
> V1 -> V2 fix commit syntax
> ---
>  tools/gpio/lsgpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
> index c61d061247e1..52a0be45410c 100644
> --- a/tools/gpio/lsgpio.c
> +++ b/tools/gpio/lsgpio.c
> @@ -94,7 +94,7 @@ static void print_attributes(struct gpio_v2_line_info *=
info)
>         for (i =3D 0; i < info->num_attrs; i++) {
>                 if (info->attrs[i].id =3D=3D GPIO_V2_LINE_ATTR_ID_DEBOUNC=
E)
>                         fprintf(stdout, ", debounce_period=3D%dusec",
> -                               info->attrs[0].debounce_period_us);
> +                               info->attrs[i].debounce_period_us);
>         }
>  }
>
> --
> 2.34.1
>

Applied, thanks!

Bart
