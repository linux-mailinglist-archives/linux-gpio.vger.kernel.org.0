Return-Path: <linux-gpio+bounces-5312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4378A007B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 21:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D880528B715
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 19:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A5018130E;
	Wed, 10 Apr 2024 19:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DKWi73AK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29481181307
	for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 19:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712776618; cv=none; b=vA67ojgK36QZ799OnN3wdLgoHLlalhyukm9ZbMKlnYfVlb4X2Abm3EqkE/OBAIS/As3BI2mZo7/O0lutioDfQUvPZpK28EAqpnlUuE21UAAoa/mvTA4K8aO3X56XNTOkhmIvmKQ8FAb+SI4nSF49KTvTBOV/bwP2yOhueLNkUd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712776618; c=relaxed/simple;
	bh=TmPMzy2QrKbaAv7DsDatyIH9559HKewe/ccvDgjokko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p21Z+5u18BSYQw+Bq10RI3EmQQJTzezt0P16u7YpGTWU7WJht6v/IUCkS5G3Bhvq5KGjxwmso7/wEkQIl5vDtMKQTGY8LBhzERLOA96pz5VqTolBEQyuC+5/2RXVAl068goLAlp0mnm3FSuQEsKZYYSFBBhXotzapOavnzHUAOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DKWi73AK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712776616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9GS63d3wUNACBhBMB1wMLf9jnd6fxCOGCI4o4/hkcZk=;
	b=DKWi73AKNos5Sl8qAnyXnDWNhqjN9qTXmUmcScX0Z++X918fphCrd09owHJq+PUbDjlRjq
	8lUbU55+OOQ6pgkea5Q/R8rFrwkAJL82vjpu6tnl30nM4w+HlRuu+0z6vaTzQBTLVsYLGP
	Wv9OzvQja8z1ijyFxgRYVum9WhAAxTM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-O5HO4J39OLGwaCTjip0aPg-1; Wed, 10 Apr 2024 15:16:51 -0400
X-MC-Unique: O5HO4J39OLGwaCTjip0aPg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4A531044577;
	Wed, 10 Apr 2024 19:16:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EDC3A44434C;
	Wed, 10 Apr 2024 19:16:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 5/6] mmc: sdhci-acpi: Disable write protect detection on Toshiba WT10-A
Date: Wed, 10 Apr 2024 21:16:38 +0200
Message-ID: <20240410191639.526324-6-hdegoede@redhat.com>
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

On the Toshiba WT10-A the microSD slot always reports the card being
write-protected, just like on the Toshiba WT8-B.

Add a DMI quirk to work around this.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mmc/host/sdhci-acpi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mmc/host/sdhci-acpi.c b/drivers/mmc/host/sdhci-acpi.c
index c0d77f589deb..f7d4808413cb 100644
--- a/drivers/mmc/host/sdhci-acpi.c
+++ b/drivers/mmc/host/sdhci-acpi.c
@@ -779,6 +779,17 @@ static const struct dmi_system_id sdhci_acpi_quirks[] = {
 		},
 		.driver_data = (void *)DMI_QUIRK_SD_NO_WRITE_PROTECT,
 	},
+	{
+		/*
+		 * The Toshiba WT10-A's microSD slot always reports the card being
+		 * write-protected.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TOSHIBA WT10-A"),
+		},
+		.driver_data = (void *)DMI_QUIRK_SD_NO_WRITE_PROTECT,
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.44.0


