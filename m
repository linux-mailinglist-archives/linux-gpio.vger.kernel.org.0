Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A61B55E264
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345801AbiF1MaQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 08:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345700AbiF1MaP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 08:30:15 -0400
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22AEAC03;
        Tue, 28 Jun 2022 05:30:14 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 59so19695724qvb.3;
        Tue, 28 Jun 2022 05:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3i5U21nT+VUA8ABM7furGCXVtjuAkrR3MN+kubxwbmg=;
        b=2WPcDBZTfOBUIovwO529iSi9OXcji2p+TbYtlg44bBnuLTK32T1vjeBngjO4Oix89S
         a5ERXuqKGhVPx6O4SmaLdQcNEOxuKknzLAdZ9KPOnVP+ckerhIAb7IVGcgdSicpgTptJ
         4z2aAqDmgivlrv4TloSZKACHUSYR+VYMcE9Soy507+9mcTxDdbDyIWef/M5Rpe1X5cSm
         i6cYj70DLeNlWsmjWcyba8rZd2BwbycvkomWeuyJV/kU1Ir0Z4/awTMb05iioJasJxZ8
         dX/tX7Whf3lKbNhWKw1y4S5e6tfSdBNFZoqIRhBlYxPu0Al5Pdzur7PJbrI6may62hDr
         yoJA==
X-Gm-Message-State: AJIora8jGAB50yf45BzgYArq8TvLgZomyOb8UQq8qiKK4B7+S9F+ZA3m
        WesHSqq5NuYlbQZWhBLWGpxRN8n0O+gz+A==
X-Google-Smtp-Source: AGRyM1vf6sk0w3pApGgWtT08jB66jCMpcbxgs1AE3H49GuhjD5vfmTVKk2/IJEgj9cSVMg+JbeLV1Q==
X-Received: by 2002:a05:6214:529a:b0:471:98a4:f453 with SMTP id kj26-20020a056214529a00b0047198a4f453mr3209843qvb.95.1656419413021;
        Tue, 28 Jun 2022 05:30:13 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id j9-20020a05620a410900b006a740bb8578sm11580281qko.83.2022.06.28.05.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 05:30:12 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-317a66d62dfso115156907b3.7;
        Tue, 28 Jun 2022 05:30:12 -0700 (PDT)
X-Received: by 2002:a81:9bcc:0:b0:317:9ff1:5a39 with SMTP id
 s195-20020a819bcc000000b003179ff15a39mr21978467ywg.384.1656419411452; Tue, 28
 Jun 2022 05:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220624084833.22605-1-phil.edworthy@renesas.com> <20220624084833.22605-3-phil.edworthy@renesas.com>
In-Reply-To: <20220624084833.22605-3-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Jun 2022 14:29:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuF3nRzFaKuntqsS7m2e+hqk1+F6XSLaB+qP_eed6thA@mail.gmail.com>
Message-ID: <CAMuHMdXuF3nRzFaKuntqsS7m2e+hqk1+F6XSLaB+qP_eed6thA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: Add RZ/V2M pin and gpio
 controller driver
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
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

Hi Phil,

On Fri, Jun 24, 2022 at 10:49 AM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> Add support for pin and gpio controller driver for RZ/V2M SoC.
> Based on the RZ/G2L driver.
>
> Note that the DETDO and DETMS dedicated pins are currently not
> documented in the HW manual as to which pin group they are in.
> HW team have since said that the output level of V1.8V I/O group 4
> (for MD0-7, and debugger) is the same as the 1.8V IO group 3.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2:
>  - Lots of small fixes based on Geert's review
>  - Remove PIN_CONFIG_INPUT_ENABLE as it is not appropriate

Thanks for the update!

> --- /dev/null
> +++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c

> +#define DRV(n)                 ((n) < RZV2M_DEDICATED_PORT_IDX ? \
> +                               (0x28 + (n) * 0x40) : 0x590)
> +#define SR(n)                  ((n) < RZV2M_DEDICATED_PORT_IDX ? \
> +                               (0x2c + (n) * 0x40) : 0x594)

If you don't mind, I'll reformat this slightly while applying:

    #define DRV(n)          ((n) < RZV2M_DEDICATED_PORT_IDX ? (0x28 +
(n) * 0x40) \
                                                            : 0x590)
    #define SR(n)           ((n) < RZV2M_DEDICATED_PORT_IDX ? (0x2c +
(n) * 0x40) \
                                                            : 0x594)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
