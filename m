Return-Path: <linux-gpio+bounces-2277-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CD282EBC8
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jan 2024 10:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8917B238D4
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jan 2024 09:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF29A134AE;
	Tue, 16 Jan 2024 09:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hYfshI+E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6CE134AA
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2024 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e72a567eeso21969155e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2024 01:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705398060; x=1706002860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UkeYB2TsYEJMw7sGTJLgFlIdWJX8k2S2k6cczxkuvlw=;
        b=hYfshI+E7AJoVImvA7jS8S/xPqea678MTpcZrQamj2MVUaTkNAMcTyMEMdk7+d0zja
         joK18PQZMnPyALVghgdRQkv5pfGqr0vVzvFFvR0Uy0qfIaFQstLH+0u/aitF7vTGikcs
         hKRbZjf3wJWoeaWZDLDwaA3vFcWzjgUuSzHksrNkzKPI9zgY/SR7I5atVZuGdw0SBLKA
         3fplmpcj33m2oIWBIi1qTVm7rOA5OvnVmK772nyhHuDfURZAAsI4GvHn63BL7amRpKak
         CBPavTimceenW2RYGFrXPcuTJxC6KcC1I95RtcUJzBFmj+N34oLg5N9lJZjtVrYjbNKp
         UelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705398060; x=1706002860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkeYB2TsYEJMw7sGTJLgFlIdWJX8k2S2k6cczxkuvlw=;
        b=G4I56Zz++IUXHhb9io0q1f63pzs4V1voX34P4zWvuNhxfnHSxaoql1LwTCQMLCvbxn
         PVXiqCQa7Zq9cz9UU6R2qE9oSUcNjLszMYturw3rgd2LrCzhgDIeeCry8wiJSdgpiF7Z
         NiI+3+PHogz4hfXQnhehhHvdRwczw/UiM+GDb8U2ibGO7r5i8d81wPedwEJSJKoqoQ6z
         7lbFi8lJzHWDF70J5GXemnXp5kqUm4tve7hZGUwet30S3GzWQtOzDC+O2b1bC9Bg235V
         YeiOZtLMr2brn1zv09w50c+l5Wgz4Jlzqk/fDH7k3yUxqRuba+EpltKfVg/Jfzp2JpR1
         pV0Q==
X-Gm-Message-State: AOJu0YwrJxB3BTspKaOmn9leMRZBrpU7LgsXU4abh2o5OVvpiI1RqU8W
	j4rPwJhIxYyZae6WPY+aF46KffyQaCPVBLd1DiH9mVP1nns=
X-Google-Smtp-Source: AGHT+IHOXpJ0W2lLbiile1jYoV9n5eCjRHRsec6SUPmopKeME3fB7N3CJn3IpszfsrYxn9sgob6A3g==
X-Received: by 2002:a05:600c:4747:b0:40e:6fff:e1a4 with SMTP id w7-20020a05600c474700b0040e6fffe1a4mr1263311wmo.148.1705398060186;
        Tue, 16 Jan 2024 01:41:00 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4da4:ec24:bd54:390b])
        by smtp.gmail.com with ESMTPSA id t21-20020a05600c451500b0040e3ac9f4c8sm22354035wmo.28.2024.01.16.01.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 01:40:59 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Phil Howard <phil@gadgetoid.com>,
	Erik Schilling <erik.schilling@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH v2] README: mention the Linux 5.10 requirement for libgpiod v2
Date: Tue, 16 Jan 2024 10:40:57 +0100
Message-Id: <20240116094057.10533-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Major version 2 of libgpiod requires linux kernel uAPI v2 to be available.
This was released in Linux 5.10 so mention it in the README.

Suggested-by: Kent Gibson <warthog618@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v1 -> v2:
- reword as suggested by Kent

 README | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/README b/README
index 632aab3..6063f43 100644
--- a/README
+++ b/README
@@ -8,8 +8,9 @@ libgpiod
              character device (gpiod stands for GPIO device)
 
 Since linux 4.8 the GPIO sysfs interface is deprecated. User space should use
-the character device instead. This library encapsulates the ioctl calls and
-data structures behind a straightforward API.
+the character device instead. Version 2 of libgpiod requires GPIO character
+device uAPI v2 which was first released in linux v5.10. This library
+encapsulates the ioctl calls and data structures behind a straightforward API.
 
 RATIONALE
 ---------
-- 
2.40.1


