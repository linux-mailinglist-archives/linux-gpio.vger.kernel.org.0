Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2F5E585726
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Jul 2022 01:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbiG2XGs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Jul 2022 19:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232250AbiG2XGr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Jul 2022 19:06:47 -0400
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8223087228;
        Fri, 29 Jul 2022 16:06:46 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id e69so4670038iof.5;
        Fri, 29 Jul 2022 16:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=SVW9DWKOLx9YOr6c7F/wYxosecHqFmeN8CQC8/9ssJ0=;
        b=79BKcuocYUYs9Zbp5DCpKdoXMxdRvoGI9+q84h62orwIrB9D7JnoI31uJpNQBCrC44
         ydQtDcy/gnC1NLY2tMO9TavF8iMenL/nOJQe5mbjYWZEkbX8Ly1L4nPgHkUqD4QPwqae
         fMNjXuXD+gZdgHAMqp7OSI6nAbtVJW/35HHs7vYOTyHRGCOMGpKJI4WR3THgKIQSJGaT
         la4a4tbOx0Cl6kU6LkSaWnkN6cRWumDsE/63pgfzNkx2apWXFsIkcqsOa2AG1puOC5ES
         MKYMNnTkqs+MDAJbZGS8MvfLp+lnS0WjKuMR1x9V25b729P6rksIRMypR2r46RtsGYGL
         nBuA==
X-Gm-Message-State: AJIora9CSr9V3rJf02C0ba/Wv6piT5BaT7utpS4Djc2+0Ux5eY5dC/DU
        oCttcbI+wc9hPjOhoF3ieg==
X-Google-Smtp-Source: AGRyM1spnDrVja1LcglOLXL2ULa6cCcIObu4tG0+mMCr8UcsIq75aUZcAyh2ev7/Zc12OQ+WJ30OVQ==
X-Received: by 2002:a02:c8c9:0:b0:33f:3647:e751 with SMTP id q9-20020a02c8c9000000b0033f3647e751mr2079680jao.225.1659136005699;
        Fri, 29 Jul 2022 16:06:45 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d123-20020a026281000000b00335c432c4b9sm2249778jac.136.2022.07.29.16.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 16:06:44 -0700 (PDT)
Received: (nullmailer pid 106784 invoked by uid 1000);
        Fri, 29 Jul 2022 23:06:40 -0000
Date:   Fri, 29 Jul 2022 17:06:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Biju Das <biju.das@bp.renesas.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: renesas: Add RZ/G2L POEG
 binding
Message-ID: <20220729230640.GA106750-robh@kernel.org>
References: <20220729122448.498690-1-biju.das.jz@bp.renesas.com>
 <20220729122448.498690-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729122448.498690-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 29 Jul 2022 13:24:47 +0100, Biju Das wrote:
> Add device tree bindings for the RZ/G2L Port Output Enable for GPT (POEG).
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated the description.
> REF->v1:
>  * Modelled as pincontrol as most of its configuration is intended to be
>    static.
>  * Updated reg size in example.
> ---
>  .../bindings/pinctrl/renesas,rzg2l-poeg.yaml  | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-poeg.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
