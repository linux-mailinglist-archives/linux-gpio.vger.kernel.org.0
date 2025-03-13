Return-Path: <linux-gpio+bounces-17556-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBF5A5FD2A
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 18:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F525173F2C
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Mar 2025 17:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1CC269D1D;
	Thu, 13 Mar 2025 17:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="HxjYMc+h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90C663B9;
	Thu, 13 Mar 2025 17:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741885992; cv=none; b=kukEz9u4UUdHIxtVy8C6xyzlF80FqNo/mHyU7oV5eJcSEqOaAtuz2HYJ5SemPongKj8GLEeudb7ElDQgCPqeMTyaUOd0Pm7fZ3OdOz7XEOoaUu1cK2++FtDsEUoOXhOj0Ex3nURE6UrjsgDakbPZBp2m8MmmzZVAaRM4WpeNpcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741885992; c=relaxed/simple;
	bh=9O6nNEssvDL7ZyDZtbLL1yjkarm1WBvWe/ehZBDssnU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WLXcbcVyYvjl4t3ZkjccmWd03U5ELozfeK62FmVhJYe3lM58DoZXQj/zHZWGHsfDc7RW9qHK/AHUbmPJF+NeFCMEFP2VOF3pZlHbVr8ikdqi+Sn78ZAPYDDyyaSYmFD3MrAOpqWKHMX+mqc+jCHAUVpPRanmCEGFuMpVuDMwJMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=HxjYMc+h; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1741885991; x=1773421991;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9O6nNEssvDL7ZyDZtbLL1yjkarm1WBvWe/ehZBDssnU=;
  b=HxjYMc+hNMMamkXfD1BmaRYaXQlwEVX40iygqD5ro9E8dUVpapsU/0JL
   WaBQmszoEeujetf0OfirnDgoCYVZWhzVjwmnCQRfNOlIqQLknFSty4Uw+
   P+cdGX2n1oGfzwI7GRdzvaLGQcEcYqBNM5M7HaCX7jgy49zmPNh2kx6pX
   afQ461xaBkFlny77h/9NZlg2D7JudMP9+6mkDQAYTcFPAVGIZbvgWHgIP
   B8IKHlui/Z9WkEmRj7eQhSHJw8FUWrjcZXQqQ0tNa35lhM7o2AqXauct7
   E/XZXNka2HtbTvbuLkIpcXN4f01PDCy23RsD18pWqO5OGmbC8VGRFY73p
   w==;
X-CSE-ConnectionGUID: NuBGJSZZTvSJoh/JmS1Gyg==
X-CSE-MsgGUID: 8MmtI+pIRBKpKkSVSSOD2w==
X-IronPort-AV: E=Sophos;i="6.14,245,1736838000"; 
   d="scan'208";a="39421681"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Mar 2025 10:13:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Mar 2025 10:12:35 -0700
Received: from che-dk-ungapp03lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 13 Mar 2025 10:12:33 -0700
From: Rengarajan S <rengarajan.s@microchip.com>
To: <vaibhaavram.tl@microchip.com>, <kumaravel.thiagarajan@microchip.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <unglinuxdriver@microchip.com>
CC: <rengarajan.s@microchip.com>
Subject: [PATCH v1 char-misc-linus 0/2] misc: microchip: pci1xxxx: Resolve IRQ handler kernel panic and incorrect IRQ status update issues
Date: Thu, 13 Mar 2025 22:38:54 +0530
Message-ID: <20250313170856.20868-1-rengarajan.s@microchip.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series resolves couple of interrupt handling issues namely
fixing the kernel panic during IRQ handler initialization and resolving
the incorrect IRQ status update inside irq_ack.

Rengarajan S (2):
  misc: microchip: pci1xxxx: Fix Kernel panic during IRQ handler
    registration
  misc: microchip: pci1xxxx: Fix incorrect IRQ status handling during
    ack

 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.25.1


