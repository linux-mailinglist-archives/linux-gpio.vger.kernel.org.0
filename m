Return-Path: <linux-gpio+bounces-5307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C803D8A006F
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 21:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2C961C22C3F
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 19:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2274D18130D;
	Wed, 10 Apr 2024 19:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IINT8dBJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643F0180A92
	for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 19:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712776613; cv=none; b=JNTYTS7b451v7bjOffhqdFae/3l8s8KEleY5vEzofdcD/OdubHMJxNvmwU9lmS3nDIf6exmbRaRfFP3W6Cbhl/ywz/lWtag1mAqAqulYpnJBqZ42knNrSZxq/FODpnPVBPa1Y1BLgS9mDSRH8lSGM8+nAqYSD9zxSNeKug8Yub0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712776613; c=relaxed/simple;
	bh=p+THzd48hQUVMEur3ENuOSA0lDZ0jQ4EJJ+0Q2LLq0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f1eZCK/z0DYsPJcfNL3SyQtBIWxH11GRpCUtB76MeWUERTz9U8EJNrwVSu5eK6ly4KvtymVPESTRn1keZvkpM1HDxf6+D2SY1WxPdocNNvLY0mMgTTymdvIvEAz8MR+8vud+wE4I8L8cLRdXj81hKxf8K+Tiygh+UXytkIcDRJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IINT8dBJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712776611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DVLmiV+FHhixrjqT4DJ7t6PVY4+lI7IXVqA4SStqmj8=;
	b=IINT8dBJ205zkYntQgZd71c2nqTxdK4hctavpDH4lLef7r4afJSnCdBYy8v0n5rWpLc3zr
	2j+4cuYZ17ySMKsDnbDRR0yTxG05VByE1HiznGVb/+KXuVCFfcsENd2BDss4HR9lh8YxFc
	+Yb82dB5JLnan6nlIOuB8E+AkPokk1U=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-390-QtjjBTjsOhS98i8d8s0Ljg-1; Wed,
 10 Apr 2024 15:16:45 -0400
X-MC-Unique: QtjjBTjsOhS98i8d8s0Ljg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AD9929AA3BA;
	Wed, 10 Apr 2024 19:16:45 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B60C44434C;
	Wed, 10 Apr 2024 19:16:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 0/6] mmc: sdhci-acpi: Add some DMI quirks to fix various issues on Bay Trail devices
Date: Wed, 10 Apr 2024 21:16:33 +0200
Message-ID: <20240410191639.526324-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

Hi All,

Here is v3 of my series adding DMI quirks to fix various issues on Intel
Bay Trail tablets.

Changes in v3:
- Replace "mmc: sdhci-acpi: Disable UHS/1.8V modes on Lenovo Yoga
  Tablet 2 series sdcard slot" with a new patch from Adrian which
  actually fixes these modes:
  "[PATCH v3 2/6] mmc: sdhci: Add support for "Tuning Error" interrupts"

  Note this is missing a Signed-off-by from Adrian since this started out
  as a quick test patch from Adrian.
  Adrian, can you provide your S-o-b for this patch?

Changes in v2:
- Address a few small remarks from Andy and adds Andy's Reviewed-by
  to the patches

Regards,

Hans


Adrian Hunter (1):
  mmc: sdhci: Add support for "Tuning Error" interrupts

Hans de Goede (5):
  mmc: core: Add mmc_gpiod_set_cd_config() function
  mmc: sdhci-acpi: Sort DMI quirks alphabetically
  mmc: sdhci-acpi: Fix Lenovo Yoga Tablet 2 Pro 1380 sdcard slot not
    working
  mmc: sdhci-acpi: Disable write protect detection on Toshiba WT10-A
  mmc: sdhci-acpi: Add quirk to enable pull-up on the card-detect GPIO
    on Asus T100TA

 drivers/mmc/core/slot-gpio.c  | 20 ++++++++++++
 drivers/mmc/host/sdhci-acpi.c | 61 +++++++++++++++++++++++++++++++----
 drivers/mmc/host/sdhci.c      | 10 ++++--
 drivers/mmc/host/sdhci.h      |  3 +-
 include/linux/mmc/slot-gpio.h |  1 +
 5 files changed, 86 insertions(+), 9 deletions(-)

-- 
2.44.0


