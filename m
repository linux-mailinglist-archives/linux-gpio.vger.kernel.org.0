Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1118222D811
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 16:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgGYOX5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 10:23:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:42078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727790AbgGYOXw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 25 Jul 2020 10:23:52 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3BC62070E;
        Sat, 25 Jul 2020 14:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595687032;
        bh=BAz1TW4/bVZUS2IHFjl3Yw+2naG6uIjsWVeWFxtMKUA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fdAxckovDYl++IXQ+ImgWscI/ZX1zozAjt0Ut7vpMiEqp2GmXLrvSyI3ODI0UOCfz
         bCtN67WyIWhDJ6onbMFc4cLzojDDf/Yq7h8UG/Ms4tujP+gS1GZ66vEXmiiAc/nYV9
         jh/86A0RQ5FW3rwdW7gkxMWCu1WwvtzahHK/cMy0=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jzL5a-00Er45-Ed; Sat, 25 Jul 2020 15:23:50 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Jason Cooper <jason@lakedaemon.net>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        marex@denx.de, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Loda Chou <loda.chou@mediatek.com>,
        kernel-team@android.com, linux-mediatek@lists.infradead.org,
        CC Hwang <cc.hwang@mediatek.com>,
        Hanks Chen <hanks.chen@mediatek.com>,
        John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v3 0/4] irqchip: Add IRQCHIP_PLATFORM_DRIVER helper macros
Date:   Sat, 25 Jul 2020 15:23:34 +0100
Message-Id: <159568680935.564881.11936174169505990646.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200718000637.3632841-1-saravanak@google.com>
References: <20200718000637.3632841-1-saravanak@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jason@lakedaemon.net, alexandre.torgue@st.com, tglx@linutronix.de, bjorn.andersson@linaro.org, agross@kernel.org, saravanak@google.com, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, marex@denx.de, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, loda.chou@mediatek.com, kernel-team@android.com, linux-mediatek@lists.infradead.org, cc.hwang@mediatek.com, hanks.chen@mediatek.com, john.stultz@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 17 Jul 2020 17:06:33 -0700, Saravana Kannan wrote:
> Made a series out of the previous v2 patch + some example uses of the
> macros.
> 
> Not sure if the MTK changes work (just compile tested), but saw that
> Hanks was trying to make those drivers into tristate. So I assume
> they'll work as platform drivers. Please wait for MTK Ack before picking
> up patches 3 and 4.
> 
> [...]

Applied to irq/irqchip-5.9, thanks!

[1/4] irqchip: Add IRQCHIP_PLATFORM_DRIVER_BEGIN/END and IRQCHIP_MATCH helper macros
      commit: f3b5e608ed6d17bdf04dacbf2374f10d51fe9b09
[2/4] irqchip/qcom-pdc: Switch to using IRQCHIP_PLATFORM_DRIVER helper macros
      commit: 04741740254cd83fb4f2b7747aeb35202104f8fe
[3/4] irqchip/mtk-sysirq: Convert to a platform driver
      commit: 3ae3022690e6787839dafa8ea3496450248b53e1
[4/4] irqchip/mtk-cirq: Convert to a platform driver
      commit: 538b63351607960ff2249460089daa31337ddeba

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


