Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24DE212B5C
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2020 19:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgGBRhC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jul 2020 13:37:02 -0400
Received: from muru.com ([72.249.23.125]:60448 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgGBRhC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 2 Jul 2020 13:37:02 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 30A4C8062;
        Thu,  2 Jul 2020 17:37:54 +0000 (UTC)
Date:   Thu, 2 Jul 2020 10:36:58 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: single: support #pinctrl-cells = 2
Message-ID: <20200702173658.GN37466@atomide.com>
References: <20200701013320.130441-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701013320.130441-1-drew@beagleboard.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Drew Fustini <drew@beagleboard.org> [200701 01:34]:
> Currently, pinctrl-single only allows #pinctrl-cells = 1.
> 
> This series will allow pinctrl-single to also support #pinctrl-cells = 2
> 
> If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
> pcs_parse_one_pinctrl_entry() does an OR operation on conf and mux to
> get the value to store in the register.
>     
> To take advantage of #pinctrl-cells = 2, the AM33XX_PADCONF macro in
> omap.h is modified to keep pin conf and pin mux values separate.
> 
> change log:
> - v4: squash patches 2 and 3 together so that git biesct will not result
>   in a boot failure

Thanks for updating it. Best that Linus queues both patches via
the pinctrl tree when no more comments:

Acked-by: Tony Lindgren <tony@atomide.com>
