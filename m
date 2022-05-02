Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98DA9516C4D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 May 2022 10:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242701AbiEBIrW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 May 2022 04:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbiEBIrV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2022 04:47:21 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4CB917077
        for <linux-gpio@vger.kernel.org>; Mon,  2 May 2022 01:43:52 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id m20so26446186ejj.10
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2022 01:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CncokmRcKjANDLE6w/8EviXFs0aoBu6dF5VEga/j1m4=;
        b=RM5vMhYTnDWgW5ubl5xDoLJqC/u04I+rdDBTcQXLstrDoq/3lL+u03zywm+DiV6JHD
         JvKnwGo4FZXiCdvOCSrI28ih/Q89FTIFq5Ap4dSA3nPdKp7h+nEcJ94PpmJg9p8xUKsW
         SIc5SY9b+fMCBshM+Px2iacQpYBewg9FifHUShG3ajeEPbaEdg+Wx4t+QiyFY+YwNEOE
         3py1TuREiBsKlujopyTal9TvbEHCkHppDJcEfmvbO8nAKgnCU9Cc5e4o+DBxGlVDeLDX
         /qk/K0qlKrnKSpo+Xshshd1LOLRME3KgPaW7YgboXlgjfNyyIGhZb0Q6MieMcCQLWbZN
         +fSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CncokmRcKjANDLE6w/8EviXFs0aoBu6dF5VEga/j1m4=;
        b=7sOUpGcJaA41dzHLUzsWyFdyyvgwC/kI0uyeV31XrAa6HStvI2ADW0PlyvuAdJHv0Y
         OUN8NKoJ5x/bOHyhjgmzbu+2gkS77C/L9kEfX/9nzNRzOHRWY4x8FGDV11TFVkog8hPY
         k20P0vukdStBCI0aFhNOJrqnzmWPzegwU8fxoL3aWhgvqrC3jCGjJQ/tIJQ4l8AzuDWf
         gnP4aaHLBPpoSupXEZZE4hqUaAx7AswjD6iatYrX3K3+nmr1Q8wulbPNZEY1pX7DcVwn
         xdveUcbFY37dffgjIv6pd+6OIj/gl4wTCIXBBfyd8iLS0Oo5i69z9wB+TP43tCcxa6Cw
         FSlQ==
X-Gm-Message-State: AOAM530xhShTpPfqpabFyfjXHquvBYV+wdhWHKxEZ7cIc82nboHqMM32
        tsE/mTS9X2ucSKZB4e/Z5Y2PFRCaHwSovyRFX+rj5A==
X-Google-Smtp-Source: ABdhPJyBr3X3y7WIseA3jYP0b8fi1XCLJCXF2HZP8iRnbLtA8Llet7aDwNr2aD4tLhhCQ8m9FTe/Y4tmxKZD0CTrojU=
X-Received: by 2002:a17:907:97cf:b0:6df:846f:ad0a with SMTP id
 js15-20020a17090797cf00b006df846fad0amr10300922ejc.286.1651481031262; Mon, 02
 May 2022 01:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220420065102.44083-1-eagle.alexander923@gmail.com>
In-Reply-To: <20220420065102.44083-1-eagle.alexander923@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 May 2022 10:43:40 +0200
Message-ID: <CAMRc=McWh2AfhrwpmfFb7T7pQ_6EcBx-wL2=q_khqfp1eeSs7Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: syscon: Remove usage of syscon_regmap_lookup_by_compatible
To:     Alexander Shiyan <eagle.alexander923@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 20, 2022 at 8:51 AM Alexander Shiyan
<eagle.alexander923@gmail.com> wrote:
>
> Since version 5.13, the standard syscon bindings have been added
> to all clps711x DT nodes, so we can now use the more general
> syscon_regmap_lookup_by_phandle function to get the syscon pointer.
>
> This patch removes the usage of the syscon_regmap_lookup_by_compatible
> function as it is no longer used in the driver.
>
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---

Applied, thanks!

Bart
