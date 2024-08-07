Return-Path: <linux-gpio+bounces-8643-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2780994A3DC
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 11:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A60861F22FD6
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2024 09:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D013C1D173A;
	Wed,  7 Aug 2024 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D1cty26/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA111D1741
	for <linux-gpio@vger.kernel.org>; Wed,  7 Aug 2024 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723021895; cv=none; b=FLH8hl3sQl+EXyZIepKOzc4B66JAv6CDx7l2rEJZfazr97b/3eEkeyIQLT9aZZK2rao5z5+hHUxR1/11Av7par8rdpZ/n9f9LtxIG+fkZxJC/IjKctGgLTWGKGdAWqGXwyIxD8d47A3dDS7h4/p3LErwoFvgrsaw0QQSgFCGo60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723021895; c=relaxed/simple;
	bh=Vh4EoHIttyFBYPBYpY/tOPOfrhSZsXyZyiKpREO7xA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UODwDZPllRClO/sHUJ8eZZyOhiTH2R5H5nVGuedMKWv7QHGVZ5PxH9YV74MVK/wFf+M9z3o8KKhOY2iZVA8181LM00V0NHjVcaDkjfOji2MeMJA3yxgcXGacjOSLCc9MfvTCzBaxpxMt+GmvbCwdRm30hkQmCvLbf5/WxKh4dQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D1cty26/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42817bee9e8so10571595e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Aug 2024 02:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723021892; x=1723626692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPj246qV1cet7HDM8O2IAb1ytG8qFZcOVcZx8UtSIgM=;
        b=D1cty26/+gJG0wYc4I2K4kORMHBDM3RyA/7NjPCCOwAsYLkJxpnfuOQVlrc5ovZq0n
         a/QXMb9YxXK4EHSLbGTWMuf2k/V/m0pNWoWKcA6GMBRZFNqNn5mGMK5xEwz8N384pCj/
         Zt+xY9ljD8CciwgHAwQU5wt+o8m7HhuOfkpPe1yA3b62X8EEaLO3Pu6Ft9AzcUZUuAE5
         cj7VJhhcyhb2ntdUCoo+SKgQRouE7FZrPxIkLSlYccBEym6iN0FteYsYLa62ZtD8O7hJ
         I/9NCqmnAe43jLm3x7u68D6f3PRNqXqGvCh0SaE34QIXoDus/EgN86OwrbixvEIK5ky0
         Hvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723021892; x=1723626692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPj246qV1cet7HDM8O2IAb1ytG8qFZcOVcZx8UtSIgM=;
        b=bd0VmlojoDvp5Zzu8Y06Scmaiez6RSpNW2ib37mJcpbzezToevChxSI17tUE362n5s
         HyJ2AUF7DU4fQGg4s9Ye+VTBrCVvcEj76rxiUIZmLKSkYaIqOMDJz3tmwUCi7B1a9qHo
         Yasgl7vIJDNKk8vNOi3C66rXAkeKE3I/ppfHHcv5V692GpVutN4AwMtxiMKnccOTiQP0
         pvy0RSzWlrFLbNXaPZrkVBaDKaBSGWvucTdno2p+6CtI3k/sPj3YevHAzVYefnNujBiu
         +BpPqxQEzNhlvFdLHZHdaecIPR788JuduRsGDHjEgiBaVp/MHAsmysrkOkZ3nLItiHop
         Ae6Q==
X-Gm-Message-State: AOJu0Yw+qKSDDqJ/yeAo43/+DlqxTutWlTimZVlwhApzHWj/8VsvBVzh
	B1h6LQ3aaB9Px5q7a8LbNk9LWtJyCUfa21OXogxIzUeACV7CXzWa8efIwoR1vug=
X-Google-Smtp-Source: AGHT+IGFn45USG2Cmzh9V5bcUGrIBvZCZ6AWbgTWJcU7FaHhceYzUPLGa9Vd6rnCpw/rtFbr9uaDrg==
X-Received: by 2002:a05:600c:4fc9:b0:426:6f27:379a with SMTP id 5b1f17b1804b1-428e6b08fc5mr115875915e9.13.1723021892546;
        Wed, 07 Aug 2024 02:11:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a3e7:be71:fe4f:c360])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059cd2b3sm18936355e9.44.2024.08.07.02.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 02:11:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 07 Aug 2024 11:10:49 +0200
Subject: [PATCH libgpiod v4 18/18] TODO: drop the DBus daemon from the list
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-dbus-v4-18-64ea80169e51@linaro.org>
References: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
In-Reply-To: <20240807-dbus-v4-0-64ea80169e51@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Philip Withnall <philip@tecnocode.co.uk>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Alexander Sverdlin <alexander.sverdlin@siemens.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RRq5aj2o8XU+L4VY4jXN1bxPEYxbUlw1+LrXyAt+gFY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmszoT4dFeY+ZbcmFAtPOZ/9QvC4oavp/mGuhBo
 qcSqtgRaBqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrM6EwAKCRARpy6gFHHX
 cvtZEAC/k193XqWeJzTl9CkOKEuEBR9Vo3PGa00H+o82BECb3XgWG4gJ5zfgLM/fAxSa2EyBFvZ
 B2lFFQikDJZSpeyug4n7deGALFx7uObOPUysr0lwMmhgTRAGA0XQnczNVfuhWxe6ikTVk9Avksd
 jxhMh07WdQlqrNkHKQpehvkccinrz4ZFxCLvIJWbIgzcCyTBP/D3iWrjtQxwLYSbZmF9gfyhfyB
 rn9wmMEj1tkEiGIVneHlTQVmaMfuSIyoDBtQD9Q1dd+jKsH3xZPultK1wDSr4f/DnyY7J0WTPTe
 +NaAosG8mIm+cEI9hhT3iZMTnAf14VZMaISyjNhN2Vs/zAMpICy+nC0yEzEUZF9C+f0rCdl7OGE
 cZsOqt+Bh8lNWRwHgLwEgzW3nZSxhFMm/essExrGyzzOTBMZkD/Z4UIDG9rcWhRXlKrMWCpQnkr
 GjHiJHTJN8lqojcD1nRgW5+whPUDP+9FOA1bMWl3fRGWwZeFmTbG/Z8SkcE/jpfhGCv7KXfSPgQ
 7bv4FzeJxAtOC7Ppi/4aCxZdBDuGo90UCYC7SCP8l7z/+LEjysO+VNpVhhAX9AoxuRu5+582Mw1
 DRV+b9XLf/yD6cqC8gO4DMav3ObYBE0vSwj2RMJBt+V8BVJsB5Dv/7zfWEz713i3VCURCRCcupp
 Eqaynw2OJFB0wCg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We now have a full DBus API implementation. Drop this item from the list.

Tested-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
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
2.43.0


