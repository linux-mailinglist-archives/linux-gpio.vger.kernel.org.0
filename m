Return-Path: <linux-gpio+bounces-12640-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A3B9BF064
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 15:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B66E9B24205
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 14:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171B61CC14B;
	Wed,  6 Nov 2024 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="MrVKGs1a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356B320126D
	for <linux-gpio@vger.kernel.org>; Wed,  6 Nov 2024 14:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.248.234.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730903483; cv=none; b=h79nqu5mopaJUiC7p5dXQGYRkShbdpOW43H7Bt16LfwwOcwpcEP0Nc5COlOcQqumgfQZ6l4prXrsVmZtk6B8FsBslVft3FJr0aOKDJDEaOgr8Iroytk+foIn/fCl5EkPztIHcCdlh9YO2cAXN6pdeXJqpRkaa13fMnFg3bjXVTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730903483; c=relaxed/simple;
	bh=YJV7jUaLOct4eMIM4v6gK4wKXTYdV2i+FhXqVoFEzdU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hqIIaDjjdKn18vjFhUyB7khE7w6KkfQo54pJQDTJVBY2+vE/iPiIJ8173IQl9I+N1G1qbt25G6Npqoo5hJ3SHvT7mUuQkDWsGHPJgXPN8PF7OQ2y9QkCmhqNVSSa0tjNG0Yw/jgS6ggFBYGbSwd98An0oSdz2nxHNvgI0vSC0bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=MrVKGs1a; arc=none smtp.client-ip=162.248.234.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
	by mail.xes-mad.com (Postfix) with ESMTP id C6F11203CC;
	Wed,  6 Nov 2024 08:23:12 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xes-inc.com; s=mail;
	t=1730902992; bh=YJV7jUaLOct4eMIM4v6gK4wKXTYdV2i+FhXqVoFEzdU=;
	h=From:To:Cc:Subject:Date:From;
	b=MrVKGs1agR08NcNulrcVlQJxo1jpN2uDajhzIQEQ636LaPzgJia7vPuC47DfoPz5R
	 hXSYgsHmT3fiupU6SEFIUz9Z7vcgfE/wiPZM1rHOC8GxVx9i02sjKeU5ogwMVA16AM
	 RTBMRxAzxyEJ3TihVFr+d21oCJV5mB/FQ3CeV2oI=
From: Vincent Fazio <vfazio@xes-inc.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@gmail.com,
	Vincent Fazio <vfazio@xes-inc.com>
Subject: [libgpiod][PATCH] bindings: python: generate CPython 3.13 wheels
Date: Wed,  6 Nov 2024 08:22:48 -0600
Message-Id: <20241106142248.305219-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support for CPython 3.13 was added to cibuildwheel in 2.21.3 and
advertised by build in 1.2.2.post1.

Update the dependencies used by generate_pypi_artifacts.sh so CPython
3.13 wheels are now generated.

Closes: https://github.com/brgl/libgpiod/issues/106
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 bindings/python/generate_pypi_artifacts.sh | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/bindings/python/generate_pypi_artifacts.sh b/bindings/python/generate_pypi_artifacts.sh
index c2fb79f..d5dbd31 100755
--- a/bindings/python/generate_pypi_artifacts.sh
+++ b/bindings/python/generate_pypi_artifacts.sh
@@ -108,8 +108,7 @@ python3 -m "${venv_module}" .venv
 venv_python="${temp_dir}/.venv/bin/python"
 
 # Install build dependencies
-# cibuildwheel 2.18.1 pins the toolchain containers to 2024-05-13-0983f6f
-${venv_python} -m pip install build==1.2.1 cibuildwheel==2.18.1
+${venv_python} -m pip install build==1.2.2.post1 cibuildwheel==2.21.3
 
 LIBGPIOD_VERSION=${src_version} ${venv_python} -m build --sdist --outdir ./dist "${source_dir}"
 sdist=$(find ./dist -name '*.tar.gz')
-- 
2.34.1


