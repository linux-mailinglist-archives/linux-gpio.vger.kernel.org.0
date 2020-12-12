Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB3F02D860C
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 11:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437288AbgLLKuH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Dec 2020 05:50:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:53886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405700AbgLLKty (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 12 Dec 2020 05:49:54 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49B592184D;
        Sat, 12 Dec 2020 10:49:13 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=localhost.localdomain)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1ko2Sd-000gY5-1w; Sat, 12 Dec 2020 10:49:11 +0000
From:   Marc Zyngier <maz@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Archana Sathyakumar <asathyak@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-gpio@vger.kernel.org, Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH v4 1/4] irqchip: qcom-pdc: Fix phantom irq when changing between rising/falling
Date:   Sat, 12 Dec 2020 10:48:55 +0000
Message-Id: <160777008910.485613.16353166280006901459.b4-ty@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211141514.v4.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
References: <20201211141514.v4.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: dianders@chromium.org, tglx@linutronix.de, linus.walleij@linaro.org, bjorn.andersson@linaro.org, ilina@codeaurora.org, linux-arm-msm@vger.kernel.org, asathyak@codeaurora.org, mkshah@codeaurora.org, neeraju@codeaurora.org, sramana@codeaurora.org, rnayak@codeaurora.org, linux-kernel@vger.kernel.org, swboyd@chromium.org, linux-gpio@vger.kernel.org, agross@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 11 Dec 2020 14:15:35 -0800, Douglas Anderson wrote:
> We have a problem if we use gpio-keys and configure wakeups such that
> we only want one edge to wake us up.  AKA:
>   wakeup-event-action = <EV_ACT_DEASSERTED>;
>   wakeup-source;
> 
> Specifically we end up with a phantom interrupt that blocks suspend if
> the line was already high and we want wakeups on rising edges (AKA we
> want the GPIO to go low and then high again before we wake up).  The
> opposite is also problematic.
> 
> [...]

Applied to irq/irqchip-next, thanks!

[1/4] irqchip: qcom-pdc: Fix phantom irq when changing between rising/falling
      commit: 2f5fbc4305d07725bfebaedb09e57271315691ef

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


