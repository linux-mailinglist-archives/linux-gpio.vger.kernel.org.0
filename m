Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A96C2565A09
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbiGDPk4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbiGDPkx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:40:53 -0400
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDC111150;
        Mon,  4 Jul 2022 08:40:52 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id g14so10315249qto.9;
        Mon, 04 Jul 2022 08:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GxcO26h/6TPuWlWdwKEaHi9teiG1O80P32Okjq0kiQE=;
        b=GpsTWfqurlFA8AtX4m2+4wMcmsRVS07r3DtJZQRcLj0R0/lEsN2AZC1sYxbrd36d9I
         PzxRnow98ZwJxxFm3zk9bvLAY8a+KAz/2G5YaUyDvMNIRhL/AHgkQ5Voyrz4tSvLckfa
         uZTysw4bGAG0QBrm/DzZDkkAajE8WKK4XQ0cy8NjbaFeTmo/uCjmfAdonW5pIV2Ad7to
         JLbc/H7cMYWsRjnNVGv+XB+jIRbRuAL6g+ddNn1hoK/1Odd5U2DBaGinNXho3w5Ea51E
         NgXwrIQ2HLTGpWjLWe73Q25czf4lwE212axnGLFhqPkLQszW3aLYjjLc7NSVqPo3EBFu
         WliQ==
X-Gm-Message-State: AJIora+rQN2OABCnoVoH2zatFHkwW8gaRq+cNBALnQHXh/xOQLKLJY3q
        7sgCRx/We7f801u/d0NgYBCggZObZOOIdJ/G
X-Google-Smtp-Source: AGRyM1vaCNEQmeyZ9RunBm93sTd22v0BdfQmyE5dzALvdvpMZLYFNR54m8UrO0K2tQ9GFB6+pax9IA==
X-Received: by 2002:a0c:f30a:0:b0:470:1c38:9508 with SMTP id j10-20020a0cf30a000000b004701c389508mr28369863qvl.66.1656949251077;
        Mon, 04 Jul 2022 08:40:51 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id u20-20020a05622a199400b0031bf484079esm12694422qtc.18.2022.07.04.08.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:40:50 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-31c89111f23so35274587b3.0;
        Mon, 04 Jul 2022 08:40:50 -0700 (PDT)
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr33829267ywd.283.1656949250526; Mon, 04
 Jul 2022 08:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87fsjlty13.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87fsjlty13.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:40:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDqwgxJe2nSgPwcLm6Y2f-cQt_tTKgxn5U+yP_+Kyapg@mail.gmail.com>
Message-ID: <CAMuHMdUDqwgxJe2nSgPwcLm6Y2f-cQt_tTKgxn5U+yP_+Kyapg@mail.gmail.com>
Subject: Re: [PATCH v4 01/23] dt-bindings: pinctrl: renesas,pfc: Document
 r8a779g0 support
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

On Fri, Jul 1, 2022 at 3:35 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Document Pin Function Controller (PFC) support for the Renesas
> R-Car V4H (R8A779G0) SoC.
>
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
