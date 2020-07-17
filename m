Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 373A4223BAB
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 14:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgGQMtF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 08:49:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:50488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726557AbgGQMs5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 08:48:57 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 756C9206F4;
        Fri, 17 Jul 2020 12:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594990137;
        bh=JgQ/oreBwGqizaX7ztymLlHDgwGeBJjpWHzJp/rYn1Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ep1345fb497pj9W1qaXfXFsZHpSxVyw39mT0Nr9wzDoZ7+uj6WsTVXSRrfmF/WHU2
         6mxJaSVk5sHcIRRj4LbZUh4DL/lxZv+CkzAk/igZKq9Ef1uWYo1BWGbXvBQ61OO7Kq
         3acO4nKlY+Xi8cSsfOHrbmaGc6FmhBaY/lCfaPCQ=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=wait-a-minute.lan)
        by disco-boy.misterjones.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jwPnM-00Ccsm-0e; Fri, 17 Jul 2020 13:48:56 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kernel@vger.kernel.org, marex@denx.de,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] irqchip: ativic32: constify irq_domain_ops
Date:   Fri, 17 Jul 2020 13:48:46 +0100
Message-Id: <159499001592.546505.4320591957768155894.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200714173857.477422-1-masahiroy@kernel.org>
References: <20200714173857.477422-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: alexandre.torgue@st.com, jason@lakedaemon.net, tglx@linutronix.de, masahiroy@kernel.org, linux-kernel@vger.kernel.org, marex@denx.de, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 15 Jul 2020 02:38:57 +0900, Masahiro Yamada wrote:
> This is passed to irq_domain_add_linear(), which accepts a pointer
> to a const structure.

Applied to irq/irqchip-5.9, thanks!

[1/1] irqchip/ativic32: Constify irq_domain_ops
      commit: 605a2cf566e130c77fc2cc77fac37fb901fc868a

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


