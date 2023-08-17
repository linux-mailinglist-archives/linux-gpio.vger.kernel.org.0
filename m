Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2A5677F6A9
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 14:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350904AbjHQMqJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 17 Aug 2023 08:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350998AbjHQMqA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Aug 2023 08:46:00 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37CC2D72;
        Thu, 17 Aug 2023 05:45:59 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-58c4f61ca12so38021447b3.3;
        Thu, 17 Aug 2023 05:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692276359; x=1692881159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibGvfzmEfXKThLKbygn+y3G1Ttqn014iJWQF6FxXxio=;
        b=C9TsMMWIufH3vumeth6n5vcA2TnfioHmbm4ql8ilh4G0hYK2EoWHlN2qMIHo8rr5NC
         6hyU6YTpMsrzl5zyT9k86myIAj75sbYsJOmHsFVUZnTSC2EXtNRuKlvvtuk7JwQqlztH
         RBrcz8lfOWuW5wpII6z+PIy7ltbJNKyPif9tVihp+AlrSHMPkyeDj3lopDyOH4NPbIWl
         3QhYjZ8UwB8JkXH70MyR2cm1Qu6drA3pcDcexKjh4EAPUJ7doQCcv3Twze6bqLORuyGD
         MuyL4rbj8YzVwk6D4ghIloYuWw1pcmnz24ibnbtnEOpPiZaZArhvXGOYGA3aFPEfwfz8
         iQRg==
X-Gm-Message-State: AOJu0YyYXmo//PJ5fnZL0L2Q3e+mu28zYXnHuE3284tZ3cRkG3UbFPRa
        PlqVpy3Eo67aHaxAO81rX1nbtm8BNt341g==
X-Google-Smtp-Source: AGHT+IFnEEp+P02ZKZBbkVJPvvtgOv8vqJNKROZiX7E2m6Kg9rKtuwLT8oaMtgsqUFRKJ4Dyl1TIyQ==
X-Received: by 2002:a0d:e88d:0:b0:577:51cd:1b4a with SMTP id r135-20020a0de88d000000b0057751cd1b4amr5873896ywe.41.1692276358848;
        Thu, 17 Aug 2023 05:45:58 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id i131-20020a819189000000b0057a57a9a932sm4544094ywg.107.2023.08.17.05.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 05:45:58 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-ccc462deca6so7300995276.0;
        Thu, 17 Aug 2023 05:45:58 -0700 (PDT)
X-Received: by 2002:a25:da02:0:b0:d07:3fb6:c00d with SMTP id
 n2-20020a25da02000000b00d073fb6c00dmr5835440ybf.12.1692276358231; Thu, 17 Aug
 2023 05:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230815131558.33787-1-biju.das.jz@bp.renesas.com> <20230815131558.33787-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230815131558.33787-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Aug 2023 14:45:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsUL5Om=+tPxktm8+=P0UmUzXXHOMTzaJxaCTY16G2=w@mail.gmail.com>
Message-ID: <CAMuHMdWsUL5Om=+tPxktm8+=P0UmUzXXHOMTzaJxaCTY16G2=w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] pinctrl: renesas: rzv2m: Fix NULL pointer
 dereference in rzv2m_dt_subnode_to_map()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Biju,

On Tue, Aug 15, 2023 at 3:16 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Fix the below random NULL pointer crash during boot by serializing
> groups and functions creation in rzv2m_dt_subnode_to_map() with
> mutex lock.
>
> Crash logs:
>  pc : __pi_strcmp+0x20/0x140
>  lr : pinmux_func_name_to_selector+0x68/0xa4
>  Call trace:
>  __pi_strcmp+0x20/0x140
>  pinmux_generic_add_function+0x34/0xcc
>  rzv2m_dt_subnode_to_map+0x2e4/0x418
>  rzv2m_dt_node_to_map+0x15c/0x18c
>  pinctrl_dt_to_map+0x218/0x37c
>  create_pinctrl+0x70/0x3d8
>
> While at it, add comment for lock.
>
> Fixes: 92a9b8252576 ("pinctrl: renesas: Add RZ/V2M pin and gpio controller driver")
> Cc: stable@kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Added comment for lock.
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
