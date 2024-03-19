Return-Path: <linux-gpio+bounces-4456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E943880451
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Mar 2024 19:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8022B24561
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Mar 2024 18:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D17B2B9D3;
	Tue, 19 Mar 2024 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="rrGyyQu/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCD638F9C
	for <linux-gpio@vger.kernel.org>; Tue, 19 Mar 2024 18:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710871299; cv=none; b=GtMTqLQMYc3G0RjAfIcITNUUlfPS8E3hGcTUQqR3NQvtJBDfxgK7yPNj3si/oY30Qvh7lHSkF55fNPviQZEju8zQNl/EU5dltRlyZn1KDEUr//4lVozEOkjHmMNInrZZCdgrow4l8J3OEcQBecLH7alG+YCmq5X/L1JCZDT2E+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710871299; c=relaxed/simple;
	bh=DFuwDdLRYzZzwDZt3GEBAbUTwZt+9FAGHBQaulnJ+LU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=W4e3rAm6rE7QkhtG+Nr1IVnq+ha8NC4I3WgsqXEQ0JeN/vjkScJjBYT5nYkGxWrjK6RHzznDJHacbw3NE2lRdzo88OvxlUZNpeDysbdo6MRSRsWmrvsxSDDwLLRq/Tt40Van3LCMyeiyU09bcfd72SsHsiZR5u4vqWNJfsj4HGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=rrGyyQu/; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4Tzffz3nrcz9sSK
	for <linux-gpio@vger.kernel.org>; Tue, 19 Mar 2024 18:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1710871291; bh=DFuwDdLRYzZzwDZt3GEBAbUTwZt+9FAGHBQaulnJ+LU=;
	h=Date:From:To:Subject:From;
	b=rrGyyQu/b1yqICVrmWLj/5i7yUdDhA9POU/xgtFcv1CffPVx3k/sARISnTEVqQ2h6
	 Br/mB2sTNx33qs6mIkUtPvcXafsydh7kCwqpQ2HZi+YtPHLjEjibqPPbtXhNRPo6Nk
	 m1Mi6VXLBTKcaAdthc72ZuXf0AbQGLE889rCWy4Y=
X-Riseup-User-ID: 8612497C1C36F016C7200B9F5B42FE2F9F511447C9CC5AC8FDA830EBE9FDB66F
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4Tzffm258szJsmq
	for <linux-gpio@vger.kernel.org>; Tue, 19 Mar 2024 18:01:20 +0000 (UTC)
Date: Tue, 19 Mar 2024 11:01:19 -0700
From: orbea <orbea@riseup.net>
To: linux-gpio@vger.kernel.org
Subject: [libgpiod] [PATCH] bindings: cxx: link using the libtool archives
Message-ID: <20240319110119.36cfd704@Akita>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/Qn_K23aF7Ms_icVJz7vlWOy"

--MP_/Qn_K23aF7Ms_icVJz7vlWOy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

When building libgpiod with slibtool instead of GNU libtool it fails
when it doesn't find -lgpiod. I attached a patch that fixes the issue,
is it possible this can be applied to the git repo?

This was reported for Gentoo: https://bugs.gentoo.org/913899

Thanks!

--MP_/Qn_K23aF7Ms_icVJz7vlWOy
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-bindings-cxx-link-using-the-libtool-archives.patch

From b00593eb3d6bec02f21d61d490e47d7f2f2e4ce0 Mon Sep 17 00:00:00 2001
From: orbea <orbea@riseup.net>
Date: Tue, 19 Mar 2024 10:41:18 -0700
Subject: [PATCH] bindings: cxx: link using the libtool archives

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


--MP_/Qn_K23aF7Ms_icVJz7vlWOy--

