Return-Path: <linux-gpio+bounces-28961-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E2DC7AC13
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 17:12:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0DEEA36795F
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 16:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D5C350D7E;
	Fri, 21 Nov 2025 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJp0x6Oc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA9434D905
	for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741336; cv=none; b=oaXTvFA9iHW1FOx1q8slnXwqpcVlopohoDEwPElV4RffW3Oy/QLt6i9WsUPfYXimjLvWg/nQvC5zTNKdzW+TXnNDJsP5CC0x6qKmLgx8Qg8jhRr6CKvfSlUpv53DORu5362K1XJY4yWmYXlX2tYtW8b862fDlxWgdcg8KVAiTHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741336; c=relaxed/simple;
	bh=+t6QRXttRpX5nce6uZuXOYAkO7xTEcrDg1qTPVsuBuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RI8u1Z4O4/7x5uIaUEpQoLPfllSjxZiTQ4WcvwCuesdv3s1nDRTJucr9DqIm/764rtMXARZgn8sc/9FNUsTLB/qpTZ7fTt1xYrltMcrjCdHsSiqG/eO0QgKaQzZP5KtbE7KlwjCRZQkzKJhk7vOIvK2nygfEsrnrN+f6I9gtyHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJp0x6Oc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47789cd2083so13689405e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 08:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741331; x=1764346131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8o2eYAk4+T2MvJcophYUy9RZhVssXZ1GeiS/j2h3xk8=;
        b=IJp0x6Oc2nW+PGonCRDevst2Z7j9C/SyOawKu2FLVDmPzGB7Etga9VuaUHR/haegKf
         xk/6KPNA9aWEknSLoOPxgMiP6eYrV2FBjBfJ2baJYG0kC9sGmw289C9k24N1roL+t2kQ
         d/aKB3yoEo86TKptUUoWzCSv1z8t5hnu8cZWXd0mln+F/9GtDxd0ciIECxJuOgtIch2S
         KG+1LYIJneal4YxKikQJ7jiD7PHIl9bkrBEyUsZ0Yos+YuRYf1WBmfCji+FAH+sn8bC2
         g4k1rrH5DEBTT1TQ/pfznyigL5NqOR6qM3mF4cHB+puGggqoQC+hvCYIC+H4KFMkKvgQ
         3a8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741331; x=1764346131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8o2eYAk4+T2MvJcophYUy9RZhVssXZ1GeiS/j2h3xk8=;
        b=u+gpMch/Cko6EBt3yFUgPjfkPFHCLn1ZMZw3uVyVBOyIglUweVgN+ey96e2Pk/KeUR
         Nw0iF79m3UiR3F3SgiZ/yN9BiyOiucvM3v2kI8fJRG+1tDwyVtkVu5NqAFBqAMMgovVL
         73/PY6n6Iv7+2AAF+rmRZ3OiWU3tLrfkE5gHiHc6ttj+lJG5gKBJ5tjiMu9Yy+OLRAQ7
         1Kyl3tzw10B50bVkWPuWYkVRgJ4633C4lf/aG2+xbnu5FgMI95xE8VQq8mnNSOUTpVlp
         F75GTnhTF+RpyXQXKGHc3+mbvNxKOoNDZ9hdqVs4JhWChIfBqrD1Hzf/JFi5PtHnVC11
         0vVA==
X-Forwarded-Encrypted: i=1; AJvYcCUzu+1AVZyq+eS5PCMc4L3fk3AwbDr63mEM7oLYjRyU6PLE6EYApiKL3PepkhmgkscC+yW++Fv/CUc7@vger.kernel.org
X-Gm-Message-State: AOJu0YwY4VilzLeYf/8MRQKbLhe9t+ajf2l6Xayba1/jjK6qfH19VMFo
	N5gTxQHF9ePxe1NlKZ4BuIzv7bDz6a6vW0WKGqd/GLTukQjWM2bN3I0L
X-Gm-Gg: ASbGncs/h8SfcVc35tgeoTxDOTj5xpGFLS8XswOhmTQfJ8JmaMAVthIM9Wf0DE5p7na
	i5vqBcOPcukHv4fEGuSCz0yXvNe75Ddzzd678OTSMbZh+ekBW/SrzLzU32gKJpmsqZlvzFscwyD
	cOsweBItOWo0mEHdgPjgqanSUfBKOaeza9v5RXcjCuwniYSIDuty3lVpH1g+JdtZkTWWgnbv7we
	TWVENE6K/2OV21NlireJbJTI5K2WDlQ9QCTsMuV1U9147A/I8YjXx8wDtYlyiTZXw6jQLU4Cbim
	hrhZNr4QzOGOYZQ0xlRpwLG4klZPnb5GeL9o1m9gCY1ga0Q+YBtzL3fK43tUsPi4mAk9oXTmtXh
	3OEMmB7UHMkeQf7okSPxvOxuicysxDoXBuEIQWFqP5tYuVmHhWZsQORwj4UQuciMDPQ3S0G9fpN
	VbHAk0Y206aAWi2MbQvnNm4YTQ11ILl3VWLyWBOyVDEzM8BSiuRNeVyg2cYXoUJaUjLnTCJ4s97
	v5yr1RhiQ==
X-Google-Smtp-Source: AGHT+IEJXgXSUSmmo2SsXVmfT6DnwKWByn13rXM7axdiuHfSioFwEpENFf28kMwD6HAfy6nncBRDDA==
X-Received: by 2002:a05:600c:3b01:b0:477:54cd:200a with SMTP id 5b1f17b1804b1-477c110325dmr23471945e9.6.1763741330953;
        Fri, 21 Nov 2025 08:08:50 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:50 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [DO NOT APPLY PATCH v8 08/15] tools/poeg: Add test app for poeg
Date: Fri, 21 Nov 2025 16:08:15 +0000
Message-ID: <20251121160842.371922-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
References: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add test app for poeg for controlling output disable through
user space.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 tools/poeg/Build      |  1 +
 tools/poeg/Makefile   | 53 +++++++++++++++++++++++++++++++++++++++
 tools/poeg/poeg_app.c | 58 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+)
 create mode 100644 tools/poeg/Build
 create mode 100644 tools/poeg/Makefile
 create mode 100644 tools/poeg/poeg_app.c

diff --git a/tools/poeg/Build b/tools/poeg/Build
new file mode 100644
index 000000000000..f960920a4afb
--- /dev/null
+++ b/tools/poeg/Build
@@ -0,0 +1 @@
+poeg_app-y += poeg_app.o
diff --git a/tools/poeg/Makefile b/tools/poeg/Makefile
new file mode 100644
index 000000000000..669c914d9c98
--- /dev/null
+++ b/tools/poeg/Makefile
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0
+include ../scripts/Makefile.include
+
+bindir ?= /usr/bin
+
+ifeq ($(srctree),)
+srctree := $(patsubst %/,%,$(dir $(CURDIR)))
+srctree := $(patsubst %/,%,$(dir $(srctree)))
+endif
+
+# Do not use make's built-in rules
+# (this improves performance and avoids hard-to-debug behaviour);
+MAKEFLAGS += -r
+
+override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
+
+ALL_TARGETS := poeg_app
+ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
+
+all: $(ALL_PROGRAMS)
+
+export srctree OUTPUT CC LD CFLAGS
+include $(srctree)/tools/build/Makefile.include
+
+#
+# We need the following to be outside of kernel tree
+#
+$(OUTPUT)include/linux/poeg.h: ../../include/linux/pinctrl/rzg2l-poeg.h
+	mkdir -p $(OUTPUT)include/linux 2>&1 || true
+	ln -sf $(CURDIR)/../../include/linux/pinctrl/rzg2l-poeg.h $@
+
+prepare: $(OUTPUT)include/linux/poeg.h
+
+POEG_EXAMPLE := $(OUTPUT)poeg_app.o
+$(POEG_EXAMPLE): prepare FORCE
+	$(Q)$(MAKE) $(build)=poeg_app
+$(OUTPUT)poeg_app: $(POEG_EXAMPLE)
+	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
+
+clean:
+	rm -f $(ALL_PROGRAMS)
+	rm -rf $(OUTPUT)include/linux/poeg.h
+	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete
+
+install: $(ALL_PROGRAMS)
+	install -d -m 755 $(DESTDIR)$(bindir);		\
+	for program in $(ALL_PROGRAMS); do		\
+		install $$program $(DESTDIR)$(bindir);	\
+	done
+
+FORCE:
+
+.PHONY: all install clean FORCE prepare
diff --git a/tools/poeg/poeg_app.c b/tools/poeg/poeg_app.c
new file mode 100644
index 000000000000..4ff8e5c007dc
--- /dev/null
+++ b/tools/poeg/poeg_app.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * POEG - example userspace application
+ * Copyright (C) 2023 Biju Das
+ */
+#include <stdio.h>
+#include <stdlib.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <errno.h>
+#include <sys/ioctl.h>
+#include <linux/ioctl.h>
+#include <stdio.h>
+#include <unistd.h>
+#include <sys/time.h>
+#include <sys/types.h>
+#include <poll.h>
+
+#include <linux/poeg.h>
+
+int main(int argc, char *argv[])
+{
+	struct poeg_cmd cmd;
+	unsigned int val;
+	long cmd_val;
+	char *p;
+	int i;
+
+	cmd_val = strtol(argv[1], &p, 10);
+	if (*p != '\0' || errno != 0)
+		return 1; // In main(), returning non-zero means failure
+
+	fd = open("/dev/poeg3", O_RDWR);
+	if (fd < 0)
+		perror("open");
+	else
+		printf("[POEG]open\n");
+
+	cmd.val = cmd_val;
+	cmd.channel = 4;
+	if (cmd.val == RZG2L_POEG_OUTPUT_DISABLE_USR_ENABLE_CMD)
+		printf("[POEG] user control pin output disable enabled\n");
+	else
+		printf("[POEG] user control pin output disable disabled\n");
+
+	ret = write(fd, &cmd, sizeof(cmd));
+	if (ret == -1) {
+		perror("Failed to write cmd data");
+		return 1;
+	}
+
+	if (close(fd) != 0)
+		perror("close");
+	else
+		printf("[POEG]close\n");
+
+	return 0;
+}
-- 
2.43.0


