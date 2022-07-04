Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1435A565A0C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233240AbiGDPlH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:41:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233220AbiGDPlH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:41:07 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B42B111154;
        Mon,  4 Jul 2022 08:41:06 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id n10so6997166qkn.10;
        Mon, 04 Jul 2022 08:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WO69+ORrtWWfu/DGzl0x4cujWbfFBPb82HfL91lvNTA=;
        b=fCStQYi6GpPwD1plKXpoMrZdXR/CmJkijdF9/micxaPLpUH378ZssjqOuugAghcRih
         QvThp5Z4pEbt77Kw4neA8xYJqJgN+VZWyY1WziOMWpGkCJR48934f7IvY/Rk8TakRy/c
         rt/em1WXptOL/R+1PDbnuEszYT9CH3bkwQQbaJRy8xYGwA13c6wxigLcGfWV2uXju1Y1
         RokYTx2n0lUwQxaHiH8282yiikW7o69yffN3pB76ttoobEIhfh/n0kUZgCKKa0PJpsvr
         jEoLaTxlEL9agbwHvbYCNhWVWvInZX8IsZTeEsxSqHX8UuDlv5/Aht9wjPRhLcxt4NH2
         ltxA==
X-Gm-Message-State: AJIora9COpN3o16ROjsjvtbirb+WxvBi1WrjRQIiQCreEWSslTz6ckql
        cFtYabLkzKhz3IAiiMRqdHGYeeXt8kzrwKV8
X-Google-Smtp-Source: AGRyM1vdCSqsJEi0dCG5CDtrQuO/hPuvm+jj4H7NXp9dJNg6wi0djmd+dXnIL8gZDSnTeU6WW1p/fA==
X-Received: by 2002:a05:620a:5d:b0:6af:65e:b879 with SMTP id t29-20020a05620a005d00b006af065eb879mr19122383qkt.364.1656949265625;
        Mon, 04 Jul 2022 08:41:05 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id a14-20020ae9e80e000000b006a77940be22sm24104853qkg.95.2022.07.04.08.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:41:05 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id e80so10265873ybb.4;
        Mon, 04 Jul 2022 08:41:05 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr33799923ybh.36.1656949265009; Mon, 04
 Jul 2022 08:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87edz5ty0r.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87edz5ty0r.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:40:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHB+YgHSmywXSJ=nai4reTtXUJLhyD-2=_xa3obhVjjw@mail.gmail.com>
Message-ID: <CAMuHMdXHB+YgHSmywXSJ=nai4reTtXUJLhyD-2=_xa3obhVjjw@mail.gmail.com>
Subject: Re: [PATCH v4 02/23] pinctrl: renesas: Add PORT_GP_CFG_13 macros
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

On Fri, Jul 1, 2022 at 3:36 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Add PORT_GP_CFG_13() and PORT_GP_13() helper macros,
> to be used by the r8a779g0 subdriver.
>
> Based on a larger patch in the BSP by LUU HOAI.
>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
