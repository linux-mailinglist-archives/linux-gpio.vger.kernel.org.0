Return-Path: <linux-gpio+bounces-3345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA37F856373
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Feb 2024 13:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18A9F1C23329
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Feb 2024 12:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A5C12DD8F;
	Thu, 15 Feb 2024 12:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jk5EEVfh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E6E12D74F
	for <linux-gpio@vger.kernel.org>; Thu, 15 Feb 2024 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708000893; cv=none; b=NzHHv4hJM1+M6EoRMo0Q7BzSn/Y69KYqFkz29Jut+6byYORMH0Td+5pDg3eEigFdsoEnlsx7i+xH3YGKlt2z7tCBINyMDa7MDpBHIbbxznTcDQlUoIXfMFJEUw8mfXm0zFylSaM+5vnzJEGJ0c16Y1OYGK76qbgpudwIRlkeESw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708000893; c=relaxed/simple;
	bh=gHnyFq4f1pDYyCf0BWfNJKuDKgh/PzyoaOwfFn6k2Rk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CpwhvIcAeoKYvrQ1cjBrp7n8s7jXijIumyb/Gboej0I/G88zvcZW9a5n5xSM6fm6VuwJY6SJ1fLtiVlg4OQyTnbbUbnBHGR0T6qpHdAhOdVHwoN5qJ+auyUJkOimQlnNG+uiYLOHvtvluSuqo9r73IQ88iR516/d3PGaQVGeAE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jk5EEVfh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40efcb37373so6324235e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Feb 2024 04:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708000890; x=1708605690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfSE0heYPzlfo04ucdVX3fOnYjllc+qDYIJqJxlkX8U=;
        b=jk5EEVfhjoVO2j4mPq4QK7/ydyYUzQiUiVGl4rF982HSBW3uv+BFU/JOx3c0HOBHIb
         kg19ZhqTBctVmBbV73BV6qwmhQIdnXV1ZiwrBAfpWe7al+O9ck+lNk5tOahDHRukAv2N
         WAHuepMhHyh6v3g0t/M3pqdljCEcfK4PelDlWPlHVfVL/QKUATDfHlvoGGhrqJwDlHZW
         h0q//NptmR6fZ8alb0Udsw4zWVr2gR+jdY2SYLdNgVBE5kkjfTLdbi1sXP9MhPnpuy71
         yHEbPNcLoUGCvGIA9P6AHt3hx1nfB8H65vwvlUoJ60/vVw/7M+AnCFD8faPOEp2bBAU9
         P/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708000890; x=1708605690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfSE0heYPzlfo04ucdVX3fOnYjllc+qDYIJqJxlkX8U=;
        b=i6RO5fSph083VUwuPJ+1YxhF2Kwu22+q0rH0zE//MjjC203vItGTvyhTYPY8l+1x2K
         0d1UhEhy2hKOzdO7T02g1NwVLDm9jasVBMUOUxWYzvo3PktmQvgPj/JvwrUBDlb1yOCv
         1XD29MsalYKAt3K4exhOdSz42GdPcseAhk8qVtJ2d2hkOig0Uyreunn53mbrsg/9sMsA
         9ypytdCRSaef/UQ6jOD44SIIe8Gi68CPJ8wehTC5Omc1j8eElqLVA0hgj3XyaF9OYbHM
         NcpzyMCVCsY5/XsCXbcg0e9ndzObgmse0t8lZp13JNXeBCWDZijafBEYXTUVnBRCD9Rc
         U/6g==
X-Forwarded-Encrypted: i=1; AJvYcCUaqwaZ7yvuMADvAJ7ywN8bciQ7Y1E2NylkiWG2O/ZoH1Z7lKFEpHgfieSoBWLNkposnZhpu9wqjTREPA3bX2xNmUJT0AjXkM/RXQ==
X-Gm-Message-State: AOJu0YyprecMo2WfeMnqABqFm2ViA1zXqxthskJR0tRk0shqUzmN76Na
	rLtY7io9coTed2re3iw6ip5IT9MLaIaypU48bFzYTW5TEwQBo5cjOi14fv8Sls4=
X-Google-Smtp-Source: AGHT+IGikOwkuOPFBTsMbTZdEAAonvNOhcu6PDAwcbmJos4zHQ93Q6qK8wgIe3B2ezllABgdj7icJQ==
X-Received: by 2002:a05:600c:43c3:b0:40f:dd4a:11f5 with SMTP id f3-20020a05600c43c300b0040fdd4a11f5mr1497192wmn.34.1708000889857;
        Thu, 15 Feb 2024 04:41:29 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d51d0000000b0033cefb84b16sm1674931wrv.52.2024.02.15.04.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 04:41:28 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 1/2] pinctrl: renesas: Select CONFIG_IRQ_DOMAIN_HIERARCHY for pinctrl-rzg2l
Date: Thu, 15 Feb 2024 14:41:11 +0200
Message-Id: <20240215124112.2259103-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215124112.2259103-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240215124112.2259103-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The pinctrl-rzg2l driver uses APIs that are defined only if
CONFIG_IRQ_DOMAIN_HIERARCHY=y (irq_chip_*_parent() APIs). On the ARCH_RZG2L
CONFIG_IRQ_DOMAIN_HIERARCHY is selected anyway, e.g., by the
CONFIG_ARM_GIC_V3. Even so, make it explicit at the driver level for a
clearer view of the dependencies.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- this patch is introduced in v2

 drivers/pinctrl/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index c8d519ca53eb..a1e57939e54b 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -190,6 +190,7 @@ config PINCTRL_RZG2L
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
+	select IRQ_DOMAIN_HIERARCHY
 	help
 	  This selects GPIO and pinctrl driver for Renesas RZ/{G2L,G2UL,V2L}
 	  platforms.
-- 
2.39.2


