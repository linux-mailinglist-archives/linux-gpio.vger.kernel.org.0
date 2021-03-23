Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872F2345F7A
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 14:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbhCWNSv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 09:18:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:46386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhCWNRf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Mar 2021 09:17:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD58F61878;
        Tue, 23 Mar 2021 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616505453;
        bh=TocmTDObLsSB+Yh5zIiipz/rUfcK3KL/UJieKC8e3Ow=;
        h=From:To:Cc:Subject:Date:From;
        b=SsbsLhMz68mlEer2lsktyESY96JxLwfKkZZ6b0E2e+nUZCQHphTlUzJk2o3L2Pm6a
         PA0bt2gTn9Z8x36hW1X62PpElRsh5LzIkonM2qx5j4RFhFYDpmXtojADiwlVTri+qO
         Jsg5TrRMmqD8868jgS+ujK1Ms+de7gohfV1vortEtZVIfGIST8O3AWk0LSfuKBLo01
         QR3I4gQrA9Bc26MYUpQ/Xwwa4MMbu+5piHOZ9atxGSoAruNzR5e1L14e0dG/kkxM3m
         EVuf8gt+OZm2R7DYW29O1eFQdCSCeKvfgzDAePGN1XZ0R3S23brQmZQYqjarvO/H+z
         EBJ0ZgbZU7sTg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jeevan Shriram <jshriram@codeaurora.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH] pinctrl: qcom: fix unintentional string concatenation
Date:   Tue, 23 Mar 2021 14:17:13 +0100
Message-Id: <20210323131728.2702789-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

clang is clearly correct to point out a typo in a silly
array of strings:

drivers/pinctrl/qcom/pinctrl-sdx55.c:426:61: error: suspicious concatenation of string literals in an array initialization; did you mean to separate the elements with a comma? [-Werror,-Wstring-concatenation]
        "gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19" "gpio20", "gpio21", "gpio22",
                                                                   ^
Add the missing comma that must have accidentally been removed.

Fixes: ac43c44a7a37 ("pinctrl: qcom: Add SDX55 pincontrol driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/qcom/pinctrl-sdx55.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdx55.c b/drivers/pinctrl/qcom/pinctrl-sdx55.c
index 2b5b0e2b03ad..5aaf57b40407 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx55.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx55.c
@@ -423,7 +423,7 @@ static const char * const gpio_groups[] = {
 
 static const char * const qdss_stm_groups[] = {
 	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7", "gpio12", "gpio13",
-	"gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19" "gpio20", "gpio21", "gpio22",
+	"gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21", "gpio22",
 	"gpio23", "gpio44", "gpio45", "gpio52", "gpio53", "gpio56", "gpio57", "gpio61", "gpio62",
 	"gpio63", "gpio64", "gpio65", "gpio66",
 };
-- 
2.29.2

