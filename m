Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8BF30ECD1
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Feb 2021 07:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbhBDG7H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Feb 2021 01:59:07 -0500
Received: from muru.com ([72.249.23.125]:56976 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229998AbhBDG7G (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Feb 2021 01:59:06 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 01C9A80C5;
        Thu,  4 Feb 2021 06:58:35 +0000 (UTC)
Date:   Thu, 4 Feb 2021 08:58:20 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     bcousson@baylibre.com, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: am335x-pocketbeagle: unique gpio-line-names
Message-ID: <YBubDME90umkF9aQ@atomide.com>
References: <20210127000303.436595-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127000303.436595-1-drew@beagleboard.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [210127 02:04]:
> Based on linux-gpio discussion [1], it is best practice to make the
> gpio-line-names unique. Generic names like "[ethernet]" are replaced
> with the name of the unique signal on the AM3358 SoC ball corresponding
> to the gpio line. "[NC]" is also renamed to the standard "NC" name to
> represent "not connected".
> 
> [1] https://lore.kernel.org/linux-gpio/20201216195357.GA2583366@x1/

So are these needed for v5.12 as fixes, or can these wait until after
the merge window for v5.13?

Regards,

Tony
