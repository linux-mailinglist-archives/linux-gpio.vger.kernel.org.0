Return-Path: <linux-gpio+bounces-10896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31082991DBE
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 12:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA5F91F2194E
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 10:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54C9172BD8;
	Sun,  6 Oct 2024 10:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="UA9W/xf+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3526A4C8C;
	Sun,  6 Oct 2024 10:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728210124; cv=none; b=JjcG4XTla41XdJxJnhPEizU3ZVkEvcemrbIvZpeALaQLVD7nTHqr2uUi/BJO9ZvMdPGPg08/c2t+1sXwfhEmpUfsw97m/1kwata+29uRqmiYC6rmMFCStGTsYb6+iHHZfk7wPJElNBiJ7yScwkeVate8oISOLsO2wC3Qt/kez4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728210124; c=relaxed/simple;
	bh=VuHakAXAwflEYOO8mFqz2A8w2amDWgRIuRc6JC6Awg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=si/oUwZAOk2HW2OPyjFY58w3b6T7rkz2E1ybhqES7EBh0rVOjC3uPntGNKF9NN9hCqGwHbzkn8UTZPRZJ5JIY2yYCbtYA8awM7KMy96pMYvs6Sm+fRUn0jD+9Uq2CW2EZNnUJhO/2WzlSllMG2Q4PZlcd6m8syc6Dy8Xf/H4l8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=UA9W/xf+; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 38DA01000DE;
	Sun,  6 Oct 2024 10:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728210121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3+nMwTV5/n3rsxEzFL9MBkV3WS2EPmdPaaYMljZdPpg=;
	b=UA9W/xf+nbCtz/TtyRaBRBin0m+V8BWd0g83PNz8GiI1yo9XfOZ6d7zNIhJ6jUGBL8Rd8w
	Iel3nf4I6KO69rSYJgRwnziIpJUe1DJayxDx17hLToYFID+p/onysaqHbsRbwzqbXYt1hY
	2mIlbFExgP8tT/ZSgG/gT91vOeLFFnw=
Received: from frank-u24.. (fttx-pool-217.61.153.101.bambit.de [217.61.153.101])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 24A28360092;
	Sun,  6 Oct 2024 10:22:00 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	daniel@makrotopia.org,
	linux-gpio@vger.kernel.org,
	john@phrozen.org,
	eladwf@gmail.com,
	ansuelsmth@gmail.com
Subject: [PATCH v1 0/2] Add mmc support for mt7988
Date: Sun,  6 Oct 2024 12:21:47 +0200
Message-ID: <20241006102154.17087-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: ee36cfc9-6920-4636-8d11-cdccd9f85891

From: Frank Wunderlich <frank-w@public-files.de>

Add MMC-Support for MT798 SoC

Frank Wunderlich (2):
  dt-bindings: mmc: mtk-sd: Add mt7988 SoC
  mmc: mtk-sd: add support for mt7988

 .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 +++++++++++++++++++
 drivers/mmc/host/mtk-sd.c                     | 14 +++++++++++
 2 files changed, 38 insertions(+)

-- 
2.43.0


