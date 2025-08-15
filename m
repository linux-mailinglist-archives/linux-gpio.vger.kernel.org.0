Return-Path: <linux-gpio+bounces-24417-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 095DBB27C3A
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97898A01973
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361AC2D46BF;
	Fri, 15 Aug 2025 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FC4sq593"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E12D2D3A71
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 08:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248292; cv=none; b=sqrmPR/f2Xo/y2o309aRYsCSsgqj1ufvjKDfzkt/MIH10XjFjDRtxXbVkVnFrmPNx6yeWvrMqT6smHxdZNVwU94b5n9tWqnyIVEzjKbJJ1Dxz8qEz/cGo5E6P5thS8W9/uRPxRTo2kFpYms2cuTWOjLHUQbjHWl6aJaO7BonYxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248292; c=relaxed/simple;
	bh=zpgSWL9a1dyXJ9/2UEEG3uJN5gZeeFxADQyRjcHGtT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O8yaPHu6yMqQAecUjgl+cF+KSVaTsWSUD3UsHdm4wz4h0uRaA6BhL1tgdzu5sSOXZ/7ZCx7pfSKHXM/+TUqUOMQYJU11OOQNC4BqKPBhMP7hz2bw5ChfqE4tClQFaFzCbazvkJvc2OuGcIwtnC9ilBvVShQRmC/B1QU6Ecab2dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FC4sq593; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9d41c1149so1332502f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 01:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248288; x=1755853088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YN9xtW+JUatHHbDFVJkNz2NVU60YrHCG517O9l8zVfk=;
        b=FC4sq593E5eV9J1esv3513dg2HJOMYue7kixm5ZSbh8t+XzWpNox81kXLkLEUyvFjY
         vWaVG1ujY0KWiD1RJZgw1bHBYTRftfIpNrd7A7Toj8TkIPIfkNoFfBcci3woATZpNq3F
         IDFDs8HztQXIDekxP0acTminCgiVTp/hil/unbgUR0kIlxqER3aG2m7XOl5sek2dP9eE
         72Zt7moZSDgJoS0n3M9+ZXEtnoqxqyMl/03rPxRtw7eNflufGOkUZvD+0qEvklPmIG0u
         JyjPWgkbMlml53KKy2qBCfQKnJK92BrWmfoKxkOPfSK/SkVTaf6P4yCRmpWAstQ+zITq
         O3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248288; x=1755853088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YN9xtW+JUatHHbDFVJkNz2NVU60YrHCG517O9l8zVfk=;
        b=aCHx/4be44lYganE3CYkq01mCorUbh72TsLSoFhOdIN1PlQHqKR3iiPJrcjFUnIknL
         DmGnnBXTjdLqRaxaJ+vQK/x7maOt1o/zazJR2bfiEpoJhhiOGP5TR9CYJ6gXAcry8CQJ
         tWCLEhiPl8vh4ctoL3aLfJTFLSHjniocUACpDUBl4JAOCHonBmwKxntYbW/w4U4YE524
         1fqkYMSjRQD6Bai6nKQ11eHnaL9DVFrxPwNCGsTv/0ChkubYNTLX6jIQxUhy4uB3Ae0s
         m+sT92eoY9xZqdTi8HyrYfh/VecqB1g3BtP28UcCJJ4ZXiGuNAFzsGIQ2YRQE2Wl3CNd
         ZO7g==
X-Gm-Message-State: AOJu0YySn6K6Ay2WUt88nGGMSv7UptLMar2eVp3VWFfitwmWTc5Pxviv
	GW5cQFQp2bydagS2+CV7liT3AZuxQDOVToWBKZleBmcq+87oobf3X+pagqQIqvBH4fE=
X-Gm-Gg: ASbGncv2MEj35cFvIwaBWe47TicroSiJhEWyVEUkZ9uzAErwVX2Ko6c7TemOPYCiRfM
	eBnP71ZFPK8GPWhGXHf+kFFz/P2YngZhxSyLq5X01bv2bwGWKgMmpAg6XrxGM1ln5BCjq1NKfqy
	HjaJUxhx5jfs8yJjBuxyDHWJLphrsp9AvygSG5D5wBg2zLffwr6QU2/cR5sr5bvZb8ePeGu83xD
	+BJ7H8IhkCCjuYiFifyu0ojJxXDP/4BwYtT/08Ba9HrW3l6aQs0/onJBCBfzwkcvHYyJYw61niJ
	DtGAUgKvOmywvcNOyzCA6ZdOMBw01uoMucjPhz5eZ+CzGwXsn0EIpW+jjZApxglGqi+YOhlfjJs
	82pSRCbW0o8sBxT6iTQ==
X-Google-Smtp-Source: AGHT+IGXtXVaivc20phoWXc9Uqojw7XWSUS0g5nKl3uZV34klliHDcB5od5ZS3bhbXaxBvheIkdbhw==
X-Received: by 2002:a05:6000:250c:b0:3b7:8473:31c3 with SMTP id ffacd0b85a97d-3bb6646e10amr971442f8f.9.1755248287873;
        Fri, 15 Aug 2025 01:58:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb64758d1csm1193355f8f.8.2025.08.15.01.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 01:58:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 10:57:57 +0200
Subject: [PATCH libgpiod v2 9/9] bindings: rust: update crate versions to
 v1.0.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-rust-1-0-0-release-v2-9-b1794cb4b9be@linaro.org>
References: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
In-Reply-To: <20250815-rust-1-0-0-release-v2-0-b1794cb4b9be@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=YzR0Jbxeg/7OPWlhgcAnhN9B5R+B22Y7KadPsFlQcnE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvaVSbTRaBi5Bahh6cIMaQ6fFn5xW3Lol61R9
 g6/OexSLZeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ72lQAKCRARpy6gFHHX
 cqvEEACKYOOT8ZsRiNoimoG3Qhoma54RD/+K2EZMy1N2wUb+08GViOGYsvov1QO4TfXU+xLgtUC
 IAQaYghu5h+ngw45SMp7LpHnFOp19TOrL7q3Pav8gPj/4QQNeecnJD0/qLRdC/fDc6N9zYshGa0
 FYH9x9hIbICyvxtIo4Q9h8zkdcxd1J6zB923NUIhuax1DicUbBT4MFyNQX88AoxgKuHpcynFJd/
 fSQN07giRPwEQTKEC+Gp1H0Vvrmzd5mdCFBdn/D1WQCW+mwH7hw6ypHug58opFmzEIdz4KKzmtS
 d3I9f8JGXrWgw3KYo4IcciA5+AbCVO3c/XArOWluckj/NABx/Jp6tdSNRwKlqz2gNEbSYic/BzI
 96He681ZHDvQM/ukaGrlGJ2INDU0a7mE+ggnLNmCpuNJIhnZLIhH0DbFk09maO12Gbp1Me36Osz
 9yolrS7I2+xMDfO8GAxMc73lYCLA6rdFYAQfN1fKUtalcxBvwo3e+r3m+s5T7DjmnsRMOvvuWxw
 AW3KANplYFGJwcCEy/yqL8mS8j3XDK7AhFSyZBKJIEEw5uc1GBOZPcqbso5pAIznRzQ0Q5G4ODC
 DOBDewYxnKJb75dqFK8tlvZtmqCIIJIhb/NLwBFqy7dClP8PilJ81sWrNdGBLYJ+K2/6/2M5RjL
 a5yE8cCiTgPhGSg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of the first stable release, update versions for all libgpiod
crates to v1.0.0.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/gpiosim-sys/Cargo.toml  | 2 +-
 bindings/rust/libgpiod-sys/Cargo.toml | 2 +-
 bindings/rust/libgpiod/Cargo.toml     | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
index 86324b3e192d8ac4ecb45cc900c75537d2df794e..6611142f2ac9e4bd59b725baf75ac4be7d78e4f0 100644
--- a/bindings/rust/gpiosim-sys/Cargo.toml
+++ b/bindings/rust/gpiosim-sys/Cargo.toml
@@ -4,7 +4,7 @@
 
 [package]
 name = "gpiosim-sys"
-version = "0.1.0"
+version = "1.0.0"
 authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "gpiosim header bindings"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index dc08f83ce3ec77165d240516aa2a224075685f42..2ad53ce98e4bdced3451c9ddec0f25c947b9dfcf 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -4,7 +4,7 @@
 
 [package]
 name = "libgpiod-sys"
-version = "0.1.1"
+version = "1.0.0"
 authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "libgpiod public header bindings"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 4902d3707bc84dfcfafa3e70493303dd1027dd26..02f7396c5d37abc502ed4dc63fd8d33078e91c5e 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -4,7 +4,7 @@
 
 [package]
 name = "libgpiod"
-version = "0.2.2"
+version = "1.0.0"
 authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "libgpiod wrappers"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
@@ -26,7 +26,7 @@ vnext = ["v2_1"]
 errno = "0.3"
 intmap = "3"
 libc = "0.2.39"
-libgpiod-sys = { version = "0.1", path = "../libgpiod-sys" }
+libgpiod-sys = { version = "1", path = "../libgpiod-sys" }
 thiserror = "2"
 
 [dev-dependencies]

-- 
2.48.1


