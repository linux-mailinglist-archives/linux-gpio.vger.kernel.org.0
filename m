Return-Path: <linux-gpio+bounces-30238-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCA8D00E58
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 04:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BF72300C5F3
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 03:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F9218AE2;
	Thu,  8 Jan 2026 03:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KbhyTmn6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C9921FF30;
	Thu,  8 Jan 2026 03:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767843742; cv=none; b=J381bqJDiGiZLOGF/MpTf76y1fHmKWyox9hD6Ws0BAxN6kPbr/tSqrsdigXwiISf9e9ftc621pIFnniEBCh8TeCLep1UT8TVVQq0NZ9va8D7raLuPNicM7zXeVDVtPvFoxYAmmg0OIib9xWvZNcSGEHPNmgLYfkw+BgS2dMjmoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767843742; c=relaxed/simple;
	bh=5SXcXLC2L6EaJ/VloDHMApeif8dFFflSNOBe2caPKeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sBfU4AMKy+rDQZ/GlpxgI3XDxLMjnKq3EnFukdNbAwkDFVxJHR5nQCt08FwXgh1e55uW4y79YaYdc0jTMsgnK/YqYdR62G8axmFrBCUxssdqBCtj0K13Eu+uJ7ZepNmRd/5+aPiEM7a6AkSD4nX09psaO7L3UpOs+89ougsmBT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KbhyTmn6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=By6s7ewtGZLzcCzLDAE2GxZhnjk73UCPHwXGDzoJQlM=; b=KbhyTmn6nqNzyIiX9Kh1Xu8bM5
	9MQveAybI8BXHaSZkUBUASP/iRVnmIzc18OTC9h/YDdlCubQazWujBa1KdBL1lnceiKH6ug++6D17
	QBsVtbjD1cW46OdrfWAuUscoHB054jLpD9jJrStHo1XARxIcEScG283bvK5g0XuqGpEDESNQfq6yX
	XzdBEbGlYn3mgVEv29NK5m5cJC23bHj2WbGHY5yEC4whtZEzTjjlE4NGOhVSJ7EdRmk1l4XDp7LYy
	YlEA7CrcY8KCxNmJW0GLn4h6Vh1MWgWNj16CpzfAG78S/SyIY7hsMlutaT/hE0ZgCI66BtQYXtXRF
	aquH1viw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdgug-0000000FtHz-0hon;
	Thu, 08 Jan 2026 03:42:18 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] gpio: drop Kconfig dependencies from symbol GPIO_TN48M_CPLD
Date: Wed,  7 Jan 2026 19:42:17 -0800
Message-ID: <20260108034217.2615017-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MFD_TN48M_CPLD is an undefined Kconfig symbol, so remove its use
in drivers/gpio/Kconfig.
Drop COMPILE_TEST so that the driver can be built at any time.

Fixes: b3dcb5de6209 ("gpio: Add Delta TN48M CPLD GPIO driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Robert Marko <robert.marko@sartura.hr>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

 drivers/gpio/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20260105.orig/drivers/gpio/Kconfig
+++ linux-next-20260105/drivers/gpio/Kconfig
@@ -1621,7 +1621,6 @@ config GPIO_TIMBERDALE
 
 config GPIO_TN48M_CPLD
 	tristate "Delta Networks TN48M switch CPLD GPIO driver"
-	depends on MFD_TN48M_CPLD || COMPILE_TEST
 	select GPIO_REGMAP
 	help
 	  This enables support for the GPIOs found on the Delta

