Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A60BA6105B8
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Oct 2022 00:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234808AbiJ0WZR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Oct 2022 18:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235081AbiJ0WZP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2022 18:25:15 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFDFB3123A;
        Thu, 27 Oct 2022 15:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HJjTWKQVZIK147tjbt+eIjT1+CH9lJZh5rgFyjVF1NQ=; b=tGt7Sl00gg9pHBQmDv2WZHuJ+E
        zW7nUywSDACnnF8TK5qSD0v+q5urCvJ/uJELfaMW5ScTSK5KXySq3nnjBsClgcGUtOOmzwsgss6pj
        AVxBwUuZ35K1wATNHBH7qbIxRH1mRuiCIk9yb+zkqQo3vQ/HjCfEkVd52SjCoUtUyogijy7l4fHNW
        rgK6iqQWcoR91saYFc1/ex/gkQphA6T+6ZUUk+UIp/vPvYsNiQpQLNya+IXpMGF8kWJP3QBZLoglr
        Ny3DvB1w7WNMUQwpL8MPs9AWnQCPUeW7KpkWI7AlDfwRfq4/soQ8kvi/To7SxdBhgZteyJbOof/4F
        gJAfm+lA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34994)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1ooBJE-0007b4-Cv; Thu, 27 Oct 2022 23:25:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1ooBJD-0001uW-0C; Thu, 27 Oct 2022 23:25:07 +0100
Date:   Thu, 27 Oct 2022 23:25:06 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hector Martin <marcan@marcan.st>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: add binding for the GPIO block
 for Apple Mac SMC
Message-ID: <Y1sFQnLivSZZA9MK@shell.armlinux.org.uk>
References: <Y1q5jW8ff0aUdjPd@shell.armlinux.org.uk>
 <E1oo6Hw-00HYp8-Sa@rmk-PC.armlinux.org.uk>
 <35ed6e48-40e6-eb14-72de-9a0a4f5b38f8@linaro.org>
 <Y1rxdEjJox3HOqtp@shell.armlinux.org.uk>
 <2e2356f2-ded1-3cbf-4456-20054a8defda@linaro.org>
 <Y1r8zZif6FUIA73J@shell.armlinux.org.uk>
 <c285538f-8fce-c723-7430-675d91876f6b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c285538f-8fce-c723-7430-675d91876f6b@linaro.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 27, 2022 at 06:06:21PM -0400, Krzysztof Kozlowski wrote:
> On 27/10/2022 17:49, Russell King (Oracle) wrote:
> > In any case, relying on examples rather than a proper description of
> > how this should be done is utterly rediculous. There should be a formal
> > definition of the language used to describe this - but there doesn't
> > seem to be.
> 
> There is...
> 
> > 
> > So, stuff like "-" means list is just not obvious, and the error
> 
> "-" is defined by YAML, so I do not understand what is here not obvious?

I wonder which bit of "I don't understand YAML" isn't obvious to you?

The "-" means list isn't stated in yaml online tutorials, it seems
one is just supposed to know this. I guess if one been in JS and
similar landscapes it's obvious, but not everyone has.

C is damn easy in comparison! :)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
