Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA468456575
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 23:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbhKRWM7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 17:12:59 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:38807 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232161AbhKRWM4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 17:12:56 -0500
Received: by mail-ot1-f49.google.com with SMTP id z2-20020a9d71c2000000b0055c6a7d08b8so13506990otj.5;
        Thu, 18 Nov 2021 14:09:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=PoptMI3B81A8R96xYHYdkAlGrDKa99jlgABV4FHfLeQ=;
        b=aL43Arjko0ir9Av6NARZneQkKS98W70hm1KukAb638X5QmewwkGiQ0JBuJgmufwMKb
         Nb6KfL/VnqTAw83kPQF/wVV1FgpUThs37VTGfZoQ6qtap96rQE07ci/tTTUB0eeAXSXf
         qiEHiQsPtZlpaceMGumjHAQ+XXBxJn260RlpFVzg3FKMuyTLUkBBofg4YpdVSOdDPz+g
         JzTEzB5stNFPujZGfpC5E9MZ43ndElwXfahttcMwcoEefYhai5LMkJyqH+4DK9TtyGvP
         OOQAm1tJd6+Nua3N5AuRw9W7AWonfCVjfx609kIsryVP2kNQJHuvUozYUg6OtIyPTAhZ
         J2gQ==
X-Gm-Message-State: AOAM533gveA8IaVCnifLbBxkPc9gVQ2mMinUdeVICN8BW28TlhnNPSQQ
        2geezla7BwSoyBom9N41xg==
X-Google-Smtp-Source: ABdhPJzS2MhDtYAnKO+WWlnoZwjb3nJiGTBN1bzPMIxk0TXyax3CW/zo0Chgj3GmmOzEas4Q79PK0Q==
X-Received: by 2002:a9d:7f91:: with SMTP id t17mr456686otp.197.1637273395638;
        Thu, 18 Nov 2021 14:09:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r5sm256835oiw.20.2021.11.18.14.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 14:09:55 -0800 (PST)
Received: (nullmailer pid 1841663 invoked by uid 1000);
        Thu, 18 Nov 2021 22:09:54 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20211118132152.15722-3-zajec5@gmail.com>
References: <20211118132152.15722-1-zajec5@gmail.com> <20211118132152.15722-3-zajec5@gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: pinctrl: brcm,ns-pinmux: extend example
Date:   Thu, 18 Nov 2021 16:09:54 -0600
Message-Id: <1637273394.255655.1841662.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 18 Nov 2021 14:21:49 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> pinctrl bindings allow specifying pins, groups & functions now. Put some
> entries in binding example to help writing DTS files.
> 
> Specify pins, groups & functions in the example.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 29 ++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
schemas/pinctrl/brcm,ns-pinmux.yaml: ignoring, error in schema: 
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml: 'additionalProperties' is a required property
	hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.example.dt.yaml:0:0: /example-0/pin-controller@1800c1c0: failed to match any schema with compatible: ['brcm,bcm4708-pinmux']
make[1]: *** Deleting file 'Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml'
schemas/pinctrl/brcm,ns-pinmux.yaml: ignoring, error in schema: 
Traceback (most recent call last):
  File "/usr/local/bin/dt-validate", line 170, in <module>
    sg.check_trees(filename, testtree)
  File "/usr/local/bin/dt-validate", line 119, in check_trees
    self.check_subtree(dt, subtree, False, "/", "/", filename)
  File "/usr/local/bin/dt-validate", line 110, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/bin/dt-validate", line 110, in check_subtree
    self.check_subtree(tree, value, disabled, name, fullname + name, filename)
  File "/usr/local/bin/dt-validate", line 105, in check_subtree
    self.check_node(tree, subtree, disabled, nodename, fullname, filename)
  File "/usr/local/bin/dt-validate", line 49, in check_node
    errors = sorted(dtschema.DTValidator(schema).iter_errors(node), key=lambda e: e.linecol)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 766, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 224, in iter_errors
    for error in errors:
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/_validators.py", line 25, in patternProperties
    yield from validator.descend(
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 240, in descend
    for error in self.evolve(schema=schema).iter_errors(instance):
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 766, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 224, in iter_errors
    for error in errors:
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/_validators.py", line 298, in ref
    yield from validator.descend(instance, resolved)
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 240, in descend
    for error in self.evolve(schema=schema).iter_errors(instance):
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 766, in iter_errors
    for error in super().iter_errors(instance, _schema):
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 214, in iter_errors
    scope = id_of(_schema)
  File "/usr/local/lib/python3.8/dist-packages/jsonschema/validators.py", line 90, in _id_of
    return schema.get("$id", "")
AttributeError: 'NoneType' object has no attribute 'get'
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1556628

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

