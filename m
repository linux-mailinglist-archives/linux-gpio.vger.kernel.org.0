Return-Path: <linux-gpio+bounces-22737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 780B1AF7796
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 16:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B71691C407F7
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 14:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED862EA17F;
	Thu,  3 Jul 2025 14:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aY/Of6B6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FC52EA730
	for <linux-gpio@vger.kernel.org>; Thu,  3 Jul 2025 14:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751553203; cv=none; b=dXpJLIBrUTPBgy8VCWNgrPSr/VUcg5tw6u0CjKjJXTvX0gfzJx6mhHq9TI0vfjBoaYPgIhEMB8dDopNVdEC8xC2AkgefGc4GIL+FfWK2gNTehkKZQyd6gVd8byifpyrS4n5zYoKmGspdila0oZ7GDwWN3mT8PpP97fpV2fNYNFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751553203; c=relaxed/simple;
	bh=2CWDOL/GMt81gOQBG8DjtoL8szLjbvb0iNgMmG5/d7s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CqMV+kDDGXjjrSi7UWzXtiLVRcTHO2bE6Bnmx9qRqO2E+jd7baGd4eGsBY6qS4ncpS9UPjD40D3PJfe6NAjX3BQleaNXgFggu/j1FjeZu0nxlxkZgPHGSxNHmPLm0jx1FNK0OfephrelE/wsmPueSnYOQdvJNWDSRWnSivHkwvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aY/Of6B6; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60c01f70092so13354080a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Jul 2025 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751553200; x=1752158000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CqVDDbWWErscZLKwiSrPbbMouQwmAiwvFs0jPgS745o=;
        b=aY/Of6B6RVBdf2RrvKPLRhxx8wXuF9lEAC5g0g0ugoNX8/iXG3z/GuSD6JtF0eWBDD
         08DmYlUi9NpvBoJLXV7o4rH9d/pLzTD4Da1QkzGu+KZTSRRESaA2wO/ERhrb7Bu3/bnX
         ySRMuwrS7/NeMV+QDFJk6hEr4qZMsyMDgGqdHuaAyQBhVhBG5nRk8PMpKtMq5bIwkYpg
         ZjqbsQSlIbAuIoHN5H74ZoY/Zkxpy2edFoqhJFpE6L3kRj+urmijyou+ww4cRKqk2I+L
         h2SxJmHFdp2O7mnjNXPRInUBy/jrdABo08gFw3V+5d3N6rDfgx+s18Frh8n6e//S9nft
         hIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751553200; x=1752158000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqVDDbWWErscZLKwiSrPbbMouQwmAiwvFs0jPgS745o=;
        b=YG02c9zAUSJUdrtEIS6UnzdhPT/0l/RIpELUKhu7mGBOXF2mV59npryDeBb/ot+YR2
         dB8+TUCPx+k673IYhdOpGoRM/kQyVU2ryUTBtWnZejA+AHTa/4FJnHxfluI+nCk/cPvQ
         Ewj4tX19YEy4yffkJxWrZkwF5LSF48zFZk/aI1puRYEgIZJIAsoc+iBA7r9FnGTaYJSe
         uDTZNA5iu0nZHuLrwZm88GO9pVojc1fGuiZMvj/LR5EIxlyHbTu87FWVsfc2R+Sp0CeR
         4JmmazDSPMQzeIczmdNVLfiXqHQwmFlnPiU0YKsQO81MsD9cVLYIU5jMhEZHCHlt9f0C
         MoWw==
X-Gm-Message-State: AOJu0YycB8HFq1fdoXQMPfi7s9cwGaUCZb2lMLwtb2QOJhtqW3IX2wQS
	398gZbxyOK1Qn0WPvN/wBPnKUQ++5kOntdxHqGe96q+V3eSetfzvpSPbMGORivW3
X-Gm-Gg: ASbGncunvtQLSPbtWiDC6yh9S65RYrrIxPzQ7cUUZ3hMDv1k1hi4HMe8vZuFQp4EBbM
	sXpgGXkwr2D36tmSyv5u5+8+H/OP4vN3z2iFKPnjt9uSy5L8lpvKJNIgJ1IgRH8P8MKHqz8AGis
	iwE+OIbR3DMg0YD+KJm0gamyY6mGCD9Vj+A6dGFCnd2ikb8GJapvkdNr9cwGU4xQ+SrFWxWxqO+
	A4EsVG6k+xIW73RkNKzmNNuNjayq2T7ZFGzAA/JvBsUJ3CrYqBugKIvWok5AHUJNgBURqpkapiC
	cqiLJafN5nWNTPOUzIkNmCQObbKXYOMdBp3CwH+/6+GX/Of6g+kl8lzQhhqKlsctZU6jdBWf+Z3
	7U2zkxM7qdLi1pvvFiRgLjeHDRtMZLaVG7SXK
X-Google-Smtp-Source: AGHT+IHmX/jf9YWcc4a6ZCGU2eOlXNypDfcYmsphcW0YG/5TqqN8cCSl6zQBG//zOsSYEzE1gncwng==
X-Received: by 2002:a17:907:94c9:b0:ae0:d94c:f5bc with SMTP id a640c23a62f3a-ae3c2ae2e94mr755561766b.27.1751553199599;
        Thu, 03 Jul 2025 07:33:19 -0700 (PDT)
Received: from instance-20230608-1018.vcn06081027.oraclevcn.com ([152.70.54.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b025sm1261592266b.27.2025.07.03.07.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:33:19 -0700 (PDT)
From: Milan Krstic <milan.krstic@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	David Bauer <mail@david-bauer.net>
Subject: [PATCH] pinctrl: aw9523: fix can_sleep flag for GPIO chip
Date: Thu,  3 Jul 2025 14:30:39 +0000
Message-Id: <20250703143039.5809-1-milan.krstic@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO expander is connected via I2C, thus the can_sleep flag has to
be set to true. This fixes spurious "scheduling while atomic" bugs
in the kernel ringbuffer.

Signed-off-by: David Bauer <mail@david-bauer.net>
Signed-off-by: Milan Krstic <milan.krstic@gmail.com>
---
 drivers/pinctrl/pinctrl-aw9523.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 9bf53de20be8..04afb344e9e5 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -784,7 +784,7 @@ static int aw9523_init_gpiochip(struct aw9523 *awi, unsigned int npins)
 	gc->set_config = gpiochip_generic_config;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
-	gc->can_sleep = false;
+	gc->can_sleep = true;
 
 	return 0;
 }
-- 
2.34.1


