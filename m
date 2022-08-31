Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC8C85A7D98
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 14:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbiHaMkX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 08:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiHaMkT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 08:40:19 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41DCD4DB1A
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 05:40:16 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id se27so20360047ejb.8
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 05:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=a4juxeAAulsXmDrJb36ig59wvWAlzfmtIuDcR0ZWcMU=;
        b=cVvQdejj1xh4k3nxjYSt5s0vZsxpXN2i7pF/rCWGkRd6NPibNRhJi/T4D2DkynEaYx
         QcjG/cIxhl4/6qzg7X7eXjHD4RVNoVqSPvPSjDxijwnxr5mmiQJLl7UIAWf7ct/R4USZ
         y6sVrnyqIeNZMPpfg22hsgcsonH5HBXg249mPi8ZJxmcLLW1tLQIpelOq4DwLHExAgrh
         nj9nlyAUV/AfcOq2TXTeoshWdB/KJ269XkbCeLwKIRo79cEguCOenMVI1Y3U/tZfJwPU
         UY0JdycIpFs47eT2tFz0Vzv23IcWLQQ5KjodRB2m2DLUCJmJY4rBCOAwSwaoMhFJGv5D
         wmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=a4juxeAAulsXmDrJb36ig59wvWAlzfmtIuDcR0ZWcMU=;
        b=q/IrtrGgizQlDTyaH0nLRAX/BZ3ZM3l+NByUDn177I5lr9WFT1CK7eRo+XzOofIT/T
         knfP0JsEPPMpCK7ty9P7crUeK8cMhdWwTEijo+FRFqv6irGRif3BAcd89XGu9MLdBxfm
         6KUs1iNp/cPVRhq9PwV2pxMTNNhdqP2AEq9YAPAYXVhyKf2ot4coBN5rBA6VLevG7djv
         svU37EkIgUEwYuANgTgCRxONup5ReniIqwji7ZSESAd4Kcu0tx4nFZUWwubdlF/SHpKg
         XghV84uG6/dSnWpaC9GNO1EPLldp13YmyORWl7bzTwq46+PTAK1xzXX6chSAM5XGNmeP
         67xQ==
X-Gm-Message-State: ACgBeo0LAYzrBwpPfBLKy6XCAINpmHlINCufkxATMb/8MMyuDBq5WQXg
        w5DLIs091VjRxxGKM0Q1auqBhqd9ROrXdamPLvsFbyKQp3A=
X-Google-Smtp-Source: AA6agR4BiTjPadhITkWlY6Fuohq9FtVy0uscgtHalamLR2uaklr48naucP5D/EiAs2TmQsaDRBmuAdsp/q+qOhJljUI=
X-Received: by 2002:a17:907:7394:b0:73a:d077:9ba1 with SMTP id
 er20-20020a170907739400b0073ad0779ba1mr19414625ejc.697.1661949615282; Wed, 31
 Aug 2022 05:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220825143522.3102546-1-conor.dooley@microchip.com>
In-Reply-To: <20220825143522.3102546-1-conor.dooley@microchip.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 31 Aug 2022 14:40:04 +0200
Message-ID: <CAMRc=MdQkP-Dd0MrJ5DvxKgvyC-1WO+f98t7-ASs3qrNJL+uAw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: gpio: mpfs-gpio: allow parsing of hog
 child nodes.
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 25, 2022 at 4:36 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> The SD card and eMMC on PolarFire SoC are sometimes muxed using a GPIO
> by the bootloader. Add a hog child property to facilitate this.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes since v1:
> - move addtionalProperties up under type:
> - drop the explicit match group syntax
> ---
>  .../bindings/gpio/microchip,mpfs-gpio.yaml     | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> index 110651eafa70..fdc16822fd4b 100644
> --- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
> @@ -44,6 +44,24 @@ properties:
>
>    gpio-controller: true
>
> +patternProperties:
> +  "^.+-hog(-[0-9]+)?$":
> +    type: object
> +
> +    additionalProperties: false
> +
> +    properties:
> +      gpio-hog: true
> +      gpios: true
> +      input: true
> +      output-high: true
> +      output-low: true
> +      line-name: true
> +
> +    required:
> +      - gpio-hog
> +      - gpios
> +
>  required:
>    - compatible
>    - reg
> --
> 2.36.1
>

Applied, thanks!

Bart
