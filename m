Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F282E565A2A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234645AbiGDPoJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234646AbiGDPn5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:43:57 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15AF725E;
        Mon,  4 Jul 2022 08:43:19 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id f14so7057275qkm.0;
        Mon, 04 Jul 2022 08:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sgOGZ7r9ugUMuJVM3W/Z/MJMP3kOnAsP3a9gfeiMHJQ=;
        b=GaCV10JRnGJrYbqjktDwt+8+1OhFs7TvYM5W4+wc3fbF9riItA3KAsJWZdnZnvE21A
         97Ar7tEK1zTKcbTGmuUsfOJfun0z9Peav6yHNwDPpq4nwQe3c2yWEM9w7OljWXC7tCfA
         CBaiuQ7o9GQZnq0/c43wi653zSkUdnRDyXW+V4PKeXtKE5r894J8Ge2k35Yal1/W+vHE
         uMCJbG5Rx2L3l/Jzs1F6tJi1RhSKfj7H32WGeLvILFxnHyzn+W8xtHnAmfOUKb/hF+QB
         x0QDNnY7bsp4167ePZ8mnE4kxxY6cuxKJKJ7qp4FG/Z7J4TK5dYhksdu02o7dz3PNbR5
         npuQ==
X-Gm-Message-State: AJIora+KIs/yDRtvVMw3RFhhIvAVVssma0FEGv2l26NgJClSL18YNGuR
        SFRGrGwp6/yBPQr4yqBoQeEo3M0DvoGd5M+e
X-Google-Smtp-Source: AGRyM1uDRRl8pPPWPtSzViwMatIukbLJW0zBkA0UyvkL3Nq5FTnkUdiYFGMfmAGXdCV/mwMiNbNIEQ==
X-Received: by 2002:a37:8904:0:b0:6af:199b:bcb with SMTP id l4-20020a378904000000b006af199b0bcbmr20699566qkd.462.1656949397907;
        Mon, 04 Jul 2022 08:43:17 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id v12-20020a05620a0f0c00b006a73654c19bsm26900270qkl.23.2022.07.04.08.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:43:17 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 64so8222713ybt.12;
        Mon, 04 Jul 2022 08:43:17 -0700 (PDT)
X-Received: by 2002:a25:3288:0:b0:66c:8a91:74bb with SMTP id
 y130-20020a253288000000b0066c8a9174bbmr31677301yby.89.1656949397367; Mon, 04
 Jul 2022 08:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <877d4xtxyv.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877d4xtxyv.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:43:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVDBMBUu8RRNWKN3ik0JV+j-b2VV1cKi1zW4dX8CPuQgw@mail.gmail.com>
Message-ID: <CAMuHMdVDBMBUu8RRNWKN3ik0JV+j-b2VV1cKi1zW4dX8CPuQgw@mail.gmail.com>
Subject: Re: [PATCH v4 07/23] pinctrl: renesas: r8a779g0: remove not used
 IPxSRx definitions
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

On Fri, Jul 1, 2022 at 3:37 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current V4H PFC code has many IPxSRx definitions with all 0.
> But these have no meaning. This patch removes these.
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
