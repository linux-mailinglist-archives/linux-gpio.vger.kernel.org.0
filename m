Return-Path: <linux-gpio+bounces-2223-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA2A82D83A
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 12:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D371A1C218EF
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 11:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3599D2208A;
	Mon, 15 Jan 2024 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UFH8DiW1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A021E873
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 11:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e7065b692so14987115e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 03:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705317571; x=1705922371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7tSIgDLlydIr6pYimgVy1JAuu+5DtKqCQJp9iL8c2UU=;
        b=UFH8DiW1BtpOJpSvXJYIhD2pooutFnPsoZLBDqQhgNE1C+1DrBLg7+QCRhDywhmI5+
         f0s9SAmU1vrWoHAkTQ7V55UUz6vNO2xoujmUgU53m1hvjTL6cthe8VDcqe97ShX3fRb8
         vpYHlsDM/kVC2pl1CJvt0CWutt3CG8txpBG0aDYhPy0mDFsFgD49GMJZ3fu0qVzXHVaE
         C7tQj7qx9FITGRmCi8qWTRh4kebPaEAYGyyaijNvh0AyE3gBDa4CWqDzcXLh4DiotVy+
         /tk2V3OpTEfHrSQ/w4PvIkMZ1IMr4hYZopUR74UP9iMgfqiwRhxXgBk9Z+7nDub/tga5
         wiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705317571; x=1705922371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tSIgDLlydIr6pYimgVy1JAuu+5DtKqCQJp9iL8c2UU=;
        b=fiVmQMZ+GpIeMj5Ef/w0pnsgIW99cAKRJucp57GanUb4daSeAt7VoOqpF7gKhMphc4
         R2PVFz4cQpivoN50HxGP4WlOatxha1lZmTrV/Wfwq6H7S0ybbivOqZySgDwEtaig+ke+
         D98LgAv6lILtVjXuaJgTFRv2T4zJZpHwp0KUcBPHnYtuRhJ7BN70Pex3Tpeqrjfnx3aQ
         CSryjr0Xw+YlB8F0e7xrmI0wTHPdrrUrYyyBjSg/D4VOAUCSFxmmwY2b1OKB+ZYYbs3v
         MAF5uK+/HrG7+VtESdQdrjFMXSA79TpKNSDF9+fw469zo0k6aJImDiXjLNPcQjcZLexC
         KF6Q==
X-Gm-Message-State: AOJu0YyFXa+77VyiKV8Lmnt+NoOqMQlTrCuyKZRxNPoqWUgS0bF+qWwP
	y0uHx9HcETApgWQAoqEcMUlYM/tGJoEUFtoGrB2BuMco8Fc=
X-Google-Smtp-Source: AGHT+IGcYuZZU6hYvIJcf614TrvyQJpwwvLGTB2CIxpUtXhhWGX/Ud0sgzDean84bexH2o7M+j7Hzw==
X-Received: by 2002:a7b:ce16:0:b0:40e:73a7:bde0 with SMTP id m22-20020a7bce16000000b0040e73a7bde0mr928950wmc.69.1705317571550;
        Mon, 15 Jan 2024 03:19:31 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b244:1a90:13e7:9f6f])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c4f5500b0040e4733aecbsm15541146wmq.15.2024.01.15.03.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 03:19:31 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Phil Howard <phil@gadgetoid.com>,
	Erik Schilling <erik.schilling@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2 1/2] README: add info about the github page
Date: Mon, 15 Jan 2024 12:19:28 +0100
Message-Id: <20240115111929.28628-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The github page over at https://github.com/brgl/libgpiod has been reopened
for bug reports and discussions. Add a link and a mention to the README
file.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Erik Schilling <erik.schilling@linaro.org>
---
Resending with [libgpiod] tag

v1 -> v2:
- add a link to the kernel.org mirror containing release tarballs

 README | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/README b/README
index 69128dc..632aab3 100644
--- a/README
+++ b/README
@@ -294,9 +294,16 @@ Those also provide examples of the expected formatting.
 Allow some time for your e-mail to propagate to the list before retrying,
 particularly if there are no e-mails in the list more recent than yours.
 
+There is a libgpiod github page[7] available for reporting bugs and general
+discussions and although PRs can be submitted and discussed, upstreambound
+patches need to go through the mailing list nevertheless while release
+tarballs should be fetched from kernel.org[8].
+
 [1] https://github.com/kward/shunit2
 [2] http://vger.kernel.org/vger-lists.html#linux-gpio
 [3] https://docs.kernel.org/process/email-clients.html
 [4] https://docs.kernel.org/process/coding-style.html
 [5] https://docs.kernel.org/process/submitting-patches.html
 [6] https://lore.kernel.org/linux-gpio/
+[7] https://github.com/brgl/libgpiod
+[8] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
-- 
2.40.1


