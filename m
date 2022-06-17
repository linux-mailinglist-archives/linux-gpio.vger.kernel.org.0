Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85A0A54FA06
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382514AbiFQPRx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382150AbiFQPRx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:17:53 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D77D13FA3;
        Fri, 17 Jun 2022 08:17:51 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id b142so3368825qkg.2;
        Fri, 17 Jun 2022 08:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KY9ZL4uRzR73X5IJX1t6sGjZlj444cvis9AOUy09f6A=;
        b=uk1/hhprLd+Jq8Gd63mFvlhOotogibnkdXP3Y09UrsrRcJLeauuBzLP38mDlmNPn/0
         P034TmB4J+kaxgSQaRus0e1hc4AJBuGARqn3rULp4OTFTtI4I/qLV9VbwxI5fgpDrr+/
         eimdbopnKb9xMrdl1YpJ8bVb1AQylVX9tcIG58xGI7cCeN20hXr8rE/YAf8GW7ohd2Gu
         Eq8ej80yCppFhUnemS8lv8YtcCm0Fpg5nkGQwJSL8moQ63RSikJFrZPa84P9kf1v4BBU
         gryRtS0NMsKK5dMRMBIsaS1L+B+VfZRW0Xm8EMlErhAeZFpDodGUsy31pmzoxhzFK5ew
         YbbA==
X-Gm-Message-State: AJIora89WJ62NnZI7kje59vnNPmctUNL0LOmgsGlesAmdjxpKX32+ky7
        lHJbICKVEi7vNY5RC4clMxkGcV9rBIzF2A==
X-Google-Smtp-Source: AGRyM1vXRVEF39X6rPC6SD/DmEmJn4hM4JFNw0QHJluEs2W0IVlFdCgX4zblK2i+iatHMLTVS00Kew==
X-Received: by 2002:a05:620a:1094:b0:6a7:1861:66e7 with SMTP id g20-20020a05620a109400b006a7186166e7mr7539148qkk.323.1655479070077;
        Fri, 17 Jun 2022 08:17:50 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id f5-20020a05620a280500b006a6a6f148e6sm4290039qkp.17.2022.06.17.08.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:17:49 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id v81so7827221ybe.0;
        Fri, 17 Jun 2022 08:17:49 -0700 (PDT)
X-Received: by 2002:a25:d146:0:b0:668:aa24:c321 with SMTP id
 i67-20020a25d146000000b00668aa24c321mr7159791ybg.89.1655479069458; Fri, 17
 Jun 2022 08:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87r13rkcos.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r13rkcos.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:17:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVPN-dhnjw1y7WqQJjZNO-YG8PjaFjmCvawMAhZJJLsA@mail.gmail.com>
Message-ID: <CAMuHMdVVPN-dhnjw1y7WqQJjZNO-YG8PjaFjmCvawMAhZJJLsA@mail.gmail.com>
Subject: Re: [PATCH v3 09/21] pinctrl: renesas: r8a779g0: add missing TCLKx_A/TCLK_B/TCLKx_X
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

Hi Morimoto-san,

On Tue, Jun 14, 2022 at 7:59 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds missing TCLKx_A/TCLKx_B/TCLKx_X
>
> Because Document has 2xTCLK3/TCLK4 with no suffix (_A, _B),
> this patch name it as _X.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

LGTM, but as the suffixes become part of the DT ABI when defining
pin groups, we should get the conflicts resolved, and this cannot
be applied as-is.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
