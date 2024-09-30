Return-Path: <linux-gpio+bounces-10560-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E226698A0A1
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 13:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FF481C264D4
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 11:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4D919D886;
	Mon, 30 Sep 2024 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="kK2heoB7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC8119ABAF;
	Mon, 30 Sep 2024 11:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727695322; cv=none; b=Mww8ec3Aj23IyK7vMd567FNRNDhCnzk4b2fkFld6qavhCodhBp7bHKSCuzsfLQ3lmn35yxjVnkEyPUu3d04QVcCORBvtFGaJ9S/lp961Zj4dZI6+IQi8eMtj5FI5GXmbg1AlWLEdfYLhdpmDYPT204MFQTV+EibNfZOXlkMR49g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727695322; c=relaxed/simple;
	bh=MOQ/MPI3IjtB3LWFtX2mGAD1DNIx7Jwa5OXMaNnwYKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z8+JBwR4cIJUWkF8ajnNz73pvi1m2/9UqWxs+cNFw6yTRcJOPc0pPQ97KFfH6kF2hvyNdMZKbGbAPl4fqtJRqTPXqDj1rxTso5vCatyIyP5Uaff4OhS1Y9pxjci3YzEnPsUD/R/WUlsI7VpsyoSK1AI8JuOikLA5ybP+7zIlq6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=kK2heoB7; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DWlQLROd+rfuub4rJqGknkw7hbMY6gSz1VgRjaj9Ez8=;
  b=kK2heoB70Ov7xGM4MW12lMT/18070v5q2wT5ADAdBqCFs8rccwgWE7Z1
   FKDjwY5oL1H2IX5KDRcodtmKHGLEOgNB72jTHPAmuX1RSALJeXD16bJAi
   l8lOYVFOy3wlzIOvGfSL6eKJsfKpy1PlyHgoJrmEBAqgpNTypMKLqMh0t
   I=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,165,1725314400"; 
   d="scan'208";a="185956916"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:21:28 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 34/35] pinctrl: Reorganize kerneldoc parameter names
Date: Mon, 30 Sep 2024 13:21:20 +0200
Message-Id: <20240930112121.95324-35-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorganize kerneldoc parameter names to match the parameter
order in the function header.

Problems identified using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/pinctrl/pinmux.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 02033ea1c643..f033a41f8729 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -256,8 +256,8 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 /**
  * pinmux_request_gpio() - request pinmuxing for a GPIO pin
  * @pctldev: pin controller device affected
- * @pin: the pin to mux in for GPIO
  * @range: the applicable GPIO range
+ * @pin: the pin to mux in for GPIO
  * @gpio: number of requested GPIO
  */
 int pinmux_request_gpio(struct pinctrl_dev *pctldev,


