Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEDB562609
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 00:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiF3WZN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 18:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiF3WZM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 18:25:12 -0400
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D652A406;
        Thu, 30 Jun 2022 15:25:11 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id f15so288979ilj.11;
        Thu, 30 Jun 2022 15:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RekG2tzkZ8TJ0hR3Sg/OCS8Mf9fHdZVYkRJgiazqIKI=;
        b=B921yx+Or+CXlpquPAHUgLT8ove6ioHIIboVXiMglBdSyWz7W5Rzr3QNiUbW69Da+4
         yRVvJ9xtzRq7UpRP/O9lFFU0FBsJa6gjV5KhtUHS6DKcO9deBRgC1TGL17cngeVkr084
         X6b4lD1m6PtxwS1yFBpn0WdfAlUKugkB7lTowgpb+njSDB4wTDllzkBBvh9GWKMF3KoW
         8UpHSwaKDzeLxwmLMZgJn+hRy29KCZoYkv50MEnmzqeqwiqbMybrZ/JO4z+vudxV9unn
         N2gT77VTD46N5Kq+ljIDeR6Kl/sIEhlMjRZO8cUwCiVsGViaIOG5lW8EkRR1by9D9a4C
         B2lA==
X-Gm-Message-State: AJIora+XQH0ltZDZxjxgofKpUQVMqpYBPNuTGXIxqmy4K1e9Er4Sa9Kq
        1g25Eu7eKeIRcTB+T/NuVFQg9fY77g==
X-Google-Smtp-Source: AGRyM1uWyWFrVjg/TpmfwgXwsCHPQyhcSjeLDUyhDCbl5dRRSHij3/u/aWy2T2xwUXZRTBnRZ4rLMg==
X-Received: by 2002:a92:c54a:0:b0:2d9:5495:5caa with SMTP id a10-20020a92c54a000000b002d954955caamr6849334ilj.270.1656627910561;
        Thu, 30 Jun 2022 15:25:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j23-20020a056e02219700b002d10dc367a1sm8397736ila.49.2022.06.30.15.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 15:25:10 -0700 (PDT)
Received: (nullmailer pid 3433399 invoked by uid 1000);
        Thu, 30 Jun 2022 22:25:08 -0000
Date:   Thu, 30 Jun 2022 16:25:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     devicetree@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: renesas: Add DT bindings
 for RZ/V2M pinctrl
Message-ID: <20220630222508.GA3433338-robh@kernel.org>
References: <20220624084833.22605-1-phil.edworthy@renesas.com>
 <20220624084833.22605-2-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624084833.22605-2-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 24 Jun 2022 09:48:32 +0100, Phil Edworthy wrote:
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
> ---
>  .../pinctrl/renesas,rzv2m-pinctrl.yaml        | 170 ++++++++++++++++++
>  include/dt-bindings/pinctrl/rzv2m-pinctrl.h   |  23 +++
>  2 files changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/rzv2m-pinctrl.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
