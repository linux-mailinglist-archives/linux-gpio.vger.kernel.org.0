Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5815B26060A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Sep 2020 23:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgIGVIB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Sep 2020 17:08:01 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:48432 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726458AbgIGVH7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Sep 2020 17:07:59 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kFOMe-00DgGY-Cs; Mon, 07 Sep 2020 23:07:48 +0200
Date:   Mon, 7 Sep 2020 23:07:48 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] ARM: dts: Remove non-existent i2c1 from 98dx3236
Message-ID: <20200907210748.GF3254313@lunn.ch>
References: <20200907024149.20001-1-chris.packham@alliedtelesis.co.nz>
 <20200907024149.20001-3-chris.packham@alliedtelesis.co.nz>
 <20200907154532.GY3112546@lunn.ch>
 <36712d90-6bfe-8965-22b1-6b6dd460116d@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36712d90-6bfe-8965-22b1-6b6dd460116d@alliedtelesis.co.nz>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 07, 2020 at 09:04:48PM +0000, Chris Packham wrote:
> 
> On 8/09/20 3:45 am, Andrew Lunn wrote:
> > On Mon, Sep 07, 2020 at 02:41:48PM +1200, Chris Packham wrote:
> >> The switches with integrated CPUs have only got a single i2c controller.
> >> The incorrectly gained one when they were split from the Armada-XP.
> Someone pointed out a small grammo instead of "The incorrectly" it 
> should be "They incorrectly". Is it worth me sending a v2 just to fix that?

You are asking somebody who is dyslexic, and often fails to notice
things like this, particularly when written by me :-)

Up to you.

  Andrew
