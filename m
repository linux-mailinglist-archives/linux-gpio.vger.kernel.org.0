Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 352534EF811
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Apr 2022 18:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349319AbiDAQjE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Apr 2022 12:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351478AbiDAQip (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2022 12:38:45 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE3A1A7777;
        Fri,  1 Apr 2022 09:20:32 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id z19so2590553qtw.2;
        Fri, 01 Apr 2022 09:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X5d+yPwzSM9+owQOJ5sOv+pSJIX+gkFsbvEmvaE4ypI=;
        b=v5BZnMQ7oOSRGvUioFtMFUiMtRAdscYHOxwPZRlRlnoRGiWOnLpqik1Ze+0p3C4dU5
         /KX7KfH27VwKNFZUZp+cL5qne6LBwxF3bhtBYs7fUjK0aLu1ZSgi0pCYy4V6ttJmn3Z/
         rw657EvOa4dMtoKSem6qhiP87MLmGFdwypYd2zB0W2J1TrSAH5QEWryqbn7TlLPUOgUi
         4NVM7UsmND1zPGO+pbxONL5VXJI0sEufg/gmv/vv/7lE36WwBhQuWxK5ALcyoKrmYqZ5
         /ryaEEAb2WUaFimjjYVSvVCFv/brWXPkW5GkyhzleU4QQX2PKIpUA81hJyo9xp6BV63p
         FG4Q==
X-Gm-Message-State: AOAM5336vXSy9oA7alyMN0bRvoHQNOi4FA/PDDNpdTNk8ppnGssuZBKa
        uaxYRkhiuow/Ysk12FMpSvRlpHPNmUI9Vg==
X-Google-Smtp-Source: ABdhPJzUrD8QZovRqkx6HMOM1PXkKdpAj43T9L3MG6R/PRlY4RdYnIFA2q20AhfNJ49U25Q15dTjSA==
X-Received: by 2002:a05:622a:1b86:b0:2e2:1e80:ed52 with SMTP id bp6-20020a05622a1b8600b002e21e80ed52mr9155433qtb.95.1648830031216;
        Fri, 01 Apr 2022 09:20:31 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id r17-20020a05620a299100b00680b43004bfsm1819368qkp.45.2022.04.01.09.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 09:20:31 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-2e68c95e0f9so39414717b3.0;
        Fri, 01 Apr 2022 09:20:30 -0700 (PDT)
X-Received: by 2002:a81:24d6:0:b0:2e5:b253:f9fc with SMTP id
 k205-20020a8124d6000000b002e5b253f9fcmr10995277ywk.438.1648830030588; Fri, 01
 Apr 2022 09:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220320092542.2308-1-wsa+renesas@sang-engineering.com> <20220320092542.2308-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220320092542.2308-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Apr 2022 18:20:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXBPEkS=PXcuxFsrTNBHc=vpg=fWfsmQSLOEhJY0QzoXg@mail.gmail.com>
Message-ID: <CAMuHMdXBPEkS=PXcuxFsrTNBHc=vpg=fWfsmQSLOEhJY0QzoXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: renesas: allow up to 10 fields for drive_regs
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
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

On Mon, Mar 21, 2022 at 12:41 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Needed to support E3 and G2E drive regs.
>
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
