Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3E6B6626A2
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 14:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236585AbjAINOm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 08:14:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236918AbjAINOi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 08:14:38 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED85E62CF
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 05:14:32 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-482363a1232so112102167b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2023 05:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8m2So3MGuEZB3+BYW+3lrEH7ogedZxWpTYj+KillujU=;
        b=Vg/tDoBqVLwlfCd1Fejf9XrdxCHek0kiXhAkrUXveZgB65xau3AkNcWId62DWfXSws
         NVb4WBUvu3X5NSYRlj17TlBuSekDth6UXgdM9u3jjLKgUKSqTfd6HmOxzHrtnb/LVyrk
         9tl8W13CAocMegxBR48lw3b7+HurwSBkgd4YLj0yEiAlnHockgLLPuoMmUnBqFPD9MhS
         0Gp8q4PLYMy3LwOTTn5TyXfmHdiF999sqzcSRsoTa0VUdtNbrBZegK1bhAXD8PUknkk8
         E6+qBSJ7a3IrhdXwYD6HqODVAz4Zbp7Xc0ZS3tSahYctGWIF1p/KcnW4QQ13j+HVaMET
         asHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8m2So3MGuEZB3+BYW+3lrEH7ogedZxWpTYj+KillujU=;
        b=Npszv1yvKcaztq5UHW/w5ZbNQnj37qaFqdTOr5ozq3YiyJ/Aina+ycSChX1M39zcun
         k+r/9EtazuHpjWCT+48c0Qzvopw8F8NVPhOWxEfhwF4CjNphzvcfOHqgjxccay5QcBjw
         Sa91EyZVOqkuJMxR4QY7OZhBDwDmFl05OltiQtJMHsVxGDo+0Bn82x0M2qabwF9M1GQy
         XHmcWv91BtG8CyEx42WXYoBjuWRBm8AdnyXeKEjisEOpSxgkAVdM1iRoT53X7yZiwZDd
         gxqPB2MS070NA+wpTDRxKQT2Uc1yyhnkjkLPDkuCwsQANImHls4qlJmIccJQn/DueFeT
         4AIQ==
X-Gm-Message-State: AFqh2kpXFze5xGRNiWy36k5sIZvt576nOPHuQCFaQ+aMY+ycqi0PlY28
        2lG2HhvZA/me1VbryC8T/5+c4JvZ6po9C2u4kaEh4A==
X-Google-Smtp-Source: AMrXdXtuzNRork4y9UTxEkpjEqi55/yzF/AxiBbP3BEw+SzlW2jB6sWbw1jPBHS3XvG4IRu2qx3Hb3QAqKnkJQz+nzU=
X-Received: by 2002:a05:690c:e0c:b0:474:b3f2:8df1 with SMTP id
 cp12-20020a05690c0e0c00b00474b3f28df1mr328091ywb.434.1673270072239; Mon, 09
 Jan 2023 05:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20230102221815.273719-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230102221815.273719-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Jan 2023 14:14:21 +0100
Message-ID: <CACRpkdb_6Y63Y5O-Wbh0F_dCqvjxvm3XP3ihMMVZQNgxxPyCJQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add IRQC support to RZ/G2UL SoC
To:     Prabhakar <prabhakar.csengg@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 2, 2023 at 11:18 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:

> This patch series does the following:
> * Adds IRQC support to the RZ/G2UL SoC.
> * Drops mapping NMI interrupt as part of IRQ domain
> * Parses interrupts based in interrupt-names
> * Includes a fix for pinctrl driver when using GPIO pins as interrupts
> * Adds PHY interrupt support for ETH{0/1}

The pinctrl portions look OK to me FWIW
Acked-by: Linus Walleij <linus.walleij@linaro.org>

If any of this is to be merged into the pinctrl tree I expect to get it as
pull request from Geert who maintains the Renesas pinctrl tree,
else tell me what to do!

Yours,
Linus Walleij
