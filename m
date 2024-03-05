Return-Path: <linux-gpio+bounces-4141-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41898871CCA
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 12:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D689FB2373C
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Mar 2024 11:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C2454799;
	Tue,  5 Mar 2024 11:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FH3slxy8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CAF1C6AD
	for <linux-gpio@vger.kernel.org>; Tue,  5 Mar 2024 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709636411; cv=none; b=eCIMgMzqp/97357F+a19GFufa9GUH5CZB4UrkQg8pIauEWOpg/JUdyjcSGI40J05dTnMZX8QQRlWj+Uic1KbAAB6kAc5uc7Z7c5eQYYPo45Lczlp5RImN9cWq6c+jnZq3GQIiuDWAUJRfgsLRLK4avuamN+QIgkDjLCYwaXISJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709636411; c=relaxed/simple;
	bh=oMEdwS1NaUwwFBUze81zUg6mZPemo6HNezHEuvMoqY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HrGmLWggHw/dg0yybRc1CJ2mG48YE2awBA7RmHAeScCotTXrpPkTnYJ7G7LW/P8TCPzNzQxVUBfyA0omtVrt8oMHkSanZwYZswwbueapy5mZTIwhCGG7+L1HssHfoNqAfWcMMNWAbQFlGhFDcIdBhe2yZxow5InG1PLtMjwJQBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FH3slxy8; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3122b70439so66335766b.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Mar 2024 03:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709636407; x=1710241207; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z3LGg5P/73PhEgi+gexm3UXLbPQzpkxWsUehv0kHl2k=;
        b=FH3slxy8K5adim96uGx76du7CQTm9n8hokgZBiI4y6Yt16v5I2iy7h80EQCzd4uhvN
         de861RIXytonvaZ5lAcRZAJmjKRn33Hjs+OemSbZUH96MKc12apZ+SHkdkMvT8mUyXO5
         kPz6QLteSOh5dToaAFcTuL0q06dxQ4yB4tttL709hDwOAbAFXVtTwoLf4xSTTPomKkRQ
         kJykcpxEIO+E9s3wUQtzP/ijQFW8ydysw8belYiuCjPsDWNM4B9lwwBVaI1i0YWf5WBO
         u3RPP3xIq2Xv12oylXn3EUB4w4kvcqR2LCd7rHE+eelYXpYKleuDQCLp/Eb5iNYCqnbX
         dW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709636407; x=1710241207;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3LGg5P/73PhEgi+gexm3UXLbPQzpkxWsUehv0kHl2k=;
        b=Bxo6fbp9FTkuGTEPCgiVzo9rOIXzkniglr0gyhuyLS1d5w/eCODsMEppRZZdaQGlLJ
         gsKZ3aZ5cTzhnehyXPXy/QdW8ujUzXzsF7+b9WYl8IOgZACai1yF8SPH7+GiRcmQ++TY
         No3fQnpQ18UjMhWI3dbQ3/W4BaeMzZPLFKjvvaUTEi5K0MPcfRLEqEimVySQifBDAR8S
         brqGHogVWMkLTe0Ybsag8wGPhJ+9qmmypxhvhyhQQGdbMOowDd0Sx7DnPRn4WRCyYV7a
         vMIgSoZ5Y8wDUeLT8CC19Xvoyn5HnDzAtqxPgM5XCeMT6jg4a2ooB7WWakVYgHyyYo45
         T29A==
X-Gm-Message-State: AOJu0Yx6rmAWlZ+NmEDmIHFkEXCW7pW5KEEYT0yuoXAWLz18SI/vV7pa
	SrbEIuxHkdTJipTdv08d/YYlH+dw0pGnwnm2b1mFv3tRf+ItKmKDgsOhHxtwOso=
X-Google-Smtp-Source: AGHT+IFEMEnoE+1/68nDt2gn8+Q4rD2rVmAxtQNrSFkuAsGWhUNSfJCNxztFTAcZPhIP0MLtb+1L8w==
X-Received: by 2002:a17:906:16d1:b0:a45:179c:119f with SMTP id t17-20020a17090616d100b00a45179c119fmr4716791ejd.17.1709636407377;
        Tue, 05 Mar 2024 03:00:07 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id ld13-20020a170906f94d00b00a451ab833c5sm2792325ejb.21.2024.03.05.03.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 03:00:06 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 05 Mar 2024 12:00:03 +0100
Subject: [PATCH v2] pinctrl: aw9523: Make the driver tristate
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-fix-aw9523-v2-1-2dc50bab2b17@linaro.org>
X-B4-Tracking: v=1; b=H4sIADL75mUC/22Myw7CIBBFf6WZtRheQ1tX/ofpApS2kxgwYFDT8
 O9i1y7PvTlng+wT+QynboPkC2WKoYE8dHBdbVg8o1tjkFxqrjiymd7MvkaUimnOjRuGuXeI0IR
 H8u3dY5ep8Ur5GdNnbxfxW/9mimCCjb3kiEYZje58p2BTPMa0wFRr/QLQ/7u4pQAAAA==
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 David Bauer <mail@david-bauer.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

The AW9523 driver fails to build in some allmod configs since the
I2C core can be a module, but AW9523 can not. Fix it up by allowing
AW9523 to be a module (tristate).

Fixes: a4f15a8d4c82 ("pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202403050916.KBtE6eEj-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Instead of restricting to bool and I2C=y, just allow the
  driver to be tristate (which was probably the intention).
- Link to v1: https://lore.kernel.org/r/20240305-fix-aw9523-v1-1-97205563645b@linaro.org
---
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 21d38bf2d1ca..d45657aa986a 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -128,7 +128,7 @@ config PINCTRL_AXP209
 	  Say Y to enable pinctrl and GPIO support for the AXP209 PMIC.
 
 config PINCTRL_AW9523
-	bool "Awinic AW9523/AW9523B I2C GPIO expander pinctrl driver"
+	tristate "Awinic AW9523/AW9523B I2C GPIO expander pinctrl driver"
 	depends on OF && I2C
 	select PINMUX
 	select PINCONF

---
base-commit: a4f15a8d4c8253d44830731d99be869d273c0c82
change-id: 20240305-fix-aw9523-4006b88f7b55

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


