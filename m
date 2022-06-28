Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4DDA55C94B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 14:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345662AbiF1M1q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 08:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345607AbiF1M1p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 08:27:45 -0400
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD30248D8;
        Tue, 28 Jun 2022 05:27:45 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id c137so9418399qkg.5;
        Tue, 28 Jun 2022 05:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fS98LCW4qTAzPueAfZNMOYZf3Q2ntP8LgD6kZPncPEw=;
        b=1H4BjmbCFQkEYK29E2NgEjNJRpJ+JQC0JHjfhweh6iu83OosFg2lrjNKGFWeqFs+2L
         jDTT4jMIkYmaTVtHX8sJTP+9cDyrtZ9LMvUdeh1ui98zLBfu9I5OwjqUGu/8ftKk8VST
         vFV+GRkuZSDcDB9W4HAUINqNx5RJI3kgN+Tb1HWO3BPFJDo0fx86UeWRaKFn66aB7sHW
         CCBMT+u/tylqQ1JP2dZS0zEdOM85Xhkb7tqUwAs1czvy2zmNYP/IDXTGU9qT2l+byIih
         iPW5fE8IfugHFN7+6zods26SCybnrWHUwFBSaD6ERpQaNTvlvq8F2foZQB/+bRBRK0dS
         auqQ==
X-Gm-Message-State: AJIora/PB/0mI3/NHxuM95HihA/ttLeeMhRHsvRMcOhn1rfTgNzT1WEI
        H//WxdUmerU2QejDtQ8vKmo/Ura6wdLKJA==
X-Google-Smtp-Source: AGRyM1v0JPFIolFdz/tsmneLcs3n09Gx/DKhGsFa15Pn8XEkdoLwuqEhMcCWe+MuMQGwhLbTj88zLQ==
X-Received: by 2002:a05:620a:1a23:b0:6af:6ceb:2ed with SMTP id bk35-20020a05620a1a2300b006af6ceb02edmr424873qkb.42.1656419264070;
        Tue, 28 Jun 2022 05:27:44 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id b20-20020ae9eb14000000b006aee8580a37sm10623545qkg.10.2022.06.28.05.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 05:27:43 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id r3so21941940ybr.6;
        Tue, 28 Jun 2022 05:27:43 -0700 (PDT)
X-Received: by 2002:a05:6902:1141:b0:669:3f2a:c6bb with SMTP id
 p1-20020a056902114100b006693f2ac6bbmr18087185ybu.365.1656419263425; Tue, 28
 Jun 2022 05:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220624084833.22605-1-phil.edworthy@renesas.com> <20220624084833.22605-2-phil.edworthy@renesas.com>
In-Reply-To: <20220624084833.22605-2-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Jun 2022 14:27:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnRxxJGtExEiaXC=eo8+iqjo9+0j1xMU3GCf_WKm6jDg@mail.gmail.com>
Message-ID: <CAMuHMdXnRxxJGtExEiaXC=eo8+iqjo9+0j1xMU3GCf_WKm6jDg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: renesas: Add DT bindings for
 RZ/V2M pinctrl
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
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

On Fri, Jun 24, 2022 at 10:49 AM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> Add device tree binding documentation and header file for Renesas
> RZ/V2M pinctrl.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2:
>  - Remove power-source as it is not supported
>  - Add enum and description for slew-rate
>  - Remove 'oneOf' and 'items' for compatible string
>  - Add description for the interrupts
>  - Remove input-enable property as it is not appropriate

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
