Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B89557DB1E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jul 2022 09:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234007AbiGVHUE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jul 2022 03:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233417AbiGVHUD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2022 03:20:03 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9914B62
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2022 00:20:02 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id ez10so6988487ejc.13
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2022 00:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ouSSdITZq0FsaMVncH1X0sX6Yphj9Cjyf72zkTGekO0=;
        b=bPYF3z0YzAGpQX9WgEBtgnp6WiDyVCcYK9pFLbm2x9uoNu4SrZJg153jrQrjKNwBLK
         KnCjXGj4hxLR86UZDs8B1FF+a37Wd9Y2DWSooabAQgmz+Js2vAgLrdd1t06GTBAdFSyu
         +9fhHvL8lPlBs/BcBn2LJv8Y8dlJwkoOYnx3w2lvOHCzhvc5/MOhcX6GHAFh22gcTlsJ
         K/tS/fdrmn28u5U2xuNwNH9KjUs+9/zhA+jDHVEiLhiqG8ZgvHzf7onb+IGq0wn1xX9A
         fFqlCw29sIdFMT1OHKBHN8ZorrcwqFBD9KaT74K/zqx6fIJaaG0J6dUO4IcU+cWP5UqN
         PEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ouSSdITZq0FsaMVncH1X0sX6Yphj9Cjyf72zkTGekO0=;
        b=NA8SOMdQHBfKqXpJ45aX8jBkcSprlOmZDDGli98ER/hdo1fxbj7zvlfrt42trwnhJF
         XYVV7mdAKT77liZMBn7ZYbJvgGAcpW4wo+MCHCsVbLm/fp4p8ed/Tv0sTpXigeZtqOjd
         lbhDqGDCMDo9LUBtT7HxoFS7NQ3WFbcmTYjJY0WH3vB68zvViri1Xoe/ZbrHf4spCw2W
         gBjqnOwwoxnAQwLx0xc+C4s0kLVkqJNPSYC7GEgMiwr43IROZ1LSVBbVaDoGjYQqEIJz
         DNJfjH72OAfn5b/EJaYSXE3mWbp5mgq5xJPheCg2hQ1JgKAPJMP0nPCZKJpU3Zg9EsWa
         SDbQ==
X-Gm-Message-State: AJIora/kcZEB4k19z8MH3iD6/4pVH9tIbh3UYACWVfxUza4mv7NUCJvm
        bCyqzrtWtfqFWbgAA1z365KVGz5LvwHPEp+qDhwN5A==
X-Google-Smtp-Source: AGRyM1vaaCFD7cdmMQ6HjkruGEujivTRBWp8780hsCXuLcgaXUNWfcvbAmpbQv+nwnM7DI/pHZJH5TtPuyiXiEigPak=
X-Received: by 2002:a17:907:1c0a:b0:72b:378f:2fa1 with SMTP id
 nc10-20020a1709071c0a00b0072b378f2fa1mr1969373ejc.492.1658474401450; Fri, 22
 Jul 2022 00:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220721152508.3661-1-william.gray@linaro.org>
In-Reply-To: <20220721152508.3661-1-william.gray@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 22 Jul 2022 09:19:50 +0200
Message-ID: <CAMRc=MfmykYAnBzhFO-XQd0j646gDHNqdUZyAivQbgFtwY5Dig@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update Intel 8255 GPIO driver file list
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 21, 2022 at 9:15 PM William Breathitt Gray
<william.gray@linaro.org> wrote:
>
> The drivers/gpio/gpio-i8255.h header file is also maintained.
>
> Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 960abc07304e..2bd82ce171ca 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9907,6 +9907,7 @@ M:        William Breathitt Gray <william.gray@linaro.org>
>  L:     linux-gpio@vger.kernel.org
>  S:     Maintained
>  F:     drivers/gpio/gpio-i8255.c
> +F:     drivers/gpio/gpio-i8255.h
>
>  INTEL ASoC DRIVERS
>  M:     Cezary Rojewski <cezary.rojewski@intel.com>
>
> base-commit: 949506dc608f9820e0cee51b106c35fd3503bbb2
> --
> 2.36.1
>

Applied, thanks!

Bart
