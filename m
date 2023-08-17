Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B28B877F6AF
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 14:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350949AbjHQMrr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 17 Aug 2023 08:47:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350947AbjHQMrW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Aug 2023 08:47:22 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1367A2D5F;
        Thu, 17 Aug 2023 05:47:21 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-58c6b6b4953so20629207b3.3;
        Thu, 17 Aug 2023 05:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692276440; x=1692881240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7jILR1Ve6WmZPM9OZvcCN6Ef1BytUgkOlnaEG52+hM=;
        b=QP9845KhKNduy8vf+Kch3NHMkXVmRSmGWK7MCFZ/gelSfKMlIJ8VcXxb5/tBVlmbOC
         1ySwKZQGEEISW0MOXz3g7x/C7VbwgVnjHWMD0RljeZCfDJBncT66mRbrja9Z3l8gIi8R
         RZcI9XeWsQdcmqXlubtKP66KpT6OFcq5ix6MM9TNVF2jkijtSZrjt/PGQV8OBZKFiHPt
         QdXAYCDobp+7fCGosEIhvBDW2Wtb2mHnPltWLpouR26m9uovie510scoLm6MYY72JIGb
         Da+yqaALkEQZLvTp8EtRoa8N+dpHW9kn6RUzoXcpRslOJrNqRi/0H+X4a8c8hYFXFYp8
         bSSw==
X-Gm-Message-State: AOJu0YxGQvbpB42eFkLv20vHhbqzCHeP8J9zsjPkXH4vW5Zxv/lvmnkr
        bMJ9v+xNkOH5LixpQaTEgO+FXRVgFlQaAA==
X-Google-Smtp-Source: AGHT+IHyKxXICHUPK7IScJnsf/OKJUnn7xNxWubEywO9CoVh+07BdHO3N7gkJdDlS+Zq3afZX4S6gA==
X-Received: by 2002:a81:9245:0:b0:58b:cea5:947a with SMTP id j66-20020a819245000000b0058bcea5947amr4951432ywg.40.1692276439983;
        Thu, 17 Aug 2023 05:47:19 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id x81-20020a81a054000000b0058cbf72d6f2sm925060ywg.119.2023.08.17.05.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 05:47:19 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d73c595b558so242109276.2;
        Thu, 17 Aug 2023 05:47:19 -0700 (PDT)
X-Received: by 2002:a05:6902:724:b0:d6b:78fe:f1c1 with SMTP id
 l4-20020a056902072400b00d6b78fef1c1mr5721279ybt.65.1692276439203; Thu, 17 Aug
 2023 05:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230815131558.33787-1-biju.das.jz@bp.renesas.com> <20230815131558.33787-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230815131558.33787-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Aug 2023 14:47:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXSdtz=i9GiLxb5fhazvBwPR4tak-1oZSp2+6Tcnr+Bg@mail.gmail.com>
Message-ID: <CAMuHMdUXSdtz=i9GiLxb5fhazvBwPR4tak-1oZSp2+6Tcnr+Bg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] pinctrl: renesas: rza2: Add lock around pinctrl_generic{{add,remove}_group,{add,remove}_function}
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        stable@kernel.org
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

On Tue, Aug 15, 2023 at 3:16 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The pinctrl group and function creation/remove calls expect
> caller to take care of locking. Add lock around these functions.
>
> Fixes: b59d0e782706 ("pinctrl: Add RZ/A2 pin and gpio controller")
> Cc: stable@kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Added unlock_and_done label for lock error path.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v6.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
