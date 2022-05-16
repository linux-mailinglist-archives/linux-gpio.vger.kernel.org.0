Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B91B52879F
	for <lists+linux-gpio@lfdr.de>; Mon, 16 May 2022 16:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236733AbiEPOxI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 May 2022 10:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233556AbiEPOxH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 May 2022 10:53:07 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE3432EDC
        for <linux-gpio@vger.kernel.org>; Mon, 16 May 2022 07:53:06 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id k30so8192588wrd.5
        for <linux-gpio@vger.kernel.org>; Mon, 16 May 2022 07:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=F/0hxZ3FdeGCwd9gwk7c1gJBeXuAJpYrwcp/nOSul0s=;
        b=LAKUAusdr95I4Vg37q15yh+zxPz/mCMHcqIG3FGhYvOJJr80PI/jPAJTLRDLOVAwEV
         PV4XzPXvu+Is+eVchVPMYv1upVAXGgJQ2AA9Sei3S+FZaAJMQ2ek/2DrmVa6sZhDm3CI
         BkPoc2DhJ8JoISCODmyFcF7q/Z0BtJb9thUvTSNmJGYKvpiymOjoVrdVMY9TMSNnIrIB
         fcU62gKkBcwmEo5SxIuhZCdt/H4IXjjf/DPHv/hT7qxCi1bSA2Qn+XjqgRqhW2EjAWQw
         NSBN3Q5ettLX7uUS8YVChOJrEUbA/9XOwOOTGDhBOap9wNxl8qv2tsghZfwGs+AEC3di
         SrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F/0hxZ3FdeGCwd9gwk7c1gJBeXuAJpYrwcp/nOSul0s=;
        b=Rl96fcjK9kagA+gE647sNS6Yb9NYlaAdKVGDnXqM1EXKnfdFqnQiivw8e2+RZYAbmO
         efAI+2N2MRrhjZOTQn/YuzOamA5MAKOE3o5FyfCcagHFaFx9LMH3QXM8iR3pKA2BUpYo
         1P98tMIlo/1rRZN35+/dWESCsBFNosbW2qUZLLWMXmcLDHTrpFFXDwjNOTM/4tq4wpP6
         bXb9kXAwRVNzhD0FGsiNakuuwnDvsKC2wFAhTqgtzLcTl1yrCyGoH3oWlfNYnE5pOwfF
         ScNeL2tn8xB9IHSu+mhrJojomaCQjFYWe1WVzz21Nkk0B8LFHFXlsBH4gt3pxwcUr7cG
         jTDA==
X-Gm-Message-State: AOAM530HbBwhcLZVLgY6J5yVDqwypcbT3gUQJOnp+4o7LtYnfDyezN/o
        grf2tXfPUZU3vLY88ZG8EyJzUnANtsHbK8bf09trZw==
X-Google-Smtp-Source: ABdhPJzElNcloeF64fOP/Kb2aO6HlOLZaVTJaip5RDigdZ9nvc7rW9rIU7lDL2m19Kia0+gDSzkJpANVRfrB4n3EisQ=
X-Received: by 2002:adf:d1cf:0:b0:20c:6030:d6f0 with SMTP id
 b15-20020adfd1cf000000b0020c6030d6f0mr14866687wrd.298.1652712784587; Mon, 16
 May 2022 07:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <4b9db94cdd8ca106feee53f76fab2a23721f7d2a.1634290039.git.michal.simek@xilinx.com>
In-Reply-To: <4b9db94cdd8ca106feee53f76fab2a23721f7d2a.1634290039.git.michal.simek@xilinx.com>
From:   Michal Simek <monstr@monstr.eu>
Date:   Mon, 16 May 2022 16:52:53 +0200
Message-ID: <CAHTX3dLAwT7BFZPg1zinhDnvsZmadpsdSHQZHpsTg5=06MMgnw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: zynq: Describe gpio-line-names
To:     LKML <linux-kernel@vger.kernel.org>,
        Michal Simek <monstr@monstr.eu>, git <git@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

p=C3=A1 15. 10. 2021 v 11:27 odes=C3=ADlatel Michal Simek
<michal.simek@xilinx.com> napsal:
>
> Number of lines depends on compatible string from 58 to 174.
> That's why it is checked based on it.
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>
>  .../devicetree/bindings/gpio/gpio-zynq.yaml   | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Docu=
mentation/devicetree/bindings/gpio/gpio-zynq.yaml
> index da95b951c23e..29c27eadbac8 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
> @@ -28,6 +28,11 @@ properties:
>
>    gpio-controller: true
>
> +  gpio-line-names:
> +    description: strings describing the names of each gpio line
> +    minItems: 58
> +    maxItems: 174
> +
>    interrupt-controller: true
>
>    "#interrupt-cells":
> @@ -39,6 +44,51 @@ properties:
>    power-domains:
>      maxItems: 1
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - xlnx,zynqmp-gpio-1.0
> +    then:
> +      properties:
> +        gpio-line-names:
> +          minItems: 174
> +          maxItems: 174
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - xlnx,zynq-gpio-1.0
> +    then:
> +      properties:
> +        gpio-line-names:
> +          minItems: 118
> +          maxItems: 118
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - xlnx,versal-gpio-1.0
> +    then:
> +      properties:
> +        gpio-line-names:
> +          minItems: 58
> +          maxItems: 58
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - xlnx,pmc-gpio-1.0
> +    then:
> +      properties:
> +        gpio-line-names:
> +          minItems: 116
> +          maxItems: 116
> +
>  required:
>    - compatible
>    - reg
> --
> 2.33.1
>

Applied.
M

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
