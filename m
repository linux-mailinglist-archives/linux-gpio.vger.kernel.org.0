Return-Path: <linux-gpio+bounces-25140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B50BB3A883
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41F947C1B3D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 17:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069AD33CEB7;
	Thu, 28 Aug 2025 17:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SfWXwP+V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32916338F36
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 17:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756403000; cv=none; b=Kg4XvbloJ58P0zbHLwFLFm5foX1HYxPFQZbAZ5PhoA3EvPopNEEIviLhW5AsMewGtIPqLBGVB3iiXLrSKy/8PPHOgNIN5+w0gPNnIInt6hNtzHJK2RmCLb/6QoVurdHOQNVd878IaRfjmKfRwzWOguhwT0D2e+0K0hJnwWw74oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756403000; c=relaxed/simple;
	bh=Emzol6rosw5oMrIJJ8fCZ7+wwljlDAHWP8cQWCGJJPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bs+xg5Mzo/tIfjdvssGdt+SwY6wPBclbql615fY9dfuKMKrYkDSPPiTB3w9jNLP9V3SNlcrHYaIThJWIrNjiNl6v5RHhriyKxwnn6I6tjRneU+RArPjTeK8LpmfrgfRWB0GABFeD0r8jCMi+ZoQANSAnwW3yWhXk4gLl/vKpFck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SfWXwP+V; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b627ea5f3so5169695e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 10:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756402996; x=1757007796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0O2m46fevRzWI7x2fXk26pkrZ8G0l8XUbzQD5KEnDRM=;
        b=SfWXwP+VkWA4QNlwfRL4Kw3JfvPG3B3AKE3e2oUUQ6kr/deFs6QPIltd99T+aSJgSt
         sMWIQClCiSSXGzatk2t2BC9bwdVczs4KZFRkdMf+PPU0/yTDzNubtb+czKPDLNnlI3Y5
         8fMuMf1DEOBX3ASvtcVNxRWOkfTbIFPLitCypVxnVsgK+ITXaNQxGIOgTSkYODiL/2Ie
         LVkW7MEwj3R6pDILxoexPInwidu7qwRg01+bHZG3XgLlDFxDhZAtt1VcGcH/w1Ny4nvu
         e1vQ1Ml8594rU7j/wTTndlGVKgJ7EXq5XAe0bnDC05ZGsitFsZEeT/tQhZYZ3Ego/O+X
         vlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756402996; x=1757007796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0O2m46fevRzWI7x2fXk26pkrZ8G0l8XUbzQD5KEnDRM=;
        b=YJgJYcoRF3L91KysmG22F1k04JLIKz7G7WwF2G6pN3QAeABzhDKMmX+kRXIYH2Ot8d
         nmGIMQ53u/DbxOMXuXDTL5UA27GW3G/yBQmpvsR6eB5vBJJeDNPDNPFfgMPSF6VD/p7X
         SzeSG8xIsL+kazxLdxnzfYQm41tnqccaQzefDTVlq5SH6HJLd7fe8APj5g8NSnfKY1rt
         oBQtJB+F/JBr7/mlTJwUHnS6kOD9CgRlR7P8zRC54vFKLvlPyg+d8HCY2vCJWSZpNB3L
         G8/A9dhsLphte6EUIO0q2wL+8DkCR3S3Vpi19TZPxjjJAfALrO3e7fpAkQvoAAXfLZYg
         3ZGg==
X-Gm-Message-State: AOJu0YwKk91FQRiGXbPXLQ1p7n+nQbVe5tUZoJfVqV7Cl8FJdEb7WFrR
	Su1vyATRZJ3W6heIHk46gMvJiCf+UsuHy7iPrpqotNIGycjSaWD4yOkr7A7n20gR4fo=
X-Gm-Gg: ASbGncv4orJgHaFyAw733YMoh1Te9WarVbTShDqOC1qGhIi24sbh+qELZ8ATVfqfR3r
	VvJcTVpG5ILPY9fcSg9NW50xs3ddc2hzQN0StGG5Spp9gndJzAgzGuKOQO9smdQWySCVYUjzCdS
	I9XHbva44RKObaoFEjJ9CdYiEvaZpQBDY2i7N3wQdk8JNhQAJVsvjrPCdY6JehP3A6UUog+tPcp
	r0PoU05Q0s9VFfpZhKrvRvgcd7z9mCo6yKgI7ZLQ2t3NW5J3JxHAtfROVLa7JBp2pGrxNiuJ+Qk
	1rUlrrJQUGyBjckfN/N1DN0KOqF5mAqDsrhJiwtQQsL2JoEyp8QCpFcYNERRS/ptexoLQfKrOgi
	wxZy6+hcMiNxR3l9nIsSB2vSMRl/W
X-Google-Smtp-Source: AGHT+IGfplKRxyr6NMTRsLMhJjFeXSoChvAsXvZeM77CYmglVTLXFn06JRVZtapE4v+yF96yUd5LwQ==
X-Received: by 2002:a05:600c:a0b:b0:456:1442:86e with SMTP id 5b1f17b1804b1-45b64b750b4mr101241405e9.21.1756402996518;
        Thu, 28 Aug 2025 10:43:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm3812075e9.3.2025.08.28.10.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:43:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 19:43:07 +0200
Subject: [PATCH libgpiod v3 05/10] bindings: rust: update errno dependency
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-rust-1-0-0-release-v3-5-0f9c6c1c4808@linaro.org>
References: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
In-Reply-To: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1660;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6IvCe6+zroVF9TBY85HhO35n2ywPKdOvQ34UsFXazWo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosJUt+bwEYef8Zeqxf125lkDIM9XcIKSfG7gMv
 nwTMdw4TI+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLCVLQAKCRARpy6gFHHX
 ciJ9EADZLibmrc6BUVRmYWnlCuC2fA39nF/lfwZGdmK1vs3SA4egDUHPhjxpi5fgKRoKDME+yUY
 HJ4s+KIhm/NmqDb+RGK49cp4rlVLamOSNbWj0Tk9WfRpOl3q3YJixKsCmlGB729I7M419Q1VvoY
 Ys+vNXrPdZohZSrcOjEOAmUOlzSEXQGqOiPFMYIV76rr0yMnnCdPQmQVWZwBvOO/xmDMJk2Fdwh
 3Jhtgmt7ed9Hk8nTmo/4wV9zs9gYg1Ca0SlzH6eOkwsXv5AEYW5ZNgKcrBWlrAsTvFc3kfBlLTU
 xH4+dCR3pkevrMoInQiFCxbgq2HjqijGXt71CvNi3OoFi5Oya5fmj2H705lpeQxZezd1MN3aiPg
 xqnH+xgiyGnhAppOdhpCv4uN/VwYzzgTiXi/AIpqpZxwYuXj2PrR266fwpOEvoe1VFb0MJwfj1F
 6xhdeCGDenvWQF4Fb0HSgH4w329Q1nRRs9xoUPii+h2QVKT8dT0voT/n3MhOYnwVL7Zi03J15Jp
 Je0qNcLgzook0qxgmPl58kWBIiqFhiXdbr/Kt/7GguhWOMuwOcoo5ObrG7XuBHYm+FYBpyiCJiC
 a7TQ6neyunR9TLzwn18iB4SveqbACDyJ3kgOeW8VmH3WQHWEdcaoAZD6z69/Zvecy9hYi1ORYND
 16W0Q5+TpJzmO3A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bump the errno dependency for gpiosim-sys and libgpiod crates to the
most recent version which is a minor update from the one we have now.
However: let cargo select it automatically by not specifying the bugfix
version. We need to be stricter than just selecting the major version
alone because crates with major versions starting with 0 can introduce
breaking changes in minor releases. No code changes required.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/gpiosim-sys/Cargo.toml | 2 +-
 bindings/rust/libgpiod/Cargo.toml    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
index 020c6e7ec0d8c07da833f8a67f1c65ee6041a14a..bd6223cf66497e960617ee4cd04db6d68496df1e 100644
--- a/bindings/rust/gpiosim-sys/Cargo.toml
+++ b/bindings/rust/gpiosim-sys/Cargo.toml
@@ -15,7 +15,7 @@ license = "Apache-2.0 OR BSD-3-Clause"
 edition = "2021"
 
 [dependencies]
-errno = "0.2.8"
+errno = "0.3"
 libgpiod = { path = "../libgpiod" }
 
 [build-dependencies]
diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 82ea2f32a0fc9a18eca406f5c0fa6c3f1aa2c57e..37a5c277593aab812a01626648c2e30dbee8ebf1 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -23,7 +23,7 @@ v2_1 = ["libgpiod-sys/v2_1"]
 vnext = ["v2_1"]
 
 [dependencies]
-errno = "0.2.8"
+errno = "0.3"
 intmap = "2.0.0"
 libc = "0.2.39"
 libgpiod-sys = { version = "0.1", path = "../libgpiod-sys" }

-- 
2.48.1


