Return-Path: <linux-gpio+bounces-34512-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NlBGUJkzGnZSgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34512-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:18:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB353730FC
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5DB3306832F
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 00:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D7918A92F;
	Wed,  1 Apr 2026 00:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDXX/eoy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C1918BC3D
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 00:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775002688; cv=none; b=lBIPTwrr3TDHe2EUnyizkoR9OYZVagTT0648orLXavoLxku04v7SlQw2nTMPyzrPFHijlId+2Mp1rO0nlK5PnD8K9TRTuRTCl9JuhV7XckXBFTjYzlGcH6p/HRZCaOEk+fPM5RZpqLxds7eU009X/TJbfpYnb1brjy/TYWADXXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775002688; c=relaxed/simple;
	bh=vmcQGfSdokuL2RhbLJNKjH4NvXM/fNPZowW3AErytnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GOFzzRtxge2BxknF7CFkcgw2U8tyndONu6xwmXz69aqihpCsD6QjVcwXt8gcNilHzqoq6qRzhI7lEK4xKTHVeHRiXLbCjZqiIVNsQQyt1mSAVxeybgHmfwy5TClxruPTvoY9WSsbzZ1+zdb+006Ffdas3IF//PJsDUoEpMR6ulY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDXX/eoy; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d1872504cbso426011a34.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 17:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775002686; x=1775607486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJX7hL4hTjPHcklVVW+2FwrO6RmoRwssmjnnhZbP86Y=;
        b=bDXX/eoyDcSOnxF3QkWawZb1wlM1qe43Fbrl5gTRlp/TiEZXLThN6Hpl6zzx7GSyGO
         gJen4VxtpqutLZPF3uGsHVtn0M092wT9yOSUKyALyaPobyTGKDBuepIbeJaJxva66WsO
         EdOLF5cXsU3IHKGVcYbnfMpb1bAiFoJsnhq7ouDJq4tRys6NJE52rT9YUMQAZr8Blv36
         T3B3uJPTOVooVDZIMELiDz1pJ+ts+7xIWmRruEyNfp+TMmLam+cNKg8Iiqd5ycZrEVYK
         7d/74Zs0Badpj0Ntc+3Qi3x/s3ixKCXPalBDJA59O0XVM2xwM9CqWlL+ZTYxM8l29Em0
         AWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775002686; x=1775607486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MJX7hL4hTjPHcklVVW+2FwrO6RmoRwssmjnnhZbP86Y=;
        b=NQ43ali/ZyN/IKA2tYPXovN7+v76cQpdTJFSsunebBn2AIrOHJeaGQkzcEmkRQV87T
         kMS/kBiAXs5iPuOHOoDU/gB9akmx9u/jZAFynKRHIu/uxdEBP4CpBWYFgXhAMRaWUcwT
         2dBRrA8EbSbR+ycNk4ezBgcu1so6kMUChwHZS1cGDFW0LtYhWcFpzgOmcCRr8QQkatN7
         lenwPOzCGJCc0OoryWfInZfmZfjQjc0NM2A8k2qTVoCReDVITXqIY4eWkicr8MV2IO6j
         X2yM6K1C5b9vUFFw4OLXwrmbe7GFa0bZDu60C+nxmh+5AokSQJ9BmbCh7e9wbKs+Eb/1
         msSA==
X-Gm-Message-State: AOJu0YxvLU4V3LYiAR6c2wAboM21kV5LSxIHw+woknpEDy5QipiroX9j
	K4H2ojWoG7kq5cZL59EdR482Y5gDZuoeCzIWVFzMUthxWoEya9vZGsdIS7RF0A==
X-Gm-Gg: ATEYQzx4aR5D0GoW7dqRBEHTbHq/I1UOv56zRKR9v2IEnmKAiGqIqUn4Vp8bi1m+/65
	Su0nWO8fNnf3RmnEsUO/eZEK6rutAGw//rTz8MUYJ8KqmXNTY5YPMoqmb01WLDeP2XgcmVyespQ
	mifzpa1/izud/GjRAXT1I1kqZu8uNZkFR7l/m/de0LFgaJbPd0aA1Ex+/VbFBV5jxVzT42h9I+P
	pNTiikCqSuHr1vlOoAE5P1KlGQQiWgx7ozDITDBDLSNR94DRs1vEHvBEmeZjIdC+aNTLSzcWEKE
	wBykkUeXl8E/7Jqa9fEsEvbvOzbKe5N+siZTiDG0U5hYG07mNVIhym3CykovTV8WRcqDzs582Y1
	Go63b8Gw5eECkB6u0ZpY/ZKbh6DHWyjqwtEN0H+3yr+VLHgCyafMWHykafC1OC4kjp52iU4uEWl
	e98VoM+/Tp7wcBVA4zyvE++fQhXz9093l4t26aT4Vd7z8i4DiENZJRGMgs94MO8w==
X-Received: by 2002:a05:6830:3693:b0:7d7:ecee:af6b with SMTP id 46e09a7af769-7db99f252f5mr906362a34.2.1775002685632;
        Tue, 31 Mar 2026 17:18:05 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a7ea668sm9173679a34.19.2026.03.31.17.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:18:05 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 3/9] bindings: python: setup: add type annotations
Date: Tue, 31 Mar 2026 19:14:52 -0500
Message-ID: <20260401001459.19159-3-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34512-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CFB353730FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add type annotations to help with lint checks.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/setup.py | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 7bf9246..4061328 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
+from collections.abc import Callable
 from os import getenv, path, unlink
 from shutil import copy, copytree, rmtree
+from typing import TypeVar
 
 from setuptools import Extension, setup
 from setuptools.command.build_ext import build_ext as orig_build_ext
@@ -10,6 +12,8 @@ from setuptools.command.sdist import log
 from setuptools.command.sdist import sdist as orig_sdist
 from setuptools.errors import BaseError
 
+T = TypeVar("T", "sdist", "build_ext")
+
 LINK_SYSTEM_LIBGPIOD = getenv("LINK_SYSTEM_LIBGPIOD") == "1"
 LIBGPIOD_MINIMUM_VERSION = "2.1"
 LIBGPIOD_VERSION = getenv("LIBGPIOD_VERSION")
@@ -20,7 +24,7 @@ SHA256_CHUNK_SIZE = 2048
 LICENSE_FILE = "LICENSE"
 
 
-def sha256(filename):
+def sha256(filename: str) -> str:
     """
     Return a sha256sum for a specific filename, loading the file in chunks
     to avoid potentially excessive memory use.
@@ -35,7 +39,7 @@ def sha256(filename):
     return sha256sum.hexdigest()
 
 
-def find_sha256sum(asc_file, tar_filename):
+def find_sha256sum(asc_file: str, tar_filename: str) -> str:
     """
     Search through a local copy of sha256sums.asc for a specific filename
     and return the associated sha256 sum.
@@ -49,7 +53,7 @@ def find_sha256sum(asc_file, tar_filename):
     raise BaseError(f"no signature found for {tar_filename}")
 
 
-def fetch_tarball(command):
+def fetch_tarball(func: Callable[[T], None]) -> Callable[[T], None]:
     """
     Verify the requested LIBGPIOD_VERSION tarball exists in sha256sums.asc,
     fetch it from https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
@@ -61,10 +65,10 @@ def fetch_tarball(command):
 
     # If no LIBGPIOD_VERSION is specified in env, just run the command
     if LIBGPIOD_VERSION is None:
-        return command
+        return func
 
     # If LIBGPIOD_VERSION is specified, apply the tarball wrapper
-    def wrapper(self):
+    def wrapper(cmd: T) -> None:
         # Just-in-time import of tarfile and urllib.request so these are
         # not required for Yocto to build a vendored or linked package
         import sys
@@ -83,7 +87,7 @@ def fetch_tarball(command):
         try:
             if open("libgpiod-version.txt", "r").read() == LIBGPIOD_VERSION:
                 log.info(f"skipping tarball fetch")
-                command(self)
+                func(cmd)
                 return
         except OSError:
             pass
@@ -175,13 +179,13 @@ def fetch_tarball(command):
                     # For further details, see `egg_info.find_sources` and
                     # `manifest_maker.add_license_files`
                     copy(_path, LICENSE_FILE)
-                    self.distribution.metadata.license_files = [LICENSE_FILE]
+                    cmd.distribution.metadata.license_files = [LICENSE_FILE]  # type: ignore[attr-defined]
 
         # Save the libgpiod version for sdist
         open("libgpiod-version.txt", "w").write(LIBGPIOD_VERSION)
 
         # Run the command
-        command(self)
+        func(cmd)
 
         # Clean up the build directory
         if path.exists(LICENSE_FILE):
@@ -206,8 +210,9 @@ class build_ext(orig_build_ext):
     """
 
     @fetch_tarball
-    def run(self):
+    def run(self) -> None:
         # Try to get the gpiod version from the .txt file included in sdist
+        libgpiod_version: str | None
         try:
             libgpiod_version = open("libgpiod-version.txt", "r").read()
         except OSError:
@@ -251,7 +256,7 @@ class sdist(orig_sdist):
     """
 
     @fetch_tarball
-    def run(self):
+    def run(self) -> None:
         super().run()
 
 
-- 
2.43.0


