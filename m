Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54D26565A2C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbiGDPob (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234551AbiGDPoO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:44:14 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A67012ABB;
        Mon,  4 Jul 2022 08:43:31 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id c13so10311505qtq.10;
        Mon, 04 Jul 2022 08:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zdPfoVbBBfoB3A2j5XkUbOPACKHMF9duIxy8PSCumkM=;
        b=XT7v3+NsksvqzZHKPVOK7jTQqAnDxkn6W2GLVu3lFQtyeA5lcABuxq9cUwhNDoCGIc
         Ek95OTZuTH7aIXWQhUhzekSe3hzFXDFzlpiFte/wNsyxI3OnK0utxDfIUeIro/GSnKuU
         yl76ep38OgmklMKz9O6aXr6Ax+u506Knq2bvFW6T7I2yYQd3VUKFyBGaV/tX92nQbpoM
         HlRiWTkRDiaJMKc5Mz0BvZlZOIi7w1+s+taSFUyW5UxNaKYpvPJNC3+ch0NwyUSynxYn
         RYSCi9wx2FMWiXa1OmhQiA4VJRHqMvDyAcTvwCzZE9HMJ34zODl9LJS8GLX6FRMRD2ft
         HtrA==
X-Gm-Message-State: AJIora87+s4RsH4vPJytR5yFzxAE8zrFFCOCTICMl/YTBHP3/vogQuav
        R2KaLMWdwEnZsl844AU9QcGwkCFSu9hLfga9
X-Google-Smtp-Source: AGRyM1v+ZhMPGWhkOfAIYTdIVroBryt3TpGAGoebYRYk/qiTTQBJ1p/X3c+iIV1l3Gsd73fZ7ig7ZQ==
X-Received: by 2002:a05:6214:508d:b0:470:4fca:c95e with SMTP id kk13-20020a056214508d00b004704fcac95emr28076294qvb.101.1656949410776;
        Mon, 04 Jul 2022 08:43:30 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id f15-20020ac87f0f000000b00304e8938800sm21350950qtk.96.2022.07.04.08.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:43:30 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2ef5380669cso85478187b3.9;
        Mon, 04 Jul 2022 08:43:30 -0700 (PDT)
X-Received: by 2002:a81:af27:0:b0:31c:833f:eda5 with SMTP id
 n39-20020a81af27000000b0031c833feda5mr13162918ywh.358.1656949410186; Mon, 04
 Jul 2022 08:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <874k01txy9.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874k01txy9.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:43:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsrH4L9=yJRCopTSUit6hpgiBy_zqHcnhT8CQufv3m0g@mail.gmail.com>
Message-ID: <CAMuHMdWsrH4L9=yJRCopTSUit6hpgiBy_zqHcnhT8CQufv3m0g@mail.gmail.com>
Subject: Re: [PATCH v4 09/23] pinctrl: renesas: r8a779g0: tidyup ioctrl_regs
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

On Fri, Jul 1, 2022 at 3:37 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch removes POC2 which is not used/documented,
> and remove TD0SEL3 which is no need to have.
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
