Return-Path: <linux-gpio+bounces-310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A79307F27C3
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 09:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D87F31C21886
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 08:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2624618048;
	Tue, 21 Nov 2023 08:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S0XMDN4K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD4F98
	for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 00:43:15 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c4fdf94666so65008731fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Nov 2023 00:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700556194; x=1701160994; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A55xbAUGBX9rGL2uh551tmtU363XMsrEdsIhcXMV+6E=;
        b=S0XMDN4KNUnnfnXnMxM8vPJBdf57Fcholyz04/7xf2CLUwSOyuThWVq2obRAwvdsp6
         TVgJHMVDQzgn6SVXOTqmJ7yXex6HVdYRsqAyqCYykEmUbY19D3UMxOssSBPWPu5HowKh
         AXTdN119YYu/g5Cx2Z/JwF8JUzor7GAh0/JKjEEpECzMc9fe7UaWY5VvAb9n6QJZi9BU
         F6YFxKE94F0ZoS2L8Dv49imwwFjQMzti1Xon2hJfH8rq+A3IZHTPNgICCM3md5gDT8uB
         QPasU99f0c4NPZlI/aSRUBymYxx2K4RZVrIvKPt81mjMjgakmpN7wYMnZAQTWHbhE7KV
         cnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700556194; x=1701160994;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A55xbAUGBX9rGL2uh551tmtU363XMsrEdsIhcXMV+6E=;
        b=KVfbhjP3iqMS0CPAhc/eNCAuCZiluTno5XJMNytp8h7nt1Aw0Y6zDSb+C6dyMVOnFj
         uVjyn8ZoXtilTwXAFkFAafMldLv8tddhenXkZrDBaysPyEiUMT6FKZecB0nBvf03AQIE
         SYjK6/eqUe0Uo+T1LJq4QUK1B/fYRV6ZsiQ7L6TidDbmP34+1KSHoFhSJ/DxUP+kCFtI
         +aP283jRbl/yquSae87b2aLbB3nah5lBntwYHYtNR38qfTM056DfaRb1cmMy7GMg4TKj
         AAqLp7k5plhNSiDIjsuokIrBYBGQmaDaib04MfuL+kIZziyfVZESAAwPVABQxiGGEGc7
         W99A==
X-Gm-Message-State: AOJu0Yw9pwHzYrxz7IGJNehkUyN/w/XwC8WY32sK+6hvaHwKtlJtDTXx
	2iH9zKyRjBGiBLXyHzfhsXmts1zqW4D1l60s9x0=
X-Google-Smtp-Source: AGHT+IH3mCn3VKEV1mHNOw/Rqoc4+HcLiu7V0BIPygIqUIeoT+6gXwunRGXEPjY8qhcxj64fqVKREw==
X-Received: by 2002:a2e:4952:0:b0:2c5:1674:8d79 with SMTP id b18-20020a2e4952000000b002c516748d79mr6041483ljd.21.1700556193573;
        Tue, 21 Nov 2023 00:43:13 -0800 (PST)
Received: from [192.168.1.149] ([2001:9e8:d5b7:1500::f39])
        by smtp.gmail.com with ESMTPSA id i6-20020a05600c354600b004064288597bsm16432271wmq.30.2023.11.21.00.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 00:43:13 -0800 (PST)
From: Erik Schilling <erik.schilling@linaro.org>
Date: Tue, 21 Nov 2023 09:43:03 +0100
Subject: [PATCH libgpiod] bindings: rust: libgpiod-sys: new release
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231121-b4-libgpiod-sys-0-1-1-v1-1-87d53dec6252@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJZtXGUC/zWMQQqAMAwEvyI5G2iqePAr4sG2UQNSpQFRxL9bB
 ZnTwOxeoJyEFdrigsS7qKwxC5UF+HmIE6OE7GCNrYgsoatxETdtsgbUU9EgvbCphsaTZechb7f
 Eoxzfbwd/D/19P4oywCFxAAAA
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700556192; l=1844;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=dQ2GOQBRoO8OROTNDvQ4n/YQHYeymPjr/3RAiuFt3Q0=;
 b=RQPkKvpUeNahd9GBacvUCupuASefZpkdmrKfANfelcSh3DRT1OPgz7tQS7WnpwZsohJmoIxaY
 EKLMEWAdbE4AgfFOpLvBqHWJJ9/e8UBUwDRRQohptQe91FvEhQNVmry
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=

During 86860fb ("bindings: rust: libgpiod: release 0.2.2"), I forgot that
we also need a libgpiod-sys release in order to expose the new feature
flag to raise the minimum libgpiod version.

Changelog:

7552e5d (bindings: rust: expose v2.1 features as flag, 2023-11-06)
bc91656 (bindings: rust: add wrapper.h to EXTRA_DIST, 2023-11-03)
2e6ee87 (bindings: rust: mention the libgpiod crate from libgpiod-sys, 2023-07-03)
d04639d (bindings: rust: bump MSRV to 1.60, 2023-06-16)
ebfed6c (bindings: rust: document build without install, 2023-06-12)
bce8623 (bindings: rust: exclude Makefile.am from package, 2023-06-12)
caabf53 (bindings: rust: add missing license and copyright boilerplate, 2023-06-13)

Most changes only touch the build scripts or modify packaging details.
Bumping the MSRV and introducing a new feature does not require a major
bump.

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
I should have done a dry-run of the release... Forgot this bump.

Will publish this + the already pushed libgpiod release once merged.
---
 bindings/rust/libgpiod-sys/Cargo.toml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
index f90615d..eb600a9 100644
--- a/bindings/rust/libgpiod-sys/Cargo.toml
+++ b/bindings/rust/libgpiod-sys/Cargo.toml
@@ -4,7 +4,7 @@
 
 [package]
 name = "libgpiod-sys"
-version = "0.1.0"
+version = "0.1.1"
 authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
 description = "libgpiod public header bindings"
 repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"

---
base-commit: 86860fb65f701720001b848bdf2a637f7e4c255b
change-id: 20231121-b4-libgpiod-sys-0-1-1-1e03a6c12ebc

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>


