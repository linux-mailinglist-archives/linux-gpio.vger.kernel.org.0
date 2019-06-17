Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78723493D8
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 23:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729730AbfFQVdp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 17:33:45 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:34730 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729704AbfFQVZg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Jun 2019 17:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=u7MoVGcAMXVMM2R0jgKIcggyAzOygrEZc0VCSkcCuyo=; b=TuhOfTZ/uWJ1wPUYqgjheigb6R
        ydQsFZd23EnqqvDhcGxeXSTiB0Ii2dwroBWw0U8Fp53HzRjLL5KW3NNXZpNHDHzPmvZjWPsXDy3Fd
        8JhCCQE3aTVwwtFCmRNoG8KU+HjvdLXVYVl73FFsg2piu6msN130tjspKvDLKPseUDuc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hcz7u-0003sW-ET; Mon, 17 Jun 2019 23:25:18 +0200
Date:   Mon, 17 Jun 2019 23:25:18 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: clock: mvebu: Add compatible string for
 98dx1135 core clock
Message-ID: <20190617212518.GN17551@lunn.ch>
References: <20190617100432.13037-1-chris.packham@alliedtelesis.co.nz>
 <20190617100432.13037-3-chris.packham@alliedtelesis.co.nz>
 <20190617170931.GG17551@lunn.ch>
 <52f0fe4f276e4088ac7ad47bc761722e@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52f0fe4f276e4088ac7ad47bc761722e@svr-chch-ex1.atlnz.lc>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> That list would be the same as the Kirkwood/Dove. I thought about adding 
> it but decided not to to avoid unnecessary duplication. One compromise 
> would be to change "for 98dx1135 SoC core clocks" to "for Kirkwood 
> 98dx1135 SoC" which would fit with the MV88f6180 line above and make it 
> clear that it falls into the kirkwood bucket.

Hi Chris

The Compromise sounds good.

Thanks
	Andrew
