Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A99B4C4E66
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Feb 2022 20:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbiBYTMp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Feb 2022 14:12:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234296AbiBYTMo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Feb 2022 14:12:44 -0500
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E3320C18B;
        Fri, 25 Feb 2022 11:12:11 -0800 (PST)
Received: by mail-oo1-f53.google.com with SMTP id d134-20020a4a528c000000b00319244f4b04so7592021oob.8;
        Fri, 25 Feb 2022 11:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K5x+EtF2eS5+RTFJ+8H7Za6pww+kwgng4S5CGgR/3fE=;
        b=kTgLghEcG0YSHlGbjgsr/L5PqvsfxsBFTrdnOFsXUCFPsK2h3XLV5M0L6+dTZztwKg
         uyPByZlQtRU4kJpIaIv6jJ3I6ChIiKRUx8FtiRc6tPc9PtKf6bwXnrjf55d9g7eftqxJ
         X0lGCXw1zsRZR1CAuRQaYE2ysUBwOxF+ixaaa/DcB2GNsRBzCX82o8YO8Si/cEBOSeoh
         qcLUjZkCChN3iMsvTefP7FpVLwqi1JS7lyM40wpHbgMB6pGqZEmA93Iv38prIbmlJXwz
         VjKBplpXBlDz21zJQX7ILB7lbDFkTu1OFhBA782y6hpUNSVZSjyO/D20oBR6W2wwZvlq
         WsNQ==
X-Gm-Message-State: AOAM531h4UscuGCgACrBWjDRTJnHINlbXCz2nBDdWzciseyBAlAulWcv
        l9QtCCzTgXZ2klyCrNhOMQ==
X-Google-Smtp-Source: ABdhPJz6nk8h5SeBNIqDSG38xu0Ws/3K828zx2f/U2XOt6ULYKegBUh57ljwkgVc/UOmWIJjP+96IQ==
X-Received: by 2002:a05:6870:b7b4:b0:d6:e56e:b85c with SMTP id ed52-20020a056870b7b400b000d6e56eb85cmr1855618oab.327.1645816331027;
        Fri, 25 Feb 2022 11:12:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bn8-20020a056820180800b0031ca56292bbsm1380681oob.46.2022.02.25.11.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 11:12:10 -0800 (PST)
Received: (nullmailer pid 1268098 invoked by uid 1000);
        Fri, 25 Feb 2022 19:12:09 -0000
Date:   Fri, 25 Feb 2022 13:12:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: pinctrl: renesas,pfc: Document
 r8a779f0 support
Message-ID: <YhkqCaiPhCjnO8qB@robh.at.kernel.org>
References: <cover.1645457792.git.geert+renesas@glider.be>
 <d51828853396773be2d6837f3301ac9da8b6f29e.1645457792.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d51828853396773be2d6837f3301ac9da8b6f29e.1645457792.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 21 Feb 2022 16:43:36 +0100, Geert Uytterhoeven wrote:
> From: LUU HOAI <hoai.luu.ub@renesas.com>
> 
> Document Pin Function Controller (PFC) support for the Renesas R-Car
> S4-8 (R8A779F0) SoC.
> 
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
