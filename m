Return-Path: <linux-gpio+bounces-5430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B82F8A2E3F
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 14:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE32CB22336
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Apr 2024 12:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA3E56B71;
	Fri, 12 Apr 2024 12:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hOzjHvJ6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C2F56B73
	for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 12:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712924917; cv=none; b=RAxlPe2VC4jubp7H7JTaGvjz+dCaMfCCOkD74YOmKFW8i9Ljh52woykoKY582yCTnTqAYkZgN/I+r1IAxaWWuI1WVFCt+M35bJdQXUHSnXCHfIoIigALLd64N8LjvAhh+6vnbzl885zweZzC3OeEUwFYHMoSA+WRCeOClZOrMak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712924917; c=relaxed/simple;
	bh=e835xGMV0pS2hS0lVdoIpVZQwmaoNyivSiCSiwatgG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cnnjIUDpzb7YN6Aclcn+ROEMVd0mlLB/imr9XY882hq7ou7HyFMju4kq4N4IGaL9z0EIWs98mIuz3kkKrNHTdfsv8xRuxQ+TEJCD81C3BWWxZSD6086pV1qRPCJXY2UTWd6lsQ1LWMNZCDrsdD14p+0LY2BEVOe0/dLQMupDlVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hOzjHvJ6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41802f985baso2824075e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 12 Apr 2024 05:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712924913; x=1713529713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVfVHmqTBKgO4xPFl6Vz5mpPTWyOk38sMQWQfF6hIZw=;
        b=hOzjHvJ6KswZUVtAulLKgM1iFe+AO0OCmpdZuF/Bw07wR6f+W0utGKGAlmKb9szGfY
         347cFrLCneQhKaC41vi80yH2NTn4QC7kPAWEhGohm9RzlsVlQwMRyBkJ5v3bSEhdFBS/
         F+/4o8oDzyPhggcCnMqs/gmJzgF7Z/nP5HFSRaloYDHYXIlHRXXAnmGbcAlrJAf/iRnG
         lCOQBQpHnlt0P9e8QGeeD3Bqr7eVdTQHM6UT6M96k1mrkjF5jBIVUcKlvt02wdGULk/T
         f1GO+g/Pi12dC8EZn7sss8yVrJDHCKXfty98744iDQkdqTkQ9W53d+WKeOWdv9lwNZOa
         xrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712924913; x=1713529713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVfVHmqTBKgO4xPFl6Vz5mpPTWyOk38sMQWQfF6hIZw=;
        b=gAzvu44jJEpTE0T7Bo8oNd3ufGXrAfnRsP/tAZSRGhqE091LFkeDnyYtK1xtEOizDQ
         REr22Vu+4w46KEsM+9nk/hnTlhkPcb1ziZh3jyFsZlvZh5dDzMbC4FrZdLwyv6TJEEVg
         JQ32ZQF+WTtpxXUIqiNVglTZgi2Y0HgqVse7c7mWmhIOsDeEU56Nnf+sYnIXqPfT2+00
         lGse1KHfG60eYCtD+ILWdm+YtWIMx8D4hiD7h2lJM3Lj4OiZ4vLNOIIbpTBBdDxoL5zK
         Npq7KP9FZAxGyBJ1WHhF4Q21XIUJCfyH5yvE4fzDkA7F3KfSXlMBaMmH8Mhc9tE/H08b
         PWFg==
X-Gm-Message-State: AOJu0YxyV4tb+pHs5770saYQHQc8YgeucS4clI/SivUuZk+m3Tf8aJke
	7njfLI7PEuSyVgN9SjEXxi42EQNc6gUvGqMd1ItrsuL5m3dRloQMCVnh+PC51unIWQS42Oa2Q3P
	6
X-Google-Smtp-Source: AGHT+IHtC1kvYF9At3/5XKl45/s9qtb92pOhgaCBi4nNGcDYY/g2c8YjnHwSf2zPI5DN4kYF6wvmVw==
X-Received: by 2002:a05:600c:5493:b0:414:653f:26cd with SMTP id iv19-20020a05600c549300b00414653f26cdmr2002208wmb.18.1712924913706;
        Fri, 12 Apr 2024 05:28:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:3e87:b228:de9:1398])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c3b1200b0041668162b45sm8752211wms.26.2024.04.12.05.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 05:28:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>,
	Phil Howard <phil@gadgetoid.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][RFC/RFT 18/18] TODO: drop the DBus daemon from the list
Date: Fri, 12 Apr 2024 14:28:04 +0200
Message-Id: <20240412122804.109323-19-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412122804.109323-1-brgl@bgdev.pl>
References: <20240412122804.109323-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We now have a full DBus API implementation. Drop this item from the list.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 TODO | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/TODO b/TODO
index 79a6246..5092f3f 100644
--- a/TODO
+++ b/TODO
@@ -11,23 +11,6 @@ serve as the starting point.
 
 ==========
 
-* implement dbus API for controlling GPIOs
-
-A common complaint from users about gpioset is that the state of a line is not
-retained once the program exits. While this is precisely the way linux
-character devices work, it's understandable that most users will want some
-centralized way of controlling GPIOs - similar to how sysfs worked.
-
-One of the possible solutions is a DBus API. We need a daemon exposing chips
-and lines as dbus objects and allowing to control and inspect lines using
-dbus methods and monitor them using signals.
-
-As of writing of this document some of the work has already been done and the
-skeleton of the dbus daemon written in C using GLib has already been developed
-and is partially functional.
-
-----------
-
 * implement a simple daemon for controlling GPIOs in C together with a client
   program
 
-- 
2.40.1


