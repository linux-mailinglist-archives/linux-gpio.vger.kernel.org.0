Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5026C628201
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 15:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236724AbiKNOIh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 09:08:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236862AbiKNOIT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 09:08:19 -0500
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01F02AC40;
        Mon, 14 Nov 2022 06:08:18 -0800 (PST)
Received: by mail-qk1-f179.google.com with SMTP id d7so5011252qkk.3;
        Mon, 14 Nov 2022 06:08:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33yRZITXRMZfRWv7t9FbaxzEPPE5E2E1Xpj8OAu5Spk=;
        b=POeyR7ljQLHbp2dskQw2fWcsHiYWGugcB7VKBYLZGg3+2KW5PuZaoIScCdbvsTybwQ
         Brc2XgKyR+1QNdkaXBhYOiv5aF+IwBEx45FnD1ESFSqB+xVFIcllDv93ML1zgfMR3THh
         MZT4ZhPheVQsZDjA2gdZ9ELLsUvqeJjgK92tnobQYujIeEcslbDA6pRN9ilpwUEKuwXt
         CGtdjWo8FsNZGeEgHSCY7D6Jh0F6jCLH6Yved0F2nmW8KwSxkL5QM/KVZ5cMzF5lZelO
         jNLvn/w97B6ErlMdACGfXHzr0QjOnP2EnhUxKnr6666REfLgsPs7hm7ToKS8PH1G4bJo
         12Mw==
X-Gm-Message-State: ANoB5pk6TefC04yxssoZ62kxG3Bv581/7YjJRs7BIwX3Q326KAnbN7w2
        Bi0cxD/Vo3VZ6R9Oinn33/BekIb+LwxXxQ==
X-Google-Smtp-Source: AA0mqf4n0RLUrAkBS43WGi0pnI+R2ng72dSqy5vpR3t4t2RRZlb+HWN1EVMWE7HPvyhSdjCsSAwRDQ==
X-Received: by 2002:a37:6887:0:b0:6cd:fd44:d83e with SMTP id d129-20020a376887000000b006cdfd44d83emr11143449qkc.594.1668434897715;
        Mon, 14 Nov 2022 06:08:17 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id f2-20020ac87f02000000b003a4c3c4d2d4sm5716858qtk.49.2022.11.14.06.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 06:08:17 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-370547b8ca0so107579537b3.0;
        Mon, 14 Nov 2022 06:08:17 -0800 (PST)
X-Received: by 2002:a81:1c52:0:b0:357:66a5:bb25 with SMTP id
 c79-20020a811c52000000b0035766a5bb25mr12967724ywc.383.1668434897139; Mon, 14
 Nov 2022 06:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20221108191309.3908415-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221108191309.3908415-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Nov 2022 15:08:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWzYkVpP9rf0+OPsizckOQdK2tf969_EjQcNZEgNhLq1A@mail.gmail.com>
Message-ID: <CAMuHMdWzYkVpP9rf0+OPsizckOQdK2tf969_EjQcNZEgNhLq1A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: pinctrl-rzg2l: remove unnecessary check
 from rzg2l_dt_node_to_map()
To:     biju.das.jz@bp.renesas.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 8, 2022 at 8:13 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This patch removes the unnecessary check from rzg2l_dt_node_to_map()
> as the ret value is already negative.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v6.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
