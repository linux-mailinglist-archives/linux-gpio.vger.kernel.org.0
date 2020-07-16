Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F15222DE8
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 23:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgGPV3I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 17:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbgGPV3H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 17:29:07 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684D1C08C5CE
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 14:29:07 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s9so9978922ljm.11
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 14:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BMW25MccEXBEQKiOayk0XDiCmm5Kg67PbQTIPz8CeXU=;
        b=Q8OcFTKPw8k3z2elh+O/yAez7MPSAXdHzUNs/Ks0fOM5yKcM8I5iUWNAkZLRO8jVYV
         Bi1IGEqK4hM3tKFXoVzNwDiXw03mVBOwFZM2ZpD5QMNN8oi/tuqzs/YmofsxLwHFSanG
         rFA5u6QvyEgmg05+RjOlgBWx164bWRFwGHueXaqHiIF8IiHGDhPO43BOuPYo2ekOAeaq
         /LFBPfI0ksHYRgg/bnshjk9SVN6q5y0JnVoHg60EqQdfLl6gRSehZshGGbiyLKJw2l8v
         fBy4ebyhe6m0NS1dY1pvmnrCSLCuqHrql7lR/IcHDRjiuLewIkuNRo4sQhYFvB/xfMWW
         L78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BMW25MccEXBEQKiOayk0XDiCmm5Kg67PbQTIPz8CeXU=;
        b=DA2wf6kK7TVz8cDIzJFpr9NU36bYzxjB252M5fJkgqZBhsiYYQa16TwxyGDOn3uXab
         +7dQpEZdr/cKwDQAYo9OOfeo25bp/HLxOhSIChA9xdfgoe2JbUT8xuN1mESFOJwof7Bx
         ziMJEJmB0tFdt449lbt+IYhd0MNsa1ccFRbDb0Ht50cHAjJ1tmmIP5j2oaCX6N3nqnMP
         guyXoX+vBsekInzx0KqgxWFATb6lDMe3HfD0nDjZbxFbNcv3g3cCHn1iwpUEsb5ezDja
         zjM/hrdEOj3LLIQvKDtYxGZ52UUz1FrcqA129z4Z9MPnCEGOLEQ8TgsAgSum9gnEbnLf
         d8IQ==
X-Gm-Message-State: AOAM5315Ubi324etnU6RuG7szX4RWLYO+fk3XngGkJESXc6PsI81YRzH
        pSybS5PFfels08+3upzTJ+D9lA==
X-Google-Smtp-Source: ABdhPJzVYp/5WHye4DJHuSaRnmWrbiRRSCijThWnACJvir4tMmyzsXCyvlLmpk/vX1xE+o8oq9JMeg==
X-Received: by 2002:a2e:8296:: with SMTP id y22mr3056440ljg.238.1594934945707;
        Thu, 16 Jul 2020 14:29:05 -0700 (PDT)
Received: from PackardBell ([82.160.139.10])
        by smtp.gmail.com with ESMTPSA id k12sm1287608lfe.68.2020.07.16.14.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:29:04 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 44c50bbc;
        Thu, 16 Jul 2020 21:29:03 +0000 (UTC)
Date:   Thu, 16 Jul 2020 23:29:03 +0200
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Rob Herring <robh@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add msm8226 pinctrl
 bindings
Message-ID: <20200716212903.GA23234@PackardBell>
References: <20200627192833.217531-1-bartosz.dudziak@snejp.pl>
 <20200627192833.217531-2-bartosz.dudziak@snejp.pl>
 <20200715202413.GA755488@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200715202413.GA755488@bogus>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 15, 2020 at 02:24:13PM -0600, Rob Herring wrote:
> On Sat, Jun 27, 2020 at 09:28:30PM +0200, Bartosz Dudziak wrote:
> > Add device tree binding Documentation details for Qualcomm msm8226
> > pinctrl driver.
> > 
> > - Bindings documentation was based on qcom,sm8250-pinctrl.yaml by
> >   Bjorn Andersson <bjorn.andersson@linaro.org> and then modified for
> >   msm8226 content
> > 
> > Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> > ---
> >  .../pinctrl/qcom,msm8226-pinctrl.yaml         | 123 ++++++++++++++++++
> >  1 file changed, 123 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> > new file mode 100644
> > index 0000000000..8d8dc15718
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
> > @@ -0,0 +1,123 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/qcom,msm8226-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies, Inc. MSM8226 TLMM block
> > +
> > +maintainers:
> > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > +
> > +description: |
> > +  This binding describes the Top Level Mode Multiplexer block found in the
> > +  MSM8226 platform.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,msm8226-pinctrl
> > +
> > +  reg:
> > +    description: Specifies the base address and size of the TLMM register space
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description: Specifies the TLMM summary IRQ
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    description: Specifies the PIN numbers and Flags, as defined in
> > +      include/dt-bindings/interrupt-controller/irq.h
> > +    const: 2
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    description: Specifying the pin number and flags, as defined in
> > +      include/dt-bindings/gpio/gpio.h
> > +    const: 2
> > +
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> > +  gpio-reserved-ranges:
> > +    maxItems: 1
> > +
> > +#PIN CONFIGURATION NODES
> > +patternProperties:
> > +  '^.*$':
> > +    if:
> > +      type: object
> 
> For new bindings, do '-pins$' for the node name pattern so we don't have 
> to do this hack.
> 

I have changed the name pattern and sent a v2 patch.
