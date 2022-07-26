Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6317B580E92
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 10:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238476AbiGZIIG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 04:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238322AbiGZIID (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 04:08:03 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056192F017
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 01:08:02 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id z22so16787535edd.6
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 01:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oXh48ITjNIZwRpcTgBzMIm7xvCXasMciNKj2nW0FLMk=;
        b=mvC8tzmaF29BiVZk1Z4LrSkhZNsRUiAI03IHsZWdBIGq+21sY3DaehmsTJSCQhOcCN
         IzDXGzhgPtgoo0weSRcw6clQCDiKyzDjc2VJ61GfKnUunLpFcddwo8T6y4Ox+JSjmmlM
         rRS/zZe7jNcqCaJMZPS2EnSOhBXmrGSZNEX2+6RylN3Eol7x+kLzHOv88BK7KXWQuKhD
         6Y28+AUAsiduoBIPGNkUmO4q80A4+6NEPpUn789GXETl2vPl2oVffajX1nEwiKEemX/A
         CFnBBeIN6MVlaE5OyaBVnc/t8xmEv4oY8fLX79lpUZReRbeqET4R87a5u6pdphdVfgZI
         XK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oXh48ITjNIZwRpcTgBzMIm7xvCXasMciNKj2nW0FLMk=;
        b=jKvG19iFbbsyqm50tyGEfFCtAlTBoaD2IUjARWkRs/DssAr3RQZJYjIGHSVhRfQ0Lx
         fbBHpnduMp8LjRR6DzNwsTuRcS1ITqTPgMGGRyaXwRHFVUKHpqGPgXeBO9dyr3llVgY2
         NRw4b8k3xDzrmctEnpejieMmitZXSmtQd7YmGTcCUV4ARmfKH3J/v4KJGQitK8bRW5LQ
         t1YJKDxZY8p4oPE1Xek4oBMry69JzqD5YRD2I6LfDZh3JUvD8VxSzaJDnbIUKeNpesxZ
         SBo+aAv4MNYMVJLr02eFCMaaN5kE/96gSzHv+ZPCTtoJM19JPzre+fNtev9ovxwicQ/X
         tjyQ==
X-Gm-Message-State: AJIora8Ydrl8RCkCVoJfA4VAKxl5odSMIhnWa8DgPIeutI9eM/gM66Fh
        8aa0H/x4fqSbBWDOf3BOoBaoRQdLwehz97pw5ZOdfw==
X-Google-Smtp-Source: AGRyM1sg7WwfgT30Z5gFgGtBrpzTZYvjI5t68L1TNcWlRC/z4bCNfsLxzmsyxNfNlAgqIwmyyt5i4fpHDXen1zH7g1M=
X-Received: by 2002:a05:6402:2696:b0:43b:eb8b:d0da with SMTP id
 w22-20020a056402269600b0043beb8bd0damr10795013edd.158.1658822880522; Tue, 26
 Jul 2022 01:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220723160513.271692-1-Mr.Bossman075@gmail.com> <20220723160513.271692-11-Mr.Bossman075@gmail.com>
In-Reply-To: <20220723160513.271692-11-Mr.Bossman075@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 10:07:49 +0200
Message-ID: <CACRpkdbNbvKySXPziKHkEfbWknXLdV2L4sb2n1MCR=TSOATEPg@mail.gmail.com>
Subject: Re: [PATCH v5 10/12] ARM: dts: imxrt1170-pinfunc: Add pinctrl binding header
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        stefan@agner.ch, daniel.lezcano@linaro.org, tglx@linutronix.de,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de,
        marcel.ziswiler@toradex.com, tharvey@gateworks.com,
        leoyang.li@nxp.com, sebastian.reichel@collabora.com,
        cniedermaier@dh-electronics.com, clin@suse.com,
        giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 23, 2022 at 6:05 PM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Add binding header for i.MXRT1170 pinctrl device tree.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Assuming the rest of the patch set really isn't getting merged for
v5.20 I simply applied this patch to the pin control tree so you have
less stuff to iterate after v5.20-rc1.

Yours,
Linus Walleij
