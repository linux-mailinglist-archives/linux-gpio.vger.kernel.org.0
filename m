Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 941F85A2356
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Aug 2022 10:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244951AbiHZIlx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Aug 2022 04:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244694AbiHZIky (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Aug 2022 04:40:54 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5B0D3996
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 01:40:48 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id u9so1852229ejy.5
        for <linux-gpio@vger.kernel.org>; Fri, 26 Aug 2022 01:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=jlYyNInnTT1mkv0Udm5OWXfX4CzedH08un39TZKrJjA=;
        b=M4VrV5Fsm6mJCTkD/X4MqIgpIpvlQiSs7VIgysc4pEx1PD5Yqu4U25+YqbB939+pQB
         tjIDE+8XGNjao9z7I4noKipak2S2aTIsrqSLozIHoIOVcQfBWnkNQym/Gj5QfdfKdjPg
         rZeinkN22uz4NEIwNpm3CFSyBgYBI6Tc1wKnQdIymw7EG6ETxCwKOXvrhiKcVnAFNztC
         WDyyCVQ3WNJrB8xa7FeECOmuvu3vjBnBOEAabmY+h7VAJDOpnBT5iQE2/XmmMvROt+hm
         eTqDq/3mIRGejab7+ChI9Lv/UpqEqlKISkYXeYyTxvV0Tek6oOmvgtPEJbCFAPRHrSFg
         jGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=jlYyNInnTT1mkv0Udm5OWXfX4CzedH08un39TZKrJjA=;
        b=Z6Qv9eKVaUav4wDiAzcw2TmWY3iHT/okrBUuwGKZFMk63DgVbGH6MJiSqPwP7KG7Th
         LmfgO6s5gpzGjJgcrKuMOqNQlzACe8BX1WKIQyFl8ZD4+/7AZYg5EhgqRMwyLwoHBqeI
         YqmnAyH4hSAc6wOsvItei85zk7TdySTVuzrdAbE7zom2rMKRqsCI3B/TAPayNMgcM3nk
         V5HZt5JCxrEoFUxnSlW/OR53qba0dMqkGND14CntCH8i01ECruEGmy0/kSuSg5nU1PjZ
         T1bryZmKl6wWY9gt8+ZIrWT452VzP97g/HDfGaVNCO85nWnKpE2o8lbjOg1rT6EnHgF+
         tXgw==
X-Gm-Message-State: ACgBeo3IPTGW9vUsHDknA37XT7U31jC1TG+q8ArwVZZ8+w/evZZ8spLp
        0wgy2DyKZcnj6XzJaIwAOZTIRkp9ESXJfeRmIhWkRA==
X-Google-Smtp-Source: AA6agR5C1h2LNm5eSFogNkexqcdEDBe7+aKQIGVdVhW4BS/UpRdA81l0x44pMynHAT/+gSm6jQz2g99OpzwuMY9z5Yg=
X-Received: by 2002:a17:907:6293:b0:73d:b27b:e594 with SMTP id
 nd19-20020a170907629300b0073db27be594mr4952677ejc.526.1661503246271; Fri, 26
 Aug 2022 01:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220725103445.88674-1-marex@denx.de>
In-Reply-To: <20220725103445.88674-1-marex@denx.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Aug 2022 10:40:35 +0200
Message-ID: <CACRpkdYjRtitJsxTswaBcbOGDaaY_PW1wnFy6083eux+wEDP3A@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] gpio: mxc: Locking and direction input fix
To:     Marek Vasut <marex@denx.de>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
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

On Mon, Jul 25, 2022 at 12:35 PM Marek Vasut <marex@denx.de> wrote:

> The irqchip callbacks in gpio-mxc perform register read-modify-write operations
> without locking, which may lead to a race condition. Add the missing locking.
>
> In case the GPIO is used as IRQ, make sure it is configured as input.

Changes look good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
