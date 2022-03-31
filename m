Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 803A74ED997
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Mar 2022 14:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236043AbiCaM07 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Mar 2022 08:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbiCaM05 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2022 08:26:57 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4051FB501;
        Thu, 31 Mar 2022 05:25:10 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id 1so19563043qke.1;
        Thu, 31 Mar 2022 05:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+xJl2Z2uDFXuDHWFAismAnDcDRzgKNsrBhzEfpkL5Zs=;
        b=L9dyS8olOVHZR9zUmSfdRrvhw99nTXrAH2K6Sn4a9M2oHgtiaRthLT1K86F0pA/O35
         dviKcIj+4oTeNlXIls7CyV9sXKGsGrIe2wm4jzwXS/ihyCME67y3nxas2/IQh3sgvrW7
         w6D50+TFx7t3SjuARYCMkJm9tpOo5iwO7HWQ4zWCV0KKgacECBQtPW5um/yaSH0vJuk5
         RXgH634sZtsfdQjqDbDm3l9GhPI2s/lTeM0DlHsHgkHe//ZSUHw99c+BZmsUXroHvTRL
         lL71bprSK1DsdgmamhH6mpHkZfJBLHnF/muXhuUjAebJ12j60ZT43sIpe9UHlBYmnmsZ
         n66Q==
X-Gm-Message-State: AOAM530eJBYwiZmNRf+DEDQ0aDA8pZ64HynEqjyXrkcSMoqJw6/h/4i5
        TqDG7pNQvq9VGAkrw6mJIrQ3VuuXi2q7uw==
X-Google-Smtp-Source: ABdhPJzFFrQXtrUh/jQQM6Ck+PzhQBGeIj+2YqItPz2dy99DXfy/LFd3ftBLsgwyntSNA3AStssttg==
X-Received: by 2002:a37:414c:0:b0:67e:6d68:c585 with SMTP id o73-20020a37414c000000b0067e6d68c585mr3063870qka.196.1648729509553;
        Thu, 31 Mar 2022 05:25:09 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 64-20020a370343000000b0067b31f32693sm12573335qkd.109.2022.03.31.05.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 05:25:08 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id f23so11554902ybj.7;
        Thu, 31 Mar 2022 05:25:08 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id 66-20020a250045000000b0063396e22179mr3960616yba.393.1648729507793;
 Thu, 31 Mar 2022 05:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220315152717.20045-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315152717.20045-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 14:24:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVNow9XjoP4LSv=as-QXSu55mA2RWWqQtxUt9aNJHT=xA@mail.gmail.com>
Message-ID: <CAMuHMdVNow9XjoP4LSv=as-QXSu55mA2RWWqQtxUt9aNJHT=xA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas: Document RZ/G2UL pinctrl
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
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

Hi Biju,

On Tue, Mar 15, 2022 at 4:27 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document Renesas RZ/G2UL pinctrl bindings. RZ/G2UL GPIO block is
> almost identical to RZ/G2L and has lesser pins compared to RZ/G2L.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> @@ -21,6 +21,10 @@ description:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a07g043-pinctrl # RZ/G2UL{Type-1,Type-2}

This can be combined with the enum below.

> +
>        - items:
>            - enum:
>                - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.19, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
