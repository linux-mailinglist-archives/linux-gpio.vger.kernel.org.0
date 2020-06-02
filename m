Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D7D1EBD5E
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2020 15:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgFBNv7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jun 2020 09:51:59 -0400
Received: from muru.com ([72.249.23.125]:56720 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725940AbgFBNv7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Jun 2020 09:51:59 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 50EC180C5;
        Tue,  2 Jun 2020 13:52:49 +0000 (UTC)
Date:   Tue, 2 Jun 2020 06:51:55 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Drew Fustini <drew@beagleboard.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: AM33xx-l4: add gpio-ranges
Message-ID: <20200602135155.GE37466@atomide.com>
References: <20200602131428.GA496390@x1>
 <803e2d78-28ba-0816-dbb5-d441d7659a91@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <803e2d78-28ba-0816-dbb5-d441d7659a91@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [200602 13:44]:
> 
> 
> On 02/06/2020 16:14, Drew Fustini wrote:
> > Add gpio-ranges properties to the gpio controller nodes.
> > 
> > These gpio-ranges were created based on "Table 9-10. CONTROL_MODULE
> > REGISTERS" in the  "AM335x Technical Reference Manual" [0] and "Table
> > 4-2. Pin Attributes" in the "AM335x Sitara Processor datasheet" [1].
> > A csv file with this data is available for reference [2].
> 
> It will be good if you can explain not only "what" is changed, but
> also "why" it's needed in commit message.

Also, please check (again) that this is the same for all the am3
variants. For omap3, we had different pad assignments even between
SoC revisions. Different pad routings should be easy to deal with
in the dts if needed though.

Regards,

Tony
