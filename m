Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3799477F6A6
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 14:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244485AbjHQMpE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 17 Aug 2023 08:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350989AbjHQMoy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Aug 2023 08:44:54 -0400
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B802A2D62;
        Thu, 17 Aug 2023 05:44:53 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-58a24ac48eeso41319397b3.0;
        Thu, 17 Aug 2023 05:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692276293; x=1692881093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Xzq+05yCwzllAPUFX9DbOBzjY5HzxjfDUboN2hQ4pI=;
        b=JcdngYm+fIe3W1ooOLHr/iYk6H/9yohGoywU0GICnwvwnCIje4TMIpUNDUkSp1Zkaq
         ueh49uaunww0Ncgpu38GsJ11kcQqYVm8FqHDSxsmWaeU+McHH0PPpsZSgBM8qLfRC03x
         xl0eyO9GEY/08rFZwIccHaraXezf+agqBbbRJ6EgnZ0Bxi0C+p3QYxY0L2EnSAvk3R4l
         cp3FYNNQl3TayqpNjndxi+ET9hNeZpfVVvLNf/5FpeV/WUoROwY/vcxbtjMmVujZi4iV
         K68BGEokLKnx5P/9ZkTllN+ypjczjEzipMOuj7xEaqpGPI8bwJjw7UxOmSPQZmU6sx63
         AgoQ==
X-Gm-Message-State: AOJu0YyznBhKkJP61pcIRotAefgC6wgS1MdIFwXzGsyUEGNFpDJdv1NO
        Au2Rpk40jWsbRn/aVcoYaW9+n2r6RnpClw==
X-Google-Smtp-Source: AGHT+IEPvyfD5D9SG4H4jDY84jWG+AiHP5caqE4dXhc9bHxJYNcOlqCB3jDSdI2tuCsQW8H7fIQLSg==
X-Received: by 2002:a0d:ca89:0:b0:589:fbfe:fff1 with SMTP id m131-20020a0dca89000000b00589fbfefff1mr4820405ywd.10.1692276292731;
        Thu, 17 Aug 2023 05:44:52 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id i5-20020a0ddf05000000b0058451c12076sm4576595ywe.14.2023.08.17.05.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 05:44:52 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-58c92a2c52dso18828307b3.2;
        Thu, 17 Aug 2023 05:44:52 -0700 (PDT)
X-Received: by 2002:a25:344a:0:b0:d43:80c6:5cc9 with SMTP id
 b71-20020a25344a000000b00d4380c65cc9mr4235803yba.51.1692276291880; Thu, 17
 Aug 2023 05:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230815131558.33787-1-biju.das.jz@bp.renesas.com> <20230815131558.33787-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230815131558.33787-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Aug 2023 14:44:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV852knZ6UoGO-_B=xir=uUJZx2O1CHL+nsK0_BB_hStg@mail.gmail.com>
Message-ID: <CAMuHMdV852knZ6UoGO-_B=xir=uUJZx2O1CHL+nsK0_BB_hStg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] pinctrl: renesas: rzg2l: Fix NULL pointer
 dereference in rzg2l_dt_subnode_to_map()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_SORBS_WEB,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Biju,

On Tue, Aug 15, 2023 at 3:16 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Fix the below random NULL pointer crash during boot by serializing
> pinctrl group and function creation/remove calls in
> rzg2l_dt_subnode_to_map() with mutex lock.
>
> Crash logs:
>  pc : __pi_strcmp+0x20/0x140
>  lr : pinmux_func_name_to_selector+0x68/0xa4
>  Call trace:
>  __pi_strcmp+0x20/0x140
>  pinmux_generic_add_function+0x34/0xcc
>  rzg2l_dt_subnode_to_map+0x314/0x44c
>  rzg2l_dt_node_to_map+0x164/0x194
>  pinctrl_dt_to_map+0x218/0x37c
>  create_pinctrl+0x70/0x3d8
>
> While at it, add comments for bitmap_lock and lock.
>
> Fixes: c4c4637eb57f ("pinctrl: renesas: Add RZ/G2L pin and gpio controller driver")
> Cc: stable@kernel.org
> Tested-by: Chris Paterson <Chris.Paterson2@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Added comment for bitmap_lock and lock.
>  * Moved map allocation down to reduce lock section.
>  * Added locks for maps and pinctrl group and function creation/remove
>    calls
>  * Added unlock_and_done label for lock error path.

Thanks for the update!

Upon closer look, I noticed that I had missed that the map allocation
is not global, but local to a specific DT node, so it does not
need protection by a lock.  If no one objects, I will back out that
change myself, queue this patch in renesas-pinctrl-for-v6.6, and send
a PR tomorrow.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
