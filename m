Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 092ABFE780
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 23:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbfKOWRo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 17:17:44 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:46982 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbfKOWRo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 17:17:44 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7E7BA61065; Fri, 15 Nov 2019 22:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856263;
        bh=P4+vLW989cfm2UdgXK12lQuYajx248UFh8qFDpzNVq8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=biXvbmKHcAVL2QCfPBtmeIhl80VdWv/OCGQkVeuJrfAJceNCId5MMeZbZqQ2ZnJRE
         /28nNOuySH1+2fdveYD+lY1txShfEFtyiu545IebIVTrS9f3vnrB5MZPg+asFNG/kB
         8sZA0W797tZE2eltO7IXmvR7CFMsx6f1GFVgyNyc=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 30A9460F80;
        Fri, 15 Nov 2019 22:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856263;
        bh=P4+vLW989cfm2UdgXK12lQuYajx248UFh8qFDpzNVq8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=biXvbmKHcAVL2QCfPBtmeIhl80VdWv/OCGQkVeuJrfAJceNCId5MMeZbZqQ2ZnJRE
         /28nNOuySH1+2fdveYD+lY1txShfEFtyiu545IebIVTrS9f3vnrB5MZPg+asFNG/kB
         8sZA0W797tZE2eltO7IXmvR7CFMsx6f1GFVgyNyc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 30A9460F80
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v2 01/12] irqdomain: add bus token DOMAIN_BUS_WAKEUP
Date:   Fri, 15 Nov 2019 15:11:44 -0700
Message-Id: <1573855915-9841-2-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
References: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 include/linux/irqdomain.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 583e7ab..3c340db 100644
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

