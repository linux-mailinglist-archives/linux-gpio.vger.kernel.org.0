Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F03A25A9D70
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 18:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233209AbiIAQrR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 12:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233576AbiIAQrQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 12:47:16 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85AB27B1D5;
        Thu,  1 Sep 2022 09:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=W3O+xqsQoDS/3T7c0b2c2tsv+0Mvz/bo8Rn3y7uzjGI=; b=C/NeG9Wwc+f4CQtNRwJHx9O/5r
        9rR6E+eKH9pnWdiSk1+xcF/h1mfmzlX+VOajEfaIfLLpxH3AggR08fcZ4t0qV3dm9CUA0JE7c1H3m
        djKAQjTCzxmHxu2nohfLG6LtiGG+DfHf4Lt8osN0RVfCG68n3QZTRyeaxLk/bXeiToyJQ7+05jUZp
        Gs+SAIaZnDqyi3+jpMw40Km2TSRSMtfuGLNmLEI0fv4XJSflI8aoP81xPadMEJ7hmpKoVEuru3NC8
        y71Ulz5JkRZZ2q/r0vKORvpOQL7zX4k815j6eOIZf++l1HO4DQ+vA/eKsyC11Zg4Em9Kdge0zGgTA
        HVWLu05Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34050)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oTnLL-0006EO-IG; Thu, 01 Sep 2022 17:47:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oTnLI-0003cg-GY; Thu, 01 Sep 2022 17:47:00 +0100
Date:   Thu, 1 Sep 2022 17:47:00 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Sven Peter <sven@svenpeter.dev>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Message-ID: <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
 <426469c1-13cc-178b-4904-09439d7788e8@linaro.org>
 <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
 <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
 <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 01, 2022 at 07:25:03PM +0300, Krzysztof Kozlowski wrote:
> On 01/09/2022 18:56, Russell King (Oracle) wrote:
> > 
> > 8<===
> > From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> > Subject: [PATCH] dt-bindings: mfd: add binding for Apple Mac System Management
> >  Controller
> > 
> > Add a DT binding for the Apple Mac System Management Controller.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Yes, looks good.
> 
> I won't add Reviewed-by tag, because I think it would confuse Patchwork,
> so please send a v2 at some point.

Thanks. Do you have any suggestions for patch 2? Should I merge the
description in patch 2 into this file?

The full dts for this series looks like this:

                smc: smc@23e400000 {
                        compatible = "apple,t8103-smc", "apple,smc";
                        reg = <0x2 0x3e400000 0x0 0x4000>,
                                <0x2 0x3fe00000 0x0 0x100000>;
                        reg-names = "smc", "sram";
                        mboxes = <&smc_mbox>;

                        smc_gpio: gpio {
                                gpio-controller;
                                #gpio-cells = <2>;
                        };
                };

but the fuller version in the asahi linux tree looks like:

		smc: smc@23e400000 {
			compatible = "apple,t8103-smc", "apple,smc";
			reg = <0x2 0x3e400000 0x0 0x4000>,
				<0x2 0x3fe00000 0x0 0x100000>;
			reg-names = "smc", "sram";
			mboxes = <&smc_mbox>;

			smc_gpio: gpio {
				gpio-controller;
				#gpio-cells = <2>;
			};

			smc_rtc: rtc {
				nvmem-cells = <&rtc_offset>;
				nvmem-cell-names = "rtc_offset";
			};

			smc_reboot: reboot {
				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
					<&boot_error_count>, <&panic_count>, <&pm_setting>;
				nvmem-cell-names = "shutdown_flag", "boot_stage",
					"boot_error_count", "panic_count", "pm_setting";
			};
		};

So whatever is decided for the gpio node would eventually also apply
to the other nodes too.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
