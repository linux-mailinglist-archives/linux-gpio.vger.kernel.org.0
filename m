Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C91D42DBD3
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 16:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhJNOiG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Oct 2021 10:38:06 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:3259 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbhJNOiF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Oct 2021 10:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634222161; x=1665758161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UKR5vWCNAno42pYINcB56F+Pp43CdX14ETbyIT5ZJIE=;
  b=nTMRZCxtF/9FlO3KQ+OJ8eP+zipDJoNUiJXFesovnC6jGcIP5oyGnPwx
   f0eUCI02P6WNbUrdBWXpB8C+5Ci3t0nZ3MU7hsHHku5nB9A/e5hk+NjLD
   4HAwMYZWFLktrVKvOzvN8pdkSZsDzYm8WcRtMaml35NZ8jr6INXIuN48X
   nqtiBhi8XQ00rxWNPTzOcbafgPKNHNCNYSD+9JvZx9PjnySmdf+Vj0iL/
   91d/ZM3dUxu5I1UtbEuGx+vkJ+grVqyMPzXjuY5cSrzKul0fUF58lGpW3
   3zhDtPH9fLcQBVJ/BgOyfdhDINWKH3UEoZaqAlLgUARLKO0f5mMHuGyKC
   g==;
IronPort-SDR: d+BId0l/vwLu4oBH7WCcy4CC1hRX5GfLxzG3TEWawvTRBPtcFMbCtQXmqjo8hNdV+IgHLQyvuR
 g96YwPTZVfzII8Z51wwTCgp+297MaRniVrh2iuBLuqJN4VIZ9PdVCau9RMycnZMxcPqyeZYAPF
 bz3Mk/s2FyLHUrNNg+NmSAU4Q2oHrAGxVGYo4ZDXxt4+ZrhdCI0O8L8Ju0nhNjE6w+i7khBxc6
 XlvJ1sbu5NIpsDT9eV06C4LcwA3DL/Kf4BSlV/LPt0h3vMrWTA8yvbZAeSqg0OOlBjrxcXuTPh
 IkFY3b7qthC/QuYMdgxw3JYz
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="140290254"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Oct 2021 07:36:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 14 Oct 2021 07:36:00 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 14 Oct 2021 07:35:59 -0700
Date:   Thu, 14 Oct 2021 16:37:33 +0200
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
CC:     <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <lars.povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
        <UNGLinuxDriver@microchip.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] pinctrl: microchip sgpio: use reset driver
Message-ID: <20211014143733.t2dov6ajjebxlht6@soft-dev3-1.localhost>
References: <20211014085929.2579695-1-horatiu.vultur@microchip.com>
 <20211014085929.2579695-3-horatiu.vultur@microchip.com>
 <2874212d2f9462880d1b0aae35296162e1277e62.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <2874212d2f9462880d1b0aae35296162e1277e62.camel@pengutronix.de>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 10/14/2021 13:47, Philipp Zabel wrote:
> 
> Hi Horatiu,

Hi Philipp
> 
> > +     reset = devm_reset_control_get_shared(&pdev->dev, "switch");
> 
> Please use devm_reset_control_get_optional_shared() for optional resets
> and handle errors. That will return NULL in case the optional reset is
> not specified in the device tree.

I will do that.

> 
> It seems weird to me that the reset input to the GPIO controller is
> called "switch" reset. You can request a single unnamed reset with
> 
>         reset = devm_reset_control_get_shared(&pdev->dev, NULL);
> 
> although that would limit future extendability in case this driver will
> ever require to handle multiple separate resets. If you decide to
> request the reset control by name, the yaml binding should specify the
> same name.

I think this requires a little bit more explanation from my side. On
lan966x we are facing the following issue. When we try to reset just the
switch core then also the sgpio device was reset and there was no way
from HW perspective to prevent this.

So our solutions was to create a reset driver[1] that will be triggered
only one time, by the sgpio driver or by the switch driver. That is the
reason why it was called "switch" reset. And that is the purpose of this
patch to allow the sgpio driver to reset the switch in case is probed
before the switch driver so it would not get reset after that.

> 
> > +     if (!IS_ERR(reset))
> > +             reset_control_reset(reset);
> 
> With optional resets, this can be just:
> 
>         reset_control_reset(reset);

Great I will do that.

> 
> regards
> Philipp

[1] https://lore.kernel.org/lkml/20211013073807.2282230-1-horatiu.vultur@microchip.com/

-- 
/Horatiu
