Return-Path: <linux-gpio+bounces-11147-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE589987A2
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 15:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F74E1C23A56
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 13:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A391C1C9EA8;
	Thu, 10 Oct 2024 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxxU/pOH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76081C9EA5;
	Thu, 10 Oct 2024 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728566863; cv=none; b=INdir/lgtPe7fijh1bJREFEXaU8FQKxfcMiYZ0+GzMDgsiRjlALeVPMLB52zr6QBsjcOHrKXZ01AFzDWfC6+Oq+wg8a5aanCAFew/6chgmeUdLEYTfEybbWZUVbQttOBzIMahtma4TPRBEHhfFkNAg4KRigeiwPgjkDrSnWuLsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728566863; c=relaxed/simple;
	bh=NXkZRUIGoEd0olQWUmLw5rekLqUos8cOEeufBmEImYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rjEq/5OtjEI3rDtAU/C3GxFAtWE5m+HnAyv47EPUE65nLRlVGy591c8pDfQw2bDE84VuQfgiNTXC/1L10GH+hKqb2o6O9ImQumcr3C/7x//NN9W29dgswb0v+BPfy0g0rDkfJpViFFxKh4aTI/aJGXEVyHBSj6fqKJf428+1xOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxxU/pOH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so611259f8f.2;
        Thu, 10 Oct 2024 06:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728566860; x=1729171660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qLlvMIrxiw/4KPPfQMbsJ7jnLI+Y6UsBkrPR7mihz0s=;
        b=RxxU/pOHByaDerOSr7It/4rFVMOOS7VinAeUo12qor5bvSX1JeIh/OCXIlzR0qMcjE
         5SWtNTD8dup1mMCRphu93/iX1myMnyN74/c/cH2OFKI7yBX7r7ugXIdIdef5bducuQUZ
         6eErPnFInmF1pWX0NkLIUYkXJRY3YJf/pGPaZS/fKrDY4XzuCo3usWOMB8G63jLUTa5k
         siGavwOLSSlLeGzDQTRIm8TuGPugOLHEdJXGsshCT5+dCRY95cG4IGvQjjre3ExtJMkk
         8Jb6XWcomoXONNawLQBTtRMJgz7ZqK2rN31YzAfpvAvV7z0JG7g+yaQG9ELlQmXsB5an
         ZoeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728566860; x=1729171660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLlvMIrxiw/4KPPfQMbsJ7jnLI+Y6UsBkrPR7mihz0s=;
        b=Xp27Ton+v2LuJNWxJ2/SRlTPd2U8z181zmoJNUPMlLfdRBH9BeDv69JluYArm9upSY
         kNWIVilN84JIVQRA4BFzaKoa2HaxaR2nahCFLctTdkdPxR90DlEwdbWsPCqGS61oDZ5X
         63KGw7QGd+mvRWBlShYLpkMY48U3jycXLH1hvg6xG/9CR7i5Rdym/QCS384tW4dBmgP6
         cnMVuJoNU5cwpCwrzE8r25G8/p4kSAADubd3NYgGIFrIt77/zox2V/slRW+pDgWhlu2L
         K4qJRheCQK3SfelWMvbOcC8ijGy1iemKSTtyD5JXIc45Z+VSPLJ/hF3zKmlMLZ8GB4fN
         7+8g==
X-Forwarded-Encrypted: i=1; AJvYcCUyC1yyC1eAOSQ7Sb1TPq2/iiwTugrrVEW4ZGzRAaYISoy1UrSOhoI3JLeTtkB721XGpblQwaCzsMj722wgkDUJvDU=@vger.kernel.org, AJvYcCWgPrVc1hXGxclxfIQnbIwCPWU5zR7/SQeOJl9tjTs+/7QIhR6zEDS/n4dT1JOQEnu4shWOdw9SWqiLVLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPly7tDPfCoCmQ1EDKGu99q31MCZiL2Oke8qPzws/jqO6SoN7X
	Ku/DgPwqzgaBkIxZZBtY8wQKtoSr6PuD7IX94FN1syGJF+aY7NbT
X-Google-Smtp-Source: AGHT+IHAc1RfKHbA+LkEqOb+uPvrC/i4EHGoWDOkb230AGYqsdC5tie9wmX9PwZg6eVCH3HDmU4W/g==
X-Received: by 2002:a05:6000:12c4:b0:37d:4c40:699 with SMTP id ffacd0b85a97d-37d4c40098amr1756508f8f.5.1728566859773;
        Thu, 10 Oct 2024 06:27:39 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8671sm1577183f8f.18.2024.10.10.06.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:27:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] pinctrl: renesas: Select PINCTRL_RZG2L for RZ/V2H(P) SoC
Date: Thu, 10 Oct 2024 14:27:26 +0100
Message-ID: <20241010132726.702658-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add explicit selection of the PINCTRL_RZG2L config option for the
RZ/V2H(P) (R9A09G057) SoC, ensuring pin control driver is enabled
for this SoC.

Fixes: 9bd95ac86e70 ("pinctrl: renesas: rzg2l: Add support for RZ/V2H SoC")
Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 14bd55d64731..7f3f41c7fe54 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -41,6 +41,7 @@ config PINCTRL_RENESAS
 	select PINCTRL_PFC_R8A779H0 if ARCH_R8A779H0
 	select PINCTRL_RZG2L if ARCH_RZG2L
 	select PINCTRL_RZV2M if ARCH_R9A09G011
+	select PINCTRL_RZG2L if ARCH_R9A09G057
 	select PINCTRL_PFC_SH7203 if CPU_SUBTYPE_SH7203
 	select PINCTRL_PFC_SH7264 if CPU_SUBTYPE_SH7264
 	select PINCTRL_PFC_SH7269 if CPU_SUBTYPE_SH7269
-- 
2.43.0


