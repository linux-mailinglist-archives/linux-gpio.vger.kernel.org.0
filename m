Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBDA392D79
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 14:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234576AbhE0ME3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 08:04:29 -0400
Received: from muru.com ([72.249.23.125]:32800 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234725AbhE0ME1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 May 2021 08:04:27 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 959CA80A8;
        Thu, 27 May 2021 12:02:58 +0000 (UTC)
Date:   Thu, 27 May 2021 15:02:49 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Jan Tuerk <jan.tuerk@emtrion.com>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] ARM: dts: dra7x-evm: Align GPIO hog names with
 dt-schema
Message-ID: <YK+KaXbh2F/CroX7@atomide.com>
References: <cover.1621583562.git.geert+renesas@glider.be>
 <e8350ea542c92465020f03481d76943168df2935.1621583562.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8350ea542c92465020f03481d76943168df2935.1621583562.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Geert Uytterhoeven <geert+renesas@glider.be> [210521 10:54]:
> The dt-schema for nxp,pcf8575 expects GPIO hogs node names to end with a
> 'hog' suffix.

Picking up this patch into omap-for-v5.14/dt thanks.

Tony
