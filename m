Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1681BB27AA
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 00:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389915AbfIMV7p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 17:59:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59412 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfIMV7o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 17:59:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CE3616044E; Fri, 13 Sep 2019 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411983;
        bh=r9VU5NwhhErW5lihrBpuQhz4eshG9uEvbjR5J9Nhdt8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qm+YCF3O1Adn77QKMX8qd0IODgk1ZQDBXznpdHZ0x2htiOfXvFzUXbpwgJhBAFq3I
         8EJ2XmypNXXYfvqfaxeBYCHQCM4ECjl1+NFYpL78zCU8OZGNQknY/uUoRchILtH3wX
         XDD8IwOFexv9i7To4T7fp8mIxg6OqEsShtRIYmhk=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6129A602C3;
        Fri, 13 Sep 2019 21:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411982;
        bh=r9VU5NwhhErW5lihrBpuQhz4eshG9uEvbjR5J9Nhdt8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GFIEJjp8j+bneKliC31btEKLSZwnGe3eXjbJG3hIXNXMpuVLMcFCMlsBejou94j7z
         SC6QgsqyH1PKyrV/OIXoj/5jsyvz1skcQTfpnFrdZgylFwAQv5iKvdpgnS6P6pvoNf
         ERVF9zxlbeUcIPxhfNP+5qRB+Hk5tVfr3UB5DZk0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6129A602C3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, maz@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC v2 01/14] irqdomain: add bus token DOMAIN_BUS_WAKEUP
Date:   Fri, 13 Sep 2019 15:59:09 -0600
Message-Id: <1568411962-1022-2-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
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
index 07ec8b3..cc846ab 100644
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

