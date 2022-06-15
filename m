Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 718B354CAD3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 16:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238011AbiFOOEh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 10:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352323AbiFOOEh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 10:04:37 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F2719F85
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 07:04:36 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-30c143c41e5so62326307b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 07:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TKNmlelPMUUwEhyo/oW2GfDg9fGO0GWkAQdbd+usNG0=;
        b=Hhk5ooKmiw/m4i7aPxBot9kGRRD4QfdArggzSzM1SVYadr1ayhHvdo0Lf2/Twv4K3v
         jYq2sbCVcfkaursJKcvjxYIOAOWgCibUIArbV5dqqKvm2HU1zksAyPgEsqoxpEr1dFxF
         TJS7ncF98C5hZIDPDc5Q0ao/FWu2b51fJxaOZS+7j3wdLgyARfPd21tN1FAjd37XByP1
         tMxMNMaoRie1uKHl3QFXUlm4wqmLoRGmmCjvDpXCxP83wB9cgXLIhfqiQppMC76e8JNL
         xui5hyqZ4b8F2FsfjmoaZNDc3fuo8nDZrviLYt+kiNM7UaALnCXM5F053RXiWxk71KoG
         hpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TKNmlelPMUUwEhyo/oW2GfDg9fGO0GWkAQdbd+usNG0=;
        b=h1SLO/tITg+zScfgmJ/b/ERQ6jDOWqV7k0VH4EOExqqPs9rNjodh4Gzf8cS+Usx7kq
         Q5mrgTvnMRzHLzMOTIZ/9W1JwHBeuP88v3IfzIF900yyZx/HEScHyyZtYNQuyfmmI29k
         npMGbcm4VAaI7twXqZ9rdoC3QKPLmVZ//3amuqM7tM8cWRMen4UJScARvdKI8XJRFu60
         S2ffaUQXWqDZIGs2INJi3Sxn4heNxsC8rFCFyQjNfhWSuwM+3OfJt3hGoUIaEgkNbwFO
         6hEkmNMG3FofyMg/X4n3be1P9/SPedsjAYjr83Cs6y/oLxhcxnOiZB84QUlv62kqqzXs
         NWmA==
X-Gm-Message-State: AJIora++YFPEYdXcUo+vfKzO1ro+6beejpAjkz1gspIOYiqcd0/LnPei
        CruCzPOMzemoHVqF26ujyn7trjiAXkrKAxnKHbXrFg==
X-Google-Smtp-Source: AGRyM1tcOWzYDj+vzN+BPLmjJWB+4BtKrK1yhKwTxn7O9wjxBMPpl/2kQCMvVMBdo4eZwYOsbLHoIiNtVTcY6D3IZpY=
X-Received: by 2002:a81:830f:0:b0:313:3918:5cf with SMTP id
 t15-20020a81830f000000b00313391805cfmr11990562ywf.126.1655301875869; Wed, 15
 Jun 2022 07:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220607111602.57355-1-linmq006@gmail.com>
In-Reply-To: <20220607111602.57355-1-linmq006@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jun 2022 16:04:24 +0200
Message-ID: <CACRpkdYBHniSSb1Och=P_YNcuSvRxXYJM0KtCuLSeETxMtnAdQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: Fix refcount leak in nmk_pinctrl_dt_subnode_to_map
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 7, 2022 at 1:16 PM Miaoqian Lin <linmq006@gmail.com> wrote:

> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak."
>
> Fixes: c2f6d059abfc ("pinctrl: nomadik: refactor DT parser to take two paths")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Patch applied!

Yours,
Linus Walleij
