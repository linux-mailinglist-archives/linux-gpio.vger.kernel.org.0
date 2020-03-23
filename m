Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDDE18FD93
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2020 20:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727835AbgCWTZX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Mar 2020 15:25:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:60520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727675AbgCWTZX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Mar 2020 15:25:23 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 116FC206F8;
        Mon, 23 Mar 2020 19:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584991522;
        bh=/NMyoIndtBy/uN2Nsb9xjYgoiz267TfqlBXGqvQ5aN4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=X+lbU52fWuhOblpsezheiDLXs/V9cliJVLzB2nfh0dDGkGt54V7PEXXyeyLKstS0L
         YNCmG0alVYdue7YDyZ7NG5OKHCOc6DZmGhUkRpVhu9G1FBpFrD1egvDgoiEqUm/dDV
         aXyHk3dJOBUdhuKnjkn/yGo1JsltgN5O2nBqHr8M=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jGShM-00F3Iu-9Z; Mon, 23 Mar 2020 19:25:20 +0000
Date:   Mon, 23 Mar 2020 19:25:19 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] pinctrl: stm32: Add level interrupt support to
 gpio irq chip
Message-ID: <20200323192519.1bd1dc5f@why>
In-Reply-To: <a7fc5e43-34c2-a4e6-e0c5-1584f17fb024@denx.de>
References: <20200219143229.18084-1-alexandre.torgue@st.com>
        <20200219143229.18084-3-alexandre.torgue@st.com>
        <CACRpkdZ7uq4U6GBQQQh=pTLf4wW3KfH3Zrz9z_3ZQgoaJD9Ynw@mail.gmail.com>
        <c991edca3e8925cf0489c0a5676f77b2@kernel.org>
        <a7fc5e43-34c2-a4e6-e0c5-1584f17fb024@denx.de>
Organization: Approximate
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: marex@denx.de, linus.walleij@linaro.org, alexandre.torgue@st.com, tglx@linutronix.de, jason@lakedaemon.net, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 23 Mar 2020 20:04:23 +0100
Marek Vasut <marex@denx.de> wrote:

> On 2/20/20 10:17 AM, Marc Zyngier wrote:
> > On 2020-02-20 09:04, Linus Walleij wrote:
> >> On Wed, Feb 19, 2020 at 3:32 PM Alexandre Torgue
> >> <alexandre.torgue@st.com> wrote:
> >>
> >>> GPIO hardware block is directly linked to EXTI block but EXTI handles
> >>> external interrupts only on edge. To be able to handle GPIO interrupt on
> >>> level a "hack" is done in gpio irq chip: parent interrupt (exti irq
> >>> chip)
> >>> is retriggered following interrupt type and gpio line value.
> >>>
> >>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> >>> Tested-by: Marek Vasut <marex@denx.de>
> >>
> >> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >>
> >> If Marc want to merge it with patch 1/2 go ahead!
> > 
> > I'll queue the whole thing for 5.7.
> 
> I have a feeling this doesn't work with threaded interrupts.
> 
> If the interrupt handler runs in a thread context, the EOI will happen
> almost right away (while the IRQ handler runs) and so will the code
> handling the IRQ retriggering. But since the IRQ handler still runs and
> didn't return yet, the retriggering doesn't cause the IRQ handler to be
> called again once it finishes, even if the IRQ line is still asserted.
> And that could result in some of the retriggers now happening I think.
> Or am I doing something wrong ?

Wouldn't the hardirq handler mask the interrupt? This should certainly
be the case when IRQF_ONESHOT is set.

	M.
-- 
Jazz is not dead. It just smells funny...
