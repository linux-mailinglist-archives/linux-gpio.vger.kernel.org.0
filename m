Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80EBA428249
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Oct 2021 17:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232377AbhJJPcp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 10 Oct 2021 11:32:45 -0400
Received: from p3plsmtpa06-01.prod.phx3.secureserver.net ([173.201.192.102]:49657
        "EHLO p3plsmtpa06-01.prod.phx3.secureserver.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232169AbhJJPcp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 10 Oct 2021 11:32:45 -0400
X-Greylist: delayed 438 seconds by postgrey-1.27 at vger.kernel.org; Sun, 10 Oct 2021 11:32:45 EDT
Received: from beer.hodcarrier.org ([216.169.128.254])
        by :SMTPAUTH: with ESMTPA
        id ZafdmCpD3zv9kZaffmGtNY; Sun, 10 Oct 2021 08:23:28 -0700
X-CMAE-Analysis: v=2.4 cv=cPklDnSN c=1 sm=1 tr=0 ts=61630570
 a=uWE2PZURgRfLboAWbsYvmw==:117 a=uWE2PZURgRfLboAWbsYvmw==:17 a=_twTT5zqAAAA:8
 a=FIwDDcP-q6B64bRUSCMA:9 a=ILoXdGDbYT3DTB7Z0gVI:22
X-SECURESERVER-ACCT: dhu@hodcarrier.org
From:   dhu@hodcarrier.org
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, Du Huanpeng <dhu@hodcarrier.org>
Subject: [PATCH] pinctrl: gemini: fix typos
Date:   Sun, 10 Oct 2021 23:23:25 +0800
Message-Id: <1633879405-11658-1-git-send-email-dhu@hodcarrier.org>
X-Mailer: git-send-email 2.7.4
X-CMAE-Envelope: MS4xfExVPAZQidp8PBhW4tORVHTWeN1o3JpOv62xM6o/QaT7Q+AgINeAMtvPDQmlAGKwciVIerQn+ouBTQ6IRtuPPNO32NxYqvRvjQCdGqdCuSndD5gsF+l8
 2GSU3YpzEZYMpv3UBiSNlTvNU/clasiP03jyy3FycaFW4KgKd8+uTyUCnD147MJ3x6i9EIVS4M+vVRz4ZRwXZ8svsLL2DN1xlxOdAMoSurF5pCN1Xc9s45gp
 Kq8kaHNtGzMrbSftOrItGwu7T3DOdwIJqZV78tIlHQQ=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Du Huanpeng <dhu@hodcarrier.org>

Signed-off-by: Du Huanpeng <dhu@hodcarrier.org>
---
 drivers/pinctrl/pinctrl-gemini.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-gemini.c b/drivers/pinctrl/pinctrl-gemini.c
index f75bf6f..5870956 100644
--- a/drivers/pinctrl/pinctrl-gemini.c
+++ b/drivers/pinctrl/pinctrl-gemini.c
@@ -412,7 +412,7 @@ static const struct pinctrl_pin_desc gemini_3512_pins[] = {
 	PINCTRL_PIN(249, "P16 GPIO0 17"),
 	PINCTRL_PIN(250, "P17 GPIO0 18"),
 	PINCTRL_PIN(251, "P18 GPIO0 19"),
-	/* Row R (for some reason Q us skipped) */
+	/* Row R (for some reason Q is skipped) */
 	PINCTRL_PIN(252, "R1 IDE DD6"),
 	PINCTRL_PIN(253, "R2 IDE DD8"),
 	PINCTRL_PIN(254, "R3 IDE DD7"),
@@ -1306,7 +1306,7 @@ static const struct pinctrl_pin_desc gemini_3516_pins[] = {
 	PINCTRL_PIN(277, "P18 PCI AD1"),
 	PINCTRL_PIN(278, "P19 PCI AD3"),
 	PINCTRL_PIN(279, "P20 PCI AD5"),
-	/* Row R (for some reason Q us skipped) */
+	/* Row R (for some reason Q is skipped) */
 	PINCTRL_PIN(280, "R1 IDE DD13"),
 	PINCTRL_PIN(281, "R2 IDE DD12"),
 	PINCTRL_PIN(282, "R3 IDE DD10"),
-- 
2.7.4

