Return-Path: <linux-gpio+bounces-34514-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLpvBPZkzGnZSgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34514-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:21:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C3037313C
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 02:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4826D3091D2D
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 00:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2642B19005E;
	Wed,  1 Apr 2026 00:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKcPZ2Ef"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2D718BC3D
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 00:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775002689; cv=none; b=hhI03Cyr1/+BuXxpVYa9Os17veZq4AWvVPlOBk54VSpAxmp60E1BMKwVTII3SbTixad8AfXKuvEeCjgQcMIOWMD8bv0v9Zd4la2H3sX4enGj9uEmt1/fm7TSSzihOedZDuzsqJdWw4k6dj9ajZ70ybhRgRAEzGa+5l1z9jfyAg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775002689; c=relaxed/simple;
	bh=cYANgNimMZrJTsfFvYFY+5hrZL6s1bs4ZSTj7/3a5WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4GXYg8SAcX6ITNcEC3zxb19CshLUIq3XOD1RRhkU2EN1pN9tnmkJ3dqbnXf2XToryFxzkKPKA92gtjWNAW87V8YW+ujl9s8ieQhWfpgbeQdOTXi+1OG7Lg8AS/EqNn7bYJ7Bu9GfU4Sv604fVEr6iNTBfNc4iMSmXLCakzHVqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKcPZ2Ef; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d9b1c57a4cso5470167a34.3
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2026 17:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775002687; x=1775607487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6abWCMaslQml4OmdnZcxBZNoa10rbuzBmK5AQe5jaQ=;
        b=RKcPZ2Efb/wHp0DIU+TwA5/ZJGdHR+TKRtCFCv/peZUchdiHXFxcNa/H83eky2Un95
         L14yVrvQR5s+3sLDr4sAwPhlBtcigpe/2uDP2WGxPX/Q1oGoLCGzZvWZSsxKxdo26BSm
         uOy2oqsXAaa243tq25SqurkTCxRptMD817RVtOq+bjNTOGlGoytn3HCuQg/CVQZCfXKl
         Tm04PBmeU80PLQtlbg6KKWoQCVR9YaGkqlXRk0QFNqFozdFUhOPLrlj0nmxWNGpEkaaa
         eBSqK8++TjjONvERK9gp/qKyHh4JJnMnHZSbNYlaQkRzuDdNu3reG/aJMF6gYarUkw8T
         HFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775002687; x=1775607487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x6abWCMaslQml4OmdnZcxBZNoa10rbuzBmK5AQe5jaQ=;
        b=XnxjiR0NWA8kbmru+EEZEtjrOLZNtUCaPs5R+Oq7qwN2MMHvtsmV3XIMMtkohFjgme
         4vYx4gU6CSCP9R/3nCRsWLO8pa0V9mkhktV4+70WzDAEeENG4EcCvVMR3pMQf2HI9Ja8
         mWrF23Wq0EerOPmoIUD6K+720MVr9zWeOUoju9bz4rGbRk839aIV61eCdAV3ggmOd+tJ
         niUp7gLK/XoDxuz50tfk3enSd0PFfvqbGDZXoED3fvcIUCmRT7+X1K82HBUf/xSDbRsX
         2K+p2EavY4OYLGh2bk7FoZFUgcE4ihOFO925RX3R+yLtCRjdYmqdyVMq9F8dOc82K1WW
         oSzA==
X-Gm-Message-State: AOJu0YzCiDvXQ0iKwbTslf4SllBTcqkdQ+KVWRAsxBIvQ3/bSFMYJ2cJ
	VXfg2oH3eIGtW5I2iZiX2BgRS/X9kHeYIiezEEIw6rwWUAnwavb7WUhM9wohUw==
X-Gm-Gg: ATEYQzwaVnV6MR22WGY2HqudjyDlomo+86fNklFop9mO3DfO12evAPYa74E4iykecil
	vKz7OUP5holZAkskKF5qqk2u2r/WT6xnKOB3XNthxaMwYEiNzaGMylfDU0dbeptOoQ1n0Fjkc8h
	Jm5UqVbiInQL/7iPpKYRV4xm9gyEh7Nz6/inVUbL5W/pe7jhjMitDa/3XsFfp9vN9B3lhRFOsIw
	sB/iEgX9R0uIZXHCRe1uEkOg2JUIcHlwPxoNRCD0r+Sx3odfunJ2BOkBUXNe4S56FKwiHLCv2YC
	D8zoDuz/Elg5bnXs+wfj3iY1RLfKju0lBCJ+JPlI+DdKwGRhBjzkJ57LPqR4QqNxxhZ4WpxWwbJ
	3u0hj3S/eoZu2vCWm0Yg5swDCxZAWCueCzogAjje1yMUTMSVu24oJoR+OkfmbNeIOJy/GNzguXI
	6XbC5IuAQQ3t+2R39WmAPKVGd+Yzoi9ZP5roEZowdHcEcv8Nc8rsElvPzzAu+Q+g==
X-Received: by 2002:a05:6830:700c:b0:7d7:eaa0:5e3f with SMTP id 46e09a7af769-7db993f4ffamr1054752a34.24.1775002687335;
        Tue, 31 Mar 2026 17:18:07 -0700 (PDT)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a7ea668sm9173679a34.19.2026.03.31.17.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:18:07 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 5/9] bindings: python: setup: use logging module
Date: Tue, 31 Mar 2026 19:14:54 -0500
Message-ID: <20260401001459.19159-5-vfazio@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-34514-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pypa.io:url,collections.abc:url,bgdev.pl:email]
X-Rspamd-Queue-Id: 73C3037313C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the `logging` module to conform to setuptools' recommendations [0].

[0]: https://setuptools.pypa.io/en/latest/deprecated/distutils-legacy.html#prefer-setuptools
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/setup.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 5f5950e..cd50a8c 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -2,18 +2,20 @@
 # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
 
 from collections.abc import Callable
+from logging import getLogger
 from os import getenv, path, unlink
 from shutil import copy, copytree, rmtree
 from typing import TypeVar, cast
 
 from setuptools import Extension, setup
 from setuptools.command.build_ext import build_ext as orig_build_ext
-from setuptools.command.sdist import log
 from setuptools.command.sdist import sdist as orig_sdist
 from setuptools.errors import BaseError
 
 T = TypeVar("T", "sdist", "build_ext")
 
+log = getLogger(__name__)
+
 LINK_SYSTEM_LIBGPIOD = getenv("LINK_SYSTEM_LIBGPIOD") == "1"
 LIBGPIOD_MINIMUM_VERSION = "2.1"
 LIBGPIOD_VERSION = getenv("LIBGPIOD_VERSION")
-- 
2.43.0


