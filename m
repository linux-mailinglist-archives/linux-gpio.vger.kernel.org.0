Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 461D7103766
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 11:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbfKTKYR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 05:24:17 -0500
Received: from inca-roads.misterjones.org ([213.251.177.50]:54174 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727259AbfKTKYR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Nov 2019 05:24:17 -0500
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1iXN9a-0001Lb-Iw; Wed, 20 Nov 2019 11:24:06 +0100
To:     Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 1/5] genirq: introduce =?UTF-8?Q?irq=5Fdomain=5Ftra?=  =?UTF-8?Q?nslate=5Fonecell?=
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 20 Nov 2019 10:24:06 +0000
From:   Marc Zyngier <maz@kernel.org>
Cc:     Yash Shah <yash.shah@sifive.com>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <palmer@dabbelt.com>,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        <aou@eecs.berkeley.edu>, <jason@lakedaemon.net>,
        <bmeng.cn@gmail.com>, <atish.patra@wdc.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Sachin Ghadi <sachin.ghadi@sifive.com>
In-Reply-To: <alpine.DEB.2.21.1911201034240.6731@nanos.tec.linutronix.de>
References: <1574233128-28114-1-git-send-email-yash.shah@sifive.com>
 <1574233128-28114-2-git-send-email-yash.shah@sifive.com>
 <alpine.DEB.2.21.1911201034240.6731@nanos.tec.linutronix.de>
Message-ID: <31ed00455bd8374b26ea6b649c14e288@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: tglx@linutronix.de, yash.shah@sifive.com, linus.walleij@linaro.org, bgolaszewski@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, jason@lakedaemon.net, bmeng.cn@gmail.com, atish.patra@wdc.com, sagar.kadam@sifive.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2019-11-20 09:34, Thomas Gleixner wrote:
> On Wed, 20 Nov 2019, Yash Shah wrote:
>
>> Add a new function irq_domain_translate_onecell() that is to be used 
>> as
>> the translate function in struct irq_domain_ops for the v2 IRQ API.
>
> What is the V2 IRQ API?

I believe that's a reference to a rather misleading comment in 
irqdomain.h:

#ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
	/* extended V2 interfaces to support hierarchy irq_domains */

which we could drop, as everything refers to hierarchical domain
support.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
