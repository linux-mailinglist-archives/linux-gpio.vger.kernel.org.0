Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B645D22D801
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 16:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbgGYOXu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 10:23:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:41970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726652AbgGYOXu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 25 Jul 2020 10:23:50 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0680206C1;
        Sat, 25 Jul 2020 14:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595687029;
        bh=gHxfx7OPA5x5BkafsPOgmHBkYQoEY8AtzlacoZATrgI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mIY3s6DgqCJR2qfz8vcX2kJNJyqa2lni/ckRLWoCpJnVdyurtu2fhvgfsEcaSNMQB
         Ol3h0U3qH+GlX8O6Pjjac6BEDawEUChJ2GdTt6TZ76Udy654eqiOud+XfR5Qe9kMe9
         /5vpJDxMeqLeQYM8P52aY++l+FmyAkuaMihkkE4Y=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jzL5Y-00Er45-96; Sat, 25 Jul 2020 15:23:48 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jason Cooper <jason@lakedaemon.net>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        marex@denx.de, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] irqchip/stm32-exti: map direct event to irq parent
Date:   Sat, 25 Jul 2020 15:23:31 +0100
Message-Id: <159568680935.564881.645108348883393903.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717140717.29606-1-alexandre.torgue@st.com>
References: <20200717140717.29606-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jason@lakedaemon.net, alexandre.torgue@st.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, marex@denx.de, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 17 Jul 2020 16:07:17 +0200, Alexandre Torgue wrote:
> EXTI lines are mainly used to wake-up system from CStop low power mode.
> Currently, if a device wants to use a EXTI (direct) line as wakeup line,
> it has to declare 2 interrupts:
>  - one for EXTI used to wake-up system (with dedicated_wake_irq api).
>  - one for GIC used to get the wake up reason inside the concerned IP.
> 
> This split is not really needed as each EXTI line is actually "linked " to
> a GIC. So to avoid this useless double interrupt management in each
> wake-up driver, this patch lets the STM32 EXTI driver abstract it by
> mapping each EXTI line to his corresponding GIC.

Applied to irq/irqchip-5.9, thanks!

[1/1] irqchip/stm32-exti: map direct event to irq parent
      commit: 99e05524bc722c8d3c1ab9c817afcb6829dbded3

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


