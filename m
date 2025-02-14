Return-Path: <linux-gpio+bounces-15999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C43A35B88
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 11:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 401D516F171
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96E52586F3;
	Fri, 14 Feb 2025 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NIIsWm2r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F54F2566D9
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739528818; cv=none; b=oPljdSG4bsFgb8S9TAKiX+YirXOa0V8YcYRXcuYrQIc+LarBhZ2g5sAH/8sLecfwWD4kNn166jqHKUNyVcJT15JNFPcTMShE2Ogv8xc5+uNsVWOwXUOhMALAcHfFpufveQjIwBieh5jIDeaicnYknqhThrLx9N1Tb/CMT+9aygU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739528818; c=relaxed/simple;
	bh=2meMHiIzkKsmrc1lfP8IvH1M2MH4D6nlyl744BBg6bQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MRy1em6Kl0OUiJS7orso7gTKI+Uj4cVKHuWJr6b8lf+XpSOT0j8iUUliRm0JLw8+6xcjAYsQRjze8CtSElr7FXXPKpN4WWCIb8uaqFW9Y5dTT9XSgKgqqyJCfOAbMmZY1eH31TQuVNu0PDnoT4gfKhVeTCieVv+pZZ7Gwncz6VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NIIsWm2r; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dd93ace00so1058481f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 02:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739528814; x=1740133614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s1pDRD9XgK6wwoUW3dlZetBGGJidVyuQJRtl7Q42LoM=;
        b=NIIsWm2rjhoETUxGnzYNIikuSadjOY1mLVjYtpWwDQo/tIvOeynpRa2Ci2AQpSw7OS
         sO3He61cFBQfIGdrWiIWxs/tch0S3iEkQkp5ZNkX+aTdvEc4JSEgPnfDRDgJexdrB3lB
         EoGHX6JHwWAKr4osztQSvp+UUCj1cg+iSGHolxdQ5aFBcnbkeIlgWkmNf5fK3X2P8s2h
         hE5fU7yhUSFAuBomu6RqWuCFinSG/I1FYNM+GxruH3si8E+0Hqh9fjA6N4EspxvT8ZYj
         dETBIrgrmnYLMbFBTD7BTJNfHWjfUbEBbW3dEkA+ZUdIeZkYqPAZJmSKI+5GeiYdESHl
         ctpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739528814; x=1740133614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1pDRD9XgK6wwoUW3dlZetBGGJidVyuQJRtl7Q42LoM=;
        b=sS2Or5uxL3GNwD8Ho/2cohhpFsDThNU/Uqph0nzC3lKsji4jFWF+zULxkaq6BmamkO
         H+lffSy/mAEFEY8XveIMNNvnOOHed2lF8y2yRZFj/OeM5s0jODdXXyXFgIxc+MWm7yjo
         RKbQLCDsbMDB2ztP/0MzkSs4zVeAJUnxe/2mYDp7FWcXSllze8BWE9iWrQBpKazMjsms
         tCDgmIvfH1oMaWtX8Q6ggR30CnkGODuVINFdN2qiMkaNQX0GNcFCtgC3Chk28AP1Q9xH
         prMexBrEQ1SqVoYcq3bBOs7jry0Vp/w5IhZc4asQJ036r+pQq1HuSR8Wz+lumIOKVdqQ
         DsSw==
X-Gm-Message-State: AOJu0YzErNhfbq/WOlirXTxFKH+bd01FNnjOymc/dzai2GJiOiSC94uW
	LLWhFwIHyNTggvDXo3hIkHRz6XCjtARB/W3Tjq73wS+L5JAEURkmPhQzDYzC9og=
X-Gm-Gg: ASbGncsPf3xKrgS9JBNB7+CsSEzouGmUIXgcIE/dNxq2LnY3EMfcaOD800cijZ2z0nw
	qve1hKJHC2CjC43zgYqHQ/WKqy+r2U4ev0qzNC1pqHrl5MdfPEid/5Go6PbRk+980tD2E7/wIqq
	vpCWCsqiP61GjRBezfJXxQ/BvILK2dPeUnq5V/rx+ETvLTn8BE/X8JutfRXsNtyV7uFtQZDSYMg
	dM8Hrd1jmhmOj4LDiXjmlFSpOfgymorNnmm6QBISRPC6O9RmUxqFUv7X42YLVix47DS//ucQHWb
	YS+grhbIvwv1kA==
X-Google-Smtp-Source: AGHT+IFARParPV7f10LBLRH5xrINs9Qjye1SpcquyclTxkwwRx9aujpH0U96SQ8pR0fI0iczwUoRCw==
X-Received: by 2002:a5d:584c:0:b0:38f:28a1:5017 with SMTP id ffacd0b85a97d-38f28a1565fmr6997714f8f.9.1739528814409;
        Fri, 14 Feb 2025 02:26:54 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:62cc:da7:7c42:97ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a04f22fsm71362505e9.5.2025.02.14.02.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 02:26:53 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH libgpiod] gpiosim: defer removal of bank entries when device is not disabled
Date: Fri, 14 Feb 2025 11:26:48 +0100
Message-ID: <20250214102648.71382-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linux kernel commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
instantiated device depends on") has uncovered an issue in libgpiosim:
we use reference counting for all objects (to make RAII easier for
bindings) but, with the above change, if the user doesn't explicitly
disable the device before dropping the last reference to a bank object,
the parent device will never get correctly cleaned up.

This is because we remove the hog and line directories in bank's
release() callback unconditionally. With the directories being locked
now, this fails if device is active and then when we eventually call the
device object's release(), we'll end up stuck with leftover bank
directories and never actually clean-up correctly.

Extend the gpiosim device with a list of deferred banks. When releasing
a bank on an active device, defer any actual cleanup until the time the
device gets deactivated which may be triggered by the user explictly or
will happen automatically when the last reference to the device object is
dropped. For inactive devices, there's no functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tests/gpiosim/gpiosim.c | 66 +++++++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 23 deletions(-)

diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index fca6b7f..81bfd57 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -404,12 +404,14 @@ struct gpiosim_dev {
 	int cfs_dir_fd;
 	int sysfs_dir_fd;
 	struct list_head banks;
+	struct list_head deferred_banks;
 };
 
 struct gpiosim_bank {
 	struct refcount refcnt;
 	struct gpiosim_dev *dev;
 	struct list_head siblings;
+	struct list_head deferred;
 	char *item_name;
 	int id;
 	char *chip_name;
@@ -633,6 +635,7 @@ GPIOSIM_API struct gpiosim_dev *gpiosim_dev_new(struct gpiosim_ctx *ctx)
 	memset(dev, 0, sizeof(*dev));
 	refcount_init(&dev->refcnt, dev_release);
 	list_init(&dev->banks);
+	list_init(&dev->deferred_banks);
 	dev->cfs_dir_fd = configfs_fd;
 	dev->sysfs_dir_fd = -1;
 	dev->item_name = item_name;
@@ -826,8 +829,33 @@ GPIOSIM_API int gpiosim_dev_enable(struct gpiosim_dev *dev)
 	return 0;
 }
 
+static void bank_release_finish(struct gpiosim_bank *bank)
+{
+	struct gpiosim_dev *dev = bank->dev;
+	struct gpiosim_line *line, *tmp;
+	char buf[64];
+
+	list_for_each_entry_safe(line, tmp, &bank->lines, siblings) {
+		snprintf(buf, sizeof(buf), "line%u/hog", line->offset);
+		unlinkat(bank->cfs_dir_fd, buf, AT_REMOVEDIR);
+
+		snprintf(buf, sizeof(buf), "line%u", line->offset);
+		unlinkat(bank->cfs_dir_fd, buf, AT_REMOVEDIR);
+
+		list_del(&line->siblings);
+		free(line);
+	}
+
+	close(bank->cfs_dir_fd);
+	unlinkat(dev->cfs_dir_fd, bank->item_name, AT_REMOVEDIR);
+	free(bank->item_name);
+	id_free(bank->id);
+	free(bank);
+}
+
 GPIOSIM_API int gpiosim_dev_disable(struct gpiosim_dev *dev)
 {
+	struct gpiosim_bank *bank, *tmp;
 	int ret;
 
 	if (!dev_check_live(dev))
@@ -837,6 +865,11 @@ GPIOSIM_API int gpiosim_dev_disable(struct gpiosim_dev *dev)
 	if (ret)
 		return ret;
 
+	list_for_each_entry_safe(bank, tmp, &dev->deferred_banks, deferred) {
+		list_del(&bank->deferred);
+		bank_release_finish(bank);
+	}
+
 	dev_close_sysfs_dirs(dev);
 
 	dev->live = false;
@@ -853,32 +886,19 @@ static void bank_release(struct refcount *ref)
 {
 	struct gpiosim_bank *bank = to_gpiosim_bank(ref);
 	struct gpiosim_dev *dev = bank->dev;
-	struct gpiosim_line *line, *tmp;
-	char buf[64];
-
-	list_for_each_entry_safe(line, tmp, &bank->lines, siblings) {
-		snprintf(buf, sizeof(buf), "line%u/hog", line->offset);
-		unlinkat(bank->cfs_dir_fd, buf, AT_REMOVEDIR);
-
-		snprintf(buf, sizeof(buf), "line%u", line->offset);
-		unlinkat(bank->cfs_dir_fd, buf, AT_REMOVEDIR);
-
-		list_del(&line->siblings);
-		free(line);
-	}
 
 	list_del(&bank->siblings);
-	close(bank->cfs_dir_fd);
-	unlinkat(dev->cfs_dir_fd, bank->item_name, AT_REMOVEDIR);
+
+	/*
+	 * If the device is still active, defer removing the bank directories
+	 * until it's disabled. Otherwise, do it now.
+	 */
+	if (dev->live)
+		list_add(&bank->deferred, &dev->deferred_banks);
+	else
+		bank_release_finish(bank);
+
 	gpiosim_dev_unref(dev);
-	if (bank->sysfs_dir_fd >= 0)
-		/* If the device wasn't disabled yet, this fd is still open. */
-		close(bank->sysfs_dir_fd);
-	free(bank->item_name);
-	id_free(bank->id);
-	free(bank->chip_name);
-	free(bank->dev_path);
-	free(bank);
 }
 
 GPIOSIM_API struct gpiosim_bank *gpiosim_bank_new(struct gpiosim_dev *dev)
-- 
2.45.2


