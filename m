Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F07D362E87
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Apr 2021 10:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhDQI27 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Apr 2021 04:28:59 -0400
Received: from muru.com ([72.249.23.125]:55438 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229870AbhDQI27 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 17 Apr 2021 04:28:59 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1FB7F80CD;
        Sat, 17 Apr 2021 08:29:49 +0000 (UTC)
Date:   Sat, 17 Apr 2021 11:28:28 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH] gpio: omap: Save and restore sysconfig
Message-ID: <YHqcLHxnCDfcd+6s@atomide.com>
References: <20210415085305.56413-1-tony@atomide.com>
 <67113b0b-5e5f-b2f4-1b1c-b58a1055f0ed@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67113b0b-5e5f-b2f4-1b1c-b58a1055f0ed@ti.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [210415 23:48]:
> On 15/04/2021 11:53, Tony Lindgren wrote:
> > As we are using cpu_pm to save and restore context, we must also save and
> > restore the timer sysconfig register TIOCP_CFG. This is needed because
> > we are not calling PM runtime functions at all with cpu_pm.
> 
> Smth. is wrong with description.

Oops yeah sorry about that. Both timer-ti-dm and gpio-omap suffer from
the same issue since the cpu_pm conversion. Will post v2.

Regards,

Tony
