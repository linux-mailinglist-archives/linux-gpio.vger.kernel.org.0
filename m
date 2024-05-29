Return-Path: <linux-gpio+bounces-6798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 029558D2ECC
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33F801C22A03
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B83168C17;
	Wed, 29 May 2024 07:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="CVIGbPhL";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="OjF/6IKl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF090167D87;
	Wed, 29 May 2024 07:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968799; cv=none; b=jKHAm4fg49UO7dSmLy8jhJVo4XfoepdfLqkCHqV1whDx9bcQ723aa4VJOPG6Ebjzq+m6xE8mLC2Cl5vHaVCjB3ED10FNfg6h0YmodcE6Vrz6scg6xYgIfUWSjQhybsqy834VXJpi+MSq1c5v6U8NpeP6DOiDud0wNozQiwyTZic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968799; c=relaxed/simple;
	bh=HC5zoAUoLlNCwVfTk0cuUjh+Tu1PhGGjLyaa71RsaWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XmnBgAoEhp2TKYMCaEOp9MsJFZ+NOCOogkHrY0/aaKbA4oFuVNdvsU2DUhD1dn/monFvuTaNqlOKfSkWqYQwC86+bKqt31u+F3jg23RXqLLAe/USFQegAFt8zG9pPyevPKmZOuEBkkdMVLQxnt1cvSAn1eC0oKxfk8YRplEcr24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=CVIGbPhL; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=OjF/6IKl reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716968797; x=1748504797;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DolAogegNEqmz+8Vve3+ndVHRcYfs92iS4R+Y8qW+RY=;
  b=CVIGbPhL+ue/1j9se2d2zloBQpDvjXdr6s/pVmCvvEO2XdZl53a+A4+M
   CVvcD7iJxcutEd1S11z+k0/PGMJ/dcqanKXumuOK4WPiSbfMPj3Wc1C71
   xyJrwtiB77x97HBQVUBk53/MlKPXsq6w2BsjvfMMUSYMnoAMNHN7AnHlP
   VOA+yuke0IDiUTtkp+TK7ntWH4qtV956NtikA55Wiqz8712LV/loxUU87
   tAqzylEVKMY7k0MVBSh3p9X681ga1UEyXLPZvdmwHbluVJMKkqmYzZ5S7
   /9qWf69QgpWAZCgaaJynp6BtwrGOWVs0quVftldKZaAUmPZyOfMj9TLk1
   Q==;
X-CSE-ConnectionGUID: V2XPPUNGQ56FiwvloNQWSg==
X-CSE-MsgGUID: fhnJzWWiTrybIYbQ712oFg==
X-IronPort-AV: E=Sophos;i="6.08,197,1712613600"; 
   d="scan'208";a="37119669"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 May 2024 09:46:34 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AB4C164676;
	Wed, 29 May 2024 09:46:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716968790;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DolAogegNEqmz+8Vve3+ndVHRcYfs92iS4R+Y8qW+RY=;
	b=OjF/6IKl5DiQecPM6Ac0MlyqZ9KsB1s/jlWB7PdtCChnK3TNEZX6e+IMspbY/edvPlSOXU
	4dMmO6k5LRAklwET+SRF9TKeaq7jjLi8DU+QgPLva7GSV3gNg9ngzfgUQgi8pNrgLpBCpQ
	gRhHiZSqQipgHHfIKVyhoH7XUe2ppW8O8NV2r8QQ3imexj198DG94WIWb5EMngQsVutuTo
	4d7MJWe3FzVQ1pIFKokvdR70QdxP8Kh4cp2NFr7HeAcZsjvoMF4udrHwA8ZDTHVS6q5Wxb
	xOxwKgMfvOyNkmERGrnu5djxSFpJ8i5sW5hpCQTfv6NywhQ8BDor9yTZar232Q==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 1/8] gpio: tqmx86: fix typo in Kconfig label
Date: Wed, 29 May 2024 09:45:13 +0200
Message-ID: <34ad6390a48ffccfe905dafcd4e478157b7828de.1716967982.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Gregor Herburger <gregor.herburger@tq-group.com>

Fix description for GPIO_TQMX86 from QTMX86 to TQMx86.

Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO controller")
Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3dbddec070281..1c28a48915bb2 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1576,7 +1576,7 @@ config GPIO_TPS68470
 	  are "output only" GPIOs.
 
 config GPIO_TQMX86
-	tristate "TQ-Systems QTMX86 GPIO"
+	tristate "TQ-Systems TQMx86 GPIO"
 	depends on MFD_TQMX86 || COMPILE_TEST
 	depends on HAS_IOPORT_MAP
 	select GPIOLIB_IRQCHIP
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


