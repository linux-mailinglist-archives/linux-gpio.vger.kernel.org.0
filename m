Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCE00176D90
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 04:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgCCDc0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 22:32:26 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:55304 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgCCDc0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2020 22:32:26 -0500
Received: by mail-pj1-f65.google.com with SMTP id a18so700287pjs.5;
        Mon, 02 Mar 2020 19:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lAJWYCHPBwbTZmy3CiLGkMtDA8pTL5n25oGIItGeMNY=;
        b=ku+HgPVxDA+o9Bbry1KSvBM5GvloyefWo5xjpCjFE4hhNhcMujErT+uE7rUw26W6sw
         r3KUouVZo2G1fqyRz6CFCJ3MUQYnL+lTJdz6IoBMNTNmQc5FdmAX6XLG4kyNwCdEgikw
         fz9D6ImwTBdBuQiDL2pBa/H0C7DSzrzpv+mkiQtnsc6RwpwqvfUVOYjP5zBargbW1ehs
         PRUqOyqKsH8crBsRoBp7sSteit0FMjG6BGuI8pkyI1bpKhY+QxHpMtA0yx9d44vEIa7V
         J/3HPjHLPXpVFJx4gzePGVVOj9qNG7P9IiOuRvDXipj0VuYehEs4Z2Yz/oF8I9T9X0Ze
         DwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lAJWYCHPBwbTZmy3CiLGkMtDA8pTL5n25oGIItGeMNY=;
        b=b3EdVhtmzCTBCtCw+You1XGLxbOKKdak/M+krlWC9zDiMr220zMBA3QlJx3SmyXkBc
         URCx2AwkjvF0VUUJI3Uqg82fZLiATH0WwpYDDaOx8Mhojp9zAgOFMmTO7idE0TqAiovS
         45RNhcppAoNDLziCxnW09GsKPCKwH00NVXrLfzPbrux33mq8wG/Tpnt8TDl/eWl0OFAE
         +p9PQ8yGEbx6CkgENcc8kNSAADyuvFOPdcZ7OBgxu10dtn2NMx3MqXePzeX47QpbMi8w
         0jthHT/Loeo0IC6I5Vi2QOWG4dExmJH7eb8sAYnL4sMvs9zBOyr/mJLHXNWJK4oehPoQ
         Wrkw==
X-Gm-Message-State: ANhLgQ0MPznX7eEzMhZ5gXd4H6KqXu+oPLxUdlI05mkzFILpMMf7UJr0
        tolcf1G9pQjHRVff/ll3yrk=
X-Google-Smtp-Source: ADFU+vtn8ib+G38fQML2jOCEFGVkNU/EFpfxLPffDUyi+Y6XsnNWcHHfrxaWEtuVaQSAeJDZWx5SOA==
X-Received: by 2002:a17:902:d394:: with SMTP id e20mr2240529pld.239.1583206344690;
        Mon, 02 Mar 2020 19:32:24 -0800 (PST)
Received: from sh03840pcu.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id d77sm9344494pfd.109.2020.03.02.19.32.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 02 Mar 2020 19:32:24 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     linus.walleij@linaro.org
Cc:     rdunlap@infradead.org, orsonzhai@gmail.com, zhang.lyra@gmail.com,
        baolin.wang7@gmail.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: sprd: Fix the kconfig warning
Date:   Tue,  3 Mar 2020 11:32:15 +0800
Message-Id: <eeb12d7843fb06f80e19f98eb25711231c3b610f.1583205650.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On X86 plaform, if the CONFIG_OF is not selected, and set the
CONFIG_SPRD_SC9860 as 'm', that will cause below waring:

WARNING: unmet direct dependencies detected for PINCTRL_SPRD
  Depends on [n]: PINCTRL [=y] && OF [=n] && (ARCH_SPRD || COMPILE_TEST [=y])
  Selected by [m]:
  - PINCTRL_SPRD_SC9860 [=m] && PINCTRL [=y]

Thus move the configuration dependency under CONFIG_PINCTRL_SPRD_SC9860
to fix the warning.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 drivers/pinctrl/sprd/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sprd/Kconfig b/drivers/pinctrl/sprd/Kconfig
index c9e7f0b..eef35d0 100644
--- a/drivers/pinctrl/sprd/Kconfig
+++ b/drivers/pinctrl/sprd/Kconfig
@@ -4,9 +4,7 @@
 #
 
 config PINCTRL_SPRD
-	tristate "Spreadtrum pinctrl driver"
-	depends on OF
-	depends on ARCH_SPRD || COMPILE_TEST
+	tristate
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
@@ -16,6 +14,8 @@ config PINCTRL_SPRD
 
 config PINCTRL_SPRD_SC9860
 	tristate "Spreadtrum SC9860 pinctrl driver"
+	depends on OF
+	depends on ARCH_SPRD || COMPILE_TEST
 	select PINCTRL_SPRD
 	help
 	  Say Y here to enable Spreadtrum SC9860 pinctrl driver
-- 
1.9.1

