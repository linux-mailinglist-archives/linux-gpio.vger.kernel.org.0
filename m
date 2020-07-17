Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74902223BA3
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 14:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgGQMtF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 08:49:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:50488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726696AbgGQMs7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 08:48:59 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7118B207FB;
        Fri, 17 Jul 2020 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594990139;
        bh=5POnxabUMyqHA1KxDC3Te6qQKnu8fFa8/yigj7vMA2A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2uJXQ1KfkRiG4WbZZf4pM/IYginKG2nTtWy/qrZp7ICtuC25ONpKgTlR0nhflNE5t
         u4nTdxiavRPloJYgVH1tyKiL+mVOXDqf9h5PcQVnPU6JCzvQPhm+Q1mFa8Ey1vj8MU
         AugpzmI4sHeoRDoyLqhcsAhurpb+Cu5GEF3pqqBM=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jwPnO-00Ccsm-0z; Fri, 17 Jul 2020 13:48:58 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Zenghui Yu <yuzenghui@huawei.com>
Cc:     linux-kernel@vger.kernel.org, marex@denx.de,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        wanghaibin.wang@huawei.com
Subject: Re: [PATCH] genirq/irqdomain: Remove redundant NULL pointer check on fwnode
Date:   Fri, 17 Jul 2020 13:48:49 +0100
Message-Id: <159499001592.546505.17916680802608483979.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716083905.287-1-yuzenghui@huawei.com>
References: <20200716083905.287-1-yuzenghui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, jason@lakedaemon.net, tglx@linutronix.de, yuzenghui@huawei.com, linux-kernel@vger.kernel.org, marex@denx.de, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, wanghaibin.wang@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 16 Jul 2020 16:39:05 +0800, Zenghui Yu wrote:
> The is_fwnode_irqchip() helper will check if the fwnode_handle is empty.
> There is no need to perform a redundant check outside of it.

Applied to irq/irqchip-5.9, thanks!

[1/1] genirq/irqdomain: Remove redundant NULL pointer check on fwnode
      commit: 47903428b0e9db7a6251aa696fd1b2fc5de98545

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


