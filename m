Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C339F6D52AA
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Apr 2023 22:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233101AbjDCUkB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Apr 2023 16:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232357AbjDCUj6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Apr 2023 16:39:58 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AB435B3;
        Mon,  3 Apr 2023 13:39:48 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id r40-20020a05683044a800b006a14270bc7eso12985282otv.6;
        Mon, 03 Apr 2023 13:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfOgDZjg9iAGbEywlD3Qv4cA6TzcBiYhilcxqJl7INE=;
        b=GJsmIBOWtyBTjMF0fAKpUB0QFr7qE01aQzfV3K549WVBg9i0Q/qtsiGaAK6+2NiH5a
         NjBQ9UJ3OpbLPQWntUeZObPuO1EPsLAIMb7ECjBFHF+7fbpvHXS9ShcRX0cd00ErkOlH
         3C6nJbfoz0UoZv/HJNbSFQ2okkUunNtzIH95eihC9sKOPw8lhWwOQF+KyTuusppkmfT4
         oSTh76gxjaNT9evQye9BdnvdBMm1jaWqdKEu7mg7v+cfNyp82PcYXpBbC2Xvv9Rxdc4E
         r/CFRJFAiZTVDtXntVsUhU1kw7xTtcevPumcDVB+Lrp/ioDBgx35zNZHcSux3aGMQ3Gi
         dN/w==
X-Gm-Message-State: AAQBX9dT7YuPbbsBLqnwf9GO39bJvzFXj4biEpe2P8zPU5rOPeHE45bi
        PTxXUcztTO7wtcfcqqGJ4A==
X-Google-Smtp-Source: AKy350b4iiBtNpECURgpNMs9BDep6T3dZCL1nbmGfQt6eD8rGJV8MrJ2NKig5JAyUySNxmc+bu1Rdw==
X-Received: by 2002:a05:6830:186:b0:69f:91eb:87da with SMTP id q6-20020a056830018600b0069f91eb87damr213847ota.16.1680554387959;
        Mon, 03 Apr 2023 13:39:47 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n19-20020a9d6f13000000b006a11dd6d2c1sm4715004otq.29.2023.04.03.13.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 13:39:47 -0700 (PDT)
Received: (nullmailer pid 1708282 invoked by uid 1000);
        Mon, 03 Apr 2023 20:39:46 -0000
Date:   Mon, 3 Apr 2023 15:39:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v7 01/10] dt-bindings: pinctrl: rzg2l-poeg: Document
 renesas,poeg-config property
Message-ID: <168055438634.1708224.8325852104595055189.robh@kernel.org>
References: <20230328101011.185594-1-biju.das.jz@bp.renesas.com>
 <20230328101011.185594-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328101011.185594-2-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Tue, 28 Mar 2023 11:10:02 +0100, Biju Das wrote:
> Document renesas,poeg-config optional property.
> 
> The output pins of the general PWM timer (GPT) can be disabled by using
> the port output enabling function for the GPT (POEG). The HW supports
> following ways to disable the output pins.
> 
> 1) Pin output disable by input level detection of the GTETRG{A..D} pins
> 2) Output disable request from the GPT
> 3) Pin output disable by user control
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7:
>  * New patch
> Ref:
>  https://lore.kernel.org/linux-renesas-soc/20230306090014.128732-1-biju.das.jz@bp.renesas.com/T/#m07d2c4661d772a705b5a48fd050b7007b830f3eb
> ---
>  .../bindings/pinctrl/renesas,rzg2l-poeg.yaml     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

