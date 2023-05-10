Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2987F6FDB73
	for <lists+linux-gpio@lfdr.de>; Wed, 10 May 2023 12:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236420AbjEJKQK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 May 2023 06:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236306AbjEJKQJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 May 2023 06:16:09 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 45CF41FC1;
        Wed, 10 May 2023 03:16:08 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8EFF68109;
        Wed, 10 May 2023 10:16:07 +0000 (UTC)
Date:   Wed, 10 May 2023 13:16:06 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: Allow use of pinconf in
 addition to pinctrl and pinmux
Message-ID: <20230510101606.GA14287@atomide.com>
References: <20230510095330.30742-1-tony@atomide.com>
 <d0368328-b2af-e4b8-4374-c9fcb9c376c0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0368328-b2af-e4b8-4374-c9fcb9c376c0@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [230510 10:13]:
> On 10/05/2023 11:53, Tony Lindgren wrote:
> > Some controllers can be just pinconf controllers and we have dts
> > files using pinconf for the node name already.
> > 
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >  Documentation/devicetree/bindings/pinctrl/pinctrl.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
> > --- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
> > @@ -27,7 +27,7 @@ description: |
> >  
> >  properties:
> >    $nodename:
> > -    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+)?$"
> > +    pattern: "^(pinctrl|pinmux|pinconf)(@[0-9a-f]+)?$"
> 
> pinconf appears in three cases. Better just fix DTS.

OK will send a patch.

Thanks,

Tony
