Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6338F15D742
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 13:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbgBNMUk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 07:20:40 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48879 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbgBNMUk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2020 07:20:40 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j2ZxW-00022B-N5; Fri, 14 Feb 2020 13:20:38 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j2ZxU-0008Eb-NV; Fri, 14 Feb 2020 13:20:36 +0100
Date:   Fri, 14 Feb 2020 13:20:36 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thorsten Scherer <thorsten.scherer@eckelmann.de>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel-janitors@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] gpio: siox: use raw spinlock for irq related locking
Message-ID: <20200214122036.n3zjx25b7kxqlr4o@pengutronix.de>
References: <87d0al4600.fsf@nanos.tec.linutronix.de>
 <20200211135121.15752-1-uwe@kleine-koenig.org>
 <20200214110238.zkbfyzfjvkzipgjr@ws067.eckelmann.group>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200214110238.zkbfyzfjvkzipgjr@ws067.eckelmann.group>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Thorsten,

On Fri, Feb 14, 2020 at 12:02:38PM +0100, Thorsten Scherer wrote:
> AFAICT this is all good.
> 
> Unfortunately i don't have any idea on how to test out the difference
> this patch makes on a real SIOX.

When I started looking into the problem I expected that the lock
debugging would catch these problems. But either I did something wrong
or there is no mechanism that catches

 - a spinlock is taken when there is already a raw spinlock taken
 - spin_lock_irq is used with irqs already off

And I wonder if there are reasons I don't see that make these two tests
a bad idea.

> Any hints? Is it necessary at all?

Apart from "normal" testing that SIOX still works I have no good
suggestion. Having said that I would be surprised if my patch breaked
something. (But it wouldn't be the first time such a surprise happens
:-)

Best regards
Uwe
-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
