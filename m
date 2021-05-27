Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36937392D6B
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 14:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234395AbhE0MDA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 08:03:00 -0400
Received: from muru.com ([72.249.23.125]:32784 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234143AbhE0MC7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 May 2021 08:02:59 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CE60480A8;
        Thu, 27 May 2021 12:01:30 +0000 (UTC)
Date:   Thu, 27 May 2021 15:01:21 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Aswath Govindraju <a-govindraju@ti.com>
Subject: Re: [PATCH v2 0/5] dt-bindings: gpio: omap: Convert to json-schema
Message-ID: <YK+KEYncDc6pCb1X@atomide.com>
References: <20210525175858.11611-1-grygorii.strashko@ti.com>
 <2dbbf0f1-be2c-de11-8ffd-77a06688a83d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dbbf0f1-be2c-de11-8ffd-77a06688a83d@ti.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [210526 10:06]:
> Hi Tony, Linus, Bartosz,
> 
> On 25/05/2021 20:58, Grygorii Strashko wrote:
> > Hi
> > 
> > Convert the OMAP GPIO Device Tree binding documentation to json-schema.
> > The GPIO hogs node names defined to end with a 'hog' suffix.
> > 
> > All existing GPIO Hogs fixed to follow above naming convention
> > before changing the binding to avoid dtbs_check warnings.
> 
> There is one note. The DT bindings change, without DTS changes, will
> cause dtbs_check warnings, so all these patches better to be merged through one tree.

So with the binding changes applied, I'm applying the dts changes
to omap-for-v5.14/dt thanks.

Regards,

Tony
