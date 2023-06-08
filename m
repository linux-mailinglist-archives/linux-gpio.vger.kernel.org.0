Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 864F9727752
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jun 2023 08:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234197AbjFHGgo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jun 2023 02:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234369AbjFHGgn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2023 02:36:43 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 745DC270D;
        Wed,  7 Jun 2023 23:36:42 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D586E80E0;
        Thu,  8 Jun 2023 06:36:40 +0000 (UTC)
Date:   Thu, 8 Jun 2023 09:36:39 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 1/1] dt-bindings: pinctrl: Update pinctrl-single to
 use yaml
Message-ID: <20230608063639.GD14287@atomide.com>
References: <20230605095216.18864-1-tony@atomide.com>
 <a4134777-e43c-4b74-58d8-bff0c0d1a6f6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4134777-e43c-4b74-58d8-bff0c0d1a6f6@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [230607 18:17]:
> On 05/06/2023 11:52, Tony Lindgren wrote:
> > +title: Pinctrl driver for hardware with a single register for one or more pins
> 
> I asked to drop the driver references but it is still here. Bindings are
> not describing drivers.
> 
> "Generic Pin Controller with a Single Register for One or More Pins"

Oh right it's supposed to describe hardware, will update thanks.

> > +patternProperties:
> > +  '-pins$|-pin':
> 
> you did not implement my comments fully, probably we misunderstood each
> other. Why do you allow anything after '-pin'? Let's make it pure suffix
> for both cases: '-pins?$'

I'll check what kind of node renaming that would cause. At least TI
arm64 SoCs use naming like -pins-default and -pins-wakeup. Is your
preference to rename all those nodes to -default-pins and -wakeup-pins?

Regards,

Tony
