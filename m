Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F943284A4D
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Oct 2020 12:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgJFK3L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Oct 2020 06:29:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:60760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725891AbgJFK3K (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Oct 2020 06:29:10 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA15C20757;
        Tue,  6 Oct 2020 10:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601980150;
        bh=cBWCt+A2bRIWJ+VhgHRDaDIaurfO5bRRNnXpUH907KU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ojjSyzvEVSo/f69Ig7Ba0XozHpeJ2Q/EH6QfO7Z21WjRmQm/WQr+alLVFDmw0e8NE
         JsOR/KobyvviaS+YCc4yX4u/dWd9QiX/jfAMPR1xSkmOzviX3+OiY1yYiyLWEKLHqX
         8kJx49CZgmWOSONR6+V02O0tHq3LwhOe/B9E3NvE=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=hot-poop.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kPkDT-0002fR-No; Tue, 06 Oct 2020 11:29:07 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     linus.walleij@linaro.org, evgreen@chromium.org, mka@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>, swboyd@chromium.org,
        bjorn.andersson@linaro.org
Cc:     ilina@codeaurora.org, linux-kernel@vger.kernel.org,
        jason@lakedaemon.net, lsrao@codeaurora.org, tglx@linutronix.de,
        rnayak@codeaurora.org, linux-gpio@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 0/6] irqchip: qcom: pdc: Introduce irq_set_wake call
Date:   Tue,  6 Oct 2020 11:29:03 +0100
Message-Id: <160198012786.3008417.11128455090479728901.b4-ty@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <1601267524-20199-1-git-send-email-mkshah@codeaurora.org>
References: <1601267524-20199-1-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: linus.walleij@linaro.org, evgreen@chromium.org, mka@chromium.org, mkshah@codeaurora.org, swboyd@chromium.org, bjorn.andersson@linaro.org, ilina@codeaurora.org, linux-kernel@vger.kernel.org, jason@lakedaemon.net, lsrao@codeaurora.org, tglx@linutronix.de, rnayak@codeaurora.org, linux-gpio@vger.kernel.org, agross@kernel.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 28 Sep 2020 10:01:58 +0530, Maulik Shah wrote:
> Changes in v6:
> - Update commit message more descriptive in v5 patch 1
> - Symmetrically enable/disable wakeirqs during suspend/resume in v5 patch 3
> - Include Acked-by and Reviewed-by tags from v5 series
> 
> Changes in v5:
> - Update commit subject in v4 patch 1
> - Add more details to commit message in v4 patch 2
> - Add change to enable wake irqs during suspend using new flag in irqchip
> - Use this in PDC and qcom pinctrl driver to enable wakeirqs on suspend
> - Make for loop more readable and add more details in commit in v4 patch 7
> 
> [...]

Applied to irq/irqchip-next, thanks!

[1/6] pinctrl: qcom: Set IRQCHIP_SET_TYPE_MASKED and IRQCHIP_MASK_ON_SUSPEND flags
      commit: c5f72aeb659eb2f809b9531d759651514d42aa3a
[2/6] pinctrl: qcom: Use return value from irq_set_wake() call
      commit: f41aaca593377a4fe3984459fd4539481263b4cd
[3/6] genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
      commit: 90428a8eb4947f9c7c905a178f3520dc7e2ee6d2
[4/6] pinctrl: qcom: Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
      commit: dd87bd09822c294a3c7c4daf11f11a9f81222f80
[5/6] irqchip/qcom-pdc: Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
      commit: 299d7890792e75065b906f83fcb0ca92e5c8c072
[6/6] irqchip/qcom-pdc: Reset PDC interrupts during init
      commit: d7bc63fa20b8a3b0d0645bed1887848c65c01529

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


