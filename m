Return-Path: <linux-gpio+bounces-5308-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A808A0072
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 21:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B384E28AF87
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 19:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DD6181316;
	Wed, 10 Apr 2024 19:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iWVEdiZ6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1761717BB2D
	for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712776614; cv=none; b=UEc+IBgvdOqplHd2rjxK/lNXIZ509q4soK5HDPliDFv24N+m+Mq7ckMUFJoPmW8x2DdOAy8eeyQ8De6pCrAdnmJLbsCqNkLk4ylLdazchi0a7GOFRKw9vlzcZHKtcqkA/cyjHryl9lY71K0hAWLgZ5UJahUiu65pY2aqG8GAmEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712776614; c=relaxed/simple;
	bh=erJ5V4AEq9kOBuy+ykQ1O00z8l7mTBVCWc0yL6DBaS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JqJYCSRE5LKK0c6GHgwzoZL8S/666Bcw7BfKOGuyxok98GN3o4GiQRCJoQ90CgMjkCqH+4H/YOTINn+W+Q0mZ0rfC4s508y/HCS95YHlcy1/9OgWCEILC4GrjenbIaVI3p8V4pEFPe9a90vqap8e28nLO+/vwN5x8TXjdRJjYCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iWVEdiZ6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712776612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bx2XDbPzp2AfqZX+T1+85Iiv5NmDhmS7mUqjJ8NOCFI=;
	b=iWVEdiZ6VG9PIdvSwXKi+U0Ph1yJN91VPp/uPLg6Qsqdd4nrQxFol6jyYtBl9EHrI31XZ+
	Z6yBiQzDREnpfvGFBeF+oG9W5IVLmnXLpcrdcn9TpwM26VGHjkf6SnsxYjYehEoHtRYQEq
	Y0yKZ5WUd8zd8BfJzCTW4RnGmihfN0E=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-OzTem-HPPFqKcAQUF1MLnA-1; Wed,
 10 Apr 2024 15:16:46 -0400
X-MC-Unique: OzTem-HPPFqKcAQUF1MLnA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43B833C367E8;
	Wed, 10 Apr 2024 19:16:46 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4BB3B44434D;
	Wed, 10 Apr 2024 19:16:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 1/6] mmc: core: Add mmc_gpiod_set_cd_config() function
Date: Wed, 10 Apr 2024 21:16:34 +0200
Message-ID: <20240410191639.526324-2-hdegoede@redhat.com>
In-Reply-To: <20240410191639.526324-1-hdegoede@redhat.com>
References: <20240410191639.526324-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

Some mmc host drivers may need to fixup a card-detection GPIO's config
to e.g. enable the GPIO controllers builtin pull-up resistor on devices
where the firmware description of the GPIO is broken (e.g. GpioInt with
PullNone instead of PullUp in ACPI DSDT).

Since this is the exception rather then the rule adding a config
parameter to mmc_gpiod_request_cd() seems undesirable, so instead
add a new mmc_gpiod_set_cd_config() function. This is simply a wrapper
to call gpiod_set_config() on the card-detect GPIO acquired through
mmc_gpiod_request_cd().

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Group mmc_gpiod_set_cd_config() prototype in slot-gpio.h together
  with mmc_gpiod_set_cd_config()
---
 drivers/mmc/core/slot-gpio.c  | 20 ++++++++++++++++++++
 include/linux/mmc/slot-gpio.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/mmc/core/slot-gpio.c b/drivers/mmc/core/slot-gpio.c
index 39f45c2b6de8..8791656e9e20 100644
--- a/drivers/mmc/core/slot-gpio.c
+++ b/drivers/mmc/core/slot-gpio.c
@@ -221,6 +221,26 @@ int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
 }
 EXPORT_SYMBOL(mmc_gpiod_request_cd);
 
+/**
+ * mmc_gpiod_set_cd_config - set config for card-detection GPIO
+ * @host: mmc host
+ * @config: Generic pinconf config (from pinconf_to_config_packed())
+ *
+ * This can be used by mmc host drivers to fixup a card-detection GPIO's config
+ * (e.g. set PIN_CONFIG_BIAS_PULL_UP) after acquiring the GPIO descriptor
+ * through mmc_gpiod_request_cd().
+ *
+ * Returns:
+ * 0 on success, or a negative errno value on error.
+ */
+int mmc_gpiod_set_cd_config(struct mmc_host *host, unsigned long config)
+{
+	struct mmc_gpio *ctx = host->slot.handler_priv;
+
+	return gpiod_set_config(ctx->cd_gpio, config);
+}
+EXPORT_SYMBOL(mmc_gpiod_set_cd_config);
+
 bool mmc_can_gpio_cd(struct mmc_host *host)
 {
 	struct mmc_gpio *ctx = host->slot.handler_priv;
diff --git a/include/linux/mmc/slot-gpio.h b/include/linux/mmc/slot-gpio.h
index 5d3d15e97868..66272fdce43d 100644
--- a/include/linux/mmc/slot-gpio.h
+++ b/include/linux/mmc/slot-gpio.h
@@ -21,6 +21,7 @@ int mmc_gpiod_request_cd(struct mmc_host *host, const char *con_id,
 			 unsigned int debounce);
 int mmc_gpiod_request_ro(struct mmc_host *host, const char *con_id,
 			 unsigned int idx, unsigned int debounce);
+int mmc_gpiod_set_cd_config(struct mmc_host *host, unsigned long config);
 void mmc_gpio_set_cd_isr(struct mmc_host *host,
 			 irqreturn_t (*isr)(int irq, void *dev_id));
 int mmc_gpio_set_cd_wake(struct mmc_host *host, bool on);
-- 
2.44.0


