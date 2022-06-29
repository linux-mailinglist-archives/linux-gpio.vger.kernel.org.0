Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3AFE55FEBF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 13:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232733AbiF2LhO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 07:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232638AbiF2LhO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 07:37:14 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5AAB7F1;
        Wed, 29 Jun 2022 04:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=In-Reply-To:Content-Type:MIME-Version:References:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=SSCPB9pAS9pvDKAWwMFfH89gInRxYovar8rDhCnxRHg=; b=DX5Xm9MwAXtkIm20QZxbhCZkSJ
        IIKRCau45yfAPH1ZJGPk1+Dk1urm0m+5hLkSKdkSYlyXWO5FJngUZmtLakMiWFHBqJrXEF1qNOnK4
        IBSZpGLenQOCyutD5NmZh+MNrVoSX29vmmm2CAEWG4b9CsXK5BpoZ14IQNk3DOexageyJQxI+QGKK
        60RE4C74Q+BclH0TA+aMA+7+7EmiqAgvMLY0aIAoC6TFYqmyIeodohMe7XQwjzr7dI0L5EEFyNxJC
        RotL/aEskwlj/weqLDo8dQpL6OLCHm3HpMyYbmfdRsUpWZYX1Mhd3KUc8moiYIImkpLCY67lkPKAi
        NqZSS0pQ==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o6W0I-006Sbe-5S; Wed, 29 Jun 2022 13:37:06 +0200
Date:   Wed, 29 Jun 2022 13:37:00 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT schema for
 qcom,msm8909-tlmm
Message-ID: <Yrw5UnFXKCZvAr2d@kernkonzept.com>
References: <20220628145502.4158234-1-stephan.gerhold@kernkonzept.com>
 <20220628145502.4158234-2-stephan.gerhold@kernkonzept.com>
 <91d972d2-689c-d357-869f-fbd826173e33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91d972d2-689c-d357-869f-fbd826173e33@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 29, 2022 at 11:38:01AM +0200, Krzysztof Kozlowski wrote:
> On 28/06/2022 16:55, Stephan Gerhold wrote:
> > Document the "qcom,msm8909-tlmm" compatible for the TLMM/pin control
> > block in the MSM8909 SoC, together with the allowed GPIOs and functions.
> > 
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> > ---
> >  .../bindings/pinctrl/qcom,msm8909-tlmm.yaml   | 152 ++++++++++++++++++
> >  1 file changed, 152 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
> > new file mode 100644
> > index 000000000000..e03530091478
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
> > @@ -0,0 +1,152 @@
> > [...]
> > +patternProperties:
> > +  '-state$':
> > +    oneOf:
> > +      - $ref: "#/$defs/qcom-msm8909-tlmm-state"
> 
> No quotes here and other places, should be needed. I know you copied
> from other bindings, but at least let's try new files to be proper.
> 

The quotes are necessary, since # starts a comment in YAML and the
property would be effectively empty. :)

I tried it anyway but "dt_binding_check" complains as suspected:
qcom,msm8909-tlmm.yaml: patternProperties:-state$:oneOf:0:$ref: None is not of type 'string'

Thanks,
Stephan
