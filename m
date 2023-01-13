Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2A4668C32
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 07:09:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbjAMGJF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 01:09:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240478AbjAMGHh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 01:07:37 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 01D9269507;
        Thu, 12 Jan 2023 22:06:03 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0D3B080A6;
        Fri, 13 Jan 2023 06:06:03 +0000 (UTC)
Date:   Fri, 13 Jan 2023 08:06:01 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        oe-kbuild-all@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: Update pinctrl-single to use yaml
Message-ID: <Y8D0ycL38T6kRkl5@atomide.com>
References: <20230112083152.10277-1-tony@atomide.com>
 <202301130430.KmUFHrrZ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301130430.KmUFHrrZ-lkp@intel.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* kernel test robot <lkp@intel.com> [230112 20:19]:
> All warnings (new ones prefixed by >>):
> 
> >> Warning: Documentation/devicetree/bindings/arm/omap/ctrl.txt references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
> >> Warning: Documentation/devicetree/bindings/pinctrl/ti,omap-pinctrl.txt references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt

Thanks for the report, I'll update the patch to change the omap/ctrl.txt to
reference the new pinctlr-single.yaml file. And we can now just remove the old
pinctrl/ti,omap-pinctrl.txt.

Regards,

Tony
