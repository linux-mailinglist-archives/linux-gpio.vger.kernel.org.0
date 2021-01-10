Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3DE2F08A0
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Jan 2021 18:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbhAJRTf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 10 Jan 2021 12:19:35 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:36562 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbhAJRTd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 10 Jan 2021 12:19:33 -0500
Received: by mail-oi1-f176.google.com with SMTP id 9so17703953oiq.3;
        Sun, 10 Jan 2021 09:19:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=gGLZSHHlGA1PUUYqmOxNID2/4S4mZUn+8nzQlPpNCuA=;
        b=hkfz1/IOfwdhFP/6RWe6Ju2Zt9Yn7ZdtLvlyIBNJrIc6sf8litNdHJ+gyI4btIvGHE
         zP0O08L29YT0GtvO+PGFh+6DlX+0lhV/8EyVMJbgtmdSnmyLCE97rQc8JGq3lkEQZmCD
         0hFrCrldxCc2PPHH3OMh3+WRRK5ZDFH42+YZ6NPaT24XafEXtiK5bm3t5rKB5AXxZAf/
         RK0lCf/+P2QW6YSulTydY0G6UWL6i6FVLgY8Waft+dTo/hrLL5kXkYABtP7hR1Ig9vI0
         zz8M3TrBcnuxa1TIhVG3JpuWNheG5aCDFtWOi855SXmapMJZMdr0x2xrewEnf2Mui9sD
         Kr0w==
X-Gm-Message-State: AOAM530QOhtni0NlS+sDkAuzKNP6zfLPNcq3zHW9BgK0IAm9KxQhi12B
        E3YeCK304f2ic+xYaXUxbg==
X-Google-Smtp-Source: ABdhPJyQrkmoBVKuplZ3vDcBNz2G3gF2OijsJ1+7LAIA/WCgpI94hj1rsqSLFXCbwri5tVWbkmB65Q==
X-Received: by 2002:aca:ab8c:: with SMTP id u134mr8468312oie.15.1610299131979;
        Sun, 10 Jan 2021 09:18:51 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 63sm3042386otx.2.2021.01.10.09.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 09:18:51 -0800 (PST)
Received: (nullmailer pid 785281 invoked by uid 1000);
        Sun, 10 Jan 2021 17:18:46 -0000
From:   Rob Herring <robh@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        martin.botka@somainline.org, marijn.suijten@somainline.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        linux-gpio@vger.kernel.org
In-Reply-To: <20210109140204.151340-3-angelogioacchino.delregno@somainline.org>
References: <20210109140204.151340-1-angelogioacchino.delregno@somainline.org> <20210109140204.151340-3-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: Add bindings for Awinic AW9523/AW9523B
Date:   Sun, 10 Jan 2021 11:18:46 -0600
Message-Id: <1610299126.040526.785280.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 09 Jan 2021 15:02:04 +0100, AngeloGioacchino Del Regno wrote:
> Add bindings for the Awinic AW9523/AW9523B I2C GPIO Expander driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  .../pinctrl/awinic,aw9523-pinctrl.yaml        | 111 ++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml:102:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml:  while scanning a block scalar
  in "<unicode string>", line 94, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 102, column 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.yaml
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 848, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a block scalar
  in "<unicode string>", line 94, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 102, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.example.dts] Error 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/pinctrl/awinic,aw9523-pinctrl.example.dts'
make: *** [Makefile:1370: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1424120

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

