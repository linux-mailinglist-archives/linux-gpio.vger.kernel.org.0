Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 685381037DD
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 11:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728823AbfKTKsk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 05:48:40 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:56270 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728760AbfKTKsj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 05:48:39 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1iXNXC-000515-1D; Wed, 20 Nov 2019 11:48:30 +0100
Date:   Wed, 20 Nov 2019 11:48:28 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Marc Zyngier <maz@kernel.org>
cc:     Yash Shah <yash.shah@sifive.com>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, palmer@dabbelt.com,
        "Paul Walmsley ( Sifive)" <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, jason@lakedaemon.net, bmeng.cn@gmail.com,
        atish.patra@wdc.com, Sagar Kadam <sagar.kadam@sifive.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Sachin Ghadi <sachin.ghadi@sifive.com>
Subject: Re: [PATCH v2 1/5] genirq: introduce irq_domain_translate_onecell
In-Reply-To: <31ed00455bd8374b26ea6b649c14e288@www.loen.fr>
Message-ID: <alpine.DEB.2.21.1911201147440.6731@nanos.tec.linutronix.de>
References: <1574233128-28114-1-git-send-email-yash.shah@sifive.com> <1574233128-28114-2-git-send-email-yash.shah@sifive.com> <alpine.DEB.2.21.1911201034240.6731@nanos.tec.linutronix.de> <31ed00455bd8374b26ea6b649c14e288@www.loen.fr>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 20 Nov 2019, Marc Zyngier wrote:

> On 2019-11-20 09:34, Thomas Gleixner wrote:
> > On Wed, 20 Nov 2019, Yash Shah wrote:
> > 
> > > Add a new function irq_domain_translate_onecell() that is to be used as
> > > the translate function in struct irq_domain_ops for the v2 IRQ API.
> > 
> > What is the V2 IRQ API?
> 
> I believe that's a reference to a rather misleading comment in irqdomain.h:
> 
> #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
> 	/* extended V2 interfaces to support hierarchy irq_domains */
> 
> which we could drop, as everything refers to hierarchical domain
> support.

Yes, which reminds me that we also need to update the horribly stale
documentation of all this mess.

Thanks,

	tglx
