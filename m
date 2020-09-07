Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 437A825FD5F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 17:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730216AbgIGPp2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 11:45:28 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:47460 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730206AbgIGPpV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Sep 2020 11:45:21 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kFJKO-00DdRP-GJ; Mon, 07 Sep 2020 17:45:08 +0200
Date:   Mon, 7 Sep 2020 17:45:08 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     jason@lakedaemon.net, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, robh+dt@kernel.org,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] pinctrl: mvebu: Fix i2c sda definition for 98DX3236
Message-ID: <20200907154508.GX3112546@lunn.ch>
References: <20200907024149.20001-1-chris.packham@alliedtelesis.co.nz>
 <20200907024149.20001-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907024149.20001-2-chris.packham@alliedtelesis.co.nz>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 07, 2020 at 02:41:47PM +1200, Chris Packham wrote:
> Per the datasheet the i2c functions use MPP_Sel=0x1. They are documented
> as using MPP_Sel=0x4 as well but mixing 0x1 and 0x4 is clearly wrong. On
> the board tested 0x4 resulted in a non-functioning i2c bus so stick with
> 0x1 which works.
> 
> Fixes: d7ae8f8dee7f ("pinctrl: mvebu: pinctrl driver for 98DX3236 SoC")
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
