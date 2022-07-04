Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68DD4565A4D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233926AbiGDPpe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiGDPp0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:45:26 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2413726D7;
        Mon,  4 Jul 2022 08:45:26 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id r138so6993009qke.13;
        Mon, 04 Jul 2022 08:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CHd/1WbioFzqkApOf1zeu0kzgraPid0NAMWrHLsmU9k=;
        b=LaCxJMZ9xIu9Qgo6N7lyFlxY6XlKasobRgMdHYmCmnqzqOw0Xh5tH1K+tifUNDwTNO
         7pRWOkt4XKBkezR3i17e2RmpPMecgT9lbLM12uRcgzCdwh+M1TbaVdAthao+xObrJEKp
         TnxgbswoSnxUXdAPx8W8WYOoITy/vnfkGMwAaz9so/AHfOskxmW6Kz/4g+QmXXKgSikX
         kv/J6eCkCDaGqemoMMApC5wxZVt4kRtqyCL3iQfmPO+0cNvYO26kkY+GFQmCR6kaFadU
         7Vvwx1rKjHkgilUUUWVn1uWMRDB0lEMx/y8jBJIcL+ID250hwjtiLTTSuIEdYvpEuSyU
         /Ssg==
X-Gm-Message-State: AJIora8nqGlEvsWHYUfUMZpIevlasE30yxDJswDUJXq7PbpHvPQvBRu8
        V9WbNCte5skuOhEpBB0N6hvKVAPaZZAop1d6
X-Google-Smtp-Source: AGRyM1tu2yK9bG3jxLMclrPcC24hjPSoDjxCn2t9t40uNib8ET0Skv2fuzSzlHfdJL7YdmmWJBlAug==
X-Received: by 2002:a05:620a:c55:b0:6a7:9f07:f41 with SMTP id u21-20020a05620a0c5500b006a79f070f41mr21322987qki.430.1656949524953;
        Mon, 04 Jul 2022 08:45:24 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id f14-20020a05620a408e00b006a5d2eb58b2sm27549156qko.33.2022.07.04.08.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:45:24 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id b85so4278435yba.8;
        Mon, 04 Jul 2022 08:45:24 -0700 (PDT)
X-Received: by 2002:a25:be49:0:b0:64a:2089:f487 with SMTP id
 d9-20020a25be49000000b0064a2089f487mr17818238ybm.202.1656949524338; Mon, 04
 Jul 2022 08:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87letdsj8e.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87letdsj8e.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:45:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_=3R4rRQbDcKdWG0yMNCBVRZMzeB-4WsRRGuFT7JG+g@mail.gmail.com>
Message-ID: <CAMuHMdX_=3R4rRQbDcKdWG0yMNCBVRZMzeB-4WsRRGuFT7JG+g@mail.gmail.com>
Subject: Re: [PATCH v4 22/23] pinctrl: renesas: r8a779g0: add missing MODSELx
 for TSN0
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
> TSN0 needs MODSEL4 settings.
> This patch adds missing MODSELx setting for these.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
