Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1935B45E26C
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 22:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244626AbhKYVbV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 16:31:21 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:38481 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236079AbhKYV3U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 16:29:20 -0500
Received: by mail-ot1-f53.google.com with SMTP id n104-20020a9d2071000000b005799790cf0bso11188494ota.5;
        Thu, 25 Nov 2021 13:26:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=lUnyMTneWGU7NFF/n4I3ZqSOv0nJuV1tmx8TUG2ODpA=;
        b=xtmvXvs3NSNg33CiAO5o4bYwxaGwIuGbRkNJIaAxmZGgsXgPjd8FwzddLrE+iEbdj1
         ziSfQiWFnCTPENFBe9BZKeg/+snT+P81zjq6qRZZ0kLNr2PcOdGepW749/9jaHqhIySa
         VclNvz2fiTSp06gB/EtBVNzz2f95mff/75t1JOrN/gjI9x5NmrHbBRV1wKjKJe572XcD
         536R2dgJcDh/dzEzjemK3KOY225djIIAjZ9mPw+k1yAzSNvRoBIZlQcK+i5Df7lTe1qY
         A2a5EH+0MK4Vf4zUcIVY7h5X4CyauQspNyw1K1sHkuDMXFgGB4hD4xj7kgstM0rn88TA
         SpNA==
X-Gm-Message-State: AOAM533+C4Su6yPXZyi/GHJ3v/efGM0ctGpWIbCc5qwtsvnnb2wziMdC
        gO0FGyILoC/MTI9jnE2ncg==
X-Google-Smtp-Source: ABdhPJy/992h9axX9rH2fCCB+RWkGA9fZZ39JA97KxQsE/4xWFvJLOpkTwRr2V1SomuUtwM8AuoEZA==
X-Received: by 2002:a9d:7e84:: with SMTP id m4mr23853157otp.102.1637875568579;
        Thu, 25 Nov 2021 13:26:08 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o14sm681509ote.41.2021.11.25.13.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 13:26:07 -0800 (PST)
Received: (nullmailer pid 2858313 invoked by uid 1000);
        Thu, 25 Nov 2021 21:26:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20211124230439.17531-3-zajec5@gmail.com>
References: <20211124230439.17531-1-zajec5@gmail.com> <20211124230439.17531-3-zajec5@gmail.com>
Subject: Re: [PATCH V2 2/6] dt-bindings: pinctrl: brcm,ns-pinmux: extend example
Date:   Thu, 25 Nov 2021 14:26:02 -0700
Message-Id: <1637875562.296357.2858312.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 25 Nov 2021 00:04:35 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> pinctrl bindings allow specifying pins, groups & functions now. Put some
> entries in binding example to help writing DTS files.
> 
> Specify pins, groups & functions in the example.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Update "pins" to match new binding
> ---
>  .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 24 ++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
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

See https://patchwork.ozlabs.org/patch/1559467

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

