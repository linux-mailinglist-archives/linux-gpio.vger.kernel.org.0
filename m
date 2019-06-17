Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3B01489B8
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 19:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfFQRJv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 13:09:51 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:33854 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbfFQRJv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 17 Jun 2019 13:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=uS9tcbuzM74Tnp95/jr2g8D6vZqSCnR3ThHPQVUFsdw=; b=Qgnf5gK33ITbHZlPmUqn+3zpvx
        QR3lSlUMuN2QO7Ykf88M/bz/LvjINl3Io9q2uMSwU2OXayJYkvJn/W8OIrXpnOkqWTNKTznWPr6dv
        tUB0bdf3wlnMrB1AuGHwInJ6ImP6BF5cL+GFCwVMyfYRGxoc5BrlNJCuFgXY0p0AaeyM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
        (envelope-from <andrew@lunn.ch>)
        id 1hcv8N-0001xo-Na; Mon, 17 Jun 2019 19:09:31 +0200
Date:   Mon, 17 Jun 2019 19:09:31 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linus.walleij@linaro.org,
        jason@lakedaemon.net, gregory.clement@bootlin.com,
        sebastian.hesselbarth@gmail.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: mvebu: Add compatible string for
 98dx1135 core clock
Message-ID: <20190617170931.GG17551@lunn.ch>
References: <20190617100432.13037-1-chris.packham@alliedtelesis.co.nz>
 <20190617100432.13037-3-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617100432.13037-3-chris.packham@alliedtelesis.co.nz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 17, 2019 at 10:04:30PM +1200, Chris Packham wrote:
> Add compatible string for the core clock on the 98dx1135 switch with
> integrated CPU.

Hi Chris

Should there be a list of provider IDs and clock names?

Thanks
	Andrew
