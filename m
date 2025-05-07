Return-Path: <linux-gpio+bounces-19743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74CAAE348
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 16:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD54C4E2CD4
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 14:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E8C289E30;
	Wed,  7 May 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nh62yrhR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B88289E1A
	for <linux-gpio@vger.kernel.org>; Wed,  7 May 2025 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628558; cv=none; b=nCJLVjvUzwIJGjw4bgGZhlZdRHZJP4uDhj+lg4dUITfJ1xs9qRKxgLTWajL8gbJ275NE5OGZ6hJ7mOpdnPZbTQxcEcLM7DDKDi0GqUXhePPPro/wtWcSbCNuwN1VxY/QMsVlr6Bb4+ZEjOeysbYWEMTCsFnGqrA06SaPGcI/Jzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628558; c=relaxed/simple;
	bh=1vJaV5IB3PQLrcO3XwAI003ot8u30fZLIj9vvrH7iAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KgzUiL3Vg41vxxO5q8NdAIz6ouA0Vo+ASdxEPoAAZACxtUIx/zCE/EHkO3Zae3by11LT85qVthFYoqDu0YiOQjSJTgV87K2xQqW3Zp+ceUV3w9cyUrO/yOyBqEBpjILIdYg4ds2UhhgmaleiWr2rEsw5dALCS7Pkmh+yx62T1EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nh62yrhR; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a0adcc3e54so1200882f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 May 2025 07:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746628554; x=1747233354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PZP+vwFNWuh5ghEI4qOKuQl+IJHm3W7oUZPfVYjUgRU=;
        b=nh62yrhRcUjU+nz7qykKCBu474EfYvXE1KqrWFiUo06p9xJSHYzeRYXSXfzCt5mh1/
         T/i0e5UhCuosauWgV2Zk0Wivpx1RvSIMnvNG2g5QNWXiOv4l313YkWn5FguiVjTwkm4C
         bPGOQnAF9k9A8rehzSSfPor7ESRVu3iuYTVzrM47gcrg0tvTwLt2RGgrA3wgtWXe8Tgk
         0UMp7SNyoT6ZppBYl/9Xpav+8YKoVcRlX7QSeRyC9YMrvKWR+hZPi10MUc+N4B8AQOej
         3jozzO6V6rYShCF4zyPOgkW2OGqXsN6vt8JVl+Kaji1mjX5YHaK+nJSIK62Rzm8K0v6u
         Zhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628554; x=1747233354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZP+vwFNWuh5ghEI4qOKuQl+IJHm3W7oUZPfVYjUgRU=;
        b=H8/0lpGzJk0f/m9ajkpa/Nj28or4T3wJS5nVLULLU8BS/B9v40BAhWhZZ9Em7Du6RS
         Yn0djYnzRdNxm6RMl+SJL+FhMpM2GH/eRSSSv96hE0GiJX6LT+R7kG7iI0f7MWn71JcS
         5wbLjaF34f5ooyOJOmTFmunRcegD6/aY7cyu35L8RqxXlGCFFEYZakvR+AhPBBl3Ljim
         SP2tO/to71a1d9UrE1Jb29u+ZJk/J+pnuQUyjXtj3GWeaN0rJ7uKhfwU/gXeY2rOnetx
         bU2I+izoBW2hyTLmxzRF9HYiDVS3bKSGaCKJM69DpFkOfcUKf27oaJkP+88qVu2S5Q93
         G87A==
X-Gm-Message-State: AOJu0YyzC1D9tAn7Jj9NdC2a6WKQgIVM/9JfADGny4/ONEOr7ouZSvWh
	qEUqqt2Lvf8CDZARDTHWcPLF+vpJoyFndSJauAGg0eDEfQYpmaBW6dI7VSlcHuc=
X-Gm-Gg: ASbGncuVAyBnwooCiR03m3zeF/RS0VbwvCU8hhK5xKLAUOlwlb78mUM59vAduXJe+DN
	nmcdIiDJV8uKnSqO9UBs+eLV7gs+JECc/C914icxfbo76TSk5lJIKDOBSTn6A4LTxWqSdIL9IVM
	duT2XsFoNGlgz+9doRCkM3rnw0B26RTj6RsXYBWpfgrC/9cR8bb6l27muvciIXobSLWKSSecEls
	u7qp4DxYSj8KVs0GJ3h9098BQD88VqiL3PmC31qx1nlNF48lP8XNLRJOOnDYuE1kDbWwTquGT57
	A1u5PESw/BQh/n0FZReEYy810lbppgr4CLRUIXXEdA==
X-Google-Smtp-Source: AGHT+IFha+RZUAi+OttzpPGZymHN1i6U1q2b9g+xVfZMh7twm5F69jMyZbgHMqWJlmduu30guOSv0g==
X-Received: by 2002:adf:a458:0:b0:3a0:b53a:7b3b with SMTP id ffacd0b85a97d-3a0b53a7b97mr1913697f8f.12.1746628553963;
        Wed, 07 May 2025 07:35:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b323:3744:4800:6909])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b9322eb9sm123475f8f.3.2025.05.07.07.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:35:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: add stubs for OF-specific pinconf functions
Date: Wed,  7 May 2025 16:35:51 +0200
Message-ID: <20250507143551.47056-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Allow building drivers using these interfaces with COMPILE_TEST enabled
and OF disabled by providing stub definitions.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505072245.OgSXI1hh-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinconf.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index a171195b36159..e1ae716105261 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -142,4 +142,21 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
 				    unsigned int **pid, unsigned int **pmux,
 				    unsigned int *npins);
+#else
+static inline int
+pinconf_generic_parse_dt_config(struct device_node *np,
+				struct pinctrl_dev *pctldev,
+				unsigned long **configs,
+				unsigned int *nconfigs)
+{
+	return -ENOTSUPP;
+}
+
+static inline int
+pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
+				unsigned int **pid, unsigned int **pmux,
+				unsigned int *npins)
+{
+	return -ENOTSUPP;
+}
 #endif
-- 
2.45.2


