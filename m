Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8176EE93
	for <lists+linux-gpio@lfdr.de>; Sat, 20 Jul 2019 11:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbfGTJUT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 Jul 2019 05:20:19 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:55273 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfGTJUT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 Jul 2019 05:20:19 -0400
X-Originating-IP: 91.163.65.175
Received: from localhost (91-163-65-175.subs.proxad.net [91.163.65.175])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B01CFFF804;
        Sat, 20 Jul 2019 09:20:16 +0000 (UTC)
Date:   Sat, 20 Jul 2019 11:20:16 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v4 1/8] pinctrl: sunxi: v3s: introduce support for V3
Message-ID: <20190720092016.bue2d7lhflrpmcg4@flea>
References: <20190713034634.44585-1-icenowy@aosc.io>
 <20190713034634.44585-2-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190713034634.44585-2-icenowy@aosc.io>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 13, 2019 at 11:46:27AM +0800, Icenowy Zheng wrote:
> Introduce the GPIO pins that is only available on V3 (not on V3s) to the
> V3s pinctrl driver.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
