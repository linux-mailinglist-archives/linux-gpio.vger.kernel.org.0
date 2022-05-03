Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5594517F4E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 May 2022 10:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbiECIE0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 May 2022 04:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbiECIEX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 May 2022 04:04:23 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C20C2646;
        Tue,  3 May 2022 01:00:52 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id j6so13051449qkp.9;
        Tue, 03 May 2022 01:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ACd1tin1AkZZIRZAIqtPRPAePGQmut/h177LMiZcID8=;
        b=n90UPuWCFKhV+FvAVbOa3g/t/x6t7KG16tjhwhPm31DNt4lgcBrhZ1nPYxljTk7ZFj
         u49X5sv+Blb66sftYSdGX5bREEuSDVB0V0kDTYXqPtqpize0EEBU66OkCSExFbhtXvBe
         wtGeBpuxP7VP17/AoLjYWrbBQgyMtSw7ELiHcPBp160Yo+y2gBO95TxHIeID4QoKKAOe
         kzY/bh7s7aCnwnzdXPRbckLiiBGRANDrs/+FjQtX2ZtBr7/fqg/2WXjjxOWnC+7FXFUO
         7KBdj0GX+Pg5nncR3PWNf1lE9hMadokFHC3NiyQF9pemT8tm4tnZXQ462Vys7Kli6qg9
         mnJQ==
X-Gm-Message-State: AOAM533+rgXpHhBCY5PQx0miZw5NYVARfyRkZBqvJ3HEamH2hqBY+gDD
        0NMpuyaxIHjw7cymNv5LSXR7IrRPBZxMWg==
X-Google-Smtp-Source: ABdhPJyf/r/3ZtYCw/dneXdaIg3/xRrb3XH1qwDNbgcg0n+tpEmADF4J1VBZR40/cAtEQ0cYOk6h/w==
X-Received: by 2002:a05:620a:4625:b0:69f:6a9a:ccd5 with SMTP id br37-20020a05620a462500b0069f6a9accd5mr10858254qkb.626.1651564851208;
        Tue, 03 May 2022 01:00:51 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id u18-20020a05620a121200b0069fc13ce1e2sm5529014qkj.19.2022.05.03.01.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 01:00:50 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id j2so29914594ybu.0;
        Tue, 03 May 2022 01:00:49 -0700 (PDT)
X-Received: by 2002:a05:6902:352:b0:63e:94c:883c with SMTP id
 e18-20020a056902035200b0063e094c883cmr12407101ybs.365.1651564849491; Tue, 03
 May 2022 01:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1650610471.git.geert+renesas@glider.be> <4611e29e7b105513883084c1d6dc39c3ac8b525c.1650610471.git.geert+renesas@glider.be>
In-Reply-To: <4611e29e7b105513883084c1d6dc39c3ac8b525c.1650610471.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 May 2022 10:00:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVgDrc=N-pgG7JrUv2LRUvC6KZGd=HEgBB=_4nrOGNtgA@mail.gmail.com>
Message-ID: <CAMuHMdVgDrc=N-pgG7JrUv2LRUvC6KZGd=HEgBB=_4nrOGNtgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: renesas: r8a779a0: Fix GPIO function on
 I2C-capable pins
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Fri, Apr 22, 2022 at 9:29 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Unlike on R-Car Gen3 SoCs, setting a bit to zero in a GPIO / Peripheral
> Function Select Register (GPSRn) on R-Car V3U is not always sufficient
> to configure a pin for GPIO.  For I2C-capable pins, the I2C function
> must also be explicitly disabled in the corresponding Module Select
> Register (MODSELn).
>
> Add the missing FN_SEL_I2Ci_0 function enums to the pinmux_data[] array
> by temporarily overriding the GP_2_j_FN function enum to expand to two
> enums: the original GP_2_j_FN enum to configure the GSPR register bits,
> and the missing FN_SEL_I2Ci_0 enum to configure the MODSEL register
> bits.
>
> Fixes: 741a7370fc3b8b54 ("pinctrl: renesas: Initial R8A779A0 (V3U) PFC support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Queueing in renesas-pinctrl-for-v5.19, with the comment fixed.

> --- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
> @@ -615,7 +615,36 @@ enum {
>  };
>
>  static const u16 pinmux_data[] = {
> +/* Using GP_2_[9-0] requires disabling I2C in MOD_SEL2 */

GP_2_[2-15]

> +#define GP_2_2_FN      GP_2_2_FN,      FN_SEL_I2C0_0
> +#define GP_2_3_FN      GP_2_3_FN,      FN_SEL_I2C0_0
> +#define GP_2_4_FN      GP_2_4_FN,      FN_SEL_I2C1_0
> +#define GP_2_5_FN      GP_2_5_FN,      FN_SEL_I2C1_0
> +#define GP_2_6_FN      GP_2_6_FN,      FN_SEL_I2C2_0
> +#define GP_2_7_FN      GP_2_7_FN,      FN_SEL_I2C2_0
> +#define GP_2_8_FN      GP_2_8_FN,      FN_SEL_I2C3_0
> +#define GP_2_9_FN      GP_2_9_FN,      FN_SEL_I2C3_0
> +#define GP_2_10_FN     GP_2_10_FN,     FN_SEL_I2C4_0
> +#define GP_2_11_FN     GP_2_11_FN,     FN_SEL_I2C4_0
> +#define GP_2_12_FN     GP_2_12_FN,     FN_SEL_I2C5_0
> +#define GP_2_13_FN     GP_2_13_FN,     FN_SEL_I2C5_0
> +#define GP_2_14_FN     GP_2_14_FN,     FN_SEL_I2C6_0
> +#define GP_2_15_FN     GP_2_15_FN,     FN_SEL_I2C6_0

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
