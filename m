Return-Path: <linux-gpio+bounces-37383-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCNkBtS2EGqFcwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37383-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 22:04:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA775B9E13
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 22:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 806D6300828B
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 20:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9E8368D4F;
	Fri, 22 May 2026 20:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNvryjD9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE5C2D0606
	for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 20:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779480273; cv=none; b=aATThe/nI5RxZZhNnbFoU9M66Ud9kmdoh6ntiGQ4+gUeoy/UEQ50yhwe7CvQ2ctlIW1TzT8OO7gOhT/k0eG1gjpZrmNDcgpqHyquaYOPhiAKk9GRO0rf76Xk92vqjHko4huOB+PQMqE4rf6jRfDKoFY+86euDI87H7bj1XcZiNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779480273; c=relaxed/simple;
	bh=LcDSEVGFOl8uSQclRgcsvfN6Nv7T3lqpxgQKffyKlrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nf3aQBYJpGEhrlqaXzaWGD28FAPRL7tO4j1Gq0SxH+dRNBfyKw2/G/uNgKdGtVBSNYLwEC5YOtcb1HxUn3TFeCOTq8OugzusK/aMUeO8F5y0nKgoC4WkPrsuYr2Gtrf3EB9nezg3kq2MxR2zgIHzz4TMTjHp+oBAt5JWvho46Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNvryjD9; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-479d593a0c3so6532496b6e.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 May 2026 13:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779480271; x=1780085071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIbKkvxlaZ7qYf8DytGu0mHBLRPF+hSk2fWbenGtRHM=;
        b=lNvryjD9esBoIuVH4GmT0+ZRDpvM7FmKpMl2gHtbXF63XEvo4y5bYSdUTJ0K3rGhLj
         A0wMepOoIAeFj2oW3q2nRJEDkYXYrg9UQe7v1tEsrdP0et2efOtz0xIZQ7ixR+quoj/x
         Zk3QaJ5rn84R0/+WGqvVOc28WKvnlpjxcO6iKlbrxGbNJL8mShSWniDlBUIMGKCBGqGY
         Ml9zJsaAnGCN+kweBkpV7dJdZ/JQOuMZq4/2ausThozkdUEtwd93lCeprO9nt7yHgUF7
         vemuri30IVPxeu9ZHSmiAZlyWcmB6DLJjY2TXQ5IhokqfHFv5r/VS4T3tXC4dhSwlyNS
         XV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779480271; x=1780085071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LIbKkvxlaZ7qYf8DytGu0mHBLRPF+hSk2fWbenGtRHM=;
        b=oM94qm592MyEShi0UQ4OWZthqkCTA4qm7wg563ReYKJIM8EvRqpSeHtixThy3d0jdt
         qVHXBpWOJKrBKLE5r+QOZ0beiUuyqH2FkiBTVzA9AWmTRRJKdRBcUTVwmAgMo7JqHFfv
         ouYpu2luutKi5uhcvBTeNydfkaOCJSLMN6yU66hPKUtL8Cab6jxrD2NZfH811f82ozCU
         MgwYdTjJQbNwhCF2wUUjtEIM08tg9V867YK+RKVDOm/VGv5KsKSxbWbNTvrwIWxp57XG
         52YiGIFHYTKCoESnirKcnPJwlDQm6pvgSxuWpLwCAbURXJ2GkKRfmWmk81y3IxxZw0fB
         F8tA==
X-Gm-Message-State: AOJu0Yw0/z9G2aJPWJY5XIauKCBOVFBYR9EnnjGGk2Dy774WX3f3891Y
	XEJ4BVVQiE6CgBPhBj87CZS5vCCLM8mEPAxteDy5k/qAvyXqes6tjnsoxvR6dQ==
X-Gm-Gg: Acq92OEDNB35DTPuI+AdRN1AQyzABhvKDOOobbyDjo4hbcTcoKy9xAbux0Awi0VidsK
	KTZ3j/xYMkxywEihyZHtqn5lGTqQ6f+UBp/PxAFpD0joHfEUy6nVg3NL9iGnRqTZXGjwvxEIZHq
	r6plag05UT2Vxy+PwsbS7XxHVZ+VmkBWQOjr9AkyyxYY5Ex0lkFsVPvP6R1JqlOqquwoscnorSf
	O+DOh0hY0z3zMcsU8Cq0H1YeLm6ki/YJ9KNA7ZAEEQp/861RLKYUKKiRgiHPRErclDU3ymUYxXc
	DnOfm6REEAobCj1WBe9jZmRptaWLs1FT/dnWetkzTurC+w+hLjRIZNsZ5iwthQN92KWVtBzEqkU
	K8rDE5mlmupu4eUkk41LFHBvipfmO8bGOFHtORIgymcIGUnHwpwcatk2ZnRIeMfhXByGBb1EBRD
	zJLoeTLbPalbOXFXuwcIMdnPQMQSrY5gd1e/lhG7dCo1NFOqxHaT4WbFxLS1I9tA==
X-Received: by 2002:a05:6808:1520:b0:479:e826:ccdd with SMTP id 5614622812f47-4854aace3cemr2200765b6e.5.1779480271218;
        Fri, 22 May 2026 13:04:31 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-485544e320csm1054591b6e.5.2026.05.22.13.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:04:30 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 3/3] bindings: python: add a changelog
Date: Fri, 22 May 2026 15:04:18 -0500
Message-ID: <20260522200419.105496-4-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522200419.105496-1-vfazio@gmail.com>
References: <20260522200419.105496-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37383-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,setup.py:url,build_tests.py:url,changelog.md:url]
X-Rspamd-Queue-Id: 7DA775B9E13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a changelog to summarize changes to the bindings between releases.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/CHANGELOG.md   | 44 ++++++++++++++++++++++++++++++++++
 bindings/python/MANIFEST.in    |  1 +
 bindings/python/pyproject.toml |  1 +
 3 files changed, 46 insertions(+)
 create mode 100644 bindings/python/CHANGELOG.md

diff --git a/bindings/python/CHANGELOG.md b/bindings/python/CHANGELOG.md
new file mode 100644
index 0000000..0f5dce3
--- /dev/null
+++ b/bindings/python/CHANGELOG.md
@@ -0,0 +1,44 @@
+# Changelog
+
+All notable changes to this project will be documented in this file.
+
+The format is loosely based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
+
+## [Unreleased]
+
+### Added
+
+- Add free-threaded CPython support
+- Generate wheels for CPython 3.14t (free-threaded)
+- Include the license file into the source and binary distributions
+
+### Changed
+
+- Remove `wheel` from build dependencies
+- Allow `Chip.close` to be called multiple times without raising an error
+- Allow `LineRequest.release` to be called multiple times without raising an error
+- (Internal) Add more patterns to `.gitignore`
+- (Internal) Update linter configuration
+- (Internal) Refactor code to conform to updated linter configuration
+- (Internal) Refactor code to use Python 3.10 type annotations
+- (Internal) Introduce a dependency group for linting
+- (Internal) Simplify Chip finalization
+- (Internal) Simplify LineRequest finalization
+- (Internal) Use newer functions/macros in the C extension.
+- (Internal) Migrate to multi-phase module initialization
+- (Internal) Removed duplicate call to `gpiod_line_settings_set_edge_detection`
+- (Internal) Add multi-threaded tests
+
+### Fixed
+
+- Fix refcount imbalance due to missing `Py_INCREF` when querying line names
+- Fix refcount imbalance by not calling `Py_DECREF` when `PyList_SetItem` fails
+- Require `setuptools` v77 or higher to avoid build errors
+
+### Security
+
+- Fix possible buffer overflows when setting/getting `LineRequest` values
+
+### Removed
+
+- Support for Python 3.9 has been dropped
diff --git a/bindings/python/MANIFEST.in b/bindings/python/MANIFEST.in
index dc7daee..e59387a 100644
--- a/bindings/python/MANIFEST.in
+++ b/bindings/python/MANIFEST.in
@@ -5,6 +5,7 @@ include setup.py
 include build_tests.py
 include README.md
 include libgpiod-version.txt
+include CHANGELOG.md
 
 recursive-include gpiod *.py
 recursive-include tests *.py
diff --git a/bindings/python/pyproject.toml b/bindings/python/pyproject.toml
index 7c4474a..3337306 100644
--- a/bindings/python/pyproject.toml
+++ b/bindings/python/pyproject.toml
@@ -33,6 +33,7 @@ classifiers = [
 [project.urls]
 Homepage = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
 Issues = "https://github.com/brgl/libgpiod/issues/"
+Changelog = "https://github.com/brgl/libgpiod/blob/master/bindings/python/CHANGELOG.md"
 
 [dependency-groups]
 lint = ["mypy>=1.18.1", "ruff~=0.15.0", "types-setuptools", "packaging"]
-- 
2.43.0


