Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1ADB673544
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Jan 2023 11:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjASKQl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Jan 2023 05:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjASKQh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2023 05:16:37 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 80CB476AA;
        Thu, 19 Jan 2023 02:16:36 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id EBCE18140;
        Thu, 19 Jan 2023 10:16:35 +0000 (UTC)
Date:   Thu, 19 Jan 2023 12:16:34 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kevin Hilman <khilman@kernel.org>, Keerthy <j-keerthy@ti.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] ARM: OMAP2+: Remove unneeded #include
 <linux/pinctrl/pinmux.h>
Message-ID: <Y8kYgjLwBU9Wkl08@atomide.com>
References: <7f22fb21f76f4d23be2e31a5908bcfa295704ef4.1668000965.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f22fb21f76f4d23be2e31a5908bcfa295704ef4.1668000965.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Geert Uytterhoeven <geert+renesas@glider.be> [221109 15:27]:
> Commit 44c22a2d12a5c04d ("ARM: OMAP2+: pm33xx: Add support for rtc+ddr
> in self refresh mode") added the include, but no user.

Applying into omap-for-v6.2/cleanup thanks.

Tony
