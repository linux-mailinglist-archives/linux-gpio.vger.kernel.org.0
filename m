Return-Path: <linux-gpio+bounces-20014-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DABD1AB4F92
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 392DA8C0250
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 09:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C568A21C188;
	Tue, 13 May 2025 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="JzNYpOwX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD8721C17B;
	Tue, 13 May 2025 09:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127990; cv=none; b=aFwzJAhGqQwMGmBAQ205USgd44UKj7u199ob3xqXnEAB2Qm1QYoDgp6t4t951B8IEHCBwUKZ8p8xy2J4F/2TQib/eg92wSXl2BVUFa4Gcst8MKCRkwvy/vwv+0qqppgLsyXblmzfI6i5joeRk4EhKgsiRIWKrZaQzuVTWyQUw2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127990; c=relaxed/simple;
	bh=F+9+GV6PR4vz3HrC1iJgRo/ICi0mkT4spMSTxAe5JUc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uIwyXSt016Hgy8V1NMnlvmFtVrVVDrxc4yu2/DR9a5GU//cvldpqClv1Xn/ra1dUMxuCHSSlNSjGWVdxyyQjU1XCBR1kBqIZVEKhCsXrpBwh9nvBGyUXo5vH7GFf3R5DO3tCYa7C19QoTkuNAZRheND7qr0hsYqmj4V8+lXw98A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=JzNYpOwX; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1747127988; x=1778663988;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F+9+GV6PR4vz3HrC1iJgRo/ICi0mkT4spMSTxAe5JUc=;
  b=JzNYpOwXuStUgCprOi+dL+6afWw3HCPKzBMcZQhIz0yfpV6BZiBu7X27
   yzNTetaR81/Ae1zLdvtVMTrTWOtSgopmChJzLLec8yoT9wpX93f8Q76XA
   nr65abDJtbkSMqv4B2VzitepBtvUFkUwaKI/wMKduegz4rUTbDITrXpXi
   BqcOMaDbpc9kGsN6T5VojoSS3kYmHJTNrqCDNBVxvVTdkRAJ4YN4mHVU2
   zjBd1PwMXI+xzgHoAlmk0d7IhhuwGev15wr4t7LW8CAqZQa3L/pTFf0mU
   m8hdNMjU/klaq8jEJEJD91KmRnwVdpH1puOTmnirBrd9awY3hEAZSa9Pc
   Q==;
X-CSE-ConnectionGUID: 4la2DOakSDynwZsvbJGMbg==
X-CSE-MsgGUID: tY78326VT2eXjS8LPxCs9g==
X-IronPort-AV: E=Sophos;i="6.15,284,1739862000"; 
   d="scan'208";a="209027473"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 May 2025 02:19:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 13 May 2025 02:19:17 -0700
Received: from che-ld-unglab06.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 13 May 2025 02:19:13 -0700
From: Rengarajan S <rengarajan.s@microchip.com>
To: <vaibhaavram.tl@microchip.com>, <kumaravel.thiagarajan@microchip.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <linus.walleij@linaro.org>,
	<brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <unglinuxdriver@microchip.com>
CC: <rengarajan.s@microchip.com>
Subject: [PATCH v1 char-misc-next 0/2] Add GPIO Hot reset and Wakeup Support
Date: Tue, 13 May 2025 14:45:55 +0530
Message-ID: <20250513091557.3660-1-rengarajan.s@microchip.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series adds the support for GPIO Hot reset from C0 device
revisions. In addition, GPIO Wakeup support is added using irq_set_wake.

Rengarajan S (2):
  misc: microchip: pci1xxxx: Add PCIe Hot reset disable support for Rev
    C0 and later devices
  misc: microchip: pci1xxxx: Add GPIO Wakeup Support

 .../misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c   | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

-- 
2.25.1


