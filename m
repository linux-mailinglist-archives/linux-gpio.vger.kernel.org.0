Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 250914E5897
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Mar 2022 19:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240166AbiCWSnt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Mar 2022 14:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232615AbiCWSnt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Mar 2022 14:43:49 -0400
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6897B5A153;
        Wed, 23 Mar 2022 11:42:19 -0700 (PDT)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-dd9d3e7901so2598989fac.8;
        Wed, 23 Mar 2022 11:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4NPQFqaDNoPKiSjcYggTREHtgSu09BWjSaJkzpqJ++8=;
        b=TeLbRGfFGaAGEIiSzGyQgPlO8jinIVoD05KYD/c61cWBcBIc9nOWnEPPXdRvRjAvgP
         XDVsu8ljRjuDuP8xwfvDJ63ew/TSJQZNfrTaR3mYYuexBKSKdIymTS291A5brQ5WF6Pc
         UCdA67K+uUnuLf31oeThpcUuasYJB+MuTiNfkAOm9l3GLs8+pMLnSkc8ygs7Y0T4HHkT
         up42lJrlVkUzsPIFA7U8lP1LcWdrqoo4gzlNOgpAkv8LSqR4iN22CR+t8Qw2ugJVxfFK
         Uz2VbNWFMaz+O4dWSDfiejIsLwL2NzwRxP4nP/98b7yxASUgY3ZoAIlClqn9T6V4/xQF
         J5aA==
X-Gm-Message-State: AOAM533CMcrRRT31RLEBWtV8SOXUSlypjWvbrC5yO3kprpuSEp7MpZd6
        qU7N9V8XocjZw18dW2UcFQ==
X-Google-Smtp-Source: ABdhPJxHOogAUZO5Meo5w0334dle3GksQuVL8Xy6eBAV8F2z8QHwPCYedrByEW/Umos3w08bkjlxDQ==
X-Received: by 2002:a05:6871:555:b0:d7:16fe:8ae2 with SMTP id t21-20020a056871055500b000d716fe8ae2mr694598oal.174.1648060938754;
        Wed, 23 Mar 2022 11:42:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y16-20020a9d6350000000b005c9653ab377sm326930otk.17.2022.03.23.11.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 11:42:18 -0700 (PDT)
Received: (nullmailer pid 233495 invoked by uid 1000);
        Wed, 23 Mar 2022 18:42:17 -0000
Date:   Wed, 23 Mar 2022 13:42:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: renesas: Document RZ/G2UL
 pinctrl
Message-ID: <YjtqCWZocGQhsO9g@robh.at.kernel.org>
References: <20220315152717.20045-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220315152717.20045-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 15 Mar 2022 15:27:16 +0000, Biju Das wrote:
> Document Renesas RZ/G2UL pinctrl bindings. RZ/G2UL GPIO block is
> almost identical to RZ/G2L and has lesser pins compared to RZ/G2L.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml           | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
