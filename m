Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4919124490
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 11:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfLRKae (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 05:30:34 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:33468 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725930AbfLRKae (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 18 Dec 2019 05:30:34 -0500
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1ihWbA-0007WF-0F; Wed, 18 Dec 2019 10:30:32 +0000
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.3)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1ihWb9-00AR7D-GV; Wed, 18 Dec 2019 10:30:31 +0000
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     ben.dooks@codethink.co.uk
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: qcom: make 'm_voc_groups' static
Date:   Wed, 18 Dec 2019 10:28:04 +0000
Message-Id: <20191218102804.2487374-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The m_voc_groups is not declared outside of the
driver, so make it static to avoid the following
sparse wanrning:

drivers/pinctrl/qcom/pinctrl-msm8976.c:592:12: warning: symbol 'm_voc_groups' was not declared. Should it be static?

Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
---
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/qcom/pinctrl-msm8976.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm8976.c b/drivers/pinctrl/qcom/pinctrl-msm8976.c
index e1259ce27396..183f0b2d9f8e 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8976.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8976.c
@@ -589,7 +589,7 @@ static const char * const blsp_uart5_groups[] = {
 static const char * const qdss_traceclk_a_groups[] = {
 	"gpio46",
 };
-const char * const m_voc_groups[] = {
+static const char * const m_voc_groups[] = {
 	"gpio123", "gpio124",
 };
 static const char * const blsp_i2c5_groups[] = {
-- 
2.24.0

