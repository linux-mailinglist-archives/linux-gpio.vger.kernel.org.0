Return-Path: <linux-gpio+bounces-12785-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F579C349D
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 22:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0347D2815F9
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Nov 2024 21:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25091386D7;
	Sun, 10 Nov 2024 21:00:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A58224D6
	for <linux-gpio@vger.kernel.org>; Sun, 10 Nov 2024 21:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731272449; cv=none; b=adTvv8bAsSBQXXVMWY/g23xcFl0BxKpFpkU4JbzkgxspDf+Zkghw1ZwUIkrF6S8IFYLkDb1KC443PCACKWIpcv87SC3RWO1+r/tMida3bpXG9z3roOoLJfPUqUiiF72UwCt8+bG/fbjAQHsH4sntCV5H1b/1+bRWcdQ3aJ/+6ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731272449; c=relaxed/simple;
	bh=TuM2v4bKs88OnxQ4o+/Uan9qBoc3OIYsSMmfWP7RecA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EwE5MB8Hhq37d/wd/BSIByJQqGM+sHutKX4+2G+uTyqKPa9Ng5pX2U0uhUusSqwAZGoHIl3N/hCTPbp+I5RlDDrK5N78RdzcQQAMZi+/m90/ZEV/j8G/Bw0rs3wRpPt5Fur23KzRnwt9MFTU/HmcalzGU1ZC5LD8b/5ikd5smm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-24-75.elisa-laajakaista.fi [88.113.24.75])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id d97256e6-9fa6-11ef-9b01-005056bd6ce9;
	Sun, 10 Nov 2024 23:00:43 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 0/6] pinctrl: cy8c95x0: A portion of cleanups
Date: Sun, 10 Nov 2024 22:59:40 +0200
Message-ID: <20241110210040.18918-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A portion of ad-hoc cleanups to the driver. Saves a few dozens of LoCs.

Andy Shevchenko (6):
  pinctrl: cy8c95x0: Use 2-argument strscpy()
  pinctrl: cy8c95x0: switch to using devm_regulator_get_enable()
  pinctrl: cy8c95x0: use flexible sleeping in reset function
  pinctrl: cy8c95x0: Use temporary variable for struct device
  pinctrl: cy8c95x0: embed iterator to the for-loop
  pinctrl: cy8c95x0: remove unneeded goto labels

 drivers/pinctrl/pinctrl-cy8c95x0.c | 142 +++++++++--------------------
 1 file changed, 45 insertions(+), 97 deletions(-)

-- 
2.47.0


