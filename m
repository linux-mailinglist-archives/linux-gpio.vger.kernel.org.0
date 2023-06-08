Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBFA727A8D
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jun 2023 10:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234950AbjFHIzh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jun 2023 04:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234760AbjFHIzh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2023 04:55:37 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 550309E;
        Thu,  8 Jun 2023 01:55:36 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5A7C780E0;
        Thu,  8 Jun 2023 08:55:35 +0000 (UTC)
Date:   Thu, 8 Jun 2023 11:55:34 +0300
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
Message-ID: <20230608085534.GE14287@atomide.com>
References: <20230605095216.18864-1-tony@atomide.com>
 <a4134777-e43c-4b74-58d8-bff0c0d1a6f6@linaro.org>
 <20230608063639.GD14287@atomide.com>
 <19710587-533c-f6df-9842-06a8e2db263c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19710587-533c-f6df-9842-06a8e2db263c@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [230608 06:57]:
> On 08/06/2023 08:36, Tony Lindgren wrote:
> > * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [230607 18:17]:
> >> On 05/06/2023 11:52, Tony Lindgren wrote:
> >>> +patternProperties:
> >>> +  '-pins$|-pin':
> >>
> >> you did not implement my comments fully, probably we misunderstood each
> >> other. Why do you allow anything after '-pin'? Let's make it pure suffix
> >> for both cases: '-pins?$'
> > 
> > I'll check what kind of node renaming that would cause. At least TI
> > arm64 SoCs use naming like -pins-default and -pins-wakeup. Is your
> > preference to rename all those nodes to -default-pins and -wakeup-pins?
> 
> No, pattern matching TI SoC is fine, but your current also doesn't. Or
> rather - matches by mistake. You do not allow anything after -pins.

So after the earlier dts node name clean-up, looks like it's only few hundred
TI pins to rename. Not sure I want to add SoC specific handling for TI. Folks
will try to use -pins-default, -pins-sleep, -pins-idle etc..

How about let's just fix the remaining dts files and then we can only
allow -pin or -pins suffix? The match would be just '-pins$|-pin$ with a
preference for -pins as it's a group that might get more pins added to it
later on.

Regards,

Tony
