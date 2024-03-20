Return-Path: <linux-gpio+bounces-4490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 829448812AD
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 14:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3A571C2135A
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 13:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36D442065;
	Wed, 20 Mar 2024 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="bYuu7CuO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D243E43146
	for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 13:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710942612; cv=none; b=rlJI42GlHkJTgTCpqGYSrdy26m3dfgbU2IGF+GCKmZoUTT41+dyfZvMyvt+Cf26ErpTiilOyusNT8AfBVy2T41AQpkRrzUO//lmbrjUC8C0Xs3JPge5kob2I2vovRQG7vXAjhUm6o0x/6zYqHKOVaxEtT+4y0qhwPwVZYO6P5RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710942612; c=relaxed/simple;
	bh=9AaU+PAkCvChf8zz0KygWhi6E6TCnladhtdFhkQ38TM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bpm7vdPKURh0ZBvO3Gv+6r4zFjxeLu2aKy57GgAgDOEa3nsMT9zDYjfD0RKoJE6q8V2LpH64TY22adOOVC2mTIlO3Oq6l0eNU0OB7HjznBAXt+MR/D11b1gK2PBdglAHpmE8al2T4zLmZR0BOzH/9kzA5XyKluXHZlhyONk9ZfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=bYuu7CuO; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4V092V1PNQz9w0V
	for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 13:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1710942610; bh=9AaU+PAkCvChf8zz0KygWhi6E6TCnladhtdFhkQ38TM=;
	h=From:To:Cc:Subject:Date:From;
	b=bYuu7CuOXPVMxMbqh6QTYwEVH4k6aQaepFFa+tnB7arR/dyahIgYsIouigWgLJuTe
	 R0Wqxx2Zr2o3LCrQLRxHXFSElrqskua3M0cPVpWtUqP+eagdMMStW5Yn/L2o/lnLKt
	 EBPDQ3eo5hIZXHi4mR6k/2tn5JW02/1nqtQUfMmM=
X-Riseup-User-ID: 9083D9FB3CDF20700D954ABDE17C25E47E5F1FA9100C63DFBD935E585CB3E389
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4V092G6DCQzJrXK;
	Wed, 20 Mar 2024 13:49:58 +0000 (UTC)
From: orbea@riseup.net
To: linux-gpio@vger.kernel.org
Cc: orbea <orbea@riseup.net>
Subject: [PATCH] bindings: cxx: link using the libtool archives
Date: Wed, 20 Mar 2024 06:49:57 -0700
Message-ID: <20240320134957.7928-1-orbea@riseup.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: orbea <orbea@riseup.net>

When linking with internal dependencies that were built with libtool the
most reliable method is to use the libtool archive (.la) files.

When building with slibtool it fails when it doesn't find the -lgpiod
linker flag, but if libgpiod is already installed to the system it will
be built using the system version instead of the newly built libraries.

Gentoo issue: https://bugs.gentoo.org/913899

Signed-off-by: orbea <orbea@riseup.net>
---
 bindings/cxx/Makefile.am          | 2 +-
 bindings/cxx/examples/Makefile.am | 2 +-
 bindings/cxx/tests/Makefile.am    | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
index 1eafaa2..e2a89cf 100644
--- a/bindings/cxx/Makefile.am
+++ b/bindings/cxx/Makefile.am
@@ -24,8 +24,8 @@ libgpiodcxx_la_CXXFLAGS = -Wall -Wextra -g -std=gnu++17
 libgpiodcxx_la_CXXFLAGS += -fvisibility=hidden -I$(top_srcdir)/include/
 libgpiodcxx_la_CXXFLAGS += $(PROFILING_CFLAGS)
 libgpiodcxx_la_LDFLAGS = -version-info $(subst .,:,$(ABI_CXX_VERSION))
-libgpiodcxx_la_LDFLAGS += -lgpiod -L$(top_builddir)/lib
 libgpiodcxx_la_LDFLAGS += $(PROFILING_LDFLAGS)
+libgpiodcxx_la_LIBADD = $(top_builddir)/lib/libgpiod.la
 
 include_HEADERS = gpiod.hpp
 
diff --git a/bindings/cxx/examples/Makefile.am b/bindings/cxx/examples/Makefile.am
index 64ced20..eca4d64 100644
--- a/bindings/cxx/examples/Makefile.am
+++ b/bindings/cxx/examples/Makefile.am
@@ -3,7 +3,7 @@
 
 AM_CXXFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
 AM_CXXFLAGS += -Wall -Wextra -g -std=gnu++17
-AM_LDFLAGS = -lgpiodcxx -L$(top_builddir)/bindings/cxx/
+LDADD = $(top_builddir)/bindings/cxx/libgpiodcxx.la
 
 noinst_PROGRAMS = \
 	async_watch_line_value \
diff --git a/bindings/cxx/tests/Makefile.am b/bindings/cxx/tests/Makefile.am
index 02b5b6d..4d40d33 100644
--- a/bindings/cxx/tests/Makefile.am
+++ b/bindings/cxx/tests/Makefile.am
@@ -4,9 +4,9 @@
 AM_CXXFLAGS = -I$(top_srcdir)/bindings/cxx/ -I$(top_srcdir)/include
 AM_CXXFLAGS += -I$(top_srcdir)/tests/gpiosim/
 AM_CXXFLAGS += -Wall -Wextra -g -std=gnu++17 $(CATCH2_CFLAGS)
-AM_LDFLAGS = -lgpiodcxx -L$(top_builddir)/bindings/cxx/
-AM_LDFLAGS += -lgpiosim -L$(top_builddir)/tests/gpiosim/
-AM_LDFLAGS += -pthread
+AM_LDFLAGS = -pthread
+LDADD = $(top_builddir)/bindings/cxx/libgpiodcxx.la
+LDADD += $(top_builddir)/tests/gpiosim/libgiosim.la
 
 noinst_PROGRAMS = gpiod-cxx-test
 
-- 
2.43.2


