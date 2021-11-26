Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2C745E3ED
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 02:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbhKZBUC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 20:20:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243951AbhKZBSC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 20:18:02 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9715FC061748
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 17:14:50 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso11783683otr.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 17:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mHC9ppagTm7NImXiQs+2uZpgzdRA1KRSenhFtTzEGb4=;
        b=tuOzZ5S+mCLY/AGkCNfNfTvDGpzt/VA7ynFdgPalTQZo/p2a0jtutBdjGcuJFQPFWO
         91ymrNALmy2Bk8eXeWyislh+OsjZVedjgKdhsoRWWsPE39sw4gmyIXvtzRhxmQWXmm5/
         jqKOR+CQJdkw5ZVNbUktrzXGH2Beo4LjHk02yJiPzXK4Kiz+zDOs4gDfZ1qdM9VbFUzr
         86WwB+GsugP+UfTtDl8cp74pG9/Uj3gQ4bmyWhurUynwuPQ5hhY85MHD6nc+8PTImgC4
         eNKl0BxZuP5quLcA3Zq2vQncqQjIyKa/BLXXoOaCDd4tHAcz2rTG+vRGv0bDy0agxofX
         1f1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mHC9ppagTm7NImXiQs+2uZpgzdRA1KRSenhFtTzEGb4=;
        b=Bt+XmWT9lSkBxMz68IBir2siJ3fNlb3+InnBad1dkz+WAtpvgrHvslmWewtL7TA5my
         H9erru9avVivOldazrvSvc86XBRg2K1kwK2wE22d2xZmXsF9pgkvEa5IN17xBJwFCav2
         80Lr3P8kCQwiAgT8ELzsTlymVQ9XbVeRNrd/bJwco+qG6D/chO62wrs0OmKA17Oz/F8Z
         tV4rocUoo7jmVCZooNr7kUPOeXRwVAhLkH6alJA4lkH7k/+2Bl5ahsHHTC5LD9PgI9FG
         qtfhXzLgstJsT2UzXapVqEAJzlJ5M08CMZdatgetzyQOdNbVpRt91dtbfKI1bCmivSKh
         4d2Q==
X-Gm-Message-State: AOAM532ufyNuI15BjpvWYeA8aB7PSHjbnevSJNoOz+xl9ZoU3a7ZiBcT
        xO0qF7QMNlMcAfQpH0VB/5hETj/fqxbdhfYTPWRczQ==
X-Google-Smtp-Source: ABdhPJzKMXqySnntDR1x0DX+w3CHJ4WW1btKlW2suMdV3Yxh6M4KwRmE179J94pvhVuCM7pYOZZPp8KV3lcO6NEJ5Ro=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr25991905otg.179.1637889289852;
 Thu, 25 Nov 2021 17:14:49 -0800 (PST)
MIME-Version: 1.0
References: <1637834276-10466-1-git-send-email-sugaya.taichi@socionext.com> <1637834276-10466-3-git-send-email-sugaya.taichi@socionext.com>
In-Reply-To: <1637834276-10466-3-git-send-email-sugaya.taichi@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Nov 2021 02:14:38 +0100
Message-ID: <CACRpkdbgMMKJwS0cUi3D2swHYbbBH6ofSeOhyXy6qiMFrU5a8Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: pinctrl: add bindings for Milbeaut
 pin controller
To:     Sugaya Taichi <sugaya.taichi@socionext.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        orito.takao@socionext.com,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 10:58 AM Sugaya Taichi
<sugaya.taichi@socionext.com> wrote:

> Add Device Tree bindings documentation for pin controller of
> the Milbeaut SoCs.
>
> Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>

What is weird about this binding is what is not there:
this is just GPIO, where are the pin mux and config
nodes? The driver surely tries to use them.

Please use the existing standard bindings for functions
and groups etc, check the other bindings.

Yours,
Linus Walleij

> ---
>  .../pinctrl/socionext,milbeaut-pinctrl.yaml        | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/socionext,milbeaut-pinctrl.yaml
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/socionext,milbeaut-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/socionext,milbeaut-pinctrl.yaml
> new file mode 100644
> index 0000000..78bc2d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/socionext,milbeaut-pinctrl.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/socionext,milbeaut-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Milbeaut SoCs pin controller
> +
> +maintainers:
> +  - Taichi Sugaya <sugaya.taichi@socionext.com>
> +
> +description: |
> +  Bindings for memory-mapped pin controller of the Milbeaut SoCs.
> +
> +properties:
> +  $nodename:
> +    pattern: "pinctrl"
> +
> +  compatible:
> +    enum:
> +      - socionext,milbeaut-m10v-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    const: "pinctrl"
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pinctrl: pinctrl@1d022000 {
> +        compatible = "socionext,milbeaut-m10v-pinctrl";
> +        reg = <0x1d022000 0x1000>;
> +        reg-names = "pinctrl";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +    };
> --
> 2.7.4
>
