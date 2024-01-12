Return-Path: <linux-gpio+bounces-2171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B353182C27B
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 16:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 627FE1F22E5A
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 15:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676BA6DD18;
	Fri, 12 Jan 2024 15:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oddzwfNN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349BC6EB46
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 15:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e68ca8e21so3220975e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 07:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705071951; x=1705676751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BBEj1408SFyhr9u9bVnJsTpzHJVxfQzxUlU7+WQjkwA=;
        b=oddzwfNNe/xj8+dWX0e2i33aSjMn/OdZ8FFh5LQT6eQl0Jn6LZhgd17RKUiDouNnl3
         hzgMzMY49nehAWY6c5Kvk9HZokq00RlsFU606WuVEZ/ZWy5ukrKaBeZzMvbpw0p/RU2/
         tkxju8yeG4XDcEVQESgYU2MuxGpJxrAoHRMoZttLq3w3rEPUHwbzrNNJPmKNeXVFUBVV
         qK2VWgdJmpNeD/1t0wnqhdVHbnrH0RdOUKISIiHiWL3kqPqO7vRaTD+6VLzFWo2Xlvgf
         iWF3c6XF8kusoJraI6/lKRLSteLlq1uP6XBySpnkDQcTYw2LNEyL6T0fDpQfnEvhwDzV
         QuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705071951; x=1705676751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBEj1408SFyhr9u9bVnJsTpzHJVxfQzxUlU7+WQjkwA=;
        b=i2G1/6Y12EQgwPBenJOLG3MhS1wEejAdNyhT+ejDQkiGW1hpaO3m6QyOfFcNyX21Ah
         y7edxpVTzqcFY+r2B7jIBDLffNnY0rFxFlotkvdb4ObbF6BHC+z14s+M2LPVV3vcAIrT
         B6pRQNW0pPhAANzKqNk+03+r6YovTF9Gbg+o4SrhHvss1mSl1DX3tDTFuo5yUJdtiyKd
         hO9bgz/veYtC/CnwjsgdROxQBe0CtPn0TUi1ZF2ZJRCYHdlajynJj7Y0rwQ3D4hgLbmO
         W861X9c27ovGretwsekV2NBtJTiMnzXcXLrjtg2Fmsfbs7hj0kMre0Wo2NI7b/1YUFLc
         f6sg==
X-Gm-Message-State: AOJu0YwtdoFq2bJ/5lFr5N9W4ytq3MoJyEZP161w+nw+RfMzs9wuwmJp
	LJ3PwWDWBdyOBmQi9+D6D8jTBitjwKKADg==
X-Google-Smtp-Source: AGHT+IHf9lE/NgJXVBkobknsXhxiGQFztAPPfBfySmf9UFvATu2IePATquTMSafIVYZ7wE2kZk5OVw==
X-Received: by 2002:a05:600c:4a93:b0:40e:4f1f:b4c6 with SMTP id b19-20020a05600c4a9300b0040e4f1fb4c6mr735399wmp.128.1705071950451;
        Fri, 12 Jan 2024 07:05:50 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2e1d:1379:12e:4f8e])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c0a0a00b0040e486bc0dfsm10093353wmp.27.2024.01.12.07.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 07:05:50 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Phil Howard <phil@gadgetoid.com>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] README: add info about the github page
Date: Fri, 12 Jan 2024 16:05:46 +0100
Message-Id: <20240112150546.13891-1-brgl@bgdev.pl>
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
---
 README | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/README b/README
index 69128dc..41237f4 100644
--- a/README
+++ b/README
@@ -294,9 +294,14 @@ Those also provide examples of the expected formatting.
 Allow some time for your e-mail to propagate to the list before retrying,
 particularly if there are no e-mails in the list more recent than yours.
 
+There is a libgpiod github page[7] available for reporting bugs and general
+discussions and although PRs can be submitted and discussed, upstreambound
+patches need to go through the mailing list nevertheless.
+
 [1] https://github.com/kward/shunit2
 [2] http://vger.kernel.org/vger-lists.html#linux-gpio
 [3] https://docs.kernel.org/process/email-clients.html
 [4] https://docs.kernel.org/process/coding-style.html
 [5] https://docs.kernel.org/process/submitting-patches.html
 [6] https://lore.kernel.org/linux-gpio/
+[7] https://github.com/brgl/libgpiod
-- 
2.40.1


