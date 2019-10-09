Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC496D06C4
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 06:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730346AbfJIExF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 00:53:05 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39703 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729040AbfJIExF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 00:53:05 -0400
Received: by mail-pf1-f196.google.com with SMTP id v4so779916pff.6
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2019 21:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=BVPDZ+UM30WirOqNPfNn7Zfe1sfZXxP2P+omCF1CkXM=;
        b=Ewr0dLfGV3C81iZtiq9ImVyUdComMA/4a9GbeiEGsQkyAMNZ8/e6pDLMSebzRSbIa+
         ryYN1cXcBAnzJINPo1cfm1WuV6rWMqP8tX5H+40EwiMZe8GTU1U3Hwrh3nihEpdbDIAP
         Bgsp28d0W3GhraUzHJNS370erIjrDJ8nSZTVjnfpk5SvdvPChqTp1gUBK7IGqYaWzaj9
         XRWxyVfPldyZUKYFKCBoDdV9sPI4L7UffXU7BQEhPIpVZEkeX5WjO/DC9FKuVIVACTdg
         O5n9B+S9dUT2OY/gP8muAzeueJy3nXOCQp8hXJ2QCumAvydNQWa2SQS+UJRKp+TxH+GF
         DPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BVPDZ+UM30WirOqNPfNn7Zfe1sfZXxP2P+omCF1CkXM=;
        b=O9e/qA+qhzjfnwv2p/e6mrHSRIJmEbB4qIjare4CYvfGmZ+c0YbF2TaO+80FJi9GH3
         A6JyTepK1aD0huTV6vgHrDMg2F3BHaeeTTyATbil7XZtEx8eh6Tovf54k3gfSQvIk5s6
         ylkbuGp583WpogFmFXsHmWLUIYjvsmHxWWMBxpSN/IZF4jeL0tfikmrA4N/XkVX8urTC
         gCV0WdB5W+a6JzBSEvnNxPRJTS0YVyCUxRapThfikigpz0H1J3GBdzsU/tP6CRtiZfLw
         Ty38DgrGg4xakFq1xh3qW3QuLWe3hTJj8Q3m5W9tyw/kajEQD0pmMaUOtgMdLQdT9VWz
         Wk/g==
X-Gm-Message-State: APjAAAXyiGH3cwsT9CkjL8PsiwrGTF6JNaahmNw7djGOJdg1ewGh0wZx
        Ij5Z2X8Rt7lUzmbmjuqYtFo1GQ==
X-Google-Smtp-Source: APXvYqyfpuTkCgyxfhyRsMlgzXxl1EcKj9bSJP/ThZa9N+wKRgLR04rtxULOcr832GHuu/Rc2AH7wQ==
X-Received: by 2002:a65:520d:: with SMTP id o13mr2343089pgp.42.1570596782870;
        Tue, 08 Oct 2019 21:53:02 -0700 (PDT)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id 7sm732678pgx.26.2019.10.08.21.53.00
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 08 Oct 2019 21:53:02 -0700 (PDT)
From:   Baolin Wang <baolin.wang@linaro.org>
To:     linus.walleij@linaro.org
Cc:     orsonzhai@gmail.com, zhang.lyra@gmail.com, baolin.wang@linaro.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: sprd: Add PIN_CONFIG_BIAS_DISABLE configuration support
Date:   Wed,  9 Oct 2019 12:52:45 +0800
Message-Id: <66d373ddee61e8be2fcef49aac5e80bd58f14915.1570596606.git.baolin.wang@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add PIN_CONFIG_BIAS_DISABLE configuration support for Spreadtrum pin
controller.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
 drivers/pinctrl/sprd/pinctrl-sprd.c |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index 7b95bf5..8869843 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -484,6 +484,13 @@ static int sprd_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin_id,
 			       SLEEP_PULL_UP_MASK) << 16;
 			arg |= (reg >> PULL_UP_SHIFT) & PULL_UP_MASK;
 			break;
+		case PIN_CONFIG_BIAS_DISABLE:
+			if ((reg & (SLEEP_PULL_DOWN | SLEEP_PULL_UP)) ||
+			    (reg & (PULL_DOWN | PULL_UP_4_7K | PULL_UP_20K)))
+				return -EINVAL;
+
+			arg = 1;
+			break;
 		case PIN_CONFIG_SLEEP_HARDWARE_STATE:
 			arg = 0;
 			break;
@@ -674,6 +681,16 @@ static int sprd_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin_id,
 					shift = PULL_UP_SHIFT;
 				}
 				break;
+			case PIN_CONFIG_BIAS_DISABLE:
+				if (is_sleep_config == true) {
+					val = shift = 0;
+					mask = SLEEP_PULL_DOWN | SLEEP_PULL_UP;
+				} else {
+					val = shift = 0;
+					mask = PULL_DOWN | PULL_UP_20K |
+						PULL_UP_4_7K;
+				}
+				break;
 			case PIN_CONFIG_SLEEP_HARDWARE_STATE:
 				continue;
 			default:
-- 
1.7.9.5

