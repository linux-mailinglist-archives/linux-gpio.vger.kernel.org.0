Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0FDF4DB59C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Mar 2022 17:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351184AbiCPQIO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Mar 2022 12:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354749AbiCPQIN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Mar 2022 12:08:13 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D3B66C95
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2022 09:06:58 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id j2so5369374ybu.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Mar 2022 09:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a/fku2jY7FrEwf8BvIHJEVI6TmZJW1EoFquRvwAEEBI=;
        b=kQniIhahzChESr2Lkq/u/YeQvDTcb3hjU5hkJFuigYB+5zfYmJX5M9Tw4PtLrkfbXH
         7+GCgpNn3+ixSdB3ecVi3zgZRseJisvsaFJ3iuRqbRkXROeyDT51XAexq6wnj/EPVBu/
         0mdDQ5crj5nu/soRPXkA54VijpRt8F3QDC/AfnNU9Y1cyCJpA2oBp96Cu0xgJ9mO00B/
         GB1sEzeRPSBteVmHmUsxF0/CPar3Ftjiyh4Rln/Am2SPBSWA7tTnAd1xDTDQvwqkEQmF
         7Hd6Zs8FpAQQ8xwcVwnZAJ5oInckAu0b6FPLTZOb4Ij/5uH0D4ncJF762lBIl6g0z/lw
         94pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a/fku2jY7FrEwf8BvIHJEVI6TmZJW1EoFquRvwAEEBI=;
        b=3NdmOM8oWknX+y6Xsw/aKGt5JdTBvrBtPgimWW+XezGH8ZtqMpIstJBDXodLI4pXXi
         sJJLAMB7qqWqhhX/lDUawrfT0gFnX/xNhMoO9NYVdlzUEUUqukAvLv4kgu0CzpJz9TjB
         x/p6G8Xgp41hmPC3YfzYX222+mhNEyIGOHLLodIydcNhxAmnMHw+oyCVqvoSVkHzkAF2
         OfYYKrLwsOn3V09GI0bdarg889u6RXl2PEIlls75G/eedY59SKVlneRpQjagGOoSP2cQ
         b78YcPrPPz9gwa5jD6jGHbmXz13pRykoQluaEzDQ0W7Zsx23387xAc4TN/Kj+EOTjDbu
         o96w==
X-Gm-Message-State: AOAM5310S25WocTef8CEh0gY/nmJeEPOeQr8F5iUI9jPCsR5ucKm1tII
        sDioH+V1r4S6fz2IzgJFr7rKP9c8SRdfPeXQAv63HQ==
X-Google-Smtp-Source: ABdhPJzpNehbsRHEj6Slc+4ZIcLJRi1k3XLsbjdKqHuiXH7nJyB8JuisPsnUq/kUqSlZbPJMHAytZV8AePC3mbRa4tM=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr553635ybr.295.1647446817892; Wed, 16 Mar
 2022 09:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220316141636.248324-1-sashal@kernel.org> <20220316141636.248324-10-sashal@kernel.org>
In-Reply-To: <20220316141636.248324-10-sashal@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Mar 2022 17:06:47 +0100
Message-ID: <CACRpkdZU_wv74MeRiO_bMV03Gwp=8LamsPOGMEpY8Rm-X2Aq8w@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.10 10/12] gpio: Revert regression in sysfs-gpio (gpiolib.c)
To:     Sasha Levin <sashal@kernel.org>
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
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

On Wed, Mar 16, 2022 at 3:17 PM Sasha Levin <sashal@kernel.org> wrote:

> From: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
>
> [ Upstream commit fc328a7d1fcce263db0b046917a66f3aa6e68719 ]
>
> Some GPIO lines have stopped working after the patch
> commit 2ab73c6d8323f ("gpio: Support GPIO controllers without pin-ranges")
>
> And this has supposedly been fixed in the following patches
> commit 89ad556b7f96a ("gpio: Avoid using pin ranges with !PINCTRL")
> commit 6dbbf84603961 ("gpiolib: Don't free if pin ranges are not defined")
>
> But an erratic behavior where some GPIO lines work while others do not work
> has been introduced.
>
> This patch reverts those changes so that the sysfs-gpio interface works
> properly again.
>
> Signed-off-by: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Sasha Levin <sashal@kernel.org>


I think you should not apply this for stable, because we will revert the revert.

Yours,
Linus Walleij
