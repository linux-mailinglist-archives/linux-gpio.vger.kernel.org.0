Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0C1E4C4589
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Feb 2022 14:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235274AbiBYNLG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Feb 2022 08:11:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240546AbiBYNLD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Feb 2022 08:11:03 -0500
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9EFF1E7A66;
        Fri, 25 Feb 2022 05:10:27 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id j12so1563130vkr.0;
        Fri, 25 Feb 2022 05:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JSp0B59ur3xKkIaLdcIUEp4jkprXfn3woJ/GJNfExNg=;
        b=ShdKfu+6ZZ93pIKrRxUzX20u0f2cx1vMnbR0ka84A/pef2+kxCT9DhDzookdVd0JRe
         iYx1LY2PM3Mv0goeoMoXfGQ7tE1/iwZRRQgQHPhW0EnRDcD7QNWeFuWDqCI0kbfh5pDp
         GmQTolD9rrL5ZmUmGZ9rRAvBfJXUmBG9K2CL/+a7GxdEtp844tIg0UC4+DsPobKufcR/
         OSHJoECLjh9yGWB59MVrVrA7oWkH8jk+Xy+cZ2qCqKBsQRJBwhBCcRfU5sFRuXtqBPqW
         R/UWGYGLMYuSbZhKghIW6bV8KtwnSsFeJXcxKO3MfSP6vIBu1dmY0u6jIUYT91HLWUir
         itow==
X-Gm-Message-State: AOAM531KaheHtfcgYnLrra5pdLuqhRxLDx5emUZSarbXAzB1iqqkfLi1
        x1Y7YUmsB8tbcBcP3J2PuVzaju9hRNgp/w==
X-Google-Smtp-Source: ABdhPJz+RQEI6KddqJRGcf7U9ZVcrb3hwbP+K0Caus5UH/3IQgQcxMxxVkMaPd3JpEmkvJSYi2v0iw==
X-Received: by 2002:a05:6122:c61:b0:331:90bf:d93f with SMTP id i33-20020a0561220c6100b0033190bfd93fmr3209321vkr.34.1645794626922;
        Fri, 25 Feb 2022 05:10:26 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id w188-20020a1fadc5000000b00330d1f8597fsm325905vke.40.2022.02.25.05.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 05:10:26 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id c23so2432944uaq.7;
        Fri, 25 Feb 2022 05:10:26 -0800 (PST)
X-Received: by 2002:ab0:6253:0:b0:341:8be9:7a1 with SMTP id
 p19-20020ab06253000000b003418be907a1mr3370327uao.114.1645794626228; Fri, 25
 Feb 2022 05:10:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645457792.git.geert+renesas@glider.be> <TYBPR01MB5341D1FD7DE5F25522211140D83E9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341D1FD7DE5F25522211140D83E9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Feb 2022 14:10:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX2naP-hY4GEO-NVitU7PXcD8W3SA4pp0V8Y0D=yQm_zw@mail.gmail.com>
Message-ID: <CAMuHMdX2naP-hY4GEO-NVitU7PXcD8W3SA4pp0V8Y0D=yQm_zw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] pinctrl: renesas: Add R-Car S4-8 support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Hoai Luu <hoai.luu.ub@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Shimoda-san,

On Fri, Feb 25, 2022 at 1:19 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, February 22, 2022 12:44 AM
> > This patch series adds pin control support for the Renesas R-Car S4-8
> > Soc.  It is based on patches in the BSP by LUU HOAI, with many changes
> > on top (see the individual patches).
> >
> > Changes compared to v1[1]:
> >   - Add Reviewed-by,
> >   - Fix whitespace in Makefile,
> >   - Remove GPIO and No-GPIO pins, pin function definitions, and
> >     registers that can only be accessed from the Control Domain,
> >   - Spin off clock and DTS patches into separate series,
> >   - Drop RFC state and widen audience.
> >
> > Serial console and I2C have been tested on the Renesas Spider
> > development board.
> >
> > Thanks for your comments!
>
> Thank you for the patch!
>
> > Geert Uytterhoeven (11):
> >   pinctrl: renesas: Add PORT_GP_CFG_19 macros
> >   pinctrl: renesas: Initial R8A779F0 PFC support
> >   pinctrl: renesas: r8a779f0: Add SCIF pins, groups, and functions
>
> I have already reviewed these patches above independently on v1 or v2.
>
> >   pinctrl: renesas: r8a779f0: Add I2C pins, groups, and functions
> >   pinctrl: renesas: r8a779f0: Add HSCIF pins, groups, and functions
> >   pinctrl: renesas: r8a779f0: Add INTC-EX pins, groups, and function
> >   pinctrl: renesas: r8a779f0: Add MMC pins, groups, and function
> >   pinctrl: renesas: r8a779f0: Add MSIOF pins, groups, and functions
> >   pinctrl: renesas: r8a779f0: Add PCIe pins, groups, and function
> >   pinctrl: renesas: r8a779f0: Add QSPI pins, groups, and functions
> >   pinctrl: renesas: r8a779f0: Add Ethernet pins, groups, and functions
>
> These patches (4/12 to 12/12) look good to me. So, for the patches:
>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thank you, queuing in renesas-pinctrl-for-v5.18.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
