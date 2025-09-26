Return-Path: <linux-gpio+bounces-26606-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC2EBA2425
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 04:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9E701C2802A
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Sep 2025 02:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB9F2248A4;
	Fri, 26 Sep 2025 02:54:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from out28-170.mail.aliyun.com (out28-170.mail.aliyun.com [115.124.28.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0990617DFE7;
	Fri, 26 Sep 2025 02:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758855266; cv=none; b=kaUoim+0aHEI6RjSO8rjgp0XUY8nTkJ3/3waLsd/tw0azdJHVl2Q4N618BMo/FblbHWFUnTbGXC8Psx/O+ux2VeG0pUq5hZ23lwz/do4DGPaO5gJEAd3bFUwpACvcb/4aR4+q6gf8M6Uyw4UwRK/ENFFabpGZWL1Whfehs/+oHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758855266; c=relaxed/simple;
	bh=7AxJLTHuNLufjyzhwhMdz+Egc9IfsztB8kWgCDonfck=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d49IsPJZ3w4JnvGPPiPol8pV25u0YU36lXVZ9hX/EiqeWK+XvuuzAKl0wVFFfQfGM53K8DiyKYIRaJuamPw6By70U6R+UkIPgMH36vtg51U5qIWIale23pIuAqj4lxSUpnxsRjzdKTT9jKg+5gpnmK1W6KVi+CiA8WwyFsy2wOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com; spf=pass smtp.mailfrom=allwinnertech.com; arc=none smtp.client-ip=115.124.28.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allwinnertech.com
Received: from SunxiBot.allwinnertech.com(mailfrom:michael@allwinnertech.com fp:SMTPD_---.eniF1s7_1758854931 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 26 Sep 2025 10:48:56 +0800
From: Michael Wu <michael@allwinnertech.com>
To: ulf.hansson@linaro.org,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	adrian.hunter@intel.com,
	avri.altman@wdc.com,
	wsa+renesas@sang-engineering.com,
	andy-ld.lu@mediatek.com,
	victor.shih@genesyslogic.com.tw
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] mmc: core: Fix system shutdown hang in mmc_bus_shutdown
Date: Fri, 26 Sep 2025 10:48:47 +0800
Message-Id: <20250926024847.45814-1-michael@allwinnertech.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During system shutdown, mmc_bus_shutdown() calls __mmc_stop_host() which
uses cancel_delayed_work_sync(). This can block indefinitely if the work
queue is stuck, causing the system to hang during shutdown.

This patch introduces a new function __mmc_stop_host_no_sync() that skips
the synchronous work cancellation, preventing potential shutdown hangs.
The function is used in mmc_bus_shutdown() where blocking is not
acceptable during system shutdown.

Changes:
- Add __mmc_stop_host_no_sync() function that avoids cancel_delayed_work_sync()
- Update mmc_bus_shutdown() to use the new non-blocking function
- Keep the original __mmc_stop_host() unchanged for normal operation

This ensures graceful system shutdown while maintaining existing
functionality for regular MMC host operations.

stack information when an error occurs:
INFO: task init:1 blocked for more than 720 seconds.
      Tainted: G           OE     5.15.185-android13-8-00043-gd00fb6bce7ed-ab13792018 #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:init            state:D stack:    0 pid:    1 ppid:     0 flags:0x04000008
Call trace:
 __switch_to+0x234/0x470
 __schedule+0x694/0xb8c
 schedule+0x150/0x254
 schedule_timeout+0x48/0x138
 wait_for_common+0x144/0x308
 __flush_work+0x3d8/0x508
 __cancel_work_timer+0x120/0x2e8
 mmc_bus_shutdown+0x90/0x158
 device_shutdown+0x204/0x434
 kernel_restart+0x54/0x220
 kernel_restart+0x0/0x220
 invoke_syscall+0x60/0x150
 el0_svc_common+0xb8/0xf8
 do_el0_svc+0x28/0x98
 el0_svc+0x24/0x84
 el0t_64_sync_handler+0x88/0xec
 el0t_64_sync+0x1b8/0x1bc
INFO: task kworker/1:1:73 blocked for more than 721 seconds.
      Tainted: G           OE     5.15.185-android13-8-00043-gd00fb6bce7ed-ab13792018 #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:1     state:D stack:    0 pid:   73 ppid:     2 flags:0x00000008
Workqueue: events_freezable mmc_rescan.cfi_jt
Call trace:
 __switch_to+0x234/0x470
 __schedule+0x694/0xb8c
 schedule+0x150/0x254
 schedule_preempt_disabled+0x2c/0x4c
 __mutex_lock+0x360/0xb00
 __mutex_lock_slowpath+0x18/0x28
 mutex_lock+0x48/0x12c
 device_del+0x48/0x8d0
 mmc_remove_card+0x128/0x158
 mmc_sdio_remove+0x190/0x1ac
 mmc_sdio_detect+0x7c/0x118
 mmc_rescan+0xe8/0x42c
 process_one_work+0x248/0x55c
 worker_thread+0x3b0/0x740
 kthread+0x168/0x1dc
 ret_from_fork+0x10/0x20

Signed-off-by: Michael Wu <michael@allwinnertech.com>
---
 drivers/mmc/core/bus.c  |  2 +-
 drivers/mmc/core/core.c | 14 ++++++++++++++
 drivers/mmc/core/core.h |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/bus.c b/drivers/mmc/core/bus.c
index 1cf64e0952fbe..6ff6fcb4c6f27 100644
--- a/drivers/mmc/core/bus.c
+++ b/drivers/mmc/core/bus.c
@@ -149,7 +149,7 @@ static void mmc_bus_shutdown(struct device *dev)
 	if (dev->driver && drv->shutdown)
 		drv->shutdown(card);
 
-	__mmc_stop_host(host);
+	__mmc_stop_host_no_sync(host);
 
 	if (host->bus_ops->shutdown) {
 		ret = host->bus_ops->shutdown(host);
diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index a0e2dce704343..2d75ad26f84a9 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -2336,6 +2336,20 @@ void __mmc_stop_host(struct mmc_host *host)
 	cancel_delayed_work_sync(&host->detect);
 }
 
+void __mmc_stop_host_no_sync(struct mmc_host *host)
+{
+	if (host->rescan_disable)
+		return;
+
+	if (host->slot.cd_irq >= 0) {
+		mmc_gpio_set_cd_wake(host, false);
+		disable_irq(host->slot.cd_irq);
+	}
+
+	host->rescan_disable = 1;
+	/* Skip cancel_delayed_work_sync to avoid potential blocking */
+}
+
 void mmc_stop_host(struct mmc_host *host)
 {
 	__mmc_stop_host(host);
diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
index 622085cd766f9..eb59a61717357 100644
--- a/drivers/mmc/core/core.h
+++ b/drivers/mmc/core/core.h
@@ -71,6 +71,7 @@ static inline void mmc_delay(unsigned int ms)
 void mmc_rescan(struct work_struct *work);
 void mmc_start_host(struct mmc_host *host);
 void __mmc_stop_host(struct mmc_host *host);
+void __mmc_stop_host_no_sync(struct mmc_host *host);
 void mmc_stop_host(struct mmc_host *host);
 
 void _mmc_detect_change(struct mmc_host *host, unsigned long delay,
-- 
2.29.0


