Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D50438F507
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 23:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbhEXVlI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 17:41:08 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:36584 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232746AbhEXVlI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 17:41:08 -0400
Received: by mail-oi1-f179.google.com with SMTP id t24so12873260oiw.3;
        Mon, 24 May 2021 14:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=8EGEl7TG/OkXyYvTFTnYpNtZYItc7Ibtk58MX5Yvvac=;
        b=EsuUyQrWCFBLodvFUzvoPrOj0eR2zhrlYHq9TQ5Jj8+223iNt+kSiCBN4A96N8cxwM
         /TwhVNKC6NmcubA2PI6gREnWkU8pFwNQ6NtcTdPvOT8ydjeBK3gWvPHJWolzI+JfXmuM
         AIsqT/IFkL9p6aeNuxq+Mq3uPC5I49PjdUUCVGTLwDvi4RAP6QrWI+aY/NSWb6m0a6WW
         PwO6n5JYVHJidxiedbiLDO9F8l6LM4pbN3XbGoWwGAcrbZZK3Q6JWkBYz9CNalw6xzTH
         NuEeEGvYibMJJoe2b70SNng0kTit/2qfvhjzAo9C3RwLEodW2Ei8Qvx2QigDU7zlyKnR
         ov+Q==
X-Gm-Message-State: AOAM533vRXfySb66dT+ZfBTFFBC7cteOc+e67N7pXOaolSXDxu1zn917
        0xZl3jweCYVNh3ctNTc+kQ==
X-Google-Smtp-Source: ABdhPJwYW1PGk1nOYYfJL+LLY33B9ICBMmggB/IFaQAFndprOIMUrK3hAiyVrJgxuHcyXB+e5yOfsw==
X-Received: by 2002:aca:4a8b:: with SMTP id x133mr12455802oia.124.1621892379373;
        Mon, 24 May 2021 14:39:39 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w6sm3359352otj.5.2021.05.24.14.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 14:39:38 -0700 (PDT)
Received: (nullmailer pid 1190597 invoked by uid 1000);
        Mon, 24 May 2021 21:39:35 -0000
From:   Rob Herring <robh@kernel.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     marijn.suijten@somainline.org, konrad.dybcio@somainline.org,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        angelogioacchino.delregno@somainline.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20210523211809.734107-1-martin.botka@somainline.org>
References: <20210523211809.734107-1-martin.botka@somainline.org>
Subject: Re: [PATCH V2 1/2] dt-bindings: pinctrl: qcom: sm6125: Document SM6125 pinctrl driver
Date:   Mon, 24 May 2021 16:39:35 -0500
Message-Id: <1621892375.422017.1190596.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 23 May 2021 23:18:06 +0200, Martin Botka wrote:
> Document the newly added SM6125 pinctrl driver
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in V2:
> Add commit description
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

See https://patchwork.ozlabs.org/patch/1482532

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

