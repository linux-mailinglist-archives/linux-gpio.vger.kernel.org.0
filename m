Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE09565A3D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234682AbiGDPpB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbiGDPor (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:44:47 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625DE2679;
        Mon,  4 Jul 2022 08:44:33 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id h19so10327379qtp.6;
        Mon, 04 Jul 2022 08:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nT/ZJrmN8g7MwDuJPaEAbBFylkxIG6OnV/oU6GC9SfM=;
        b=pvxIfdxIoo83+U62W1Zkqs8ZiJpFYJ39oW+WY83kaDv9bPJV9SC1V4WRsjt7iyrgyI
         GyV+ztjPxnizsIrybGsoPE87A3+zGL/gv82HmD2W6zTiLbvXN2zVxZmJkxCzmoyXTMT5
         FJrt9qCJtnZvwsN0P91KCd4HUSDOcqVItfPt+VHDifbxHLNJ/7z86wiYrKOFwpHsv8H+
         k5lMBHX7tA0dDRA0IM/N7WzUaNSnTBSMXYR6rRvAbMcPF9xI8BjqI97IHrVk5qf9SuMb
         42L5zJh8RL3LjYXeZkPpjJbrcbSDtYqazgiqUBW3b5cTGpAiUvZIMPmqHQvon3lXREBJ
         nOFw==
X-Gm-Message-State: AJIora+XZ92vH7+XuW5G7qeUPlvcZn2t+upZYpUcx2sWCQCYBHMQvYrX
        eTtDVUoxuW/5VhUSs6VqGBcHENCvFiYYLzy0
X-Google-Smtp-Source: AGRyM1sRpjp4hqNaijpoeLpp2gpIWXK1YW5LniVKzqQ2socdM0Czhq3mlk1g6PK02twMBwzKHzFOLw==
X-Received: by 2002:a05:6214:2465:b0:472:ffd8:93e9 with SMTP id im5-20020a056214246500b00472ffd893e9mr1587158qvb.47.1656949472356;
        Mon, 04 Jul 2022 08:44:32 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id s12-20020a05620a16ac00b006a70f581243sm23343792qkj.93.2022.07.04.08.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:44:32 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 64so8227634ybt.12;
        Mon, 04 Jul 2022 08:44:32 -0700 (PDT)
X-Received: by 2002:a25:2b48:0:b0:668:3b7d:326c with SMTP id
 r69-20020a252b48000000b006683b7d326cmr31242057ybr.380.1656949471887; Mon, 04
 Jul 2022 08:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87r135sj9j.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r135sj9j.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:44:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-6HLKcioKJUutABgnsvxvFpmDrELO+Dwt9O-0bkQ5Tg@mail.gmail.com>
Message-ID: <CAMuHMdU-6HLKcioKJUutABgnsvxvFpmDrELO+Dwt9O-0bkQ5Tg@mail.gmail.com>
Subject: Re: [PATCH v4 18/23] pinctrl: renesas: r8a779g0: add missing TPU0TOx_A
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
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

On Fri, Jul 1, 2022 at 3:40 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds missing TPU0TOx_A
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
