Return-Path: <linux-gpio+bounces-37602-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKMoLWdpF2rcEAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37602-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 00:00:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DBE5EA82A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 00:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 755EF307CFEB
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 21:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49EDD3BE178;
	Wed, 27 May 2026 21:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEy6In5r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46E63B27C1
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 21:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779919190; cv=none; b=VtknQkBOpRMbyuu88wP4oydtnqb8rxximW0ZjvOMD3hHF3DzG17zmZRQogMMK2+HsteFrGdS1ENUh59dkdAPd+iRsQ/6Y6aYAonzOCJ9GCfevIk4dXF8fI1bGVQ9iTnmD3WTGIl7VD8iXHlssVJ3gSBYKLVcRU/wd1pmtnfbARs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779919190; c=relaxed/simple;
	bh=LcDSEVGFOl8uSQclRgcsvfN6Nv7T3lqpxgQKffyKlrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuenXPgERZi5kfbX+tze5OnGLBvIrWWoM3AeT1LTwvx5421kPF5tI+J8Hr9NyvJ6/MULeg4m7a0ikGx5wW4j8QmdD9NYr0oolJh+Vi/Ep7zo+ZAtIkRF6mWhuVqhK8LVE0Z/8Etr4e7jH9o6ccrKQtvEjF1M1Rf8QawWbu1sBCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEy6In5r; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e61b59e03eso3540196a34.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 14:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779919187; x=1780523987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIbKkvxlaZ7qYf8DytGu0mHBLRPF+hSk2fWbenGtRHM=;
        b=cEy6In5ruh78TOXtg2LpwuPxSdgIljw+1A0Ursa6MCe8VTUGmb+8WeWIkzCPN1Te04
         nO6J6D9uFMJCiggzMjk3oTDkPyatVEgmzLsBR4zs2xx40cylQkNykiw8h/bPUPQtRYPy
         RecvWLXytdrFcNBmHhO0CAUcrF6xxxFz8kQAjLLpr3Uifp+KWiOvXID28sCn0xhBX3D6
         Vshf/0/5tC9DK+lsfTA46LN7UXpqlFnC0pk13nc2nQvIROHMQm4d79FZ96d/hp85857t
         9NJGMWkGWVZ7q+RuNhf9Bgjk2JipnQRm3YdUV5FwNQDsJOjbT3lefoRefld/eB/EnI20
         tLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779919187; x=1780523987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LIbKkvxlaZ7qYf8DytGu0mHBLRPF+hSk2fWbenGtRHM=;
        b=cN1Isos0GvYnOIhPDp61ptZEU4g5LFdYtfEh+MJeShS7YPRBiA36VEyvyUCjCIKtkE
         Z+yZF9yi8l7Vm3vUvDdf34ELMTKP+NGho7Q7BbQ+n3RSmxfPDGNklSXjAxD+529vCBpM
         UPZ0VysGcQw03SkY8Y55mZz/Xjf//LlaEcA6p51akRmSabIEzFDIDEOBfJ1M4CqMzd/T
         hvk6Sdne6nWtpRcli7HL0dQnMf0/XrE/u5/3ztG0+RjlW2NAURPkvY+a2S3EiPRL0ZiD
         5PQI5JIiIoxH5cbZcQBOPMH1Bn5jaPbSY92rHVBvs6nnhdX/yaV6FBxRtoqVU68sJCu0
         pPhA==
X-Gm-Message-State: AOJu0Yx70I1seUFtpW5r4qPnaU3aIRuVIbYr7gKa11lfnkOV84C4CyqC
	a0e4sMgV2jOSJ5QsdotSSWqHikyKeJHkl7AhsaTsIgxUcV3AY4ByVczcuqqTEA==
X-Gm-Gg: Acq92OEUAOeK8lfsXufVpSmEHX1qtMQOBZq5BwntA/l3AslWoVDMX9ElFmXJJH2C844
	apWn/CRUD4GXMLSoYzDBw7wmMG14BKgjD1t4gQEkNepFbfMkVplEzIrWgHtZHUZKJK9KnWivMjx
	1ZvMw11Ure8zACjZIR3+N5qEVXYDjrESgkfEADIXx4iI+pmKaysqWb9wOO1AfXQfq0H0jBY81TT
	K2ZWJBH1NTuPKMpgH4Q1UMFTZMfxtepU7YrOGknXH1fqKrpqd+JhK18TY67g2X6I3Mu+EKupJXs
	+31IOhWJoAiUpnh6e8pGG5M3Bn9WaA7JgsLzLPxwFpQX5yayOFfJtwkWz1gylcZ5EfaAnX4WozB
	IX96L7gdDs6RxRjoDIS5/yUKknrBWj7q27tilcQ2C9wt0U6LUotD6QsuI748642EcUx4Kr/Czlj
	wP0Jgq9t7TLYLj+3AY6o0g3oIDmbhXYzEkpMzfwilufZlkXlM6RLNw2yThTUdb5MI4NgX6tb6j
X-Received: by 2002:a05:6830:81eb:b0:7d7:cd59:17c with SMTP id 46e09a7af769-7e5fee21bdbmr15140772a34.12.1779919187309;
        Wed, 27 May 2026 14:59:47 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6065e7cb6sm12803303a34.16.2026.05.27.14.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 14:59:46 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 3/3] bindings: python: add a changelog
Date: Wed, 27 May 2026 16:59:22 -0500
Message-ID: <20260527215922.18678-4-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527215922.18678-1-vfazio@gmail.com>
References: <20260527215922.18678-1-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37602-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,build_tests.py:url,changelog.md:url,keepachangelog.com:url]
X-Rspamd-Queue-Id: 09DBE5EA82A
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


