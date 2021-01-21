Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA8D2FE434
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 08:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727629AbhAUHlD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 02:41:03 -0500
Received: from muru.com ([72.249.23.125]:55486 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727223AbhAUHUC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Jan 2021 02:20:02 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id BE01688B3;
        Thu, 21 Jan 2021 07:19:18 +0000 (UTC)
Date:   Thu, 21 Jan 2021 09:06:44 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Emmanuel Vadot <manu@bidouilliste.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: clarify #pinctrl-cells for pinctrl-single,pins
Message-ID: <YAkoBAkaj63voakr@atomide.com>
References: <20210120050342.320704-1-drew@beagleboard.org>
 <20210120090108.bbdee781a237cb931a572323@bidouilliste.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120090108.bbdee781a237cb931a572323@bidouilliste.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Emmanuel Vadot <manu@bidouilliste.com> [210120 08:01]:
> On Tue, 19 Jan 2021 21:03:44 -0800
> Drew Fustini <drew@beagleboard.org> wrote:
> 
> > Document that #pinctrl-cells can be 1 or 2 for pinctrl-single,pins
...

>  Reviewed-by: Emmanuel Vadot <manu@FreeBSD.org>
> 
>  Thanks, now the docs make more sense :)

Looks good to me too:

Reviewed-by: Tony Lindgren <tony@atomide.com>
