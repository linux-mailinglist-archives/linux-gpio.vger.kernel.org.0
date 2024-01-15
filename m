Return-Path: <linux-gpio+bounces-2215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0835082D62B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 10:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B16391F21D32
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jan 2024 09:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FF1D275;
	Mon, 15 Jan 2024 09:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3RHkWueD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE63F4E3
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33678156e27so7319151f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jan 2024 01:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705311548; x=1705916348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8qhrsF6Kb7W+uzCqN+2CH11GXv4br2sknGpx3hEdjns=;
        b=3RHkWueDFH0UG1prso4NyFKWmijugUN0jVBdg21Q9FnqScgfEoYTrwUagfbyueRMYU
         i3s1Yeu7tvmL+nph8ps9Fz2CM4/k8/aE9f6ItygPK581rfZ+hAhxxt/b1qHeBODhUQoM
         0xazAuUPF1dbxMrVZhmSVM9ws/vpjMRU1k4w6K+Xd++EVbRG7T1Govd3fkJSfHEiqeRd
         67d3FPT642RMFnjDyhD+TjAqMlVEgGWTbL0yT/ZnM6sS2djcgaeQ7QUJZCXB9vhk/lXB
         /dt4SLnHKT+LaTPIBQPvNt5GFcnIhg4MTiLfwOEX3vRrg7FmS3qxUxhUIYTYA3THrRlj
         S6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705311548; x=1705916348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qhrsF6Kb7W+uzCqN+2CH11GXv4br2sknGpx3hEdjns=;
        b=iGvbGX55rI/pmv7F3UuXReibylpRVrA200nm149LGapXunrlMzRgYOsrbqe3MYaC4N
         ru/kcKMfm3brkPuVGFKBeICm6QO97fTI1G4SJvNtA/mccEmQu1isQk/8zp9EOpzP2JWB
         oonn4Cj5XNZBnJutJ5mfZTPpm8OUU79brJ8rBEJqsEItQZmmY+aR7k/Frx+0im33WZ3e
         5X95wkzoAjOr5Cu+TePMnGqXDgcNmbHZgC8Ak/a2LTzwW8oZWMgr/4OuxMidAKxg1vvb
         VMfoIUzd2hCx468++aeeO7iMQ02jiq/Lpqzd+hB3aaqLJmQBWXgBxUUqK53/LNx26ehn
         lUfw==
X-Gm-Message-State: AOJu0Yy5C+/BjOfwWTGP0e/ja5cV9v3te725FRkbqPMUejxKbmsepiBW
	QZuio57yDyd4YvfEEpdQE+G+xHCqk3XDdw==
X-Google-Smtp-Source: AGHT+IE1+sCz+V/xH9YwNETo8mEbbxjlsDdoNC90LZ/62Uc2/nQugYnR/IE0NEstHJVX6OYOfJViDQ==
X-Received: by 2002:a05:6000:1186:b0:337:6189:da19 with SMTP id g6-20020a056000118600b003376189da19mr2730268wrx.2.1705311548046;
        Mon, 15 Jan 2024 01:39:08 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b244:1a90:13e7:9f6f])
        by smtp.gmail.com with ESMTPSA id c18-20020a5d4cd2000000b0033740e109adsm11361087wrt.75.2024.01.15.01.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 01:39:07 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Phil Howard <phil@gadgetoid.com>,
	Erik Schilling <erik.schilling@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 1/2] README: add info about the github page
Date: Mon, 15 Jan 2024 10:39:03 +0100
Message-Id: <20240115093904.9606-1-brgl@bgdev.pl>
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


