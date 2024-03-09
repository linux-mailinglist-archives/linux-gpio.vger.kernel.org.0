Return-Path: <linux-gpio+bounces-4234-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB787747E
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Mar 2024 00:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68C511C20E85
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Mar 2024 23:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00EA851C43;
	Sat,  9 Mar 2024 23:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iIEp4Kre"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF22943ADE
	for <linux-gpio@vger.kernel.org>; Sat,  9 Mar 2024 23:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710026853; cv=none; b=nIKf9aIkJHrEEHip84pPJYVQppvQW9xyYckucLqRg7enOf7k80013linKCVzFoDo3rTYPuoi5VXbJG+HWb+pylNBs6F5RiC+rXBrOQCnOShFK4J2WSkqWB0PVrHWVbALTmtNo8VaUqKEjQxSRDtOE0c9Q70zrQftDtJeynQ3S7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710026853; c=relaxed/simple;
	bh=p+My4HmWBQsJvPSmqxFwCa000CPQedSiE6H9ZDUlVyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T/vdHpYH15LFgVDD+Kur8qvUrrLr9hWqFE9shPNEM8L2wVjoBtIYXcP6Ppo5pOi2Vv9htNiGr84VsMoj0M1XV5XHB8VCfjoTU9qJeOGrRRfcXmuMFMXM/w5MUABX6fAZCVI8stwIsrqaTg1QbvnwR5Jef+PKd6Zx0CEOWcQ2pzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iIEp4Kre; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5684073ab38so893949a12.0
        for <linux-gpio@vger.kernel.org>; Sat, 09 Mar 2024 15:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710026850; x=1710631650; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T2VvUr57XpWLkwj2Urdow9kP8nzOatkbx+ejTfT17F4=;
        b=iIEp4KreNT05wUj4vYOQ3Ap1UGYiCABmhiucI4ct1iVm5a/l4YwzKH1zRk+cmKkS2x
         JLrr2J8jKicAWWEKarvR8WINB2xUy6LEC/poSsK/KzoYjFdFJaFOxNruHQIXgxh/dUHx
         mu70YKGS4Jk1PYLY1mMBR1HvCQbPlUpzNrt2SXB7T//zH43QjzI/Y//Nf4rnyk/mU6IZ
         gnsT8WB0CYQPVL4R3E6ddYYGHrHy+qIoFyqgco6HVMsa6M7zM+rt6C8sx4xW5AQ5VNJh
         xdnmkJ8V+8Zbz9yru7x7+7rtkCAAjQFPhru5AZpORxmy6US+taEe1b0sxoKUojNHTTxP
         ErLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710026850; x=1710631650;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2VvUr57XpWLkwj2Urdow9kP8nzOatkbx+ejTfT17F4=;
        b=jZSczKcKSK/pFwi+kOpa0mElLyyiCyHJlgZ2AMa/2Ac4ziql9oOcX7kox3STFczO3+
         4wjYz1Q9EZs0PHP0EqjtmdXoTQ9yDfnMF0xtBbEntF5F2oU1uszKhlrx/MJ25icTPttQ
         FXxXc5Ahuc3Od0e1FystPv5GSseMGayQjV90aP3sRwgE36EIAeDKjg2mQk43fzaDq+w6
         k3wuboFjoP5N8duTxyrIW8o5JnQqVVtu/VgKNOxFJwd+x5waNWuy/5f+XM3sa59iENpD
         0eWqNmhctEtawX9bnG2+df6eji4UUQtehFdW+87lfMijFTRBj8ydIisbWpJvbXirxKd4
         HU7g==
X-Gm-Message-State: AOJu0YyLwAH6IlKU8LetQKPR+q//KQQvaH7fBv1QMt+XqqX0Qlz9T+1J
	xFNnMUzUHucQ85LLgngRFqWRI7drLvf4yW6EiAsW6WgvZU5DleSnJ7fRyUbpTpE=
X-Google-Smtp-Source: AGHT+IG0F0gSTyufv1LTvBqnwgOBfmwFVZn1vlsoaptKYMqYWIJfQufcSSH+0K9OWqiOdZfm2Ul2dg==
X-Received: by 2002:a50:8d18:0:b0:566:78ff:b24e with SMTP id s24-20020a508d18000000b0056678ffb24emr3365666eds.17.1710026850159;
        Sat, 09 Mar 2024 15:27:30 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id o8-20020a056402038800b00567566227a5sm1326641edv.18.2024.03.09.15.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 15:27:29 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 10 Mar 2024 00:27:29 +0100
Subject: [PATCH] gpio: nomadik: Fix debugfs without debugfs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240310-fix-nmk-debugfs-v1-1-38fe65409c56@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGDw7GUC/x2MQQqAIBAAvxJ7bkEzCPpKdDBdbYkslCII/97Sc
 WBmXiiUmQqMzQuZbi58JAHdNuBWmyIhe2HoVNcroxUGfjDtG3parhgKDt7aYEkvzhiQ6swkyn+
 c5lo/TuKYc2EAAAA=
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

When the code was extracted from the pin control driver the
non-debugfs compile path forgot to take into account that this
function is no longer static but shared.

Fix it by making it a non-static stub.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
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


