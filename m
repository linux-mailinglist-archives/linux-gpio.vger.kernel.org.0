Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4AF31DAFF
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Feb 2021 14:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbhBQNye (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 08:54:34 -0500
Received: from muru.com ([72.249.23.125]:34676 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231470AbhBQNye (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Feb 2021 08:54:34 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6F8CF8061;
        Wed, 17 Feb 2021 13:54:14 +0000 (UTC)
Date:   Wed, 17 Feb 2021 15:53:46 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Joe Perches <joe@perches.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 0/3] pinctrl: pinmux: Add pinmux-select debugfs file
Message-ID: <YC0f6uuNlbv7wjyP@atomide.com>
References: <20210216224455.1504008-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210216224455.1504008-1-drew@beagleboard.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [210216 22:46]:
> This series first converts the debugfs files in the pinctrl subsystem to
> octal permissions and then adds a new debugfs file "pinmux-select".
> 
> Function name and group name can be written to "pinmux-select" which
> will cause the function and group to be activated on the pin controller.

Nice to see this happening!

Reviewed-by: Tony Lindgren <tony@atomide.com>
