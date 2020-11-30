Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D55E2C89C0
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 17:41:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728586AbgK3QkA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 11:40:00 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:32945 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbgK3QkA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 11:40:00 -0500
Received: by mail-il1-f193.google.com with SMTP id y9so11901624ilb.0;
        Mon, 30 Nov 2020 08:39:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GxbcPm40Z/OfvA3tX+RN9PfY6ghzBrA55YxrDnO7ysY=;
        b=M6lpowL3qpdVRL5koaCCc14/I589CBqNBouWLk7DkXiVeRFnJeQqC8kUn0EThTRfPa
         5Uk4V9IEP4DbTq/iSWClXh+LZgso1a9vNOeXa+UR82tkORmP0mlpB4VYhwGjAw49uiKO
         j1WvdNNgm+1t6ed7ifac83QV9pokgjusQ9KN30LjGJoQxr0ilfPpR7JIVaxhOD9CiYk+
         AyTTGmkGUxoH0guNya7lm7tqsWnr0Z1fj9GzrczIgdsavC2A/tfoY7ktsg0coCAdOLmy
         db3cxGPo3abraxF4/q7LQbHWQ1jUcEIwv+bGSciS+KbkDgFA0P+d5BNrZEY3D1m6Bk9z
         TH/w==
X-Gm-Message-State: AOAM530TSZeGTNdFqwywg6NsDtecmQrG39BcxyoI8oy0wPupQk/nx+gn
        Ta4VVNfvHCKfI3FSvmXP+w==
X-Google-Smtp-Source: ABdhPJzY9MzktBK1OkYtWSDkzwOcRYCFt2VHyLCC7bUEJXijT3EkfPx6av4RZ3T4OMflXGgu5ppcjw==
X-Received: by 2002:a92:607:: with SMTP id x7mr18906592ilg.34.1606754358863;
        Mon, 30 Nov 2020 08:39:18 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id b9sm4311464iok.20.2020.11.30.08.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 08:39:18 -0800 (PST)
Received: (nullmailer pid 2593543 invoked by uid 1000);
        Mon, 30 Nov 2020 16:39:15 -0000
Date:   Mon, 30 Nov 2020 09:39:15 -0700
From:   Rob Herring <robh@kernel.org>
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Sean Anderson <seanga2@gmail.com>,
        linux-clk@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 09/21] dt-bindings: Document canaan,k210-fpioa bindings
Message-ID: <20201130163915.GA2593105@robh.at.kernel.org>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
 <20201124043728.199852-10-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124043728.199852-10-damien.lemoal@wdc.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 24 Nov 2020 13:37:16 +0900, Damien Le Moal wrote:
> Document the device tree bindings for the Canaan Kendryte K210 SoC
> Fully Programmable IO Array (FPIOA) pinctrl driver in
> Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml. The
> new header file include/dt-bindings/pinctrl/k210-fpioa.h is added to
> define all 256 possible pin functions of the SoC IO pins, as well as
> macros simplifying the definition of pin functions in a device tree.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/pinctrl/canaan,k210-fpioa.yaml   | 165 +++++++++++
>  include/dt-bindings/pinctrl/k210-fpioa.h      | 276 ++++++++++++++++++
>  2 files changed, 441 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
>  create mode 100644 include/dt-bindings/pinctrl/k210-fpioa.h
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml:59:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
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
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 731, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a plain scalar
  in "<unicode string>", line 58, column 11
found a tab character that violates indentation
  in "<unicode string>", line 59, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.example.dts] Error 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.example.dts'
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1405241

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

