Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEB43565A46
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbiGDPpP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234183AbiGDPox (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:44:53 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51049E0FD;
        Mon,  4 Jul 2022 08:44:53 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id ay10so10318181qtb.1;
        Mon, 04 Jul 2022 08:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6OB/1RyvlmBRMrsjuuTkNd5Q/BhBoTStV4cuhMipFnU=;
        b=balm+G2EowILEcRFCEZqCUVrU+02e5nkeLBCdKS3tTEJSuPRLSihiozrwor8YMWTrB
         nKhodKn1cT5RI8G0b2DiXG3zU+80FA7QXqgVD2jj0RSYuBKsUSvG0eTkbBfeCyNEFfdl
         j8PkVnV3h3OHbUBmAGFM8E6maCwY/ybW0B3avpfGaGhmMBNKMeVp6+8r5VFujdWMF0og
         NxuVI2cun4VQHrSedlzKniQllxEnwf3PMgBGAxICgFk0+f3fos9BuuayvYKedCJ8gVpx
         i34TgMDWB8i4DJe9NS7U+eegjlUVu7DdTA7K1832mtSyLK/zPpwOD287+YjYDskKcRju
         0Amg==
X-Gm-Message-State: AJIora84hxdPh77yNv6JSNt79wAoA6geXDqMbptJeJUNbRaqV2laTAyN
        cSbSmJ4POGN8Wbk5nGWyncZeC2+mJEukw5+E
X-Google-Smtp-Source: AGRyM1vDuTMrfGZr9579oo296BxK62Q01BCgxLsFttpx53gvuTLAg0xMf2vSuTLldEnqOnpcD4iXrQ==
X-Received: by 2002:a0c:e290:0:b0:472:f695:6082 with SMTP id r16-20020a0ce290000000b00472f6956082mr4863636qvl.73.1656949491970;
        Mon, 04 Jul 2022 08:44:51 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id p14-20020a05620a056e00b006ab91fd03fasm22941452qkp.19.2022.07.04.08.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:44:51 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id g4so17533981ybg.9;
        Mon, 04 Jul 2022 08:44:51 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr16118023ybu.604.1656949491306; Mon, 04
 Jul 2022 08:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87pmipsj9a.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pmipsj9a.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:44:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCv7Mrk+hNQUaAKVp0fcvEdMw5-bj40p3KiJxgMtCW2Q@mail.gmail.com>
Message-ID: <CAMuHMdXCv7Mrk+hNQUaAKVp0fcvEdMw5-bj40p3KiJxgMtCW2Q@mail.gmail.com>
Subject: Re: [PATCH v4 19/23] pinctrl: renesas: r8a779g0: add missing FlexRay
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 1, 2022 at 3:40 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds missing FlexRay pins.
> Because Document (Rev.0.51) has 2xFXR_TXENA/B pin with no suffix (_A, _B),
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
