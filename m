Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C809F6FDE15
	for <lists+linux-gpio@lfdr.de>; Wed, 10 May 2023 14:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236925AbjEJMsn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 May 2023 08:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236617AbjEJMsm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 May 2023 08:48:42 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D77D65BD
        for <linux-gpio@vger.kernel.org>; Wed, 10 May 2023 05:48:40 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50bc0ced1d9so10786318a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 May 2023 05:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683722919; x=1686314919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NTb3PFqZjRywOvCruaTWXhoZpVjyn+1Cf6fGgu1FyAA=;
        b=VMwvLylU7oHixR+Vw7boud6qkZdq99f7ytTvREQcW2PAcYSHJpEdwJmd9RN852zY4E
         1nTtLoJAcHrxi8QZm97lUota5mrfeEEQQSeaVaNlsR9k/ca4euKz1GkUftrdvLYE/9K7
         G2IIgzKq4mEKQ8p52/rFs3hPL169BqFeV++ICeLX02HIqh20vIAIaOetw9CvXjaU8EgF
         j+CFLO6njGI18REzulX+qsuC+UBSUwfA4NgTTxt2rhwkEdiM3aL+VzlNCJ9PAzLRh1E8
         mIQY/uRsrGmGbuea82e+6VjalOszkIkevhRkXXvZtf+K5Nwa1HH53Bqqb87C90T7KJtC
         +YeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683722919; x=1686314919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTb3PFqZjRywOvCruaTWXhoZpVjyn+1Cf6fGgu1FyAA=;
        b=RtdLuVo1DRNTI8v6NFRjNNNj7KmslF9hXlWzPTXrIlsCBDbytjM7WwhgNBWMcQEmp5
         tHeGX1yM1xki0nasXA1X4SVpjCIb7bE2vuIaUagJl483dBYXtLmahpdW/gxuCnmKx1M/
         5NoYMpS30i5RAX5+Nyt6IpVXTViTa8geBlH1goGqqa0j41DM63ZnXg0wf7CGPewOQ6cQ
         NegaGDh6cogAW5rTm+5YfJs2xTs2faGbaQ9vf6/g4vx6cp1OKZi2xj8sSY/lsx+fKNCO
         D97+tb8DJ8IdGOk+5Z+kuJCXZHyKUmIKq68Px4Erk7ueKuUf3oNXpmsDYE0ud3X3Xmmu
         5nAw==
X-Gm-Message-State: AC+VfDyKisZqtSwc0pumAihPcezLTVB/Z1lOWRiUUoAwhjHNRmlWEipo
        JHCdvuKOCbWQVHNijML6KC16bQ==
X-Google-Smtp-Source: ACHHUZ5zs4uO98cPUCdsu7HaNKzqF2WWD5nkbIVuD12iDI8wUC2Ut0meoqoO0vBvWUP451RR8sbmcA==
X-Received: by 2002:a05:6402:182:b0:50d:abde:c7a3 with SMTP id r2-20020a056402018200b0050dabdec7a3mr6932109edv.42.1683722918754;
        Wed, 10 May 2023 05:48:38 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id w23-20020aa7cb57000000b0050b57848b01sm1810482edt.82.2023.05.10.05.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 05:48:38 -0700 (PDT)
Date:   Wed, 10 May 2023 14:48:36 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Nishanth Menon <nm@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: pinctrl: Update pinctrl-single to
 use yaml
Message-ID: <20230510124836.thqtol6qac762ggx@krzk-bin>
References: <20230510095330.30742-1-tony@atomide.com>
 <20230510095330.30742-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230510095330.30742-2-tony@atomide.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 10 May 2023 12:53:29 +0300, Tony Lindgren wrote:
> Update binding for yaml and remove the old related txt bindings. Note that
> we are also adding the undocumented pinctrl-single,slew-rate property. And
> we only use the first example from the old binding.
> 
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> 
> Changes since v3:
> - Fix issues noted by Rob for v2 version that I had missed
> 
> - Categorize patternProperties a bit to make fixing dts files easier
> 
> Changes since v2:
> 
> - Drop old ti,omap-pinctrl.txt in addition to old pinctrl-single.txt
> 
> - Replace reference to pinctrl-single.txt to point to the yaml in ctrl.txt
> 
> Changes since v1:
> 
> - The v1 version was a WIP patch posted as an example in thread
>   "dt binding check error with hash and comma"
> 
> ---
>  .../devicetree/bindings/arm/omap/ctrl.txt     |   2 +-
>  .../bindings/pinctrl/pinctrl-single.txt       | 262 ------------------
>  .../bindings/pinctrl/pinctrl-single.yaml      | 235 ++++++++++++++++
>  .../bindings/pinctrl/ti,omap-pinctrl.txt      |  13 -
>  4 files changed, 236 insertions(+), 276 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/ti,omap-pinctrl.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml: patternProperties: 'i2c1-pmx-func' does not match '[\\^$()*@]'
	hint: Fixed strings belong in 'properties', not 'patternProperties'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml: patternProperties: '_pmx_func|_pmx_idle|_cfg_func|_cfg_idle|gpio_key_func' does not match '[\\^$()*@]'
	hint: Fixed strings belong in 'properties', not 'patternProperties'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml: patternProperties: 'cpsw_default|cpsw_sleep|davinci_mdio_default|davinci_mdio_sleep' does not match '[\\^$()*@]'
	hint: Fixed strings belong in 'properties', not 'patternProperties'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml: patternProperties: 'usb1_drvvbus|usb_hub_ctrl|usb2_phy' does not match '[\\^$()*@]'
	hint: Fixed strings belong in 'properties', not 'patternProperties'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml: patternProperties: 'gpio_keys_s0|matrix_keypad_default|matrix_keypad_sleep|matrix_keypad_s0' does not match '[\\^$()*@]'
	hint: Fixed strings belong in 'properties', not 'patternProperties'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml: patternProperties: 'user_leds_s0|gpio_led_pmx' does not match '[\\^$()*@]'
	hint: Fixed strings belong in 'properties', not 'patternProperties'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml: patternProperties: 'nand_flash_x8' does not match '[\\^$()*@]'
	hint: Fixed strings belong in 'properties', not 'patternProperties'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: #pinctrl-cells: [[2]] is not of type 'object'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: #pinctrl-cells: [[2]] is not of type 'object'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,register-width: [[16]] is not of type 'object'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,register-width: [[16]] is not of type 'object'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,function-mask: [[65535]] is not of type 'object'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,function-mask: [[65535]] is not of type 'object'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,gpio-range: [[1, 0, 3, 0]] is not of type 'object'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.example.dtb: pinmux@4a100040: pinctrl-single,gpio-range: [[1, 0, 3, 0]] is not of type 'object'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml

See https://patchwork.ozlabs.org/patch/1779341

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
