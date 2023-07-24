Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FAFA75FB62
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jul 2023 18:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbjGXQCq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jul 2023 12:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbjGXQCp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jul 2023 12:02:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 595A71A3;
        Mon, 24 Jul 2023 09:02:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C882761237;
        Mon, 24 Jul 2023 16:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0964FC433C8;
        Mon, 24 Jul 2023 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690214563;
        bh=Omsqe8+eInRgeTcrf+/2KtOeHqFHTNe9dlgLEqOlreo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S+hEY6sUhQAeEdGjeAOLds2fJ5fe2yDEMv3kgB5oipe5XFr5EzXtX3PWDyHi8RxvW
         8xA4TBAxNtTzf1gdUSwDVzOwGQdETMM+EBfYLu8irLjMLpwSSO00xV3aUGjsdU7iYY
         A8vLw9MGN+SYKEjK5MeXOS7ZC2oUrJgH8bWUsehqoiRcQhSMki1T9NPB3lp6awNFMn
         CNUHqVpOVtDOBWCzv1yb9z2T9224npR/x2RGv//d77EPgzEcKk7pKV5iQUyQ+mzpBh
         BIkph+R82P7qLP2pEDPBHh/2DmK4ftf0F2xfBt4RNZFBbkTP8WdTzrBJRr6O8OR2PX
         KcK6N95XLdMGA==
Received: (nullmailer pid 3622554 invoked by uid 1000);
        Mon, 24 Jul 2023 16:02:40 -0000
Date:   Mon, 24 Jul 2023 10:02:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v7 1/1] dt-bindings: pinctrl: Update pinctrl-single to
 use yaml
Message-ID: <169021456020.3622493.10284534202541859578.robh@kernel.org>
References: <20230721082654.27036-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721082654.27036-1-tony@atomide.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Fri, 21 Jul 2023 11:26:49 +0300, Tony Lindgren wrote:
> Update binding for yaml and remove the old related txt bindings. Note that
> we are also adding the undocumented pinctrl-single,slew-rate property. And
> we only use the first example from the old binding.
> 
> As we are mostly using a generic compatible across various SoCs, let's not
> start adding matches for random pin group node naming. Let's standardize on
> pin group node name ending in -pins with an optional instance number
> suffix.
> 
> As a pin group may have additional pins added to it later on, let's always
> use -pins rather than -pin for the gropu name.
> 
> Most of the dts files have been updated already for the pin group node
> names with a few changes still pending.
> 
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> 
> Changes since v6:
> - Avoid adding lots of matches and only accept nodes ending in -pins
>   with an optional suffix for instance number
> 
> - Update title to drop driver related stuff as noted by Krzysztof
> 
> Changes since v5:
> - Fix issues noted by Krzysztof
> 
> Changes since v4:
> - Removed legacy matching for pin group node names, let's fix the dts
>   files instead to use "pins" naming with dashes. This also fixed the
>   new warnings introduced for "not of type 'object'" for anything named
>   pin
> 
> Changes since v3:
> - Fix issues noted by Rob for v2 version that I had missed
> 
> - Categorize patternProperties a bit to make fixing dts files easier
> 
> Changes since v2:
> 
> - Drop old ti,omap-pinctrl.txt in addition to old pinctrl-single.txt
> 
> - Replace reference to pinctrl-single.txt to point to the yaml in ctrl.txt
> 
> Changes since v1:
> 
> - The v1 version was a WIP patch posted as an example in thread
>   "dt binding check error with hash and comma"
> 
> ---
>  .../devicetree/bindings/arm/omap/ctrl.txt     |   2 +-
>  .../bindings/pinctrl/pinctrl-single.txt       | 262 ------------------
>  .../bindings/pinctrl/pinctrl-single.yaml      | 206 ++++++++++++++
>  .../bindings/pinctrl/ti,omap-pinctrl.txt      |  13 -
>  4 files changed, 207 insertions(+), 276 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/ti,omap-pinctrl.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

