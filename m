Return-Path: <linux-gpio+bounces-10662-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D36298C792
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 23:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68A0B1C23CD9
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 21:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F601CDA20;
	Tue,  1 Oct 2024 21:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8V8Xr8N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DFC322E;
	Tue,  1 Oct 2024 21:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727818048; cv=none; b=pOPr1fq3QtgMY4Jvz+bny8p6Xy0eYdNJnk7uCDbUhn+MrkWbiDAfl2LyePa/gzNtY0N1z8y/iqJZrlyJzWNlSdaggc9/fD5ds0ykCjk5IU4y/Zy2Cfgnf4R0oJBAqGse6qeFrPjy9Znrz3Jnj0AFTGK2IgSy6l3qqVdwy3p2u60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727818048; c=relaxed/simple;
	bh=6BJzA92DUG+O6xuNwb5m4dK6PPn25FEwaFk2MLI7+0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d9bc6Avt8K7ELsVtSrXZBlEBLRv+41x5kQlFfmn3knyZ2dQWas3IgReogzWumcUAp3WzNU2rR31ZdUP8RenTN6zEZtEsCnBn7jqVHGtnAIMcHHhpc3bzPsUP7eusfsKcj5wkNhXtn+tQGiVotrZHtP4HZLSITtPEqtXnbb+YQEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8V8Xr8N; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-718d91eef2eso171984b3a.1;
        Tue, 01 Oct 2024 14:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727818046; x=1728422846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LQca9DR91ltbBlGQg8xftox/shScBvpsoAMjaXf9zJE=;
        b=a8V8Xr8N6/qiFFNTkpSjW+fYIuXlSjf9llfYIfqEIATUFLwOZnBhJiZQEEwpApwINq
         Wl7uGLkbesYjE339N6t+hSiofYyMkIh+G15z88S4WESkLVDPYi2aHr+WDn8etEIex8F4
         venRiIiqS427+onWWK5cBcvTTLzAiDTTdsMLH+D4lRYLnof/sJT4pU0ri7/kr8oRttjj
         CCQUApDVhpDp+ZrxNTGpVD/JswoCu/83iGIL4b1cpktm2EluFybd+9EOEK6La4HNUTbI
         vG3RvWUyrdgHuuR7nHj5Ix7Vbt+usUsnWRUQKDIJBZ4hBW5+7hmFjU4FwEOpKIycEO2X
         citA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727818046; x=1728422846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQca9DR91ltbBlGQg8xftox/shScBvpsoAMjaXf9zJE=;
        b=PXU7hGgG6CgbbQvliUuxto1Yh1PVcI2NKQk+ZwoZzpwcjIe86inYewXpdYfIOsRSPH
         gFCjqdJpcymndFpX8ZduRiAkRFpDudSltOv09gLQfpdxxm2aKtddlVMXEOjK3J3xc6BV
         Sq3K5fI3AhDdtdx9hYWJeAG/UJ1IYijNoUuMWVVz9dSUfa2nUho/Fu/epfWZ+F+hIbWB
         szF6CbmXvHjrlluI6Y5Jr1YDPJ2xdysPyxEP6EB1UDQi9gIMwI51sNQRurWBW7JDD8bp
         2m7lf5JIIL16c+493IMeEXpgJn9Ytz+OuDzGObgU9fqjpO+6M7PHyrCJpe43WLT4s8Ft
         baQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUncwDonqEnqih6vEa687WfYNflnP/ZLbw0zY2ajHqEHi6r0VJ2c+//kgVuz51QptDubgLbvpxcW8LnToU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx7O8q7l8YdXS+G/eCFTXDAi/vKn7vi9OdSWLayUAXX7MmlTVv
	f7L1ZGq5tJ2ten0Frf7n5DCe5yI4ocfbO3EpAyu9cc8tAbBRS4Tb/ry6uPli
X-Google-Smtp-Source: AGHT+IFMVAvq+6O3pjPa5fuBOmkAFnt5kV4DDCKh29ainEwH8OC8LUCT+15mHJDzgrNbdz3PmbBQpA==
X-Received: by 2002:a05:6a00:1794:b0:71c:722f:8298 with SMTP id d2e1a72fcca58-71dc6020e52mr1681051b3a.8.1727818045996;
        Tue, 01 Oct 2024 14:27:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26518a2asm8572942b3a.107.2024.10.01.14.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 14:27:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] pinctrl: aw9523: add missing mutex_destroy
Date: Tue,  1 Oct 2024 14:27:22 -0700
Message-ID: <20241001212724.309320-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise the mutex remains after a failed kzalloc.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pinctrl/pinctrl-aw9523.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index b5e1c467625b..1374f30166bc 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -987,8 +987,10 @@ static int aw9523_probe(struct i2c_client *client)
 	lockdep_set_subclass(&awi->i2c_lock, i2c_adapter_depth(client->adapter));
 
 	pdesc = devm_kzalloc(dev, sizeof(*pdesc), GFP_KERNEL);
-	if (!pdesc)
-		return -ENOMEM;
+	if (!pdesc) {
+		ret = -ENOMEM;
+		goto err_disable_vregs;
+	}
 
 	ret = aw9523_hw_init(awi);
 	if (ret)
-- 
2.46.2


