Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC490223BA4
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 14:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgGQMtF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 08:49:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:50408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbgGQMs5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 08:48:57 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C61E8207F5;
        Fri, 17 Jul 2020 12:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594990136;
        bh=px+ZOr5vGWOD2WY1nkEe6GE/wiHxQX4NyNmrfPIeG7M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iu1cvXPAlzooZ6RFLUKS78s8jwgqZAVrA9BXFIpWJcw6EZk29M3soHUxoO9YF+xom
         D1Ol+o6cPd9LLJw7IXEVrnGoJn+zLuPKJoDYv87UVtj66Ld5C2ctFO/x4YfxsH1r75
         jVHgRBdYRlt/EZ1YztBPKtyHMPJHD7Bcrh4N2rDA=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jwPnL-00Ccsm-AZ; Fri, 17 Jul 2020 13:48:55 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Cc:     marex@denx.de, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Joerg Roedel <joro@8bytes.org>, Andy Gross <agross@kernel.org>,
        Todd Kjos <tkjos@google.com>, iommu@lists.linux-foundation.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v3 0/3] Allow for qcom-pdc to be loadable as a module
Date:   Fri, 17 Jul 2020 13:48:45 +0100
Message-Id: <159499001592.546505.10441967473975319808.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710231824.60699-1-john.stultz@linaro.org>
References: <20200710231824.60699-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, jason@lakedaemon.net, tglx@linutronix.de, john.stultz@linaro.org, linux-kernel@vger.kernel.org, marex@denx.de, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, joro@8bytes.org, agross@kernel.org, tkjos@google.com, iommu@lists.linux-foundation.org, linus.walleij@linaro.org, gregkh@linuxfoundation.org, mkshah@codeaurora.org, ilina@codeaurora.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, saravanak@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 10 Jul 2020 23:18:21 +0000, John Stultz wrote:
> This patch series provides exports and config tweaks to allow
> the qcom-pdc driver to be able to be configured as a permement
> modules (particularlly useful for the Android Generic Kernel
> Image efforts).
> 
> This was part of a larger patch series, to enable qcom_scm
> driver to be a module as well, but I've split it out as there
> are some outstanding objections I still need to address with
> the follow-on patches, and wanted to see if progress could be
> made on this subset of the series in the meantime.
> 
> [...]

Applied to irq/irqchip-5.9, thanks!

[1/3] irqdomain: Export irq_domain_update_bus_token
      commit: ce8cefa53c06cd98607125c52c91e74373a893a0
[2/3] genirq: Export irq_chip_retrigger_hierarchy and irq_chip_set_vcpu_affinity_parent
      commit: 96703f046c42f8ab15e735953cbfee572c717e2d
[3/3] irqchip/qcom-pdc: Allow QCOM_PDC to be loadable as a permanent module
      commit: 5ef7f1bbf9f56c5380c4d876655920cac92008e5

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


