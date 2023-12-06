Return-Path: <linux-gpio+bounces-1050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AD3806565
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 04:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E64D1F21724
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Dec 2023 03:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474896ADB;
	Wed,  6 Dec 2023 03:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W+IumrHh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E6C31AA;
	Tue,  5 Dec 2023 19:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=tCDaEFASEaOM0xCnH4GzWPewdM5mMFU6qA94jFCl3Wk=; b=W+IumrHhlp4WIUBpIpxh4HMWIa
	NMKWZOmrhl4rGxxkvHVzHJRHB3f8/1caKxSntLEuEmki1LgjTU+jZ7xuDC7ruVnK94v81Jt3kmy1W
	sawTOVM5UZbC0n5O3c35VUvOeeJ/96CCCjyDzY7uhYMUGn2PF0yKGaMClw2gmhsL68U6z0ivTDli9
	FLjYhLH+w9dMLpPzBsGaYigiCRGZjdA+eUaYbf/OEPPg75cemIfWrlTzdIjZREwymcpA04BakODbE
	J8fOgGi1JUItV3650Dbal18mN7mwuzRl+XnaxTIisZXcN0GWcjRdph5Qks6k50MWUHO0LvUMxcVNi
	Pa3i4yLg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAiDz-008vhk-2a;
	Wed, 06 Dec 2023 03:05:23 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] gpio: max730x: don't use kernel-doc marker for regular comment
Date: Tue,  5 Dec 2023 19:05:23 -0800
Message-ID: <20231206030523.302-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a common C comment (/*) instead of kernel-doc notation to prevent
warnings from scripts/kernel-doc.

gpio-max730x.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
gpio-max730x.c:3: warning: missing initial short description on line:
 * Copyright (C) 2006 Juergen Beisert, Pengutronix

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/gpio/gpio-max730x.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/drivers/gpio/gpio-max730x.c b/drivers/gpio/gpio-max730x.c
--- a/drivers/gpio/gpio-max730x.c
+++ b/drivers/gpio/gpio-max730x.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Copyright (C) 2006 Juergen Beisert, Pengutronix
  * Copyright (C) 2008 Guennadi Liakhovetski, Pengutronix
  * Copyright (C) 2009 Wolfram Sang, Pengutronix

