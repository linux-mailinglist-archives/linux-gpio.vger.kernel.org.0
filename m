Return-Path: <linux-gpio+bounces-12690-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AFC9C1019
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 21:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69B921F23E5A
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2024 20:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380F421767A;
	Thu,  7 Nov 2024 20:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="YBNu/n0M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E46B322E
	for <linux-gpio@vger.kernel.org>; Thu,  7 Nov 2024 20:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731012637; cv=none; b=aP6Rr6RdWO3xpfKNffJ+ywrbenjFn8Kmq6/uHGj4WgTUouxMkA4c4d4cIG9OqKRN4J7DD+CXI5ZWLtNCKdVQy7ZiWHGicaXfPirl+TQnMVuMS1HDlIOurQ/AfunxfEFy5is6KL/RDUaORxWKWGlBxWNZpqEyQOLVx9cXRCWFPl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731012637; c=relaxed/simple;
	bh=CjRJdr25PQ3Ha5wfO5wwpylS98fJeGf9w1Xu/bpK91c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OY4NZnqypj68Nhlnt0CSXs5dJrPzaBrkpVNSlWaQXd6NgQGM6CM/mYh1Enc9gM44sR5Ma+Wh80Px3fEQZbx4AXhay8gL7L0ThFc6vFT7A8p+qdajXLTMmdd8C2AXCWU1SUueNZxYoI3k7MlJcqYqoMGinPbV8kiQfL3/GLep/co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=YBNu/n0M; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id 802D4207FB;
	Thu,  7 Nov 2024 14:50:27 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1731012627; bh=CjRJdr25PQ3Ha5wfO5wwpylS98fJeGf9w1Xu/bpK91c=;
	h=From:To:Cc:Subject:Date:From;
	b=YBNu/n0MUcx/uj9RYz6RsSFWqC/lzIRbSqx3Bs5NnHkWelHfPZej74BpTSPcfChgh
	 KKknmtKOJGa1QNv6nk6uOhO66VqFZPE7+hwLK1NHfQNQfzY5rVj9GcTpEtyZOf5x/0
	 022BgmXcJ69tzYjq12BdAO6lSmA+Tm1cWUCl8OSw=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH] bindings: python: specify a tar extract filter
Date: Thu,  7 Nov 2024 14:50:01 -0600
Message-Id: <20241107205001.574426-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting in Python 3.12, extracting files from tarballs without a filter
specified generates a DeprecationWarning [0].

For Python >= 3.12, specify the `fully_trusted_filter` filter which
replicates the behavior from previous versions.

This filter also makes sense as we should be able to trust the tarball
the maintainers generate after the hash has been verified.

[0]: https://docs.python.org/3/library/tarfile.html#tarfile-extraction-filter

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/setup.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/bindings/python/setup.py b/bindings/python/setup.py
index 1f04b99..7ab783f 100644
--- a/bindings/python/setup.py
+++ b/bindings/python/setup.py
@@ -70,6 +70,7 @@ def fetch_tarball(command):
     def wrapper(self):
         # Just-in-time import of tarfile and urllib.request so these are
         # not required for Yocto to build a vendored or linked package
+        import sys
         import tarfile
         from tempfile import TemporaryDirectory
         from urllib.request import urlretrieve
@@ -122,7 +123,10 @@ def fetch_tarball(command):
             # Unpack the downloaded tarball
             log.info(f"unpacking: {tarball_filename}")
             with tarfile.open(downloaded_tarball) as f:
-                f.extractall(temp_dir)
+                if sys.version_info < (3, 12):
+                    f.extractall(temp_dir)
+                else:
+                    f.extractall(temp_dir, filter=tarfile.fully_trusted_filter)
 
             # Copy the include and lib directories we need to build libgpiod
             base_dir = path.join(temp_dir, f"libgpiod-{LIBGPIOD_VERSION}")
-- 
2.34.1


