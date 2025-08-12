Return-Path: <linux-gpio+bounces-24284-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0DFB22663
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76FD23A6A61
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 12:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47BE2EF66D;
	Tue, 12 Aug 2025 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WtaxatBD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED642EF66B
	for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 12:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000658; cv=none; b=OXDu9zdSklrHkY3J76P/TDsGSPSezpnht0keVwACrvathzU9mMDVN2dEGhMPThvwNLDlSixU/oq1kI4WbileoG5BxdKeDRCib5Ghe64drp85rQiFTMhtF64Zi/zYPYYv1Kt6Alj+BdOBca2JMfua9Kr72FFPfA5xuR9KSBB6QTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000658; c=relaxed/simple;
	bh=PJzAp/SRjqMQHwHI7LyUs9+Li4OCvHukoXtJUnM7BzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m1Yh7G0CTwPEk1nBzkQ8huSnDUQIBBK+sDFOq4xvziI72oHNoWk2HoXrGYBEQie1UAYx4mfOhuDa8Z1wKRIVSXjqg6VaelXPYXchXEXOY3ctQbUwP7kPtehtQGTMKEBNbO3NmvWVfmD3397h2cL+UKlL/Em/aOTdaDBP4UtQJ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WtaxatBD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b783ea502eso3688106f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Aug 2025 05:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000655; x=1755605455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYqkcL2uTC/8AAmP4JDFhCAoGg3Y+LgNen1LWu4einw=;
        b=WtaxatBD94hcMdYCEgJzxZm0lH85ORNg/UVylWR6X2oKA1/RT0mBe1eP4x4B1VnU3y
         qu4DWAqiDVeDolZOqGPkOq2rEYWr0YyhT7ZYrwL2y0nl0kmKnow7hEPst0z2lHv9aGkM
         16iCHWr81RsjP7xN2jctJilsF0r7kBsYO3csOohA5AojAj6vhKlGS+CMM7bhSekjvJZe
         FDFZQu4gDizZ76h/O6KHXDRNPGkhhj8ljkzwHEGCHvwiXqou3vS9LTsCyuSDjNfI9VWu
         iaeY4gkxfJlrFAfL38jErp+jYwWRc2oieoyqDPlt4D1M/OuRWIsI6qwocNV5InnJBcOV
         46Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000655; x=1755605455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYqkcL2uTC/8AAmP4JDFhCAoGg3Y+LgNen1LWu4einw=;
        b=C27NNXsVZGpy+sonoH8PM4YfokPoH4PXOJ6xoOf5mg53HxEV7JEaIFnfOZcv6f2pxl
         ELWMVlGIXrme3H4HIagxzR/YEbAhk+7N4HdxMyDdUuI5/+z/ped60mWpLe3k1wlCfMEK
         e3L+DW7/kn07i9LyunSz2vCtps8Vej2SFSaDpJEi9PO2EoBxM3mM3IE3OQirXrzjf8nl
         v5l0TR0JdFckZeWRB9iRYY6NCIYlc7Iype9pIR6PROZAOUf4qsYYTFhFQhQpZPDpuAUH
         jO23mGsF9VK6A6HjIKhaNm1YRvc4IuVbZQr7G6e4hWIWw/NT6z31i2iMEYNVcPeEAtee
         R3XQ==
X-Gm-Message-State: AOJu0YzNu/zJMsp5Pmkafl0Uy6cbD7HaFjjF7Q0rrGckQCCwi1vB1lX8
	eBXLY+5OTYeJaUiooE2z0z5sucVN1XoMUYoYQTdy+CVUO1Disx59NYFq/O9tDT2WJ3c=
X-Gm-Gg: ASbGncuVWF09pWj5rq3Z2wEdmJRCChEBHINqeGwPz2fvT4ger8uQXNpf7rn/GF7hrtX
	lBsb/0r/U/jARF+I5+ObJ04+O78rmZ/57Rvc6u1ocxNBauOmmeBAGDSPeVIj1vIgCB6lXqM8IMn
	x9zhid4tzcu8h1V383qSPDafcqwtDjyZAfhPiEcWlNvrSMDgDX1qDU1YdcCs+wnMMTnH4BS69My
	ClND5A6DUB+lT3sT8v3grJf2q3Si02V+a9KaDptNOc6E6MPeZyQ16W4KIwRETjsZLuGI5Jnwy3B
	eoa7DfbeQAY72K6EWqZvnFCGpRtQN5O/dWRlO2fIWfEy2fx2JqRekuwY/df158IZc3nr76eb7RQ
	KyLeDWUk9MHhnF6U=
X-Google-Smtp-Source: AGHT+IFa17g8YZ7A3J78JUuXbNM+56Knja680Rzy/X6UIUX9PRfZjnXXBtmPCYFw4V636m0Rumg26g==
X-Received: by 2002:a05:6000:26c8:b0:3b7:9d87:9808 with SMTP id ffacd0b85a97d-3b9111c5d5cmr2634289f8f.15.1755000655510;
        Tue, 12 Aug 2025 05:10:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e1cb7deesm34268788f8f.2.2025.08.12.05.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:10:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:10:40 +0200
Subject: [PATCH libgpiod 10/10] bindings: rust: update crate versions to
 v1.0.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-rust-1-0-0-release-v1-10-372d698f23e8@linaro.org>
References: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
In-Reply-To: <20250812-rust-1-0-0-release-v1-0-372d698f23e8@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2255;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1k86NhuYcIcyhR+ZYNl2L3gcs4zC5Zpna0vWK4Bhh6M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy9DVv0o7CSmCP2qrastwhD20iQB18utEVzA0
 c8nBpgHv4GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvQwAKCRARpy6gFHHX
 ciYlD/4zVTvZK3Sv6EliJe4ffNXsQzubrAdtGr/zBxh6YOxlG8qQ3NGuA7+taUJbb5c0C6mdCYz
 ao2nqYMYwak3ZYce7s/KNmscwVGASJh4hj2vzELSr453htsLBwB22jA3EYHffb1ntVuv5bjKsN8
 Xjy/JbdwvOBj7blvNo8ZF534UT8OLdfoeL/gKxQyHiM7vvnlu5kqJkWbO1+BkRRHR5P+QIpVpQK
 a9f7Fz7fpKnE2hZKtBTbQe1gWX+XrG27in1XUzSoyOG5YscwcwNRtq3kBGXMWqEw7hgz57aGVdL
 923uHkYjlt4smOXiQFX2MfUpBc7EH1nM7+PHk1ch7+MiSB5mnpldjwcgvbQ2qicYcEE1HsQbxDZ
 Ib4GXbXeVqtyQnJK02Pz4nAvXCfF3/vFzWydoRM+AWIb+yjCJTcpEMFfGAevrUPU8ZxdKQ+CM7i
 6fl2ws66iYl4BxP/hUf1/KyftlWa5exQxY/FmndBEvtUo0nje68eGLEIeHERhUs9xk+fn8+CF1k
 reR1uIQHhpUVT9CAt5lYZ78qlFtlNl2ic+0cuiZGnxFoc6iaEEeWf5ZSZwUcOu+AMUU35Yk3dPh
 LU3SkPxBZDzsSDoHeps9CCiPy/wVGZrnbH86uqlMqUHOvpkvkRRIUfaWmNsHf1hLhbQGyEkS4Hn
 PNzW7OzB1tK07Uw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of the first stable release, update versions for all libgpiod
crates to v1.0.0.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/gpiosim-sys/Cargo.toml  | 2 +-
 bindings/rust/libgpiod-sys/Cargo.toml | 2 +-
 bindings/rust/libgpiod/Cargo.toml     | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
index 7c092db1a4ff30f28a55bd35573cb9cc11393661..1e642f3d4be21f648317ea2d36dfacd191dfe32c 100644
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
index ab86ff8ecf871bfc3f931f8ea08490c4eb40eee6..dea834a13ad619abb507e073c3e15ff3f668f909 100644
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
index c81680de1bdea76986c4a2fbb421bc452f92ff3c..bbe974f5d8652ca6e1db4b6285d4b651a1bf6799 100644
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
 errno = "0.3.13"
 intmap = "3.1.2"
 libc = "0.2.39"
-libgpiod-sys = { version = "0.1", path = "../libgpiod-sys" }
+libgpiod-sys = { version = "1.0", path = "../libgpiod-sys" }
 thiserror = "2.0"
 
 [dev-dependencies]

-- 
2.48.1


