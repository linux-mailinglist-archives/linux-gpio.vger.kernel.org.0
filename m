Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE9B755DDDC
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbiF0J16 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jun 2022 05:27:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbiF0J14 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 05:27:56 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343A562E0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 02:27:54 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id r9so4944968ljp.9
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 02:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gN3nF3XcouQL/cVCpyx7ZrlwyAQWaFQc+AC2iPUl3mk=;
        b=Gw1BickyXa7Ce+fFAWhaiKOGyn/Ah2/OoU0nK39dLFFciUiKFIdcRZ5jDssYLCuHPR
         FwpniWrQDHoEm9VGihHYvFe17m+e5YvDOgn8Fmjknqj+UXZMmHUXd1Onzl85iOP521FX
         u8lH/OGKBT+Asad5yTRQthKajwIwl6lg9OH8IPFdhvhB6tq5yPMDyF2iW+Of+KyWGPR7
         bY/Q2CjNrhe2371DdxVCx8/rV7wanL3+/XRC533IG3KtnRoZHaXqgDqMPsRiBouolAkI
         cnMi8sjW6+bMt5BOhzyqpCWAYy+x6b+SYqYqNFgm8fzMVTyHJK5RKTvxx258VqXOQY4Y
         kPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gN3nF3XcouQL/cVCpyx7ZrlwyAQWaFQc+AC2iPUl3mk=;
        b=VwIkteFQLMFdnDjE+05ao+L2Ck59hG30lY48Z98HOyOSUqbhGdnLzZ5t8bhul5SMMN
         S8HeotIZN9kJ/H+6nPe3rK/XlMYeHPI+pbSaQvJV+1DPOumDbIoX6QqrUkLScPij/9Xa
         ruftScIUMrQk5gldAoSFO2PDkgTyLRVtc84vbge5SUJLQ/lJNdP9v9QKQLlQ80LjKm36
         L1E9Qo4j2h4q9ZF90Z0KHyX9Sf5ik/RYRCRuxlqB+5EUsmtl4fRvp9t8gT+fTOH1iiIM
         ruXskfMrfQIR89E41YS5TS6wPYazIZBH4Ey7MP/ir/R8ZlctGOjcp09CBM8Kfs6guR6P
         tzgA==
X-Gm-Message-State: AJIora/NEvQwhN2B0CNwo0sRvQByT/fcOhYG5biqugoOUAAgMMuMzKF9
        GZJRt+Z099udEWhvnbFIUNlk7elmhNshidVt6pozyw==
X-Google-Smtp-Source: AGRyM1tVSsjXPe5++ARLNUhpuau2SGj30HOReNKHpIbE86XK/nqCBFBRZKRvYgV5dc1Syd6xxcDne5wD4klkN/GDrd0=
X-Received: by 2002:a2e:9f12:0:b0:25b:ad89:80e8 with SMTP id
 u18-20020a2e9f12000000b0025bad8980e8mr5880429ljk.145.1656322072538; Mon, 27
 Jun 2022 02:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220525190423.410609-1-andrey.lalaev@gmail.com>
In-Reply-To: <20220525190423.410609-1-andrey.lalaev@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Jun 2022 11:27:41 +0200
Message-ID: <CACRpkdY107+sT60D3iuPNhXCx48cWKm953tq4Uso8+n4mwvO0A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: sunxi_pconf_set: use correct offset
To:     Andrei Lalaev <andrey.lalaev@gmail.com>
Cc:     wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
        linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev
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

On Wed, May 25, 2022 at 9:08 PM Andrei Lalaev <andrey.lalaev@gmail.com> wrote:

> Some Allwinner SoCs have 2 pinctrls (PIO and R_PIO).
> Previous implementation used absolute pin numbering and it was incorrect
> for R_PIO pinctrl.
> It's necessary to take into account the base pin number.
>
> Fixes: 90be64e27621 ("pinctrl: sunxi: implement pin_config_set")
> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>

Patch queued for fixes, sorry for waiting so long :(

Yours,
Linus Walleij
