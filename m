Return-Path: <linux-gpio+bounces-34510-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEFAKfBkzGnZSgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34510-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:21:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 076B437312E
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DB66308E227
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 00:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF43218A92F;
	Wed,  1 Apr 2026 00:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFaMj5ql"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBAA1FB1
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 00:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775002686; cv=none; b=BgcLviox5q2kHEXU+neFJB9VNFsPo07Fe5WMsYR59SmlSPzmR3PGLKB5TA9ZS9jaLtB6k2GzHUNKrW5vez/ZtPTGsG4dd4jJgsdv5arYAH0IUcfUtrnpJdyqUJXbViKqVBm3WO+NGZkTc8zbS3okE4g7/LsrUBXJmbPPXJrht7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775002686; c=relaxed/simple;
	bh=VkEN60okmK9i2KtGQBWrPze/iExIv8ZInWpndSEujlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mEBhAFRrexjXGbDcmjjqQEFHc2IHRowQWi4/hw+TPJxeisnMxMhGGKbPL3rFoOmrA14v90k5Qv01TOuO2rzrVTxygcCvvtgDASfvNZUoDEvbiSfUC9jyv9uylEoM3Yvqp+nJXPbfwJvdFVY4BitV5yWusgS5QfNG7Q94OwywYqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFaMj5ql; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7d7ebe11bffso5137969a34.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 17:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775002684; x=1775607484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GWISWA4ajN4PQ6cr94Gr2HPzzv2YKzY2AWcYClVo8eI=;
        b=LFaMj5qlSzC+r/U6eTv1niSwPaNTx93/fKrF94VEuwuHhKn53YXxARD/H6CAwKMOYZ
         n3u9xJjXpDhw4m87/rKwbUzjlB8LaPTJI519bYgitxUSGwdYLdJ6rUMvLZ4EkxR9zd53
         g+e9SmfJyQtlyCl036l5sEfJIS99oi7lmsfTDJjXjVvQOnxaQqiMXjxQwFIpbl077tKE
         K5r/adndEUp2WrDNSbcrVMLJ2Y+LBEz8Hfur9MKzJom4jnOmo+i5vSw24ENwUQtkub5U
         b7VTj/Q8pYczdigE/UjPiZNpFFqf+oeRVJbmJJrtAU3vnr5xnEfWkPtz6QBtt5ktMuri
         12Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775002684; x=1775607484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWISWA4ajN4PQ6cr94Gr2HPzzv2YKzY2AWcYClVo8eI=;
        b=ZbjGINLGwGxWBeCdwe0ibWGxuQ6WJxW43SRQFXabvekXJa4BUkb2I6PXlPh3waM1U6
         s2Jph+NQxPMvx5YmGfa/b6GMQz6sjI/usN7a3EiUUpCtx+12ESqmImpA/vbErmFYG5km
         1W0ohGvUsXJbJ12JR24oNK0a8g7w5jdyPZHJsubolFPKU5x2M0+QbGlVWTmeJEB26nLe
         k9e1sjK4GOTVHqaMpjySpDySV4qjBVZE/45jz6tRkAOIct7L6HYrRuPhjtemktWrUSPi
         wpoBnWcCkSYd5hhkZU0SwEk1jFhWB9EqW6hoe6jz0OeXmWpOdTIJTznqVoAAJ0EeUGhU
         IDtQ==
X-Gm-Message-State: AOJu0YwQcwuf49ORRC7QSNi5oJk5nCjCxlq1v+ZCe7YY16I12zZICbb4
	OnceFIOUVqgL/Mp4iPpdiWndr4bnXVZiTo73lGrqFO5w7SDhaGz4AIYMyB36bQ==
X-Gm-Gg: ATEYQzz1cqRgKMTQPLstK1gkT1Oz2Kj3tAkHXPMtb9UpBtH+sDOnVQ38zYxbNPDrs6k
	PCwc/4p9onUH+qt6jSkeKquhZBbTJillAfPwZekEFlR8UWC/Bj7dtNTzktq2ebuVrKPZKpnARfG
	QJx8kXesC/Y85oWynrRdbD9+hoL254xKH2ZSXDcKYePhyes6ycTm1peCWAeKHwUIkqTAGgykONL
	EZn/w1YtABxM97cKCMleyU8VNoWkGvvvGnmwKVIfYHpfO3WxzyGFuR4Ro4fy7ARqWLWqaaSjpSr
	cAg1wUXSzQmyKM7PGghPgsRuIozngZxLifWurE1JI7PqRXb6im2bTb/AOC+5tUCD0Nqfw2l61dE
	fpZUiedmC4/YD4MgF1kMzcQfdtAvUvnHfZ/AOavFLqW4LCBjh1B5Rs3YNmDDHZblMPl4yPSt6Hs
	iGKfkhnpw/Dg0ekY3HgdV2hCKMXaiRqlDdyK/nYfvNyvZLTMumcstLoMcZBobYgQ==
X-Received: by 2002:a05:6830:6f90:b0:7d7:4fc9:5204 with SMTP id 46e09a7af769-7db991d86bbmr1120144a34.2.1775002683940;
        Tue, 31 Mar 2026 17:18:03 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a7ea668sm9173679a34.19.2026.03.31.17.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:18:03 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 1/9] bindings: python: build_tests: do not fallback to distutils
Date: Tue, 31 Mar 2026 19:14:50 -0500
Message-ID: <20260401001459.19159-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34510-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 076B437312E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make the assumption that the build host has setuptools>=60.2.0 which
exposes the logging module and remove references to distutils.

This conforms to setuptools' logging recommendation [0].

[0]: https://setuptools.pypa.io/en/latest/deprecated/distutils-legacy.html#prefer-setuptools
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/build_tests.py | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/bindings/python/build_tests.py b/bindings/python/build_tests.py
index ebe1727..6375b29 100644
--- a/bindings/python/build_tests.py
+++ b/bindings/python/build_tests.py
@@ -19,9 +19,11 @@ import glob
 import tempfile
 from os import getenv, path
 
-from setuptools import Distribution, Extension
+from setuptools import Distribution, Extension, logging
 from setuptools.command.build_ext import build_ext
 
+logging.configure()
+
 TOP_SRCDIR = getenv("TOP_SRCDIR", "../../")
 TOP_BUILDDIR = getenv("TOP_BUILDDIR", "../../")
 
@@ -77,19 +79,6 @@ dist = Distribution(
     }
 )
 
-try:
-    from setuptools.logging import configure
-
-    configure()
-except ImportError:
-    try:
-        from distutils.log import DEBUG, set_verbosity
-
-        set_verbosity(DEBUG)
-    except ImportError:
-        # We can still build the tests, it will just be very quiet.
-        pass
-
 with tempfile.TemporaryDirectory(prefix="libgpiod-") as temp_dir:
     command = build_ext(dist)
     command.inplace = True
-- 
2.43.0


