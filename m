Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B119D50E8E8
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Apr 2022 20:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237656AbiDYS60 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Apr 2022 14:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244731AbiDYS5a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Apr 2022 14:57:30 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08ECECD33A
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 11:54:25 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id k23so31455349ejd.3
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 11:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HWkRDQJwMPlR19wYgPWzNkV4z1riKbIU1L+c6IyBvKg=;
        b=lF1JmNOWX9Ja9KWsat+tf3cfY25xezlLRLC7mGeCe9/40bk6BQBEsjZjW9xwRmPCP1
         8tii9cpMQHMQO48lpGeHlRPGSuRdz/1Z76IG45t77exBvY/KO96xA82PZgX0NVrX8QZB
         0QrIxx3xQ4oQS3R8ytYiA5FBT2CLW8F/P8WdZR9CbctqlZZw1bqG2wO9j7NJyOy1YIyo
         tdsNT4vTepS0SFFYgKGUISsThaziqHzM3z7J+NXkCAZEZ89rN2+SNA1DOrPuB8AOzC3l
         R9KYHkLaKf/sobq/2vHIARBeVrbBL2so6wm/Sy77mdfqFH+3kUhr6YLdaTYjgs5P0PYa
         VjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HWkRDQJwMPlR19wYgPWzNkV4z1riKbIU1L+c6IyBvKg=;
        b=IXkEs0k6+ierhx+N4/VwzaiJhw1BIJ8hmBymkj1+9/2KInUoyw2ZpGCmP4Tq2xd9GX
         yrUYe7LMdLam7VgbzVH0/cOGQnkDdqMz5TyUKumcMWCjBrvcektkb1XyDCL5bh44kk7k
         V3ZoX2Sd1tTMSVK6XeOeU3/GY6lbyhKiydpDKf9Cp8n20vnWDKaUWGBPtl7IREbmLO8U
         ILOCbwMIUAOXwJqKo5O7CTJlHb8tybrFGF00sTrs/vujlP+nAejnqVdVD3rSf5iZwkut
         84YoR8o4Xk8gYS4vk8ZzpT8ObXBPLJzQkdb4G4nD0nPV4B2DE/LBfJtf1B5OPVNctKoy
         0/1A==
X-Gm-Message-State: AOAM533Rv/lXYo8Q6b81DWEziib+bbImAQ/QSyOMSEirol0y9hrdhXau
        ZfSRDTThJEbW376O5VJz3XCRJ5FjIAmHRqB6ptDE6Q==
X-Google-Smtp-Source: ABdhPJxi/Fir6KRp+xFbi2zKLAqREypE5RELrBklhwSwvtecFh1/ffYTT07TB8BSuve6uqIUojMg1JBeeJdpj0F7J/Y=
X-Received: by 2002:a17:906:1841:b0:6e8:872d:8999 with SMTP id
 w1-20020a170906184100b006e8872d8999mr17408232eje.492.1650912863652; Mon, 25
 Apr 2022 11:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220425184631.684906-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425184631.684906-1-krzysztof.kozlowski@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 25 Apr 2022 20:54:13 +0200
Message-ID: <CAMRc=McwGpZU7FJ8v_OXkkx6Sdh_As3z7zZR=UaSHtO=Qm9eDQ@mail.gmail.com>
Subject: Re: [RESENT PATCH v3] dt-bindings: gpio: add common consumer GPIO lines
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 25, 2022 at 8:46 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Typical GPIO lines like enable, powerdown, reset or wakeup are not
> documented as common, which leads to new variations of these (e.g.
> pwdn-gpios).  Add a common schema which serves also as a documentation
> for preferred naming.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
>
> ---
>
> Reason for resend:
> ==================
> Previously patch was on hold because richtek,rt4801 bindings were using
> two GPIOs in "enable-gpios", so this schema would complain.  This was
> resolved here:
> https://lore.kernel.org/all/165089886500.211842.728549769223794277.b4-ty@kernel.org/
>
> Changes since v2:
> ==================
> 1. Correct my email address.
> 2. Add Rob's review.
>
> Changes since v1:
> ==================
> 1. Select-true, add maxItems and description for each entry (Rob).
> 2. Mention ACTIVE_LOW in bindings description (Linus).
> 3. Add allOf for pwrseq reset-gpios case.
> ---
>  .../bindings/gpio/gpio-consumer-common.yaml   | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-consumer-common.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-consumer-common.yaml b/Documentation/devicetree/bindings/gpio/gpio-consumer-common.yaml
> new file mode 100644
> index 000000000000..40d0be31e200
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-consumer-common.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-consumer-common.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common GPIO lines
> +
> +maintainers:
> +  - Bartosz Golaszewski <brgl@bgdev.pl>
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description:
> +  Pay attention to using proper GPIO flag (e.g. GPIO_ACTIVE_LOW) for the GPIOs
> +  using inverted signal (e.g. RESETN).
> +
> +select: true
> +
> +properties:
> +  enable-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO connected to the enable control pin.
> +
> +  reset-gpios:
> +    description:
> +      GPIO (or GPIOs for power sequence) connected to the device reset pin
> +      (e.g. RESET or RESETN).
> +
> +  powerdown-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO connected to the power down pin (hardware power down or power cut,
> +      e.g. PD or PWDN).
> +
> +  pwdn-gpios:
> +    maxItems: 1
> +    description: Use powerdown-gpios
> +    deprecated: true
> +
> +  wakeup-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO connected to the pin waking up the device from suspend or other
> +      power-saving modes.
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mmc-pwrseq-simple
> +    then:
> +      properties:
> +        reset-gpios:
> +          minItems: 1
> +          maxItems: 32
> +    else:
> +      properties:
> +        reset-gpios:
> +          maxItems: 1
> +
> +additionalProperties: true
> --
> 2.32.0
>

Applied, thanks!

Bart
