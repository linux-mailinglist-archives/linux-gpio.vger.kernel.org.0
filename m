Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B58EA2660
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 20:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbfH2Sre (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 14:47:34 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35714 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbfH2Sre (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 14:47:34 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E556A694B2; Thu, 29 Aug 2019 18:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567104453;
        bh=aZZpAgEtM8Id45U6CuX5S0qyC0RSjoNEmA5BfPWcAGg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ov21A1G42E7QKGF9E4OUvXkh3mhX1MPH0SYwpdYsL2djJExm/+HczxiBWNsKcaSEU
         YJ3SYl8950Esrr2pVzADwlmyK3E20csr/ih4xF4XdTTx/A+isJywHRbEpbx3Zc4zgI
         FKMVlyFWRBbBBg+/2/hNKsmTxAnzDjMeHwc+Zwmg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D47C0687FA;
        Thu, 29 Aug 2019 18:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567102333;
        bh=aZZpAgEtM8Id45U6CuX5S0qyC0RSjoNEmA5BfPWcAGg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E/u4IlOjRFXMG+Q6scsxflg2M9dogTX+2cs3a2prPwC7a0sHKvKASBxYqzgWs6ZZB
         oGy5VLDwJSqyPoPTWzb5cpt1CpgAfctgiPb/lsz8NMJ7S9urhyTwulshdDw4fvgllX
         votNpEZk5O1ZeemKz1gEq+LPOAkv5s+F6+zgQOH0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D47C0687FA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC 01/14] irqdomain: add bus token DOMAIN_BUS_WAKEUP
Date:   Thu, 29 Aug 2019 12:11:50 -0600
Message-Id: <20190829181203.2660-2-ilina@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829181203.2660-1-ilina@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A single controller can handle normal interrupts and wake-up interrupts
independently, with a different numbering space. It is thus crucial to
allow the driver for such a controller discriminate between the two.

A simple way to do so is to tag the wake-up irqdomain with a "bus token"
that indicates the wake-up domain. This slightly abuses the notion of
bus, but also radically simplifies the design of such a driver. Between
two evils, we choose the least damaging.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 include/linux/irqdomain.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 07ec8b390161..cc846abeff28 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -83,6 +83,7 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_IPI,
 	DOMAIN_BUS_FSL_MC_MSI,
 	DOMAIN_BUS_TI_SCI_INTA_MSI,
+	DOMAIN_BUS_WAKEUP,
 };
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

