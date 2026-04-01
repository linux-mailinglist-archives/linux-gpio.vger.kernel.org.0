Return-Path: <linux-gpio+bounces-34513-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJZNFENkzGnZSgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34513-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:18:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7522373103
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7EA93035895
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 00:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625D3189F20;
	Wed,  1 Apr 2026 00:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYbSUaUg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1DF54774
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 00:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775002689; cv=none; b=UyE4lxbEbGlZeKrkc+4ZtpWL2SjFx65LbsWAZBz4yBIbGvNXQyuun522F156STOGBDsKnJC805f1ZgdGXjkRQ1JeBoW3Dwxpy59yHOGNpWLRC1paEhwczBa+xXc4/USgEiQmT2BcnbR3l/3aNUS98774kgDVhYzocvtknsPM5cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775002689; c=relaxed/simple;
	bh=aO6z0pIlEfgd9NJupNQ+WoAXFx4hkywd+0dZ7J7Z8uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UEkE4lsjGjw8B+uxa2aUuP9KPtT0RH6pcBA1IjSpa08bu04xASOmwujaZZe63UmK4RHluVEOYNZJWGXTKOv8LlSKitOGdqHOzUxToLp7xsh9S4CSzG6U5qMc1J2/NAEILO+uvX1Jwwgti7/UyG4P4fI6OD5VUhBm2Ox8ZGDXpY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYbSUaUg; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-46aa216a65aso2299504b6e.1
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 17:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775002686; x=1775607486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Oe0Pdp4ldq+lBERamuDmC69rk6YjZVnj4Xz4VeI3KM=;
        b=aYbSUaUgkSKoRMyLFbUuq2wLuaVkWpK4AZ6sFxd0cKjZ1xS7vkwLGzbbPfl7t8974s
         33cpFHomdXzVAz97jcVbL0WqwApOvrzYvFRePQn1pHrk6HcEvOtK7Vgnf79vBmpHTEHj
         3fWZXT3uo1BoqjC9wVFnV501usqM1ltRJvs+5N2T8Ig2wezae5Zh1WtyZOWM+CLNXJTn
         2i6nNPxL3FIURm2kpVtTxJ9JQLjHm2As36OSMphrWrkzpT8nXAlY8IvNBuZ2SxjkIV0V
         c2AiXc84nyme9v2gfmX3Pp6E1jrC8vMH+5wpWPi4f/cKL2/WqemkER5BWxe2Cf+HktAQ
         F2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775002686; x=1775607486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Oe0Pdp4ldq+lBERamuDmC69rk6YjZVnj4Xz4VeI3KM=;
        b=e4RKPrZF0M5sN87MLeloU/W4JahXDYEIXD7FL0wfbb3IhAnJbUXBYPglbSszeZuf8K
         dI56YzgVp1DdnCJI55GX0sN+ptJed4I7UzivQs1D/UvPaSsH6DGovYql+WikomeG0eh9
         /YbjAzduuIkKVeZqaZMx9fqLwQ5KVU/N5Cu4PIMBnwMZ4OZ1MIQQiKcyc0ALxTOyx0ka
         ByNg1nYFKIxANdHAU8tSxXrX9BLDJrNY/lQvoaxp7xVaR2ocJkE/7RpF99rfEc0V4x6W
         snx/FuML7IQBVg7Eqpf7C2e2ZAPVQkqYa1x+WHLe1DhhCO89cwo+wj3aLMg4yAlBOjEG
         54dg==
X-Gm-Message-State: AOJu0YzF7zkAA7GpbI3kUjab/klCbibm4G1qP6JJApGB4zC3NtcHSeca
	N5MlBGKfREnfvAMXY+4fOY74iRjcHy95IqEPgUy+CIl0tb1QSd/D7TVDxnGv1g==
X-Gm-Gg: ATEYQzxnarGvJPiUMk9kMxcL1in7Lm6gwDoU4uEjlt0BiTSkqcB3Ep0kdmNKO95ZxC+
	TKYUDG8JcMJp1u9h8Qo3aKZgHJk1z9IyV5GuzPv1mA/Bo3rm2Zq5PxNklwMKgT+NmKGSv2cPIU2
	aTsdjQO/bthUk5/MZ2/TC7MY0jHZuO8K+Fbeer4nNfOtuL0hkMIP1l11F83CKmRJRe5LmqSLtMq
	eT4C7I/p1T8Z6UgMbDkwZUNCC2JIoyJ3FT2idwPxlUNogr+XoqFwOKo9gSvsVmZWUWd8+sLsHfd
	0UCc2Mewfnr9lH/W5p1LhyfQW6AkO2nsIB+RVSEPgBSj72G2ZErhRezsNOpJEyoAi7jeYEsofmx
	mzg2fJCtj/3pSNjUX7TPy082XCKCy40nlFxOp1TtLIqIcdoLu6jtXF97Jb0VVW+vHdbKnDBr+Vg
	l9uEwedFNYk7LJMKHR+Oqs1SnJDdrCgx5wSO8I41PCHki5G16fhS9Cysk+i4mFiw==
X-Received: by 2002:a05:6808:c2c8:b0:467:1212:46fe with SMTP id 5614622812f47-46ae015bbdcmr899401b6e.38.1775002686505;
        Tue, 31 Mar 2026 17:18:06 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a7ea668sm9173679a34.19.2026.03.31.17.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:18:06 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 4/9] bindings: python: setup: apply linter recommendations
Date: Tue, 31 Mar 2026 19:14:53 -0500
Message-ID: <20260401001459.19159-4-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401001459.19159-1-vfazio@gmail.com>
References: <20260401001459.19159-1-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34513-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E7522373103
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

* Drop unneeded mode parameters
* Cast toml parsing result to dict[str, str] for expected license value
* Disambiguate the `line` variable type for parsing the .asc file

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/setup.py | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 4061328..5f5950e 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -4,7 +4,7 @@
 from collections.abc import Callable
 from os import getenv, path, unlink
 from shutil import copy, copytree, rmtree
-from typing import TypeVar
+from typing import TypeVar, cast
 
 from setuptools import Extension, setup
 from setuptools.command.build_ext import build_ext as orig_build_ext
@@ -44,11 +44,11 @@ def find_sha256sum(asc_file: str, tar_filename: str) -> str:
     Search through a local copy of sha256sums.asc for a specific filename
     and return the associated sha256 sum.
     """
-    with open(asc_file, "r") as f:
+    with open(asc_file) as f:
         for line in f:
-            line = line.strip().split("  ")
-            if len(line) == 2 and line[1] == tar_filename:
-                return line[0]
+            _line = line.strip().split("  ")
+            if len(_line) == 2 and _line[1] == tar_filename:
+                return _line[0]
 
     raise BaseError(f"no signature found for {tar_filename}")
 
@@ -85,8 +85,8 @@ def fetch_tarball(func: Callable[[T], None]) -> Callable[[T], None]:
         # If the version in "libgpiod-version.txt" already matches our
         # requested tarball, then skip the fetch altogether.
         try:
-            if open("libgpiod-version.txt", "r").read() == LIBGPIOD_VERSION:
-                log.info(f"skipping tarball fetch")
+            if open("libgpiod-version.txt").read() == LIBGPIOD_VERSION:
+                log.info("skipping tarball fetch")
                 func(cmd)
                 return
         except OSError:
@@ -161,7 +161,8 @@ def fetch_tarball(func: Callable[[T], None]) -> Callable[[T], None]:
                 if sys.version_info >= (3, 11):
                     import tomllib
 
-                    license_file = tomllib.load(f).get("project").get("license")
+                    project = cast("dict[str,str]", tomllib.load(f).get("project"))
+                    license_file = project.get("license")
                 else:  # tomllib isn't standard, fall back to parsing by line
                     for line in f.readlines():
                         _line = line.decode()
@@ -214,7 +215,7 @@ class build_ext(orig_build_ext):
         # Try to get the gpiod version from the .txt file included in sdist
         libgpiod_version: str | None
         try:
-            libgpiod_version = open("libgpiod-version.txt", "r").read()
+            libgpiod_version = open("libgpiod-version.txt").read()
         except OSError:
             libgpiod_version = LIBGPIOD_VERSION
 
-- 
2.43.0


