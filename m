Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 644AD51BD82
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 12:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238885AbiEEKyj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 May 2022 06:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233254AbiEEKyi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 06:54:38 -0400
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9667C2E0B2;
        Thu,  5 May 2022 03:50:59 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id h13so2730299qvh.0;
        Thu, 05 May 2022 03:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oniyS6Mks/p+cynfPvdlqtZs0HHKpBZQLIAAbGk71k8=;
        b=pefEct1i0MjVuRmUg6tQi/79gdyt390lEZDvMZSAXhDjCrDY1f+jzN1eBsKMBH3Fac
         oGslstIcq/pG42iBlpVCCxn/UqCeKMu9N2nwIogV02BA6D0LZF7RKOrsDqGrrPkqKVng
         JEz02XQh4FfJI2D3ov5j+fdADEeWQ6j0VyoT53ozqG3e7aX2k+hhfe7ypZqeC6ti3BSl
         rHF62lGKB38xQRF126NodQ0m/6qzMI56nPBBjfrSbjsXJBTqEwVBQUdu0eMYGl98B6fT
         3sT4OLS7siqr70ORyf4ys6BNLtoe4bX1Sjknd7ZZdGcLq9GCNHwWWPfhyuAhTGovzWRj
         2S5w==
X-Gm-Message-State: AOAM532JcRBGHBWx8PBlxVyONKq2dCgvS9a830Oh1wxM4/OB/Q8p6e32
        KXMOhXc5gI8Ei4U5yLsCAKe184XGXWU46A==
X-Google-Smtp-Source: ABdhPJw59n0eB0tVR2QF3BKdajm1MoVQX+2xxxwZBOTHbdwBRvw7j0rHTiiiQ6As7ugnEybtYdQsMg==
X-Received: by 2002:a05:6214:2aa7:b0:446:4356:ef25 with SMTP id js7-20020a0562142aa700b004464356ef25mr21421096qvb.124.1651747858618;
        Thu, 05 May 2022 03:50:58 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id t8-20020ac87388000000b002f39b99f69bsm603775qtp.53.2022.05.05.03.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 May 2022 03:50:58 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2f7d7e3b5bfso43949497b3.5;
        Thu, 05 May 2022 03:50:58 -0700 (PDT)
X-Received: by 2002:a81:547:0:b0:2f8:6e8:19d7 with SMTP id 68-20020a810547000000b002f806e819d7mr23671770ywf.383.1651747857699;
 Thu, 05 May 2022 03:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1649865241.git.geert+renesas@glider.be>
In-Reply-To: <cover.1649865241.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 5 May 2022 12:50:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtBQAGSHqxObY7eMx_UEj-sO_upeJ5sR18y62YqWeOvw@mail.gmail.com>
Message-ID: <CAMuHMdVtBQAGSHqxObY7eMx_UEj-sO_upeJ5sR18y62YqWeOvw@mail.gmail.com>
Subject: Re: [PATCH 00/50] pinctrl: renesas: Reserved field optimizations
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
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

On Wed, Apr 13, 2022 at 7:24 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Lots of register in pin control subdrivers for Renesas SoCs contain
> reserved or unused fields.  As the macros for describing these registers
> (PINMUX_CFG_REG() and PINMUX_CFG_REG_VAR() for registers with
> fixed-width resp. variable-width fields) require describing all fields,
> the resulting data structures contain lots of dummy (zero) values: 2^N
> values for a field of N-bits wide.  To reduce data size, reserved bit
> fields wider than 3 bits were typically split in multiple 2-bit fields.
> This patch series aims to improve this by introducing a shorthand for
> describing reserved variable-width register fields without dummy values.
>
>   - Patch 1 converts a few register definitions for registers with
>     fixed-width fields that accidentally used the equivalent but larger
>     description format intended for registers with variable-width
>     fields,
>   - Patch 2 introduces a shorthand for describing reserved register
>     fields,
>   - Patches 3-22 convert reserved field descriptions in the various
>     SoC-specific pin control subdrivers to the new shorthands,
>   - Patches 23-49 convert register definitions for registers with
>     reserved fixed-width fields to the equivalent definitions with
>     variable-width fields where it makes sense,
>   - Patch 50 updates the checker to flag possible conversions to
>     variable-width reserved fields.
>
> The total kernel size reduction due to patches 3-49 is:
>   - 12685 bytes on ARM32 SoCs (multi-platform),
>   - 5416 bytes on ARM64 SoCs (multi-platform),
>   - 2575 bytes on SH SoCs (sum of mutually-exclusive single platforms).
>
> I've been running with these changes on R-Mobile APE6 and A1, R-Car
> M2-W, H3 ES1.x, H3 ES2.0, M3-W, M3-N, V3M, E3, D3, V3U, and S4, and
> SH-Mobile AG5 during the past six weeks, without any issues.
>
> I plan to queue these in renesas-pinctrl-for-v5.19.

Done.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
