Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 866A33E9FBC
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 09:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234251AbhHLHse (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 03:48:34 -0400
Received: from muru.com ([72.249.23.125]:42534 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232186AbhHLHsb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Aug 2021 03:48:31 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7A2C680E2;
        Thu, 12 Aug 2021 07:48:26 +0000 (UTC)
Date:   Thu, 12 Aug 2021 10:48:04 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Ben Hutchings <ben.hutchings@mind.be>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH] gpio: omap: Enable software fallback for long debounce
 periods
Message-ID: <YRTSNGsy7gH7z2ya@atomide.com>
References: <20210811202751.GB18930@cephalopod>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811202751.GB18930@cephalopod>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Ben Hutchings <ben.hutchings@mind.be> [210811 20:28]:
> omap2_set_gpio_debounce() currently returns -EINVAL if the debounce
> period is too long to be handled in hardware.  gpiolib provides a
> software fallback, but it is used only if the driver returns
> -ENOTSUPP.
> 
> * Enable the software fallback by using the expected error code
> * Downgrade the log message about this from info to debug, since
>   the error is now handled

Looks good to me:

Reviewed-by: Tony Lindgren <tony@atomide.com>
