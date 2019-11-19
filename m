Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D645102276
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 12:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfKSLAi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 06:00:38 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:49768 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfKSLAi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 06:00:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
        Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=7xYPBOsOUttXU6u6FFGO6AadLzEHL85S6CRWNpo/gZQ=; b=TopOXo3RK1DkRNils8wMuqomO
        33SdGU7uMQFzhaga5C2QPeBRsJjvMo6N4ytk+A0fOZJ9qykcoq9ZKnpur5C6+cRLTCnGEp6HtvH8I
        z0nelwmeTxj7nAtINIOa6UZrzwt8TAZgfNJJept6qHcQsHbxBrlfJ7bIvZIaspP5ChFvbTx2yrqLu
        MhpNQ6/2vv/P/nH7FCs18Fsard5vDJBfKKmMOy0fQ4yQqXoBvCooOI77SBtkjY6b7Vrszyw3oO9Py
        MGl7RdiFlq7sH/ytvnFCIfErM628Me03XktDGGhYuDcfohhu/Ui8JWY+oVcJ7M0kQbO6BoUoGiErL
        JLHPGYfLQ==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:37538)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iX1FH-0000nU-Nv; Tue, 19 Nov 2019 11:00:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iX1FH-0000fC-2X; Tue, 19 Nov 2019 11:00:31 +0000
Date:   Tue, 19 Nov 2019 11:00:31 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Marc Zyngier <marc.zyngier@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        GPIO <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: Using a GPIO as an interrupt line
Message-ID: <20191119110030.GA25745@shell.armlinux.org.uk>
References: <f0d383f3-8efa-ae68-62af-68f69cd4143f@free.fr>
 <20191119095748.GX25745@shell.armlinux.org.uk>
 <07db59e7-ff16-0457-87f2-fba10dc182d6@free.fr>
 <20191119105619.4osmin7m5ryqfwih@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191119105619.4osmin7m5ryqfwih@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 19, 2019 at 11:56:19AM +0100, Uwe Kleine-König wrote:
> Having a pin configured as GPIO is the boot default setting for many
> SoCs/pins. So you might get away with not specifying a setting for pin
> 42, but that's not as robust as configuring that explicitly.

If only that was universally true - the LX2160A as an example doesn't
default to GPIO mode... just be very aware of what the documentation,
and, as the saying goes "if there is any doubt, there is no doubt".

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
