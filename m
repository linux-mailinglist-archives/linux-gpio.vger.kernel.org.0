Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 625A566E895
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jan 2023 22:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjAQVjX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Jan 2023 16:39:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbjAQVit (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2023 16:38:49 -0500
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86282E0E0;
        Tue, 17 Jan 2023 12:04:39 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id r9so16121408oie.13;
        Tue, 17 Jan 2023 12:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL+np8smkP7FSXt9qO9bmY6grgj8WYKwJKgXRY8ZBcU=;
        b=ikTRkX1bA2UJb+Yquk92pvl+/JkbnFTqnuoQzfjNSwet1djDujiLrnDR/4Pgjtv/iC
         BLXNrSOFcGfqhat9i1SMVDvl+WcDItVLVt58yGluaBRupDohY/Ov5sL3PppMusbL8iG2
         mmaTyCCXuspGlDDiP0fN2viSG1grGKTbY2Ee2ZJhbCwJdmj/rwfTs3dtatAoGBXn/ub1
         IDDMjbBwPN0tL6fldWAI+mUx14bFMnPapK00SUG5pbJIDkZCeNmncQ3NQ0mj8XWQTx5d
         /c8JkN/fRs2GDbArVAhgb4Q1/4LLT3c+QdvbEPGizM1M8PMq7qtaiUNgfb3BZTb2Yt3S
         znuw==
X-Gm-Message-State: AFqh2koe45A99Z2DMe2sEk0yfgeP8MWa4esk7JFar/49HP2lz8gWTFYG
        Imtwr6itI0xhZkp2Fx70nA==
X-Google-Smtp-Source: AMrXdXvmzGoLs6M8Mi2uZIM7/ivg4qx44J6VbPcY9Vptlack77OOKL/RsfLrl5jEf5MiYZddcjILzg==
X-Received: by 2002:aca:f1a:0:b0:36a:9706:665f with SMTP id 26-20020aca0f1a000000b0036a9706665fmr979417oip.10.1673985878974;
        Tue, 17 Jan 2023 12:04:38 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r21-20020a9d7515000000b0068646611d0bsm1943619otk.44.2023.01.17.12.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 12:04:38 -0800 (PST)
Received: (nullmailer pid 3546639 invoked by uid 1000);
        Tue, 17 Jan 2023 20:04:37 -0000
Date:   Tue, 17 Jan 2023 14:04:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Nishanth Menon <nm@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: pinctrl: Update pinctrl-single to
 use yaml
Message-ID: <20230117200437.GA3538302-robh@kernel.org>
References: <20230116071602.63788-1-tony@atomide.com>
 <167388667378.596858.12053272103098373981.robh@kernel.org>
 <CAL_JsqLQMkU-r=E2wmbgO9+PA=XxAeR2OC5isAYY701f6V+BOQ@mail.gmail.com>
 <Y8WFIzElz8/pv4uy@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8WFIzElz8/pv4uy@atomide.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2023 at 07:10:59PM +0200, Tony Lindgren wrote:
> * Rob Herring <robh+dt@kernel.org> [230116 16:39]:
> > I imagine you don't want to go change all these node names, so I'd
> > make the schema accept them.
> 
> Heh yeah, I was wondering about that too :) Some can be handled with a
> regex, but there are still a lot of completely custom names. If you have
> some preferred solution in mind, please let me know.

If just allowing 'pins' anywhere in the name is not enough, you can 
match on any other property with 'additionalProperties'. There's some 
examples in pinctrl bindings.

additionalProperties:
  type: object
  properties:
    ...

Or use 'unevaluatedProperties' if there's properties defined behind a 
$ref.

There's also this hack, but I try to avoid it:

patternProperties:
 '.*':
   if:
     type: object
   then:
     ...


Rob
