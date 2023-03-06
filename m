Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 674616ABB9C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 11:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbjCFKSX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 05:18:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbjCFKRy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 05:17:54 -0500
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C906122001
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 02:17:29 -0800 (PST)
Received: by mail-ua1-x92f.google.com with SMTP id x1so6035655uav.9
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 02:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678097849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKtYenUqtd6VLS14GJrUPd5L2ue++xHl4Zvl1BOmIFU=;
        b=WnA1PDe7IO9i9LNud6CZrnh3mgBD12jgBwRQDB6tfNWrXF9y28VFhW+Flxl/4gNY4e
         e0TWsqMvgW8RM72Js22NYwfVvtYMLdzmNCYbt8D51secquUaetoU8bYZp4zxkqOEmQcj
         +8+7zJfzSKuQ7EdEZeTYMcNcE5nO3ShTa0zbkuc3uQGfkguTecW4Lgb18lL6i1GYsSbh
         8qqE8Fbgqmd11uYDkfwQbbyDr9JYjCgazgIzJjasSucop9ttnlbGajizf5/2Hp0oJpiM
         zxGgRYswZoJucJz+iPdixZkTEEmOjN7tWBs0Fvw3De6nnit/Bm9dqp7luej92qXu51vJ
         fmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKtYenUqtd6VLS14GJrUPd5L2ue++xHl4Zvl1BOmIFU=;
        b=NYmlsw51zFcze6ZfXc/Z3RWmB3VgRpKvm97Z01ItqW/0fpOGr2SnO7cmMtL8tgAx+S
         d3a25H//jkeaChGG/xz05z9bGEU23DTPaiiLPlivwp81VsNBHgP0RcoX9GmcLXQFNwpA
         FJMncm1Ofb21ccze8WX3keRicO4Wb5/Ht4Zx0nyCU708XhOsXriaws0q0UAECahx5vTd
         hfHOXEsxW3rSqAptvr9tk16MJUxi9YejrGS/yZdL9T27R0gQGB72PmQEBD5MiW7UZxKU
         cgVAxddjpde4vJenNtwyEpyP8J2CE3jcFuQCLJiiuZb96QnATygj+orgtxLGZZZvkzQ1
         pzmg==
X-Gm-Message-State: AO0yUKWdbOM0CnAA4r/zBG0Q5XMxKTUp7pcVrHlAU9lkmEh+kk8I+5ol
        gE9QNl+Ws9YFaAWcbjwaR9wQ0MTI+QyJSQg1g9kj4A==
X-Google-Smtp-Source: AK7set/X1gbAlXGfd9w/+La9Un/k7BbX9YRtJU9/AJdwxyPogFCGtQifMzZmGZ0sqrTFpoLiV/EVM8Bh5GgzffrAR7o=
X-Received: by 2002:a1f:1888:0:b0:401:8c72:4cf4 with SMTP id
 130-20020a1f1888000000b004018c724cf4mr6487877vky.1.1678097848924; Mon, 06 Mar
 2023 02:17:28 -0800 (PST)
MIME-Version: 1.0
References: <20230226053953.4681-1-rdunlap@infradead.org> <20230226053953.4681-4-rdunlap@infradead.org>
In-Reply-To: <20230226053953.4681-4-rdunlap@infradead.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Mar 2023 11:17:18 +0100
Message-ID: <CAMRc=McJk4QE_hbjKzPcVTdfOAqT+jcfCenwdPzds8CqRYVtZw@mail.gmail.com>
Subject: Re: [PATCH 3/8] gpio: GPIO_REGMAP: select REGMAP instead of depending
 on it
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Feb 26, 2023 at 6:40=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> REGMAP is a hidden (not user visible) symbol. Users cannot set it
> directly thru "make *config", so drivers should select it instead of
> depending on it if they need it.
>
> Consistently using "select" or "depends on" can also help reduce
> Kconfig circular dependency issues.
>
> Therefore, change the use of "depends on REGMAP" to "select REGMAP".
>
> Fixes: ebe363197e52 ("gpio: add a reusable generic gpio_chip using regmap=
")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: linux-gpio@vger.kernel.org
> ---
>  drivers/gpio/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff -- a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -100,7 +100,7 @@ config GPIO_GENERIC
>         tristate
>
>  config GPIO_REGMAP
> -       depends on REGMAP
> +       select REGMAP
>         tristate
>
>  # put drivers in the right section, in alphabetical order

Queued for fixes, thanks!

Bart
