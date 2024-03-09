Return-Path: <linux-gpio+bounces-4235-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A782987747F
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Mar 2024 00:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3B7528173B
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Mar 2024 23:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3964552F82;
	Sat,  9 Mar 2024 23:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="em0B5GRB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2509143ADE
	for <linux-gpio@vger.kernel.org>; Sat,  9 Mar 2024 23:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710026915; cv=none; b=DJ3TjkwBvbisetNmvdkIvgE+L5AGIdKwa9updSbUeOMvfHwdoP2K+QaQ3CDS8+dxQrO/GeLsr8tVksit9qkUtPa7LTxWd2YQy8lNMfZ/nFSlZGDehqZ2T7MojGA3PbCJAee+MuZB0zT98mCCbTLfUUT7qITtXw0lgREnKqbdYY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710026915; c=relaxed/simple;
	bh=PK6WFta69keXKnypkpxQHNZvIpbbeLlnHaabrReb9Lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RauxqSIkMf56NtfXrefnn7IFIAyBegt9FmHkObuUsmsfnQx8CpoCgKGj09VbRRQbtMRh/uildrmws2Y6BVOXaxNddvADIewFNgwkVPMkixKoM8uPfe7Zjg8bdUZ4SdhMf5HDbMiF/l1n/tEhwpE3ovhSs5hweeHwsyHvk53FyZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=em0B5GRB; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3ed9cae56fso770238066b.1
        for <linux-gpio@vger.kernel.org>; Sat, 09 Mar 2024 15:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710026911; x=1710631711; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8s9ZLtELDKx+1S0sA6Ih5yNucgEwThVpM5SrY4FQqhg=;
        b=em0B5GRBkmdrDOsvmwJp0+nYtmzFPGn3xLf2+LprVE+qd0AHYVZ1f/UjIfXkcjNppg
         0eA8w2MmAhSYQPaQLRdlwYuayNexQu4oiS1CLNWi1xK2q3ndsuFswiysjWDI4pOAqDoY
         qP99BH2pMdAYJ9CmzdcSEfkNazxp4o5ZrCNC8inwtyuRD4EmjEAJkXZRLA0EVFuR5QRf
         aUIMjTSQiE32muKD7xLaxLFK5shUj9M3ECLjyeRt6Nr8oVaecFoC+GGR78VmbQyP17JN
         OlqeC830rbS5IbUSWBO5rLwH1D8annnE9RphpaDllRMou3IsKR9mhYqDAj2H8V++HSei
         t0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710026911; x=1710631711;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8s9ZLtELDKx+1S0sA6Ih5yNucgEwThVpM5SrY4FQqhg=;
        b=FNChaAoAcmIWk92US+MPbpTrCCiu679Rv31nb8riuB4orhxLI4teznd5WkmSzQsFhh
         iZNaePwtdzZ6lIWbac6vdopcuUy09R0cPS3NUtjrw7e/uk5pcpehsJAJ64scYVxcixbF
         pTvEJBU/cryz67+AeQDTgYjmqiqXxmSyPnetCnzpZL4c1iJScY4VkLrcZm0dfq8Y+/j7
         hAJP5zIZ1Ml6p5eRYMWBkQYOsFIleKonPU1D9EnSyK4UEmUL5GeiY71GrZ9ieXq5tY17
         45FZzfIMGN5xkzgsp7YNx96pgFk9gmlD4jX6FhKsbphTpXrZWfN/bKFpKL78k0wk/RMs
         5SOw==
X-Gm-Message-State: AOJu0YxYcFcZfv3g7vFxxDiw392S6zqpTVDwxwMnhua2ORy0CnoFNRqw
	qfOZOiPXiAx5MNyGkmAShhtUgu4HkwUFv1kZHW0UCgwBzdcoYrQZRiSsS/CJBrgpFkpSVbJ6wcg
	4
X-Google-Smtp-Source: AGHT+IGlYnxNZow/WzVFi5SiDnJTUfKDII7+tFMe6ulUjdBmBm66iHZlifLmAw7sEDnpLG6oORkMHw==
X-Received: by 2002:a17:906:d0c7:b0:a43:fd2c:663b with SMTP id bq7-20020a170906d0c700b00a43fd2c663bmr2210227ejb.33.1710026911355;
        Sat, 09 Mar 2024 15:28:31 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id x19-20020a1709064bd300b00a44e2f3024bsm1349483ejv.68.2024.03.09.15.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 15:28:31 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 10 Mar 2024 00:28:30 +0100
Subject: [PATCH v2] gpio: nomadik: Fix debugfs without debugfs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240310-fix-nmk-debugfs-v2-1-5de562b27520@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJ3w7GUC/3WNwQ7CIBBEf6XZs2ugtFV78j9MD5Qu7UYFA0o0D
 f8u9u7xTWberBApMEXoqxUCJY7sXYF6V4FZtJsJeSoMtagboaRAy2909ytONL5mG/EwaW01ydE
 oBWX1CFQqm/EyFF44Pn34bAdJ/tL/riRRojpa6tpGnEzbnW/sdPB7H2YYcs5f1zL8ZK8AAAA=
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

When the code was extracted from the pin control driver the
non-debugfs compile path forgot to take into account that this
function is no longer static but shared.

Fix it by making it a non-static stub.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202403091024.OZ4KCPBL-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Add reported closes tags
- Link to v1: https://lore.kernel.org/r/20240310-fix-nmk-debugfs-v1-1-38fe65409c56@linaro.org
---
 drivers/gpio/gpio-nomadik.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 463a765620dc..7ea630f70ce3 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -486,11 +486,11 @@ static void nmk_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 #else
 
-static inline void nmk_gpio_dbg_show_one(struct seq_file *s,
-					 struct pinctrl_dev *pctldev,
-					 struct gpio_chip *chip,
-					 unsigned int offset,
-					 unsigned int gpio)
+void nmk_gpio_dbg_show_one(struct seq_file *s,
+			   struct pinctrl_dev *pctldev,
+			   struct gpio_chip *chip,
+			   unsigned int offset,
+			   unsigned int gpio)
 {
 }
 

---
base-commit: d295ad7ef0137b292289dc214b27993ddffeae15
change-id: 20240310-fix-nmk-debugfs-7daafae1bc33

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


