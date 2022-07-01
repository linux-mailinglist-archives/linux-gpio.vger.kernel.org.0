Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C413256316D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 12:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234895AbiGAKco (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 06:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236048AbiGAKcl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 06:32:41 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5FE4796B0
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 03:32:39 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id z41so2420527ede.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 03:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JOFbrEFB9DCfHsTRcts2PWWLes6+Uj7GP9RbVOzCFVM=;
        b=G+gv7lbE9ycKvCE2XLzqdLc2Ydvt8ZMtLvSeU8HaZ9IBTC9+4C4J6ma8pDYRasv6wq
         dcAt/tL/BVFPZBcEhMgdJxdBXiLcrR5bmHv75VIK3GY2JxCSNscmZtvnZBYdFRUX9Qcy
         IisiKj6sGhICKwcz5anBl2siQIhcRP+Uc4j32evQkEIK3AZcvRK1nehjJQIM5EzR/bPG
         fi6N0RqIPnU/tv562fCX7SXzZa+R0t5D5E/Ffu34GINVQTBi1YcK1LVQLyZlIFvcww/7
         Qm2IqQQtvN82DMspOaGPkO152of48xEt9tQYjv0rwDLdjcEcLNFX8kaM4qN61e0hgIvf
         93/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JOFbrEFB9DCfHsTRcts2PWWLes6+Uj7GP9RbVOzCFVM=;
        b=FX6DG9BFdUlgz4zCGhcxJkxSV8/AM2/1pyRyGmgx85UVQhvo103ZXzczNYGmI/0AFo
         KyGNbTVOWL//axCk3LDTfztnYjebilDpwXuDzl5XGdBbm0ExJ7VIBKQH2P0GjsAFxySm
         7QkirfvX8OEZJNaAumoqX5uyTdh4177FF2CSjMKlR2E7Onl10joXNIkx/lCIbjhVIN+/
         bjMoMNpPFPt9Rr1YfVY4W7ETAbWb4USzPNlSTFPWSw73gveRGhtMolCOMRl0acb6E3nm
         9VB+jli6FztQxY75K1MPWUHWXpv0iJ7EG08dIJfKy15tfppky81rEykGZdFYj5wYny1v
         lC6Q==
X-Gm-Message-State: AJIora+vEQOBCZPFaS0f8J4xUQdvvhrAsWJcVx02ukArC7N4+k2VV+ii
        vofwW7mZcX+0iBLbkTocrnLxCuIlZzc9F98aYBaQwVvQ/ec=
X-Google-Smtp-Source: AGRyM1vgIA6SqnHR0nHNlzVRqwiqRXFzYSzGJQPFnq7om9GgN5s8pDmkyBxQwG7kziOKv65nyKva/jRmpalBobiJTEQ=
X-Received: by 2002:a05:6402:d0a:b0:437:66ca:c211 with SMTP id
 eb10-20020a0564020d0a00b0043766cac211mr18200869edb.29.1656671558454; Fri, 01
 Jul 2022 03:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220623160801.240779-1-sebastian.reichel@collabora.com>
In-Reply-To: <20220623160801.240779-1-sebastian.reichel@collabora.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 1 Jul 2022 12:32:27 +0200
Message-ID: <CAMRc=Mc9KHb1Y4EGbhaAKgVFwto+ujcF9f+VWC2P9imbawrcog@mail.gmail.com>
Subject: Re: [PATCH 0/2] RK3588 GPIO Support
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 23, 2022 at 6:08 PM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> This has been part of a bigger patchset adding basic rk3588 support.
> Since that gets more and more out of hand, I'm now sending patches
> for each subsystem as individual patchset. Previou patchet:
>
> https://lore.kernel.org/all/20220504213251.264819-1-sebastian.reichel@collabora.com/
>
> Changes:
>  * None (except for collecting Acks)
>
> -- Sebastian
>
> Jianqun Xu (1):
>   gpio: rockchip: add support for rk3588
>
> Sebastian Reichel (1):
>   dt-bindings: gpio: rockchip: add gpio-ranges
>
>  Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 2 ++
>  drivers/gpio/gpio-rockchip.c                                   | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> --
> 2.35.1
>

Both applied, thanks!

Bart
