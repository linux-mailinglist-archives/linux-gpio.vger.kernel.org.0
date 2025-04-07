Return-Path: <linux-gpio+bounces-18378-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65238A7E9BB
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 20:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6044F1898B6F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 18:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A9D2236EF;
	Mon,  7 Apr 2025 18:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fzgLiVA7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46C3254876
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049485; cv=none; b=FEy8UoJDAdONV8k/BHZtCPy15LTuQFDDZZrKlr41sac8091vZjGM1Io6NMvz4jzn98+jpI02gXeUthJbA0cePPrLMXA7eeKJMeoCWt3HNbg8clQbIXKM8FEM4r0u4dxpi4ycHL42Rgdx//1X1jiNz2I+/KSjTtVNc+PnQHv12aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049485; c=relaxed/simple;
	bh=2byTi40ycqHnAGlE4JQEN2iCn4PtzJHhQg3gwKw7dyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X1vwCnK5Th33mIRJE9zrk38LdsfdvI9OpwUkqGx98Ab3r0P8KH7Ds1ezDXoRaz/OD1O4Q/2EPWpVDn5jt++MVGEt2HvdX7lpaVFgIbYyGd/DIqwF/muScaXaD5uPoN4RZY+/TYcuWDvO2mxruqFtsA6JZojo5ZU6HlmgaFVrnYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fzgLiVA7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744049482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QhN+fU02sAb3vVFYxbhgdX1uXBOwa4BAIYnDnoICN7s=;
	b=fzgLiVA7QybJ+qLR27vlV/viN9xlsmVfhKpyYRODZEuIkKu2Or2rAlh2vmbTCaH4n5qk2/
	dMAL38LWYDrfyAm/s902jcDPwMVlqxJvE161EMQX5uyVKxwWpCddD/hKIK03j1aeo8Z+9T
	oO1QbDwlaGJ1kUlrrpAuP0CkTqAoXTo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-450-rvbatCqwNeeW9PChwpPJYQ-1; Mon,
 07 Apr 2025 14:11:21 -0400
X-MC-Unique: rvbatCqwNeeW9PChwpPJYQ-1
X-Mimecast-MFC-AGG-ID: rvbatCqwNeeW9PChwpPJYQ_1744049480
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 796061809CA6;
	Mon,  7 Apr 2025 18:11:20 +0000 (UTC)
Received: from toolbx.redhat.com (unknown [10.22.80.4])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B84EC1828AA8;
	Mon,  7 Apr 2025 18:11:19 +0000 (UTC)
From: Yaakov Selkowitz <yselkowi@redhat.com>
To: linux-gpio@vger.kernel.org
Cc: pbrobinson@gmail.com
Subject: [libgpiod][PATCH] bindings: python: build with pip
Date: Mon,  7 Apr 2025 14:11:12 -0400
Message-ID: <20250407181116.1070816-1-yselkowi@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

'pip install' is already used, so build with 'pip wheel'. This avoids a
dependency on the Python 'build' module, which has many dependencies, and
is not necessarily available when building packages (such as in RHEL).

Signed-off-by: Yaakov Selkowitz <yselkowi@redhat.com>
---
 bindings/python/Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index 2ae8ac8..c6b1b31 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -36,7 +36,7 @@ clean-local:
 all-local: python-tests
 	CFLAGS="-I$(abs_top_srcdir)/include/ -I$(abs_top_srcdir)/tests/gpiosim \
 	-L$(abs_top_builddir)/lib/.libs/ -L$(abs_top_builddir)/tests/gpiosim/.libs/" \
-	$(PYTHON) -m build
+	$(PYTHON) -m pip wheel --wheel-dir dist .
 
 install-exec-local:
 	$(PYTHON) -m pip install dist/*.whl \
-- 
2.49.0


