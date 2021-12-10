Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7092470255
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 15:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239203AbhLJOGg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 09:06:36 -0500
Received: from mail-oi1-f175.google.com ([209.85.167.175]:42999 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239260AbhLJOGg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 09:06:36 -0500
Received: by mail-oi1-f175.google.com with SMTP id n66so13312778oia.9;
        Fri, 10 Dec 2021 06:03:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=yERcZG0LYZMGlslnxe6v1+iJXRzLWJCmIMN6Bxt3k18=;
        b=dRbbVitx3qe69y1xQS5gBMRbdeMDWXEsHywwbjIvO9A/ZTlpyNGea5HWXjJTeSrJGc
         wrl+ylBzH1J1116X0g+Mz49MO924q+6TdFmcm5AGzseMAJFrgiKW/0GbW3VAjUEht6uH
         6nBrvncyV1mh6/90+sXNww+6GmzVd0dvcP/W0/0EFDz4bPu28/Mn714vAymcW5RjBcSk
         rYaYI+nkFSOEfWYPtGOSyTHU+U4E7mHLpRRKozSs6GMc7IFi1Wkp1e8mWjKYF8Hd6ms8
         GhuRFRmcLo73Zg4Wi8OQtrZEIimP4n1YXA5TvbghZw9f5Em0BYacdSy2hrX8z8I10StC
         6nRA==
X-Gm-Message-State: AOAM532JHWGzkrG7BUuE7hQmOHoHfXGw0IsWz/6VeE9hKlKpbAwr8C2T
        lQztkGz1kf/NZVMtwmpUXw==
X-Google-Smtp-Source: ABdhPJwza5Xh7FjwPl3bUzlD3XI4unHXX0Rpc+dEnENgFFOxb0gtCfEVpj1oA58lBte6xxH8FCh5RQ==
X-Received: by 2002:aca:ab84:: with SMTP id u126mr12182021oie.41.1639144979805;
        Fri, 10 Dec 2021 06:02:59 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a5sm532423otd.74.2021.12.10.06.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 06:02:59 -0800 (PST)
Received: (nullmailer pid 1252253 invoked by uid 1000);
        Fri, 10 Dec 2021 14:02:56 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     linux-gpio@vger.kernel.org,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Andy Shevchenko <andy.shevchenko@gmail.com>
In-Reply-To: <20211210114222.26581-3-zajec5@gmail.com>
References: <20211210114222.26581-1-zajec5@gmail.com> <20211210114222.26581-3-zajec5@gmail.com>
Subject: Re: [PATCH V3 2/2] dt-bindings: pinctrl: brcm,ns-pinmux: describe pins, groups & functions
Date:   Fri, 10 Dec 2021 08:02:56 -0600
Message-Id: <1639144976.220651.1252252.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 10 Dec 2021 12:42:22 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Use and extend generic pinctrl binding to include info about pins,
> groups & functions.
> 
> Northstar platform pins have numbers assigned to them (they are needed
> for mux programming) so add a custom "number" property for that.
> 
> Extend example to provide a complete binding of a single / random
> function.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 38 ++++++++++++++++++-
>  1 file changed, 37 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml: 'additionalProperties' is a required property
	hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
schemas/pinctrl/brcm,ns-pinmux.yaml: ignoring, error in schema: 
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

See https://patchwork.ozlabs.org/patch/1566458

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

