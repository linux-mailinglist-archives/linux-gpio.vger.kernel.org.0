Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59197621F54
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 23:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiKHWar (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 17:30:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiKHWaS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 17:30:18 -0500
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E6F1007;
        Tue,  8 Nov 2022 14:30:10 -0800 (PST)
Received: by mail-ot1-f50.google.com with SMTP id r13-20020a056830418d00b0065601df69c0so9176811otu.7;
        Tue, 08 Nov 2022 14:30:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kj6QYdjPI+Mq4cfZXxle0k51SIZ4UdpD/shGFJqOIiY=;
        b=rsC4XHHvIUH0nLc+i/7PA/kswwxqAmsLvjMD22FJ3M7Av6bBi4dHg/hIX5VmWkFJdD
         To/UUF8AFMMp/cQoyiyOjfOPvuS58XZqiwV1oUZ0KK//v8gv9qy3RGj04afmnqU7Vvzg
         nNaaZowYu7a7bT7i9WewRrn8al4pE1APi1zd6DreCWMy8CK46/j6ggPcWdvtkh7aBgg2
         W0h976ttbEiKZXGLje4DACRpb9QEDeuKnLMmyqpGkR98p6yxaCxhaSLaJ+nAUerebH6G
         eIyjSLryLU9FLXMiLy8hhSRbRFT0p+QuAZMzGcrB6+hw8sI4POo0YTIrF8wRv4RlC6dx
         mbdw==
X-Gm-Message-State: ACrzQf0SJp5nNUiFJspgchMn+Mh6lJ8SIBk2fF4eNnKEohvvAZ0KaraX
        3L+4SXQKTKzs32DlPEPY5g==
X-Google-Smtp-Source: AMsMyM4w+Q0bbTEoYWhch8yicb0YbQQFv0vfYscvOAojHPlu4xud6CxfcJeuZdXmpshPM5pW0gSwWA==
X-Received: by 2002:a05:6830:628b:b0:660:d639:f380 with SMTP id ce11-20020a056830628b00b00660d639f380mr27602176otb.181.1667946609236;
        Tue, 08 Nov 2022 14:30:09 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y36-20020a05687045a400b0013ae39d0575sm5230025oao.15.2022.11.08.14.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 14:30:08 -0800 (PST)
Received: (nullmailer pid 4095484 invoked by uid 1000);
        Tue, 08 Nov 2022 22:30:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>, asahi@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Steven Rostedt <rostedt@goodmis.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Sven Peter <sven@svenpeter.dev>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-doc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <E1osRXi-002mwL-UB@rmk-PC.armlinux.org.uk>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXi-002mwL-UB@rmk-PC.armlinux.org.uk>
Message-Id: <166794645522.4092185.9292599131300169784.robh@kernel.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: gpio: add binding for the GPIO block
 for Apple Mac SMC
Date:   Tue, 08 Nov 2022 16:30:08 -0600
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Tue, 08 Nov 2022 16:33:42 +0000, Russell King (Oracle) wrote:
> Add the DT binding for the Apple Mac System Management Controller GPIOs.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../bindings/gpio/apple,smc-gpio.yaml         | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/gpio/apple,smc-gpio.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

