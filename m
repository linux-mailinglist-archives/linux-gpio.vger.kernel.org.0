Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4416F5A22AC
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Aug 2022 10:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343555AbiHZIMg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Aug 2022 04:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343547AbiHZIMc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2022 04:12:32 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8382FD3E55
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 01:12:31 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id gb36so1691916ejc.10
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=e8ZphYJdOSEPtt5r/EW36Akv3KjPF5sUUtzi1KPW6Gs=;
        b=EfK1gkKtPi95p7HfDEJLPwR9kaDVTcWRqUBCA558fF6Uj70P8ZhvSSmOLZB7WiQT/b
         Ldkh5jLuyAikVaMOCPZeCaFqAWko49wweCa/2egJ7ajsHjhDWP9glt/UGZ7xW2CQIQbo
         YeWNyFM8y/iE7k+5Kv0hPkz8ZPXFOjDu1cXAZ9n52moBGOAc9L62Z5eVETTlBIT3zBay
         79mMVTzrdyso6KaGZgecHm7dCCM87bMoi3hkDRPk73bODZ9849rTVNJoK0QzpiQMY/L0
         1dV69Mrkm+WzwKeFWanPhuLE46nuxb9b1eLKY0HHXxZ9ibDiv5Ya/DtgBPPIj6mqTcqZ
         KBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=e8ZphYJdOSEPtt5r/EW36Akv3KjPF5sUUtzi1KPW6Gs=;
        b=BJmI7dyGOowzZcRXiIui8YYxRfVgOqW0+do5PlR/g5r2PbHsfVhPMJP9FqvQ4UF3Nf
         inVOkdPxETyeM4v3rIjgXr5uPnq9DDmwoBPuOgMwUkUkn+iywsyY3dov4PcPzdxHLDWk
         X6K28ztVLjEuLpPXGOPkrLDazIJhPQdQG9wWEefsjDzEtqFsM2/gw8bB2i+iW178xZRT
         443CmawCK0ve/x6meSSJ9fxgS6iMuFKVzHL0cLfqhZgimF70dVpyp3ywzhBPtNCPF5P1
         kyIpR9tdkBGxvP6OawtwQyg2DdaDSEq3sUmSpCpDfpn1PslPFEZmZ/DihppZAjd6rkBj
         gSwA==
X-Gm-Message-State: ACgBeo1RAz247ox8WK2AkWwv34IRVFsJxNJObQjr1PXhBjI0EI+whNhJ
        ZTgfOUbPyVS5vJvWALvyQtXzbaE4TOe9NcqLhXouaA==
X-Google-Smtp-Source: AA6agR6f7eH6YJdq9JVbpPEbgCaW3gYLDNs2I15gxyc3uImcpgRtDDAxTVWv/4WL40bUQdUWhmuWKI5L8ScwqraYo5w=
X-Received: by 2002:a17:907:6293:b0:73d:b27b:e594 with SMTP id
 nd19-20020a170907629300b0073db27be594mr4890230ejc.526.1661501545163; Fri, 26
 Aug 2022 01:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220819014126.1235390-1-jay.xu@rock-chips.com>
In-Reply-To: <20220819014126.1235390-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Aug 2022 10:12:14 +0200
Message-ID: <CACRpkdYTrdrSVWSfpEqP7Wekk+_j+rO60Xrn1jY1OzjmNHJLcA@mail.gmail.com>
Subject: Re: [PATCH] gpio/rockchip: handle irq before toggle trigger for edge
 type irq
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     heiko@sntech.de, jeffy.chen@rock-chips.com,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 19, 2022 at 3:41 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> The irq demux for rockchip gpio interrupts do real irq handle after loop
> over the bits from int status register. Some oldder SoCs such as RK3308
> has no both edge trigger type support, replaced by a soft both type
> which switch trigger type once a level type triggered.
>
> For example, a irq is set to a IRQ_TYPE_EDGE_BOTH trigger type, but the
> SoC not support really both edge trigger type, use a
> IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING instead.
>
>         --------
>     ____|      |______
>
>         ^      ^
>         |      |
>         |      [0] the falling edge come before irq ack set by driver !
>         |
>         rockchip_irq_demux set to EDGE_FALLING type
>         rockchip_irq_demux call generic_handle_irq
>                                   -> handle_edge_irq
>                                     -> irq_gc_ack_set_bit
>
> The [0] irq will lost by software on board test.
>
> With this patch, the generic_handle_irq has been move ahead before
> trigger toggle to fix the [0] lost issue.
>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

This looks fragile, but such is the nature of this dual-edge emulation.
If it works better in practice like this, it is better.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
