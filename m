Return-Path: <linux-gpio+bounces-13980-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 256E29F580F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 21:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77A381881B94
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 20:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6591F8AE7;
	Tue, 17 Dec 2024 20:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bJ+wx1r4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE3A150994;
	Tue, 17 Dec 2024 20:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734468506; cv=none; b=llo4vZqS15FuVMaCsz/eHRqSXZYQeiGj+vfV3vyhdvUrmGgMYklBMticQLhdQlnqR/JddZ7wO2HjXr1Ue60KFQiECed9dRYRhDX0G9vaOy1bnB1MpW3bzVo6YQDuaypP5uUbYU7Ddv2gfYnZH2WpETqbOqkFY9IAf58g0BuHpDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734468506; c=relaxed/simple;
	bh=VGwN2IRMnIhPVWCwWW62o4eZYGILo8S5ix6UL4fDIDQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YN9+B6I7mV5ZJ/N0i6GnQyigkw/TryYR9q3Nv/dpuhRLUde5DlHdyBgUEUbY6S2lOSW6W1VFFPMggIHZIfym6l4Gddb6GjAG4unr1lhmeyNRu4YYJvhihy+jr9u/sAd6QQzNYzWEwoT5jfAUR7KBbhsjrYEyqU+eY8VyH8TXpe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bJ+wx1r4; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHKltGP055178
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 14:47:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734468476;
	bh=LTOIe3GVKsSWdeJG4XQTfvePTsd9cRoeiTuF0rnAvKE=;
	h=From:To:CC:Subject:Date;
	b=bJ+wx1r4KCnEnhTmtjrbVat+VCtZBe7FbLLYuZlFlfDCONYCOqCm9neEScmzg1HGR
	 m9Ubc5NkXTP7hVVzjBtPaznnAI9Ox/FR8rxDYniQJDvgWl2YnoBeolBmgctO2PhKEL
	 Z/skKR3CxZGYZnDSomMwn32uPwF6fW322PmnR234=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHKlt7u130150
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 14:47:55 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 14:47:55 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 14:47:55 -0600
Received: from DMZ007XYY.dhcp.ti.com (dmz007xyy.dhcp.ti.com [128.247.29.8])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKltv6025808;
	Tue, 17 Dec 2024 14:47:55 -0600
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
To: <aaro.koskinen@iki.fi>, <andreas@kemnade.info>, <khilman@baylibre.com>,
        <rogerq@kernel.org>, <tony@atomide.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
Subject: [PATCH v1 0/1] TPS65219 GPIO Driver Cleanup Series
Date: Tue, 17 Dec 2024 14:47:54 -0600
Message-ID: <20241217204755.1011731-1-s-ramamoorthy@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This series is in preparation to add 2 PMIC devices to the TPS65219 driver.

The changes involve using existing helper macros to simplify code. The 
intention is to remove unnecessary noise from the new PMIC patches adding 
support to this driver.

Shree Ramamoorthy (1):
  gpio: tps65219: Use existing kernel gpio macros

 drivers/gpio/gpio-tps65219.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

-- 
2.34.1


