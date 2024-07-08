Return-Path: <linux-gpio+bounces-8092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB60D929F84
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 11:49:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A07C2830AF
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2024 09:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21D66A8D2;
	Mon,  8 Jul 2024 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m3GlserN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AAF53362
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jul 2024 09:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720432148; cv=none; b=jhMteQWQwOZYSMBnQbmVXekIodQPUsHp6LNY0u4QkY5vuhW65lydW12Zc3pso2c9wmSDcsBZIW5DREXlrjGwADNS7R0xCB4flSUo71oY2oNRCPKltJn1WGILQOBrEqiBiKpJmSqwp8MoMvfJrA3wxNqyJ/3Px+xEm8+6HIdweuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720432148; c=relaxed/simple;
	bh=e3fwMKpJZ3cGGbK0477wZ0A4oqkOt2n0QPn7WPIZ3Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uddlYnZ3Rjs7CHgVOR3hvbvE1IjYeZ6tRZPbd4Rill1KhfD6PW1U+cZTatyzjU/AVaQBIAONVJSmihXZLrejgQPGvXFw/phvQvrrIQ6vmuinDQMaqKcUtwBhAmUv6mRB4zgPKYRKJ7bn7M+BuSVDDFVgX1o4Q+sVNBPRLt5RttA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m3GlserN; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eea8ea8c06so8013421fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jul 2024 02:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720432145; x=1721036945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JinfUOS0mRH8fZO3rpei8CyQY7jy3eezIcVW2aMxENE=;
        b=m3GlserNqRQSMnVLqhEFLaYJYHHwqYZB84Wym32+5hVjzYrFyhtCBZv3m+pIRm+1WO
         KcH378HNfV5REQgg6B61xkk+ymjh67WXVEz9CY9Si+yBVv685a28IoMutEgPCah5lPl6
         fODfolYLrg7Muvix2MHk0N+FO6KcN4BiV67b68kqG31TIl31oZM0Vei+xndjIj0Z6VlB
         nls714e4dpF/6BDpoWbDCJ4qS+bIJEIlhM9vd8/SGv7yb6kZj9iBFmqT95Xz6lnS9fAH
         q9z4qQ+IZlQAluPh7dliLwdK3W9D5GW+JZoCDnyybScyXuRCNDLqfZhkFLgcG+4Ns9WD
         098g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720432145; x=1721036945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JinfUOS0mRH8fZO3rpei8CyQY7jy3eezIcVW2aMxENE=;
        b=g/OoVmXw+Scv4dg4V6Nf1DMpwaLfJKd9CZACja0t3JSDPCNSLOO/aT/3TIUzbypLny
         EVbBVb0XIfmyy0yxCwgynpznKfESMpmuLB2e0kkKgEvbl6m2C1/eeIU5L5KThfAEZMO+
         npu0Et2a7jdbXP660ky3T3Rj7ZKSejU9YxLo2NAat8KgGnrNiMwZhV+btND0dBd9AMy/
         7R0gQQmqx+6d+b//QVcr3n73ePhZLYOqTs6r7KD/Ds3wNufXirYgwfKrWfe5K5hApDQJ
         s+Rhw91EZnXVeQiazqjvRHmn/vEAh9RgV8Pwvnv1iykwkrdJS21HmJ3DAjqidBe6PIlt
         7VXA==
X-Gm-Message-State: AOJu0Yz0t/klR5EbY+QGonFKVFwbGerqOigX93YyfnLQjqhfO0iJOJrO
	8F+7lqY+semrIv37kGfPTn08lakh0b2XkUN/lfdTU1Lg+vp1+5iXNooS9c9swFQ=
X-Google-Smtp-Source: AGHT+IFK8ZwuMEsDIeFJ2u+j54yxD7CqbcL73Qz21Ps4A+5nMcQIw/N8vdPkrT81PZjvFCpiSg1K4g==
X-Received: by 2002:a05:6512:3b4:b0:52e:830f:38a7 with SMTP id 2adb3069b0e04-52ea0628c5emr7865897e87.21.1720432145337;
        Mon, 08 Jul 2024 02:49:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a2a3:9ebc:2cb5:a86a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a21cc59sm157931605e9.25.2024.07.08.02.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 02:49:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] bindings: rust: tests: set direction when reconfiguring lines
Date: Mon,  8 Jul 2024 11:48:58 +0200
Message-ID: <20240708094858.85015-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linux kernel commit b44039638741 ("gpiolib: cdev: Ignore reconfiguration
without direction") made the direction setting mandatory for line config
passed to the kernel when reconfiguring requested lines. Fix the Rust
test cases which don't do it and now fail due to the rest of the
settings being ignored.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/libgpiod/tests/line_request.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
index 4e095a4..4ba0d18 100644
--- a/bindings/rust/libgpiod/tests/line_request.rs
+++ b/bindings/rust/libgpiod/tests/line_request.rs
@@ -138,6 +138,7 @@ mod line_request {
             // Value read properly after reconfigure
             let mut lsettings = line::Settings::new().unwrap();
             lsettings.set_active_low(true);
+            lsettings.set_direction(Direction::Input).unwrap();
             let mut lconfig = line::Config::new().unwrap();
             lconfig.add_line_settings(&offsets, lsettings).unwrap();
             request.reconfigure_lines(&lconfig).unwrap();
@@ -452,6 +453,7 @@ mod line_request {
             let mut lconfig = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings.set_event_clock(EventClock::Monotonic).unwrap();
+            lsettings.set_direction(Direction::Input).unwrap();
             lconfig.add_line_settings(&[0], lsettings).unwrap();
             config.request().reconfigure_lines(&lconfig).unwrap();
             let info = config.chip().line_info(0).unwrap();
@@ -460,6 +462,7 @@ mod line_request {
             let mut lconfig = line::Config::new().unwrap();
             let mut lsettings = line::Settings::new().unwrap();
             lsettings.set_event_clock(EventClock::Realtime).unwrap();
+            lsettings.set_direction(Direction::Input).unwrap();
             lconfig.add_line_settings(&[0], lsettings).unwrap();
             config.request().reconfigure_lines(&lconfig).unwrap();
             let info = config.chip().line_info(0).unwrap();
-- 
2.43.0


