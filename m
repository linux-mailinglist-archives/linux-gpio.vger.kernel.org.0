Return-Path: <linux-gpio+bounces-25138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB622B3A886
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFD657B355E
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 17:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7719033CE9F;
	Thu, 28 Aug 2025 17:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="27GcH7uz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A179C338F36
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 17:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756402997; cv=none; b=r78r7VMqzzkvKTbMg7wFVFH9xF/Pbxdr7Vh4MNVKryj9ctOae97XGFBCNR18fy66eDwOxI+ImrO9slsCwKdowWNzexpkLYLFpkSjwyEXTQjDkxjMraB9YY3j66fKWxVpXNtDsBDkCidryBjwvm6i++vQxZGRNu0t+1nL2baek+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756402997; c=relaxed/simple;
	bh=3MJC0U8q6H/qC22qtcUTKwNIkaioP9mQFkU00tHCjO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2tFIAi21i0U1SR/FPACE4vZwZO/JcL4Kch+0gFDE6Ia4ksTow/juWCPQkvDvWJk5IJfc1C1CmSW4O0QKSp3rsU3CILCj4z95EUnyZcDYo8XLuUZBvJlocDk1prh0gNZxNa7OdaflhDq2ahXQARHe0Q+TLiv817ZTDPeHfvUSmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=27GcH7uz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b05fe23so7953285e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 10:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756402994; x=1757007794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zr5bxuVU3No6k+Me+tg6LQvvRXHITQoUkcrFzLhL2/U=;
        b=27GcH7uzgmd6z10TFHv45a0K9YWjNyoRzHTBu/DlPikfFK8EQQAMKxyayHlI8O9n/p
         cUwhpNpBa/FaMc5/6pmt4TBGjoA0UxAsBhuwZxQDtg8cr04V77iFC7I7X7pOpLevo2t9
         CCs+1I1dbbgZ2OI4rQ47u2mDwGVLPJc0zT1vw7ZhjeDtEF5h3FdppXGVUpVr3XrHQ2gi
         gOhg5SQfTX3SG1YheFSIb6w2Z9EwvrrXvCLNCp4ovcLP1WJ5bd9xONoEhcay34gIKKL5
         NoMzyC9vFUNK5hZh3XZ4ZrLvsFyNBU4CB5xlAaHPrD0s7ZR2hQVoEbLEDi14XZ/5TFYd
         VauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756402994; x=1757007794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zr5bxuVU3No6k+Me+tg6LQvvRXHITQoUkcrFzLhL2/U=;
        b=BcfJAfT2k9z5O2BsIL96Np4puSeis52UBqSQpMU/nt74ivmVDRne/dmqs6lqBBJMIw
         b1kVrelpFy3FuDULuHx/hBPC4VXeE1+0byGhU/1wIyMS6MCYGSnJakag3+uJwHVM5hqy
         8qF7o3/pJANRKX1GDC/Kd/ypCPvzb7up/uqfGsFzl+A1SGbLr0GH4hkjnnejFH0Xw6nv
         O2QoIA1A5Jk5dARS2QraT+YLByJkezk0GeIEuMlmD7LfEgewfibg2NHwRilbTUEORu+X
         3ZYW/IP8wLOXcBU5RxIoLsttKN0qQ+J5PZqy6G3Zcrga9As9C6oC9h2zCrr+OIkO3LUM
         AYAQ==
X-Gm-Message-State: AOJu0YytRBEu05va0oW62ec3RSiRNXy6ILrEk6sAfoPysQl4DNIC6MJq
	Lg1/wRiSIKaU3drDBLLcWME7wAAw9SNUmRCldwDi7n7tbyAMDkJ3JwoyJujoOrhlpOHjgGb+hUC
	cfSxm1LA=
X-Gm-Gg: ASbGnctBJj6W1Ebt2Fkgg754wwgxBlzPQhYKbPN9Uwa8pkouAaFCIZsE72llpo+z0Ul
	5nn9OUq1894km+3FUuNgWTwNZaoFM+qlWFnP2lZRfqho/wIbhEKkX0C+ai44+LGb8e5fVnwsDMV
	y5WZ66wFlgvLr1W5VktQWjb5R8c7lPmWm4REuHoskZliU+C73omazxJI4FZPIz3QZrf8aXWFEaQ
	N2gFFLPSPIzXNpIR6SviiRqTo9Q5sKEZp11mUbQMKWwbVRR5Q3jfIxY2oWi39W1D72u17+7PvPS
	toZdwI8ZDgp3qCmyt6M7DLfEZQbr9J9GDQsL+BZ28PaUFNUsYjet4tag76iuugQnVvFHEKW5e0Y
	6zDAupTElh16iLjV7yQJ4qVXfxEUxm/Vv/knkBEI=
X-Google-Smtp-Source: AGHT+IHacEgwKWDt5FlcD+nCLDe0Q3cj2Do168TTu/ocS0UYL//L+FwQHX6w6WCgI3gDlElRzi7fpg==
X-Received: by 2002:a05:600c:6304:b0:445:1984:247d with SMTP id 5b1f17b1804b1-45b5b8c69cfmr150912805e9.7.1756402993975;
        Thu, 28 Aug 2025 10:43:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e7d2393sm3812075e9.3.2025.08.28.10.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:43:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 19:43:05 +0200
Subject: [PATCH libgpiod v3 03/10] bindings: rust: bump the minimum
 required rustc version
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-rust-1-0-0-release-v3-3-0f9c6c1c4808@linaro.org>
References: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
In-Reply-To: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Erik Wierich <erik@riscstar.com>
Cc: linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ph5VjZ7aGUUkUtoyxD8lZC9Yj3vAp8vHjXtOmyAN9go=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosJUshFzoBCfHJoPAq9fe7D+UCR3AoLwHKs5Hw
 T/Y15Gx8TqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLCVLAAKCRARpy6gFHHX
 cg3nD/9ELMKh+DEQlzK6l312B1V1JMCkoq3k7knDc+TK0qDaZnB9BHcOvkRdET8mLEUC/5vuoCo
 N2WoBmNT9q1tU2iN9lAYZFTGxQVPdXp4DxgBJz87R/Vy7K6qGTgmt9teKs+9ldr195RKf/cpJrV
 Q1PuAA5iP1xdehiBAta+xNwjRDACMZ7WoyuYmb3Cuxn5ZTVkjqpcTqLSM8pFNCRVeY5M3g6wE+7
 OyJnK1OEMY0Z7ewjwIdyqwF5kqWQnnE892qJyAGGX/z9aIY2vCHRYyf71okpn9AP0L4QiNz3BFp
 8T0aR4nlpacyn170+ULldPTwUnv0JQuDbzG+6qHPu10thwZY9WamrXXZpvMhskoBx4aLQr4NZlB
 7amJSgHcJOnF9ugqcgIECLgE8WmMREZTr10rxUJ+Zhi7y78p4SZd8P3UNGWzqAWTUwu5zPlnRHr
 PHSD84Y6AEjzCY2nB7BWtJacc3IbozAAxkITm0zkP84I0z6UUcFY4Cm+52eE24vmoZw30WTtLFp
 CD6q/EiJEgGhp1uqt9WncnDGsKTJPMXl8/2Ggb7UWaTVYoKIN/2MEtx7/2FTXBpd2qZOpBmsyqJ
 5XkcLdBoADDk6IMXZiSlYBwE1spRtPk5HrOa6hUXol9tSBPgOSssfI3CFxP7loSLGxa6ZDEzXhN
 NfkNDT44LvrTaqg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to satisfy the requirements of more recent versions of bindgen
and system-deps, bump the minimum required rustc version to v1.78.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/rust/gpiosim-sys/Cargo.toml  | 2 +-
 bindings/rust/libgpiod-sys/Cargo.toml | 2 +-
 bindings/rust/libgpiod/Cargo.toml     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
index 1f44a312563f21181b4b3ff79f1fa3b70ededc5d..47b74cda2f391eb5a15f8aa2be3ccbeed0c92604 100644
--- a/bindings/rust/gpiosim-sys/Cargo.toml
+++ b/bindings/rust/gpiosim-sys/Cargo.toml
@@ -9,7 +9,7 @@ authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "gpiosim header bindings"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
 categories = ["external-ffi-bindings", "os::linux-apis"]
-rust-version = "1.60"
+rust-version = "1.78"
 keywords = ["libgpiod", "gpio", "gpiosim"]
 license = "Apache-2.0 OR BSD-3-Clause"
 edition = "2021"
diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index eb600a9ee087638e1a3ea5013dec6ccbbaa29d1e..e789a874cade99d6fc792136079d6ddb6988dfee 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -9,7 +9,7 @@ authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "libgpiod public header bindings"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
 categories = ["external-ffi-bindings", "os::linux-apis"]
-rust-version = "1.60"
+rust-version = "1.78"
 keywords = ["libgpiod", "gpio"]
 license = "Apache-2.0 OR BSD-3-Clause"
 edition = "2021"
diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
index 23c34799715339be02f769a6b4b7de8ae5c1639f..82ea2f32a0fc9a18eca406f5c0fa6c3f1aa2c57e 100644
--- a/bindings/rust/libgpiod/Cargo.toml
+++ b/bindings/rust/libgpiod/Cargo.toml
@@ -9,7 +9,7 @@ authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "libgpiod wrappers"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
 categories = ["api-bindings", "hardware-support", "embedded", "os::linux-apis"]
-rust-version = "1.60"
+rust-version = "1.78"
 keywords = ["libgpiod", "gpio"]
 license = "Apache-2.0 OR BSD-3-Clause"
 edition = "2021"

-- 
2.48.1


