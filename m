Return-Path: <linux-gpio+bounces-8057-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B6C92804C
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 04:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AC601F21DCC
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 02:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADED91172C;
	Fri,  5 Jul 2024 02:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pb0kbyi5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E6545978
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jul 2024 02:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720145880; cv=none; b=QuTVyKyyODv2qBNTIRhaJGZxj4wsVykVif26RetinWsrH6fb96BLunKqJX1edh4C4uytZgjEoirF6S6FZgyicHftmpAkZm5b/y45j3iNiPdzcoEPzzU21uYXlUai5vrYGl7Pr8pLYxZH5bj+033pk34c+HBhLZWAYtQFLNBoOKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720145880; c=relaxed/simple;
	bh=AWoJ6suU1MWW3DDG8XEyakVI5KwBQnfzfeq2DnGkHuI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OWk6wKsaYTHE1R9fzr0UP+88i67T41cQ5FgJ/4iybyEKyWemcErmehiWwLwmNXZ14P4RUT6HYbDgHlLEk+v7w/sO6+vkvAkTZ6YqROe5XRTSGLIlvRSbew/Sw3z0q/bHRSBXJYEUM6AQsbtQZ8HLCeJEsTDB+USdk8fF2fe1C/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pb0kbyi5; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70b0ebd1ef9so92369b3a.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2024 19:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720145878; x=1720750678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iq/G41w0QogcyICNmS8VuszjnekBEu0foJ9QhMLjsiM=;
        b=Pb0kbyi5Rpx7aP6WtZfI0UCSDEVuORi/0FpXhzEjLRySkwOpG8d64kpgBdixhiSKa1
         pqwutfR0VC/L65GYjxjw81OZ6DR8p+BxzywTS2kLKsNjt9g9LSvo0+zHDqBatKs4I6F+
         hIMB06dCWtPHKQfIhfKtbJUVv+qPmsWvBhlb4xOTE004TRhN65xjxaC3LxO8ztZBtONL
         rjyBgoGs5LGaAnvH6gMArZE64+WHpXEzxxsSvhvzk1uVAx+qRERShA7lcw5z/2ucVDh7
         QeYpiNbyW7VSORPx2OA8CdVFPwWh34sg5oOcZbPVpcpSKMlaBEKE4Auk4w54/pKmdKuY
         Ek4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720145878; x=1720750678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iq/G41w0QogcyICNmS8VuszjnekBEu0foJ9QhMLjsiM=;
        b=m+OLZUKLrzVCeIqOJr2HcnXuQXZorBz+n0TmbiLIKxxmbtor883KhhAF4a+6GI/QY3
         8Tt5KhVGJGFDFcgA4LKe/O5Tx3IlM2cUUnbNQN4uatbP5Tbyb47j4/AqyAdp9+c0Dk91
         KYfFvbWm5o+bAAUuJlq/O+mNhpljV3jEglCNJjh0r2/8Gb09wzdCNMdrOsKzjkMN+BhB
         aFYWUfmLSBVoe9+bMNfoukaOCAFqFsSwj4UvzuJ9oCN1Y/iWmtsCzfdh9KGeZRerr2Ug
         Ir4TXizVTacioO98/6KvAcrdWXCYo9UojALc4TOJt/wnU+C/fcGuqB8W97OpPZvC3bKm
         FlKA==
X-Gm-Message-State: AOJu0Yy2bgUY9SmNeVg1EIM7GemVXu6vj7cMMuUzSmiV5DFGKQoWdNf/
	NbQehwhtdLZjCV59OaHxmfB6aYHACPJ01hmyB28WkGd3Lgh/0eSNyY69uA==
X-Google-Smtp-Source: AGHT+IGOZExRQTusQnpHYvbFVM5zS8/56ACmdiZN5MPY2osZr8dIb/dEEuHDrik5fGWpzE/UWCrQGw==
X-Received: by 2002:a05:6a00:1f10:b0:70a:ec36:9332 with SMTP id d2e1a72fcca58-70b00957552mr3072179b3a.16.1720145878226;
        Thu, 04 Jul 2024 19:17:58 -0700 (PDT)
Received: from rigel.home.arpa ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708029582fasm12898354b3a.88.2024.07.04.19.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 19:17:57 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] doc: fix sphinx config for rtd
Date: Fri,  5 Jul 2024 10:17:50 +0800
Message-Id: <20240705021750.43197-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generating the latest documentation on readthedocs is broken as the
index.html generated by Doxygen is now being overwritten by one
generated by Sphinx.

Make Sphinx generate a differently named root page that does not
conflict with the index.html generated by Doxygen.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 sphinx/conf.py                     | 2 ++
 sphinx/{index.rst => contents.rst} | 0
 2 files changed, 2 insertions(+)
 rename sphinx/{index.rst => contents.rst} (100%)

diff --git a/sphinx/conf.py b/sphinx/conf.py
index 51ae3e9..043dc79 100644
--- a/sphinx/conf.py
+++ b/sphinx/conf.py
@@ -53,6 +53,8 @@ exclude_patterns = []
 
 # -- Options for HTML output -------------------------------------------------
 
+root_doc = 'contents'
+
 # The theme to use for HTML and HTML Help pages.  See the documentation for
 # a list of builtin themes.
 #
diff --git a/sphinx/index.rst b/sphinx/contents.rst
similarity index 100%
rename from sphinx/index.rst
rename to sphinx/contents.rst
-- 
2.39.2


