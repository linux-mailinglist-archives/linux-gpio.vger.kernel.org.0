Return-Path: <linux-gpio+bounces-13553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4919E5765
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 14:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFC0E28440E
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Dec 2024 13:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27751218EAA;
	Thu,  5 Dec 2024 13:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="F/UzR3QM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D2A218AA7;
	Thu,  5 Dec 2024 13:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406033; cv=none; b=lqyaUppWzfHrSaZ/dOBul6AL8h+RljjcJrZ2oZGBuPtFhf2jaeQu1dqE4DuBR0stk+Zh22Xy4IaUhGAwP6yryQ7GRqqBaF5/aDbLZYIyJYSrfwUD1l2ldlcl8ND4EmCpoOnF/cjvN1cZ1fg4wFw5N3tKv84GY9SDKiJm7MYTLQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406033; c=relaxed/simple;
	bh=Cr1+wcP0hTSTt3+7HHRS/vUhWxRrCsu8Ewqll3JAfVg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X1yaHnodmWW5FQZTIDNjylSBXPdeM5wsRmQc/cNpYJ2LVu9/rqk2nfxTOxR0+3JQd14Vgco6bcAZD+CFUSYzXuWxihvjnJ1oQJmzOkVyKiG1mJvu1IrCtH4o1SLVzTC0XINRoWBU5HotqANEBm+g+THdriXLvC0fJrPN8s2eyjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=F/UzR3QM; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733406031; x=1764942031;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Cr1+wcP0hTSTt3+7HHRS/vUhWxRrCsu8Ewqll3JAfVg=;
  b=F/UzR3QMarlzTFaPJWrGiL88WCXVR0TEKS00d4FRYBzT68Gk7u6SOIJN
   ZgsYqBeuTYR4ru9leXY7dBJQcYBrjAZ6qnbf5H8vxda3bABu4z+qnEMRt
   LfR27k7RnTY1aM93Tu5k/aRkA7xZGhWPZ4LmJq7Ah3zJrNnxuVcwHa31Q
   3uwX2qBxx0/84+Itv05AJlf3nuzH7Z3di4rNLxDz4ZbPokEYIh9WmC2hN
   zSflrr4Qb9gaQsomXqp6zmELHR0z/0+ax7Jz1JXceNR6pX7VV6kryLZnJ
   9brOZpBs4RbAsSzUHDC5Bb/G8mPF+37HKvOk+sifStQWEjfMS7Phjs6i3
   w==;
X-CSE-ConnectionGUID: pwzK5/P8TFGnVo0ml5dWew==
X-CSE-MsgGUID: WuZON1DvQSGrLDOBHCuPwQ==
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="38836227"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2024 06:40:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 5 Dec 2024 06:39:54 -0700
Received: from che-dk-ungapp03lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 5 Dec 2024 06:39:51 -0700
From: Rengarajan S <rengarajan.s@microchip.com>
To: <vaibhaavram.tl@microchip.com>, <kumaravel.thiagarajan@microchip.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <unglinuxdriver@microchip.com>
CC: <rengarajan.s@microchip.com>
Subject: [PATCH v1 char-misc-linus 0/2] misc: microchip: pci1xxxx: Resolve kernel panic and return code mismatch issues
Date: Thu, 5 Dec 2024 19:06:24 +0530
Message-ID: <20241205133626.1483499-1-rengarajan.s@microchip.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series resolves the kernel panic during GPIO IRQ handling.
Additionally, it fixes the return code mismatch during GPIO set config.

Rengarajan S (2):
  misc: microchip: pci1xxxx: Resolve kernel panic during GPIO IRQ
    handling
  misc: microchip: pci1xxxx: Resolve return code mismatch during GPIO
    set config

 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1


