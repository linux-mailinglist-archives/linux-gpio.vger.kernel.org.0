Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66E86748133
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jul 2023 11:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231660AbjGEJlb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 5 Jul 2023 05:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbjGEJla (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Jul 2023 05:41:30 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 385BEE54;
        Wed,  5 Jul 2023 02:41:30 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-57045429f76so74067327b3.0;
        Wed, 05 Jul 2023 02:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688550089; x=1691142089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fAzkXesdKC71OkqBakXkG1XHnbuCOLBuXtSO5+gYEgM=;
        b=gVc1aqYyIx53tAdB5wHUJwgO/IiklibXdQDJiG2IhBFefojuAzyVNFVXeMxgHPD9M5
         5FWcu6/yAPF1Ehf1UINxEGIf+usGoli5IDMvbwGYtXy0FoMtlCKeMgJJDdYBlyYgHOHP
         Hi5OQPT4MWbfn4QDIp0MGlHHyrO4RPDAGAGpFuznsU8aqo3RAPxclDJLsFRH5Kbu3/H7
         Q+tIQrmiL1WWUsJ3in2Bmpa6nIrep4tHwHVzJGjBG6XbMV4JrBjj/I6FR+NVGF8imQ21
         nstMDfLimDzx+VzG5zkef5/ZqfSEVg9vdCp3BQe9h30H9hYWoS9qudCumxUPp3hoYLpQ
         bq0w==
X-Gm-Message-State: ABy/qLZiNBzuQmzfyt8JTB4wzAPyB2ZrW3+c1voxqHX9bTtnldCeRI2m
        Ozli3d3o/+SpP+VMw65KYv6O5Lal2eQG6w==
X-Google-Smtp-Source: APBJJlFTyT1a8P3UIheu2XZVU+cflKo6IwV+KfVTWoHw6VvMempSU4aIZiE+WNwwUNhKOE9YPdrthA==
X-Received: by 2002:a81:520e:0:b0:570:6a58:d864 with SMTP id g14-20020a81520e000000b005706a58d864mr11360395ywb.51.1688550089291;
        Wed, 05 Jul 2023 02:41:29 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id z4-20020a816504000000b0056d4649670fsm6094032ywb.133.2023.07.05.02.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 02:41:29 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-c581c758ad8so2745625276.1;
        Wed, 05 Jul 2023 02:41:29 -0700 (PDT)
X-Received: by 2002:a25:fc1f:0:b0:c61:390d:7f2a with SMTP id
 v31-20020a25fc1f000000b00c61390d7f2amr1567304ybd.51.1688550088873; Wed, 05
 Jul 2023 02:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230704111858.215278-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230704111858.215278-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jul 2023 11:41:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-vpPKjw-x45u41KTJPOE2twUFPiU+n9ZzHhgiY0+igA@mail.gmail.com>
Message-ID: <CAMuHMdV-vpPKjw-x45u41KTJPOE2twUFPiU+n9ZzHhgiY0+igA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Handle non-unique subnode names
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 4, 2023 at 1:19 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Currently, sd1 and sd0 have unique subnode names 'sd1_mux' and 'sd0_mux'.
> If we change it to a non-unique subnode name such as 'mux' this can lead
> to the below conflicts as the RZ/G2L pin control driver considers only the
> names of the subnodes.
>
>    pinctrl-rzg2l 11030000.pinctrl: pin P47_0 already requested by 11c00000.mmc; cannot claim for 11c10000.mmc
>    pinctrl-rzg2l 11030000.pinctrl: pin-376 (11c10000.mmc) status -22
>    pinctrl-rzg2l 11030000.pinctrl: could not request pin 376 (P47_0) from group mux  on device pinctrl-rzg2l
>    renesas_sdhi_internal_dmac 11c10000.mmc: Error applying setting, reverse things back
>
> Fix this by constructing unique names from the node names of both the
> pin control configuration node and its child node, where appropriate.
>
> Based on the work done by Geert for RZ/V2M pinctrl driver.
>
> Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controller driver")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue as a fix in renesas-pinctrl-for-v6.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
