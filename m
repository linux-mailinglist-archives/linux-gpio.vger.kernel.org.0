Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B43BD60FC17
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Oct 2022 17:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236100AbiJ0PgA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Oct 2022 11:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236103AbiJ0Pf7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2022 11:35:59 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBC885581;
        Thu, 27 Oct 2022 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=s+M6sobZFS2XFHU3hImQaww3sBWbyTgoTyZB56RT6oQ=; b=0Wl0lz38fS8oNBjPjkW3g+zNLi
        dQvszuVhFufAyJm/qeCA5v5MpKj6wnsSm0sX6K0x1d9GZFc8/U6xJQXvlhx1hVziJvjOKQKk0aOM/
        sFt6bbx8iQ1GhXm/jHylg+Tbb+4qwJidqn58zBJ7Wl5OX2WXdkN/4DSgBWn/EMXgWJDc4XcO1MJLv
        o3lFLZZ+64DaZRQGDEvkGgDXd5CKhPFaRYiYG3EdEjRWALsjXj8ja9Kkm1amqTZFxEyqgM6h0BkbN
        RLcCIWFwHZMmTrVSSWVgviXoGukaQmfUtW8Ze0SHRuYxu9drvKEsMfKihs70fmv0Xc1b6WaDvgBrO
        DyHD/5lg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34978)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oo4v8-0007EX-1M; Thu, 27 Oct 2022 16:35:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oo4v5-0001ex-3J; Thu, 27 Oct 2022 16:35:47 +0100
Date:   Thu, 27 Oct 2022 16:35:47 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 0/6] Add Apple Mac System Management Controller GPIOs
Message-ID: <Y1qlU0Hes4768PUX@shell.armlinux.org.uk>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 01, 2022 at 02:54:01PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> This series adds support for the Apple Mac GPIO driver. These GPIOs
> are hadled via the System Management Controller.
> 
> The first two patches add the DT binding documentation for the new
> drivers.
> 
> The second two patches add the core System Management Controller
> support.
> 
> The last two patches add the GPIO support.
> 
> DT updates will follow once the bindings have been reviewed.
> 
> Patches taken from the Asahi project.

All,

As the discussion on this series was _extremely_ long, and did not
take account of my posting of v2, I will shortly be posting v3, but
as a much smaller series.

My plan is to get the two patches for GPIO driver sorted as an
independent series from the rest of the patches (that being the
platform or mfd bits).

I believe I've addressed all the comments for the GPIO driver, so
expect that part shortly. The other part will take longer due to
further changes being required.

Russell.


-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
