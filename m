Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29F47223B94
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 14:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgGQMsz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 08:48:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:50288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726056AbgGQMsy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 08:48:54 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 24969206F4;
        Fri, 17 Jul 2020 12:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594990134;
        bh=JicYhAGOKzhPBf+VglJ1C3AyTSIJ0ZQ1V5JPVESHxps=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Euhq4VpE6K8tsdd/DG+pg9V0RQHPklthe2SDVGgYQHTZi8HrGEcuhs4jCKPDgSI1y
         6A4KNsIw7xeRnsUKFF2iIhxvjcLhyVcN/ygb8iWgC6lYwblHlZVnsPpDSlZbwthVGk
         IkYxnoWHUoXyqHlBixnmKoHBRZLLqeRoYSoGR27c=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jwPnI-00Ccsm-Jz; Fri, 17 Jul 2020 13:48:52 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, marex@denx.de,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [RESEND PATCH] irqchip/stm32-exti: Use the hwspin_lock_timeout_in_atomic() API
Date:   Fri, 17 Jul 2020 13:48:42 +0100
Message-Id: <159499001592.546505.1419567168123690034.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706081115.25180-1-alexandre.torgue@st.com>
References: <20200706081115.25180-1-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, jason@lakedaemon.net, tglx@linutronix.de, linux-kernel@vger.kernel.org, marex@denx.de, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 6 Jul 2020 10:11:15 +0200, Alexandre Torgue wrote:
> Now that the hwspin_lock_timeout_in_atomic() API is available use it.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 
> diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
> index faa8482c8246..c7ab69694931 100644
> --- a/drivers/irqchip/irq-stm32-exti.c
> +++ b/drivers/irqchip/irq-stm32-exti.c
> @@ -25,7 +25,6 @@
>  #define IRQS_PER_BANK 32
> 
> [...]

Applied to irq/irqchip-5.9, thanks!

[1/1] irqchip/stm32-exti: Use the hwspin_lock_timeout_in_atomic() API
      commit: e5c19cf32b68d8c59cd3e94e257ab030f07db7d6

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


