Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF1D95AA304
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Sep 2022 00:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234630AbiIAW3K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 18:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235427AbiIAW2i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 18:28:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B2D17E1D;
        Thu,  1 Sep 2022 15:26:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1D42462018;
        Thu,  1 Sep 2022 22:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72607C43141;
        Thu,  1 Sep 2022 22:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662071192;
        bh=bZrKkMHky4BQzJVVvsb02JmTiYQnJu9Lm6ukGG8Mg6w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=D/jb6WwQGPHXu1ZGTH90T4bn1t1YMRNjDDGtAqrsaTcVFMnCAzo8S55HGIl9J2Uup
         rGHTjyn5A/PT1UV6iUJd465HLfcnsVLVR9eC+IhtYjUEFylLXme2QRCCo1XnNnkzID
         KJMhNesNTnePUy+GvsMgpWC+mp0EGx7XlHtICX99kYr6suooeOY3uBnsx7boDCsX9a
         F944tjUPUhNrAeQg+mbz5d6QmyJymcwCpr5kl6F3/IsGqRoi5uJyviUFhuG/XnFSmI
         UwEzGtB8npiS6lvktSdbb9woLKmvwOwQfOmCw9bk5hd2ciL3ho0Wp8vzg6WEXftNSj
         UVlHS/wnbL3JQ==
Received: by mail-pl1-f175.google.com with SMTP id d12so147600plr.6;
        Thu, 01 Sep 2022 15:26:32 -0700 (PDT)
X-Gm-Message-State: ACgBeo34kPy22ZUwxHPLVHw6Gv6EkNscF4NCwpUtoQ/val399guFkolJ
        XnI5pq4tVTx+P/U0raJI3bGsn1e5gXfkEofhqA==
X-Google-Smtp-Source: AA6agR4PER6rS9o3wMnfpyVtUwmQLctyFI3dEgc26Wj20wwFX9hOPwoTXmT7dbdlf4AmgXN7lpMrCHLCT+7mP5FokSM=
X-Received: by 2002:a17:90a:8689:b0:1fd:9ab8:bec2 with SMTP id
 p9-20020a17090a868900b001fd9ab8bec2mr1404684pjn.155.1662071191938; Thu, 01
 Sep 2022 15:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk> <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
 <426469c1-13cc-178b-4904-09439d7788e8@linaro.org> <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
 <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org> <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org> <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
In-Reply-To: <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 1 Sep 2022 17:26:18 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLXNVdEj3ZCA_Wnirv-7maCZATKmjS8fJYR0uLQ9OTQZQ@mail.gmail.com>
Message-ID: <CAL_JsqLXNVdEj3ZCA_Wnirv-7maCZATKmjS8fJYR0uLQ9OTQZQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 1, 2022 at 10:56 AM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Sep 01, 2022 at 06:45:52PM +0300, Krzysztof Kozlowski wrote:
> > On 01/09/2022 18:24, Russell King (Oracle) wrote:
> > > On Thu, Sep 01, 2022 at 06:15:46PM +0300, Krzysztof Kozlowski wrote:
> > >> On 01/09/2022 18:12, Russell King (Oracle) wrote:
> > >>>>> +  compatible:
> > >>>>> +    items:
> > >>>>> +      - enum:
> > >>>>> +        - apple,t8103-smc
> > >>>>
> > >>>> You miss two spaces of indentation on this level.
> > >>>
> > >>> Should that be picked up by the dt checker?

I have a problem that Krzysztof is quicker. ;) Maybe I should stop
screening the emails (for the times I break things mostly).

> > >>
> > >> I think yamllint complains about it. It is not a hard-dependency, so
> > >> maybe you don't have it installed.
> > >>
> > >>>
> > >>>>> +        - apple,t8112-smc
> > >>>>> +        - apple,t6000-smc
> > >>>>
> > >>>> Bring some order here - either alphabetical or by date of release (as in
> > >>>> other Apple schemas). I think t6000 was before t8112, so it's none of
> > >>>> that orders.
> > >>>
> > >>> Ok.
> > >>>
> > >>>>> +      - const: apple,smc
> > >>>>> +
> > >>>>> +  reg:
> > >>>>> +    description: Two regions, one for the SMC area and one for the SRAM area.
> > >>>>
> > >>>> You need constraints for size/order, so in this context list with
> > >>>> described items.
> > >>>
> > >>> How do I do that? I tried maxItems/minItems set to 2, but the dt checker
> > >>> objected to it.
> > >>
> > >> One way:
> > >> reg:
> > >>   items:
> > >>     - description: SMC area
> > >>     - description: SRAM area
> > >>
> > >> but actually this is very similar what you wrote for reg-names - kind of
> > >> obvious, so easier way:
> > >>
> > >> reg:
> > >>   maxItems: 2
> > >
> > > Doesn't work. With maxItems: 2, the example fails, yet it correctly lists
> > > two regs which are 64-bit address and 64-bit size - so in total 8 32-bit
> > > ints.
> > >
> > > Documentation/devicetree/bindings/mfd/apple,smc.example.dtb: smc@23e400000: reg: [[2, 1044381696], [0, 16384], [2, 1071644672], [0, 1048576]] is too long
> > >         From schema: /home/rmk/git/linux-rmk/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> > >
> > > Hence, I originally had maxItems: 2, and ended up deleting it because of
> > > the dt checker.
> > >
> > > With the two descriptions, it's the same failure.
> >
> > Yeah, they should create same result.
> >
> > >
> > > I think the problem is that the checker has no knowledge in the example
> > > of how big each address and size element of the reg property is. So,
> > > it's interpreting it as four entries of 32-bit address,size pairs
> > > instead of two entries of 64-bit address,size pairs. Yep, that's it,
> > > if I increase the number of "- description" entries to four then it's
> > > happy.
> > >
> > > So, what's the solution?
> > >
> >
> > If you open generated DTS examples (in your
> > kbuild-output/Documentation/devicetree/bindings/mfd/) you will see which
> > address/size cells are expected. By default it is I think address/size
> > cells=1, so you need a bus node setting it to 2.
>
> Thanks, that works. The patch with all those points addressed now looks
> like:
>
> 8<===
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> Subject: [PATCH] dt-bindings: mfd: add binding for Apple Mac System Management
>  Controller
>
> Add a DT binding for the Apple Mac System Management Controller.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../devicetree/bindings/mfd/apple,smc.yaml    | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
>
> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> new file mode 100644
> index 000000000000..168f237c2962
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Mac System Management Controller
> +
> +maintainers:
> +  - Hector Martin <marcan@marcan.st>
> +
> +description:
> +  Apple Mac System Management Controller implements various functions
> +  such as GPIO, RTC, power, reboot.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t6000-smc
> +          - apple,t8103-smc
> +          - apple,t8112-smc
> +      - const: apple,smc
> +
> +  reg:
> +    items:
> +      - description: SMC area
> +      - description: SRAM area

Based on the disjoint addresses, is this really one device? Perhaps
the SRAM area should use mmio-sram binding? That already supports
sub-dividing the sram for different uses. I'll comment more on the
full example.

Rob
