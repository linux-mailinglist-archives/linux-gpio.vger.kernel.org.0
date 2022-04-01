Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68D0F4EF81D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Apr 2022 18:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348965AbiDAQlC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Apr 2022 12:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345159AbiDAQkw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2022 12:40:52 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB5B02A4FB0;
        Fri,  1 Apr 2022 09:21:35 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id g8so2521790qke.2;
        Fri, 01 Apr 2022 09:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4OKMCak5ZQhUip8GmIsy6tfMEtN3lZbYMW2GCr1wwrY=;
        b=Wi2pMU8HtuplgSvyVoDCeo6IcmTY5ZDRwXqH74BCTZ0orGXnqHTqtSykpYhQ+R0wSO
         JD5HAZOxbWS4zL5FFLU1xpydb7fyGy5aeK+Uzeu3d3QlGdGRMwC/m94+qw9d0A7TJkBb
         FFK01oHEy2PxaoEpEAP0Ywp4K81Pe1xEZQniccePSeqqBaJ8k3i16Au0nq/841fQNTZh
         EWWqvj8p5zkzg1Hzjy9TkCFJd1gJTjYqHzB2uX7gMKa73MCznCvukaJoTnefB+ktl6yR
         H1sdbQgIgTV03CrxszpjMn0qphmZ5ejFsb1Ztd+FA7CVBkUup8CfK9XM/bjN5r6Kc01E
         9LMQ==
X-Gm-Message-State: AOAM531NKtaDUNG829snhRy+cCAJb7Ghy3PF0c+bQ4OI307mTuJ6ctli
        oKEFuiOfNaF/dIjbF1tZ2neWpIaZtnhgNw==
X-Google-Smtp-Source: ABdhPJwTf369KgqrP10z0NBG+pLR1/Saq3CwVA+zBGr0HHot2VwWffzcsGi2zu7ysB+wRkYvzKZTvg==
X-Received: by 2002:a05:620a:24c8:b0:67d:c9f4:8271 with SMTP id m8-20020a05620a24c800b0067dc9f48271mr7003585qkn.96.1648830094226;
        Fri, 01 Apr 2022 09:21:34 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id 22-20020ac85756000000b002e1cabad999sm2099536qtx.89.2022.04.01.09.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 09:21:34 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id v35so5859270ybi.10;
        Fri, 01 Apr 2022 09:21:33 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id 66-20020a250045000000b0063396e22179mr9690505yba.393.1648830093511;
 Fri, 01 Apr 2022 09:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220320092542.2308-1-wsa+renesas@sang-engineering.com> <20220320092542.2308-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220320092542.2308-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Apr 2022 18:21:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWTGsL4H_h3MRgbUaVZSAXQAFZEC5dcGMhne28SbFMRyA@mail.gmail.com>
Message-ID: <CAMuHMdWTGsL4H_h3MRgbUaVZSAXQAFZEC5dcGMhne28SbFMRyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: r8a77990: add drive-strength
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LUU HOAI <hoai.luu.ub@renesas.com>
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

On Mon, Mar 21, 2022 at 2:43 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> According to R-Car Gen3 HW documentation 2.20 onwards, drive-strength is
> introduced to r8a77990. It is also documented for r8a774c0. Add it to
> the pinctrl driver.
>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
