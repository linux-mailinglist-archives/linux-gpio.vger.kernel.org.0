Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F14625FD68
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 17:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730230AbgIGPrW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 11:47:22 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:47482 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730213AbgIGPpk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Sep 2020 11:45:40 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kFJKm-00DdRx-T0; Mon, 07 Sep 2020 17:45:32 +0200
Date:   Mon, 7 Sep 2020 17:45:32 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     jason@lakedaemon.net, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, robh+dt@kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ARM: dts: Remove non-existent i2c1 from 98dx3236
Message-ID: <20200907154532.GY3112546@lunn.ch>
References: <20200907024149.20001-1-chris.packham@alliedtelesis.co.nz>
 <20200907024149.20001-3-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907024149.20001-3-chris.packham@alliedtelesis.co.nz>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 07, 2020 at 02:41:48PM +1200, Chris Packham wrote:
> The switches with integrated CPUs have only got a single i2c controller.
> The incorrectly gained one when they were split from the Armada-XP.
> 
> Fixes: 43e28ba87708 ("ARM: dts: Use armada-370-xp as a base for armada-xp-98dx3236")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
