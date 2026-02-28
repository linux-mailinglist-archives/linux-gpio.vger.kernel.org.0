Return-Path: <linux-gpio+bounces-32348-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDLTABZfo2myBQUAu9opvQ
	(envelope-from <linux-gpio+bounces-32348-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 22:33:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 365401C9238
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 22:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34D0A3445890
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 19:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF84235DA4B;
	Sat, 28 Feb 2026 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JrelRZHA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D85135DA54
	for <linux-gpio@vger.kernel.org>; Sat, 28 Feb 2026 18:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772304128; cv=none; b=SRVpWFM2QIhfUZfq5ZPT5khCn8dBEX/EcOexzuEa1BbGXvIXrxvIjkoF0l3cHDe85GZJbH/eH5pavQtdrjfNAA4IkxeXS++14f2C2BPzr53GeBYFKBXv5e4zQw03vgSn371VmJ4tCWRLPcYn/hBAWJ3TtZ3C7bJAs6FsPVD2EEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772304128; c=relaxed/simple;
	bh=8hvzeHo22aHtICDHOH8Cme06uhRerQ1Gyi3U2O1Dam0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lu9uCMFLVBbf5YCbNgHDi0zZ/lyRcz0HdSXxYGUA0zbUnoJkkolwuLNWeNpSe6lyC0an3OQHFtXyzM6Ch1hP3T0u5xgYu9qz/UIj+/YVg6omUCcCPGN1kqN7GB4Q9f1S8Z0Fnjt6GgucWq6KFZU3smRgmAzkFye2OFliXUuNalo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JrelRZHA; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-464ba2bb3aeso2222702b6e.1
        for <linux-gpio@vger.kernel.org>; Sat, 28 Feb 2026 10:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772304126; x=1772908926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uuLlgbaYWUOdkb7DZYWP5GMwu+RZWLLAl58g+Wnzaeg=;
        b=JrelRZHAH0biazE3zuUCLxYCP+d2oJI5tDBHzw5dNBO98Ohz/wjea+fpPtw2cW6ln5
         EZNxCsrxRQgIrMmh1wckZYbrjKDf0M+HEQhaLpb++4nPew8VQcIG267XuFM0qPnsMosC
         1n/ZLJ+z8bG4l1nj3luauxq08lpYtvU6G8SQ0ggt9FeeQz7X++ljZ00IZTDL9yDIY3IE
         daOatLsu9GHtV/OTItiAxfoIzkLa0ZFYz0RPayit36ihVQKNW1lFB49/YOkxVsIjgMR2
         QxNSrvGYFS+Ls31QkCrjsxFpVfnuHYNMGIcnqdJqiyPa+CHb2l1fwfK51MyDCluqfcn+
         Mmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772304126; x=1772908926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuLlgbaYWUOdkb7DZYWP5GMwu+RZWLLAl58g+Wnzaeg=;
        b=oXiZGonWsgBl5RnrUMXsy2mlAihgzT57OYOqmNSii0iXqBHKh5Amc31u3WOdzbpabD
         Xf9+PmjrMDcuxFcYJjFmM3iqEkiRcktQdzf/AcoyaWsdU3wTxsBbfFgHYUE7QpE2tFXt
         6B0Wob+e04sEcQT3Mv93+3vYwqMf1LGuOaJfmH7ZGEWyUWeHc0/4L+XyJjpR6JnWbvm8
         wCWcfLG2KlbmDl9joAA+QgHnu/S23WTYvcBqxo+9Dn9FPra88ZWCQ7C4Y2gm6JRjJ44Z
         UPDit12jBBmaQPIixVIoomMMkblO/WM/bz0MNjhhzCY6PYH2p8uf12V+w87SzOKwiepO
         667Q==
X-Gm-Message-State: AOJu0YzaTTYWu2/29ApREugvYZqGWOgAPBWrT79NgE9RBjJ8gVaiofR8
	FodIKypZsTc8vRum81UWnP8qhmXcViATPi8sJpeon0b7dYi2EG9gbjfj6ZHRBQ==
X-Gm-Gg: ATEYQzzeBdab+vm27vX7I3/bYzdj8+0RmLxo7TirnFTpBddZrwP2iOcEBFZ0Nrr74p4
	cqZcLqAXSu49SeUqJX7AIxLATvMtowFCBCuHV3uk97ZKwurHW4okzYmUPAcgsSJMHGkE1EtOK7e
	Pw0nwphTERpF/uGjgdOmmFVWQpZSHK/R40UQKjQyxYcL2YdXs7Z89brAnhLMVMVTxRYEjp9jZJw
	66LCZ2+o1Wu3cMr8IhyLg3shzqlmIweTe/DbW8Pnu6ziaRshlzPBFZdaZRkC2lItQ3+QTWXaGP8
	Hg5V3w2GYaXVtzSe/OjlU5GNhnuoqKP8J5JUgrbEVOW5xLfnWoOKSAnns8pNun7SaeZtW5lKIen
	Q52PIeiX5U32XGVWwHGC+2GO0h9n+4b6KwhebI/T5wUCh9QoSQHIyVL70/mItPbn2MER+kN+AaL
	ZWFbf4c3Ti53oEl4ni1qLXypiJEk74TeXlcFe4ge5DStBHxbsCkUgOAhY1aNN17Q==
X-Received: by 2002:a05:6808:1a21:b0:450:1eae:96e9 with SMTP id 5614622812f47-464a5d7adb1mr5346029b6e.7.1772304125824;
        Sat, 28 Feb 2026 10:42:05 -0800 (PST)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d5866541fcsm6964875a34.21.2026.02.28.10.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 10:42:05 -0800 (PST)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: copy the license into distributions
Date: Sat, 28 Feb 2026 12:41:58 -0600
Message-ID: <20260228184158.25003-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-32348-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pypa.io:url]
X-Rspamd-Queue-Id: 365401C9238
X-Rspamd-Action: no action

Previously, the bindings called out the SPDX license identifier in the
pyproject.toml but did not include a copy of the license in either the
source or binary distributions.

This can be problematic for tools that rely on extracting license
information, such as Buildroot or other license auditing mechanisms.

Now, when distributions are built, the license is copied out of the
libgpiod source tarball and into the target distribution.

Closes: https://github.com/brgl/libgpiod/issues/162
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/setup.py | 52 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 9555e54..7bf9246 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -2,7 +2,7 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 from os import getenv, path, unlink
-from shutil import copytree, rmtree
+from shutil import copy, copytree, rmtree
 
 from setuptools import Extension, setup
 from setuptools.command.build_ext import build_ext as orig_build_ext
@@ -17,6 +17,7 @@ SRC_BASE_URL = "https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/"
 TAR_FILENAME = "libgpiod-{version}.tar.gz"
 ASC_FILENAME = "sha256sums.asc"
 SHA256_CHUNK_SIZE = 2048
+LICENSE_FILE = "LICENSE"
 
 
 def sha256(filename):
@@ -129,6 +130,53 @@ def fetch_tarball(command):
             copytree(path.join(base_dir, "include"), "./include")
             copytree(path.join(base_dir, "lib"), "./lib")
 
+            # Since the license file is not in the bindings directory, we cannot
+            # use the PEP-639 `license-files` property since the `Distribution`
+            # class is constructed during `setup`, parses pyproject.toml, and
+            # searches for the license file before we can copy files in to the
+            # directory*. If the file is not there, we get an error.
+            #
+            # To work around this, we manually copy the license file to the
+            # current directory and insert the license file into the metadata of
+            # the `Distribution` prior to the cmdclass building the distribution.
+            #
+            # Copying the file as `LICENSE` allows wheels built off of the sdist
+            # to automatically include the LICENSE, see:
+            # https://setuptools.pypa.io/en/latest/userguide/miscellaneous.html
+            #
+            # *Note: this is not technically true, but it would require doing
+            # something more complex like a custom build backend or to wrap
+            # `setup` or the `Distrubtion` object which get invoked/created
+            # multiple times and could fetch the tarball sources multiple times.
+            # Further, we only really care about the license file when building
+            # the released distribution files (sdist and wheels).
+
+            # Read the SPDX license identifier from pyproject.toml
+            license_file = None
+            with open("pyproject.toml", "rb") as f:
+                if sys.version_info >= (3, 11):
+                    import tomllib
+
+                    license_file = tomllib.load(f).get("project").get("license")
+                else:  # tomllib isn't standard, fall back to parsing by line
+                    for line in f.readlines():
+                        _line = line.decode()
+                        if _line.startswith("license = "):
+                            license_file = _line.split("=")[1].strip(' \r\n"')
+                            break
+
+            if license_file:  # Do not allow empty string or None
+                _path = path.join(base_dir, "LICENSES", f"{license_file}.txt")
+                if path.isfile(_path):
+                    # manually set the license list for the distribution after
+                    # the license file has been copied into the build directory.
+                    #
+                    # Note: that this must be in place prior to `egg_info.run`.
+                    # For further details, see `egg_info.find_sources` and
+                    # `manifest_maker.add_license_files`
+                    copy(_path, LICENSE_FILE)
+                    self.distribution.metadata.license_files = [LICENSE_FILE]
+
         # Save the libgpiod version for sdist
         open("libgpiod-version.txt", "w").write(LIBGPIOD_VERSION)
 
@@ -136,6 +184,8 @@ def fetch_tarball(command):
         command(self)
 
         # Clean up the build directory
+        if path.exists(LICENSE_FILE):
+            unlink(LICENSE_FILE)
         rmtree("./lib", ignore_errors=True)
         rmtree("./include", ignore_errors=True)
         unlink("libgpiod-version.txt")
-- 
2.43.0


