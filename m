Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B245F4C44B1
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Feb 2022 13:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbiBYMjM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Feb 2022 07:39:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiBYMjL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Feb 2022 07:39:11 -0500
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565DB1BD041;
        Fri, 25 Feb 2022 04:38:39 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id y26so5365065vsq.8;
        Fri, 25 Feb 2022 04:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lpsl70NeniIbkyLwhbPQj1WNfq7vaiwdbXuyeg+ajGk=;
        b=U3kVykAzLVwZtbsmKPLmQuxjeCS5wesLwhA6Bns16oQ+0BHtQtweJ2UVIaWulmf96A
         1hyE3O4B5FkBOchzHI/Jn69pWC1Waj/KYrYl1OAiC5n13LncUoYrXTXqD4jJo5H8CZS2
         bhkCn1mX4YOQW4ArlLLc3xJQyejBaOEFOlcIzhs1mO5+PYu8mxFcjzjqz85ykCV21PiN
         ++9snGN4ZotSe9sqL/Rbn808Wi3eT7MVCxA8KmPhBfzC/I3serV1gWmRruX4hNmkAF9T
         6IQJZ+TZw+A9zYIXZKUtKBu6rScVumRjh2xQ5kry7CsftEdOK0u5OfS4PS5oGgSBve0P
         ONrg==
X-Gm-Message-State: AOAM531BpI2tOS8JNfR1uQu7SIpququAD/4IInJuBnkQHp7/w1EH6jp/
        dbkoWrCRIMdCkqDnlw9mpYdgklxyiCuO6g==
X-Google-Smtp-Source: ABdhPJwzCDN8CpKAO5oema4pmHx/NV71lLKDSzCCJYVBQM50FdCa0AceE/hvVqtJh6JQkXcesYpOQA==
X-Received: by 2002:a67:d50a:0:b0:31b:9be2:8aa0 with SMTP id l10-20020a67d50a000000b0031b9be28aa0mr3286421vsj.76.1645792718388;
        Fri, 25 Feb 2022 04:38:38 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id n22-20020a1fa416000000b0031e658fd080sm318400vke.43.2022.02.25.04.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 04:38:38 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id j3so5373059vsi.7;
        Fri, 25 Feb 2022 04:38:37 -0800 (PST)
X-Received: by 2002:a67:b00e:0:b0:30d:dc98:6024 with SMTP id
 z14-20020a67b00e000000b0030ddc986024mr3408170vse.57.1645792717609; Fri, 25
 Feb 2022 04:38:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645457792.git.geert+renesas@glider.be> <fd8201da404b7b0897130b254380ffc97f437266.1645457792.git.geert+renesas@glider.be>
 <TYBPR01MB5341194E803AB92109AA3ECCD83E9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341194E803AB92109AA3ECCD83E9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Feb 2022 13:38:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=oomYfT_SbYgApUt+3z9N4io7fU+_PERn8hArEhs8Yw@mail.gmail.com>
Message-ID: <CAMuHMdW=oomYfT_SbYgApUt+3z9N4io7fU+_PERn8hArEhs8Yw@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] pinctrl: renesas: Initial R8A779F0 PFC support
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

On Fri, Feb 25, 2022 at 1:07 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, February 22, 2022 12:44 AM
> >
> > Add initial Pin Function Controller (PFC) support for the Renesas R-Car
> > S4-8 (R8A779F0) SoC, including bias, drive strength and voltage control.
> >
> > Based on a larger patch in the BSP by LUU HOAI.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> <snip>
> > diff --git a/drivers/pinctrl/renesas/pfc-r8a779f0.c b/drivers/pinctrl/renesas/pfc-r8a779f0.c
> > new file mode 100644
> > index 0000000000000000..2f3fbb794eb635c1
> > --- /dev/null
> > +++ b/drivers/pinctrl/renesas/pfc-r8a779f0.c
> > @@ -0,0 +1,1024 @@
> <snip>
> > +static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
> > +     [POC0] = { 0xe60500a0, },
> > +     [POC1] = { 0xe60508a0, },
> > +     [POC2] = { 0xe60510a0, },
> > +     [POC3] = { 0xe60518a0, },
> > +     [TD0SEL1] = { 0xe6058120, },
>
> TD0SEL1 should be 0xe6050920 (0xe6050800 + 0x120).
>
> After fixed it,
>
> Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thank you, will fix while applying.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
