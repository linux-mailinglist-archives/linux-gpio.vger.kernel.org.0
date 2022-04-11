Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2DB4FBCFD
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Apr 2022 15:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245332AbiDKN1V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Apr 2022 09:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231480AbiDKN1U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Apr 2022 09:27:20 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E23553B57A;
        Mon, 11 Apr 2022 06:25:06 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id t7so16110645qta.10;
        Mon, 11 Apr 2022 06:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bGC2tgeOPfry3WvGg3C5/9hE7RvSDEamHHdww/M1V3c=;
        b=5CobRKGLE27GrLFviDTpqCa4BccpEe17KV/lD9noQU3eeIIdeFwVL0qisJpV2vTYdw
         a5OlUXPuEixPR77R4ULy53pN/YOk5JQh8YhdwWB4yNirCR++Wwk8qhIHk9SDcnP0JyP9
         sAQZgUtbKYDFFMoMhokZHv1hc5YV77pcZf2HdQ7iPguo+US/zDXK6rCAeLnPBJxowjzz
         7Sd4J8wcL5S6omB9Ey43T+Z2n7HSk4qYvN7CW5KSvQ0Q7z+lEiukGqQwjhD8N3oHrMGu
         WO8ZnUXabsjd2+0ZK+JyCMR/PpAc9CluEUYdO69Y5Q1Y1n6DpBIur+DtRHqS/SlOioac
         QidQ==
X-Gm-Message-State: AOAM533FpJ0VnwvkIBHQQlt/i/tFBFf5VyW0sfnlmzUAJUNhqPPR/rQo
        eyRCK1vIWXSJlj1JaZ3kVcF3dp+VOqxBBw==
X-Google-Smtp-Source: ABdhPJxNpZ7pMpvRsUdRVlSTYEeGO5vfJej6uHAXxlI4OBl0CTSBWMHLvBwDuXS5Y42D+vDwzn0jMg==
X-Received: by 2002:ac8:58c5:0:b0:2e1:cca9:b3f3 with SMTP id u5-20020ac858c5000000b002e1cca9b3f3mr26030632qta.100.1649683505920;
        Mon, 11 Apr 2022 06:25:05 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id br13-20020a05620a460d00b00680d020b4cbsm18208629qkb.10.2022.04.11.06.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 06:25:05 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id v77so9344678ybi.12;
        Mon, 11 Apr 2022 06:25:05 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr11911366ybq.393.1649683505196; Mon, 11
 Apr 2022 06:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220406075318.14385-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220406075318.14385-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Apr 2022 15:24:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVgxWMTXBp-3kZrHx4A74_k5N1QxGqum_7FiRUcLgnLtg@mail.gmail.com>
Message-ID: <CAMuHMdVgxWMTXBp-3kZrHx4A74_k5N1QxGqum_7FiRUcLgnLtg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: Kconfig: Select PINCTRL_RZG2L if
 ARCH_RZG2L is enabled
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
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

On Wed, Apr 6, 2022 at 9:53 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> GPIO (PINCTRL) block is identical on Renesas RZ/G2L, RZ/G2UL and RZ/V2L
> SoC's, so instead of selecting PINCTRL_RZG2L config for each SoC select
> PINCTRL_RZG2L config option if ARCH_RZG2L is enabled. The ARCH_RZG2L
> config option is already selected by ARCH_R9A07G043, ARCH_R9A07G044 and
> ARCH_R9A07G054.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
