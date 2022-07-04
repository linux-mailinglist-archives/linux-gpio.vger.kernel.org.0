Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA59565A1B
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233821AbiGDPmz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233693AbiGDPmy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:42:54 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129271115F;
        Mon,  4 Jul 2022 08:42:53 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id he28so10318729qtb.13;
        Mon, 04 Jul 2022 08:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TGsBcfPOKTVyAw1B2ow+L5BK1p+LcvChD8BhKCn0pWY=;
        b=VDVfj+Jcnp9oRHE1jFJgGcYOGeAzeTdYKWJ63xmuMkp5qnnfJgsUdzbGpT17O20TSv
         3twiL3s1QfPo7xU+ND5WTUX5LUKhsvY0v5Ie7JlWvvbQXfmse56F+JBZfgUO8+8lEg5Q
         XbIl9Vd6gkQnKA7wHd0EQetPvIbBAHaqcQHu8w2zHwtgTVnYFcgQzLvF+OIqUPG1LUvu
         /kSwZtu5GRbxHUXeQQnDqoJcHIvh5ri5w2IeFH//IzfG4HxmfyMTVGwi3oUWC2KtZ7vl
         wW4ud6afVeGp1TZMfJZXm9O0myGXMxpjtGA21c52Y9H1l31Mbo0hObUYSOirMYtXzmhF
         mqVg==
X-Gm-Message-State: AJIora+IqnvVTAitMOWcAAXY5ZD3vGpiNl9i7PmZFIL1pZYJ3OYnCJud
        tyrMDc2BWI35Gj5U3EjMgy8w4LVOR6ZXMpPM
X-Google-Smtp-Source: AGRyM1t4NlaW0vitWAp2VyZO4CmAY11b8mvBQ9bGwQ+Upe2BZ/PwmiwILvhEbECo+byzR9ltWVHRlA==
X-Received: by 2002:a05:622a:1824:b0:2f3:c196:10d with SMTP id t36-20020a05622a182400b002f3c196010dmr25265595qtc.74.1656949371956;
        Mon, 04 Jul 2022 08:42:51 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id v26-20020ac873da000000b00304dec6452csm20320443qtp.78.2022.07.04.08.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:42:51 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-31c89653790so34597967b3.13;
        Mon, 04 Jul 2022 08:42:51 -0700 (PDT)
X-Received: by 2002:a81:4fc9:0:b0:318:b0ca:4b13 with SMTP id
 d192-20020a814fc9000000b00318b0ca4b13mr34757814ywb.502.1656949371413; Mon, 04
 Jul 2022 08:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87a69ttxzg.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a69ttxzg.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:42:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJHbcMrfZ-q8CY2Qb3Y6f-dh8eRgP10sTf9x2_aDN=Jg@mail.gmail.com>
Message-ID: <CAMuHMdWJHbcMrfZ-q8CY2Qb3Y6f-dh8eRgP10sTf9x2_aDN=Jg@mail.gmail.com>
Subject: Re: [PATCH v4 05/23] pinctrl: renesas: r8a779g0: fixup MODSEL8
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

Hi Morimoto-san,

On Fri, Jul 1, 2022 at 3:36 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> MODSEL8 controls I2C vs GPIO modes, and Datasheet (Rev.0.51) is
> indicating that I2C needs 1. But we should use 0 for all cases
> in reality. New Datasheet should be updated.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

The patch matches the description, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
