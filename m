Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB135565A30
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234405AbiGDPor (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbiGDPod (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:44:33 -0400
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3508C12D39;
        Mon,  4 Jul 2022 08:43:52 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id x1so10322407qtv.8;
        Mon, 04 Jul 2022 08:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fXhlTVWao0w3m2PTWu5HZP4DTPIQExJEKuMNlv+8yw4=;
        b=TflXaUou1xnZo+oFxM6ZCkO8K81RTTOxoBLYNFEnvNXR1fZoDINpFsuEj2kGRzQQqa
         u93OGHayZMcA/yxj153RTBjCOFh8E1f9l9lq7IcJMPxZJMztFXNwAWwQsAptd6SCaZPT
         gxYTvwwXB6JFWgRag2y8X8BVSNwDpmBexm9MEzgA+GOAddGQJUjQqfm0WKUvgDJAbWst
         K+lF5HkPHuS9AD29CsVkGm9O66reUx6mltwxxGFJCayIZp+scyNTERAzTB5xvc8p2WlF
         +KGL4idmiztpR9y747JV7SyYljhQKMxHrdTkVEGxjLoV678R3tMtDzSRzO70IKRWGptK
         NacA==
X-Gm-Message-State: AJIora88nAEp23zcNP37HLqXKk2BB8YYcFMjYR6I8NV3ZPLpebGCjUgF
        dKv23gDu/4aPc193XVNUgnXTwEIHSdJrMzDD
X-Google-Smtp-Source: AGRyM1vq49MtvF0N6x3EaNOotnRCbKQh62ve0tjMl0YwLuz+Sb/KhiLwDN5Pl40eExofkN38FpXT3w==
X-Received: by 2002:ad4:5c68:0:b0:470:52b5:c85c with SMTP id i8-20020ad45c68000000b0047052b5c85cmr28735371qvh.3.1656949428866;
        Mon, 04 Jul 2022 08:43:48 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id f6-20020a05622a104600b0031d283f4c4dsm10957356qte.60.2022.07.04.08.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:43:48 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 76so1912553ybd.0;
        Mon, 04 Jul 2022 08:43:48 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr31885588ybq.543.1656949428346; Mon, 04
 Jul 2022 08:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <871qv5txvt.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871qv5txvt.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:43:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVZYqwoZFroJuf3qo-CJJyybuhJzc2X2iPYvXg-v=BvnQ@mail.gmail.com>
Message-ID: <CAMuHMdVZYqwoZFroJuf3qo-CJJyybuhJzc2X2iPYvXg-v=BvnQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/23] pinctrl: renesas: r8a779g0: add missing TCLKx_A/TCLK_B/TCLKx_X
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

On Fri, Jul 1, 2022 at 3:39 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds missing TCLKx_A/TCLKx_B/TCLKx_X
>
> Because Document (Rev.0.51) has 2xTCLK3/TCLK4 with no suffix (_A, _B),
> this patch name it as _X.
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
