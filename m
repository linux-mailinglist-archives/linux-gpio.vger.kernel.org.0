Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3C2517F53
	for <lists+linux-gpio@lfdr.de>; Tue,  3 May 2022 10:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232376AbiECIF0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 May 2022 04:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231962AbiECIFZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 May 2022 04:05:25 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C69E624E;
        Tue,  3 May 2022 01:01:53 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id t11so12791641qto.11;
        Tue, 03 May 2022 01:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KBS3r0l+ntpIFxaiDt6K6KsvH/8E4MfqPe3mWaEUNrg=;
        b=WgCv5WW0ATuK2kzycY0kdoSRsCkxfvlW/Na9+vT77E3aBbtf2t9xuZT8FVDKBeXoz0
         HTS9vbrj4VZFccYbAG6Y8wjcenHM7SYuTu5oPtUhY65qxOrU7RNQn3uIR9BIhOuXhA2n
         yrBDpQlClQdvf9RcdcgTnfM6/nbS6Wg2dKze0A4uuCIeJTi5ktouYDKxGXEpaQvH+hDW
         0jb52faxf3dtQ/I8uvRSwNsR9D1kMuE8ZJpFoMOzi2csS2Ffm+4LxAzESbiZhp5cjbtH
         Kkrxkdsm5ZlijOBhjrAwMyGnzdcE4OI4r/UIIZHxqhcNMmsuCiBXJdXo473tiFhrcYyd
         R1eg==
X-Gm-Message-State: AOAM531xoK7oYTFauphvMPOgaFGXTd48xYFqRzgy1pwR7FNinir76RLH
        W/il9bdzbo5166TU0bL08/I1Y2k8FCIPdg==
X-Google-Smtp-Source: ABdhPJzX+JL+Wa4DrbDI8BjBF+P7QiBJqzDbAX0VN6ffM01pCqBFyTM0jwfWAG3H1Kp6H+092qLNfg==
X-Received: by 2002:a05:622a:138f:b0:2f3:9985:5ac4 with SMTP id o15-20020a05622a138f00b002f399855ac4mr13400085qtk.658.1651564912097;
        Tue, 03 May 2022 01:01:52 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id i12-20020a05620a150c00b0069fc13ce21esm5675552qkk.79.2022.05.03.01.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 01:01:51 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id h10so814304ybc.4;
        Tue, 03 May 2022 01:01:51 -0700 (PDT)
X-Received: by 2002:a25:4506:0:b0:648:cfc2:301d with SMTP id
 s6-20020a254506000000b00648cfc2301dmr12993272yba.380.1651564911118; Tue, 03
 May 2022 01:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1650610471.git.geert+renesas@glider.be> <c12c60ec1058140a37f03650043ab73f730f104f.1650610471.git.geert+renesas@glider.be>
In-Reply-To: <c12c60ec1058140a37f03650043ab73f730f104f.1650610471.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 May 2022 10:01:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-yMzzaD_cf_Z1VQOEFGhAJ3csOPDCZM1jSFQS4WYMDg@mail.gmail.com>
Message-ID: <CAMuHMdU-yMzzaD_cf_Z1VQOEFGhAJ3csOPDCZM1jSFQS4WYMDg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: renesas: r8a779f0: Fix GPIO function on
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
> Function Select Register (GPSRn) on R-Car S4-8 is not always sufficient
> to configure a pin for GPIO.  For I2C-capable pins, the I2C function
> must also be explicitly disabled in the corresponding Module Select
> Register (MODSELn).
>
> Add the missing FN_SEL_I2Ci_0 function enums to the pinmux_data[] array
> by temporarily overriding the GP_2_j_FN function enum to expand to two
> enums: the original GP_2_j_FN enum to configure the GPSR register bits,

GP_1_j_FN

> and the missing FN_SEL_I2Ci_0 enum to configure the MODSEL register
> bits.
>
> Fixes: 030ac6d7eeff81e3 ("pinctrl: renesas: Initial R8A779F0 PFC support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

queuing in renesas-pinctrl-for-v5.19, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
