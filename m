Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6802A2528E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2019 16:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfEUOrs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 May 2019 10:47:48 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42323 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbfEUOrr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 May 2019 10:47:47 -0400
Received: by mail-pg1-f195.google.com with SMTP id 145so8706065pgg.9;
        Tue, 21 May 2019 07:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=vWapel5oQFRL5IS9nITnTDS1CiQKS+fkgwKTVcUkRi8=;
        b=J+wfUmDSL7gurwPNzxB20Y9csHlDX+J2lMuxHU1BjO7Ee4cmiTK3EE9XkA8tMMn42W
         tpNPg1ZAjRJesMpVd8tltQp5G3UdZSkYd7s2iUQZnoF4ZHlXjn1NwcMWf0p+gms2GcSW
         uOK0LiORxiKO8x2i6QVei6lCzwf/Opm9dLSkMSuxG6bWc+lYkLbmpcV9askG7wkwCGeZ
         p+qPqk66IZYb5VzlNCh1Llg/fKpj/4lGWf/W63jm8IekkNnB+EVElP15Ay/Iz57W50SU
         8VulXzLuTttSDYpHHb9B4whok/Yqx9b5E1gk68sEd01REGO192+SgL/PDwIKH8M1JkcA
         k7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vWapel5oQFRL5IS9nITnTDS1CiQKS+fkgwKTVcUkRi8=;
        b=FrDfaKdWEfdmhoCpSEH2sRgwN/pOCx6i/SKXjX7vRKFe1DRbV9RaGc0UgvlPssi97X
         vNEUPtSLQ6aQ7vX1VbzyYIzthgZ2NjMrePOKwjaYFQ7qd3du/vbvEPIie7Qvo+RH/MYS
         +wcccbXKL/28Petvz7zkbajiPSVMOL4mayknFEWmYkjpaWLhL0QbKQJUQoAjnwvxhGhI
         /smuZbnmwBsoFlmgoyJmXpI4G3Jq/7r9C/xwIBdd6iScdNZmk1vBb382NbNAdj0FdNU6
         7lsDRLipoJxq6R1XgvyIpOVku1Gt8WSbLFlZtZElaRZEBs0O559Ss9sS5rmcjBjocw1E
         EPVA==
X-Gm-Message-State: APjAAAUOgwe9EogSr3h/Ix6QYOaSuY3pJjpC1//j8UWUhbHAkyO2OxHc
        p8YeR1e4jdf303IrRswtyeY=
X-Google-Smtp-Source: APXvYqzLKro+yl9TmaN24S/pQj0fpek+/qhlfX1j1ZWZnpe6kEvnbtW9El8eBXcB5losLDhepUyYKA==
X-Received: by 2002:a62:304:: with SMTP id 4mr70248166pfd.186.1558450067108;
        Tue, 21 May 2019 07:47:47 -0700 (PDT)
Received: from localhost ([43.224.245.181])
        by smtp.gmail.com with ESMTPSA id a7sm40112206pgj.42.2019.05.21.07.47.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 07:47:46 -0700 (PDT)
From:   houweitao <houweitaoo@gmail.com>
X-Google-Original-From: houweitao <houweitao@xiaomi.com>
To:     linus.walleij@linaro.org, yamada.masahiro@socionext.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        baohua@kernel.org, gregkh@linuxfoundation.org, jslaby@suse.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, davem@davemloft.net,
        rostedt@goodmis.org, mingo@redhat.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org, sparclinux@vger.kernel.org,
        houweitao <houweitao@xiaomi.com>
Subject: [PATCH] tracing: fix typos in code and comments
Date:   Tue, 21 May 2019 22:47:40 +0800
Message-Id: <20190521144740.22490-1-houweitao@xiaomi.com>
X-Mailer: git-send-email 2.18.0
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

fix ingore to ignore in kernel; since there are other
mistakes can be found with "git grep ",fix all

Signed-off-by: houweitao <houweitao@xiaomi.com>
---
 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c | 2 +-
 drivers/rtc/rtc-sirfsoc.c                        | 2 +-
 drivers/tty/serial/mxs-auart.c                   | 2 +-
 drivers/tty/serial/serial_txx9.c                 | 2 +-
 drivers/tty/serial/sunsab.c                      | 2 +-
 kernel/trace/trace.c                             | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
index 57babf31e320..9f56863ed481 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
@@ -399,7 +399,7 @@ static int uniphier_conf_pin_bias_set(struct pinctrl_dev *pctldev,
 		}
 
 		if (arg == 0)
-			return 0; /* configuration ingored */
+			return 0; /* configuration ignored */
 		break;
 	default:
 		BUG();
diff --git a/drivers/rtc/rtc-sirfsoc.c b/drivers/rtc/rtc-sirfsoc.c
index 9ba28d1ebd87..af1b7ba403fc 100644
--- a/drivers/rtc/rtc-sirfsoc.c
+++ b/drivers/rtc/rtc-sirfsoc.c
@@ -121,7 +121,7 @@ static int sirfsoc_rtc_set_alarm(struct device *dev,
 		rtc_status_reg = sirfsoc_rtc_readl(rtcdrv, RTC_STATUS);
 		if (rtc_status_reg & SIRFSOC_RTC_AL0E) {
 			/*
-			 * An ongoing alarm in progress - ingore it and not
+			 * An ongoing alarm in progress - ignore it and not
 			 * to return EBUSY
 			 */
 			dev_info(dev, "An old alarm was set, will be replaced by a new one\n");
diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 4c188f4079b3..9f83a387d6ed 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -667,7 +667,7 @@ static void mxs_auart_rx_char(struct mxs_auart_port *s)
 	}
 
 	/*
-	 * Mask off conditions which should be ingored.
+	 * Mask off conditions which should be ignored.
 	 */
 	stat &= s->port.read_status_mask;
 
diff --git a/drivers/tty/serial/serial_txx9.c b/drivers/tty/serial/serial_txx9.c
index d22ccb32aa9b..372890e3b896 100644
--- a/drivers/tty/serial/serial_txx9.c
+++ b/drivers/tty/serial/serial_txx9.c
@@ -314,7 +314,7 @@ receive_chars(struct uart_txx9_port *up, unsigned int *status)
 			}
 
 			/*
-			 * Mask off conditions which should be ingored.
+			 * Mask off conditions which should be ignored.
 			 */
 			disr &= up->port.read_status_mask;
 
diff --git a/drivers/tty/serial/sunsab.c b/drivers/tty/serial/sunsab.c
index 72131b5e132e..daae2b0dbe11 100644
--- a/drivers/tty/serial/sunsab.c
+++ b/drivers/tty/serial/sunsab.c
@@ -200,7 +200,7 @@ receive_chars(struct uart_sunsab_port *up,
 				up->port.icount.overrun++;
 
 			/*
-			 * Mask off conditions which should be ingored.
+			 * Mask off conditions which should be ignored.
 			 */
 			stat->sreg.isr0 &= (up->port.read_status_mask & 0xff);
 			stat->sreg.isr1 &= ((up->port.read_status_mask >> 8) & 0xff);
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 2c92b3d9ea30..bfa5ab0663e7 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -8554,7 +8554,7 @@ init_tracer_tracefs(struct trace_array *tr, struct dentry *d_tracer)
 	ftrace_init_tracefs(tr, d_tracer);
 }
 
-static struct vfsmount *trace_automount(struct dentry *mntpt, void *ingore)
+static struct vfsmount *trace_automount(struct dentry *mntpt, void *ignore)
 {
 	struct vfsmount *mnt;
 	struct file_system_type *type;
-- 
2.18.0

