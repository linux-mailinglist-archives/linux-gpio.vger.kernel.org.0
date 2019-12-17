Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E05FE1224CE
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2019 07:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfLQGkQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Dec 2019 01:40:16 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46831 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbfLQGkP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Dec 2019 01:40:15 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ih6Wg-0006mX-3m; Tue, 17 Dec 2019 07:40:10 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ih6Wf-0001MH-Gn; Tue, 17 Dec 2019 07:40:09 +0100
Date:   Tue, 17 Dec 2019 07:40:09 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [RESEND PATCH v3 3/3] pinctrl: da9062: add driver support
Message-ID: <20191217064009.GB31182@pengutronix.de>
References: <20191212160413.15232-1-m.felsch@pengutronix.de>
 <20191212160413.15232-4-m.felsch@pengutronix.de>
 <AM5PR1001MB0994E2D72A95E4AC4796F80A80550@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191216074734.ctjxx6rqtj6mt2dw@pengutronix.de>
 <CACRpkdbZ67jp64oMS0Q=aDuo18i_fT22grST0qSVjk_9EV=4hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbZ67jp64oMS0Q=aDuo18i_fT22grST0qSVjk_9EV=4hw@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:38:49 up 109 days, 18:52, 74 users,  load average: 0.32, 0.49,
 0.49
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19-12-16 11:33, Linus Walleij wrote:
> On Mon, Dec 16, 2019 at 8:47 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > Nice catch, Linus is it okay to add this as follow up patch? The current
> > patch isn't wrong without the 'PIN_CONFIG_BIAS_DISABLE' case.
> 
> No strong opinion on that as long as the result is running code.

Of course the code is running and was tested. Just didn't covered this
use case.

Adam is this okay with you?

Regards,
  Marco

> Yours,
> Linus Walleij
> 
