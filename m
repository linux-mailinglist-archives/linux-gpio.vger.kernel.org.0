Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591A238F330
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 20:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbhEXSrw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 14:47:52 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:35746 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232746AbhEXSrw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 14:47:52 -0400
Received: by mail-ot1-f47.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so26164544otg.2;
        Mon, 24 May 2021 11:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=zUHC5bIhrZ72gMSo4YDUSPpMzPen1n8QrM3EpHdTPCU=;
        b=ZN9WSq4Ga2k7jF584kZKj3f1EySb3V/oP5BiP5nd01ZSTOTOQ6kkWuxTWniEEt5R2N
         TpsCnKeESFlrCcshNYGi1BO4yXN1ziwKvU/M1ZA7N9h0zV1G/boDMiM2igfMKMMqIFP9
         v3oYN3cAyG7F4wHwnCDB9CTl7yJ7LehoX7ZfUvTBEV0WJTehYAXhkpFeuUd98EChnf4K
         OUjoIFyIdYrlvDhRZB5iF6DfQ63QlGo779SABpc7whQhZFJB6FNkZkBP0hy05V7t2c/x
         9++OIgaRt/b4CsFzg2wAA6hM0uqRIz4Bnzm+37nl1rAXtVxS3VeT7acPuec1crjoT0Qa
         +4eQ==
X-Gm-Message-State: AOAM530sTyNhrgJFJQnF8zYRsLMi+o+jn9MYqrMS+8/wdAB0RtJ/meX9
        4HdKbIzuSGkgj1etWr6F7Q==
X-Google-Smtp-Source: ABdhPJxdAi4fhbZzkOm6+CuFnI7z6/7DvcD5YO0qHwvEi3e5MRZ55z5rLH5D3pwhDjCNUsZ/1ZsHdQ==
X-Received: by 2002:a05:6830:1042:: with SMTP id b2mr19873646otp.120.1621881982575;
        Mon, 24 May 2021 11:46:22 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 77sm3178951otc.54.2021.05.24.11.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 11:46:21 -0700 (PDT)
Received: (nullmailer pid 437764 invoked by uid 1000);
        Mon, 24 May 2021 18:46:20 -0000
From:   Rob Herring <robh@kernel.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        konrad.dybcio@somainline.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>, marijn.suijten@somainline.org,
        angelogioacchino.delregno@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20210523204415.703081-1-martin.botka@somainline.org>
References: <20210523204415.703081-1-martin.botka@somainline.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: sm6125: Document SM6125 pinctrl driver
Date:   Mon, 24 May 2021 13:46:20 -0500
Message-Id: <1621881980.447955.437763.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 23 May 2021 22:44:13 +0200, Martin Botka wrote:
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
>  .../bindings/pinctrl/qcom,sm6125-pinctrl.yaml | 161 ++++++++++++++++++
>  1 file changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml:122:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 421, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 109, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 848, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a block scalar
  in "<unicode string>", line 120, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 122, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml:  while scanning a block scalar
  in "<unicode string>", line 120, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 122, column 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
make: *** [Makefile:1416: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1482519

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

