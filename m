Return-Path: <linux-gpio+bounces-34511-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPalFfJkzGnZSgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34511-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:21:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4D7373135
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B717E308F8F6
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 00:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824FE18FC97;
	Wed,  1 Apr 2026 00:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Af+cONTr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185F154774
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 00:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775002687; cv=none; b=b8zctZxdOr7LQsWdVMBdb3VittAP4o7NfadhNOYLmuby/X+4ueS9ZfFC63ncHVFLyQMB+U9gzYvNBIr9AxCyHGfOT786zNE+JwR9QUAEGTRoSd7pnxC8Yg9CuhBFXjYJnwxxoxbTUZHP9VamKnMZGVrhs3C35600/VHOEDJgjFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775002687; c=relaxed/simple;
	bh=l0Bv8BrQhuVyXhZhgGCq6BbY8pbLkuf6wjlqIXJ3ALQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwHJuGIKFE/EYYoQ4OnbB8V8179rGkUPJ7peZFJOt/lcUbrvPHmdJIECdUpivVgYinnSAndneI1CRVpNXySqaEcwjVs4ZFy/pyJJE+8sMks8zOAGUB0te98qFBUfWJxoRDIQuLXmX7GGLpuzbqiY+PiKNHC918hm/XI50X1v2mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Af+cONTr; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d86eb7c854so3354874a34.3
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 17:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775002685; x=1775607485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYtaPAq6EGoYGrjgDwyPGSvyGWDhdwC+5bNVbZzqlZE=;
        b=Af+cONTrklV0f9GAvqnUJPxOPzbvgDgVwu/Xhaadoezu+PeRsnX3UraOJcCB1xAyqj
         zh9GdGJJ6AQNXn/vqenavPx9tSm/II6Nci12Nw5bs4l2luqtjtDdjPwY3IWIkd4ii/kg
         klvmpWUAUivWfgYLHR6RuJcgmGzPOKTRVqkw0FRBWKAXcJaQZGLpGHRStG72I++dZIXP
         BjdLSuoBn+mtbJk6HLaTwmuqptlLZRjRPvEcpw+8HcZX+dd9uXC77G6QFl1AklpSta1c
         2m8sjG+3UyrqVfNG4r9WHWGMpQZcCTJlM4Gn4xhD1LBovvVUOFcUxB3N5TYmFXGOh9Wh
         7nEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775002685; x=1775607485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fYtaPAq6EGoYGrjgDwyPGSvyGWDhdwC+5bNVbZzqlZE=;
        b=CeUTYF+8XBsZ+Wc0VvrIytwGeNlvryLAWafO1BMFr7DDuwmh9+AE/oVWtPIkqFr+r7
         mcnRjJe5uEN4ZoT/8aGP7NBYoYqHuWo//Oiav2DqwOQk8lAk5iuMt38PgQLo5D7XmODx
         Mu8l9F7NFn8IP4Bowgo1RgwA1+sCwfRDCkZ9a/seJnYh5NNnZNvJs6BN6RcG9N3t6r4s
         SdjwM1SsVUxpoHcpkaSbpZlMoi5VPBCRxoiRIeMw2EZIiSmI0zG39AHQIyCOYhqWwZnK
         Tnyxemz7cFMLq3ACMf+lR0QEmo3fEWZ0RKPFk0XsXcovrtwGvG6uoZMvM7Kpp3Fl9+Lt
         9BMQ==
X-Gm-Message-State: AOJu0YzHBQZqBbSjq494LjX3jfg/GCpF35vDf0Knequnp1qRPCahmgGD
	5WugLO6f7mL70qzdevGoRB05JAdkV+Jym2RVKTcl6QYNfiYQIk5lDjEncOLy7w==
X-Gm-Gg: ATEYQzyxaSIM+eo+oEL0oBK4/1cVzBMdcvirCX0b/zNiQe/scQ9dj8qCI+cuFHR20vS
	r+gkvWaIt5ZgABEQYgwdr7CNQwONZP3GscMT6UG87xCuh4zgluqoyku6tyLV7oHTQVJpcT+a/6x
	p54IuUo1lCLN0p/v3Ca3SphXWoihSOEMqRmzH7Lwt5yyI1rhipiYILjfkxlHnGKiDRAKnUTiS3P
	CCJQwto7/C2udNrr/b0gr6ca4Zn9mUmftz3NqUAetke21Z9slmxvJcMibvPE1HnwN8MtuVCfJQe
	hn67z/UkRI5tXzlJfZ70veC6DsVl/V7tKVQ9vkVM2QBWGJHsO4Gpjbi2tUijiWrXWwC8wjnGPdY
	+ZnZ3906Z/MZG1KcKRTXTAEtrdWUmIMvUwW2yGrz7CHuKvGV+hrWZFdNZF+ike3IvMz6dhLRc0h
	wKYejIl9mayle9z7alKqAdDUu/FHhMBLW7vpDblZhZjmwttV0wPYbMjyJCxqHlzA==
X-Received: by 2002:a05:6830:dc3:b0:7d7:d702:401c with SMTP id 46e09a7af769-7db994f8c45mr1092982a34.32.1775002684854;
        Tue, 31 Mar 2026 17:18:04 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a7ea668sm9173679a34.19.2026.03.31.17.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:18:04 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 2/9] bindings: python: build_tests: simplify the Distribution
Date: Tue, 31 Mar 2026 19:14:51 -0500
Message-ID: <20260401001459.19159-2-vfazio@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34511-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC4D7373135
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The version, package, and platform information is not necessary to
compile and stage the extensions, so drop that information.

If we need to add it back, we can use `dist.parse_config_files()` to
parse information from the pyproject.toml.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/build_tests.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/bindings/python/build_tests.py b/bindings/python/build_tests.py
index 6375b29..77e38ba 100644
--- a/bindings/python/build_tests.py
+++ b/bindings/python/build_tests.py
@@ -27,9 +27,6 @@ logging.configure()
 TOP_SRCDIR = getenv("TOP_SRCDIR", "../../")
 TOP_BUILDDIR = getenv("TOP_BUILDDIR", "../../")
 
-# __version__
-with open("gpiod/version.py", "r") as fd:
-    exec(fd.read())
 
 # The tests are run in-place with PYTHONPATH set to bindings/python
 # so we need the gpiod extension module too.
@@ -72,10 +69,7 @@ system_ext = Extension(
 
 dist = Distribution(
     {
-        "name": "gpiod",
         "ext_modules": [gpiosim_ext, system_ext, gpiod_ext],
-        "version": __version__,
-        "platforms": ["linux"],
     }
 )
 
-- 
2.43.0


