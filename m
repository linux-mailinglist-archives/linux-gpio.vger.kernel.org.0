Return-Path: <linux-gpio+bounces-13369-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2EB9DF2EF
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Nov 2024 21:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 509042809E2
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Nov 2024 20:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB191A0B15;
	Sat, 30 Nov 2024 20:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=george-graphics.co.uk header.i=@george-graphics.co.uk header.b="bM57qGh5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966342F2A
	for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2024 20:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732997724; cv=none; b=e9QPYV+7ErxZnCfXelgh43De95WAU9V4/qUZRMyb58RqRyj/pScURZUMDgHb0okgvMtnV44f5PYh8nzqcpSta5gm7KjtVKsSrb4CCMDodKbr0N04wGXSYS+aitMj9LQUxkxzQ3qQT7Pp/ECilgj6E+yio4HB+y9Zp0jGQZvO0ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732997724; c=relaxed/simple;
	bh=Y/RGBRv82URvsqlNZNq2Up0uFH4iuDGlO68TrD6C960=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gIWy9iSsL6HQDWTmg6YxQx4YCTzTsgOXTFgAe01n+I/pp1Mghd9FqVN9gwHDPaQwZ1BUvB0gCmzaiOn4J8hziG5l8kns4oeMaLTvboFmJzJarKzqjy0t1tEimDJDPYASQoXZYafNFVx+QH7bgf/uUGHRqm/CDOv8Brdk26oI3fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=george-graphics.co.uk; spf=pass smtp.mailfrom=george-graphics.co.uk; dkim=pass (2048-bit key) header.d=george-graphics.co.uk header.i=@george-graphics.co.uk header.b=bM57qGh5; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=george-graphics.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=george-graphics.co.uk
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7f46d5d1ad5so2267398a12.3
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2024 12:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=george-graphics.co.uk; s=google; t=1732997721; x=1733602521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xY3CgqtBjAo1heIA0VA+1v4kAbI79KQR1JPuigQXkVE=;
        b=bM57qGh5JG6HZQC40eOGVVhLlMtbZK9yDgAzDnMoFat8H92TIbhntTrQOeA3eWLM62
         FjRAFbd0yr7QGJQfPEEaI8w4596y8/PNxwV7044opvWDqGSrxd0ipF84A8XOf1+1fXXB
         1+o2o46kBNsKISkhZiqDxtJJn28eCey8MCkxF5hzfgU+uViBba9Lja8c3oOHlVT3sEa8
         K3MLEhSR1odcbWQ8IiBJBrskI23RRGD136pD9nAc8hpfxAXO27bi2mof1hzs4siT9zIS
         VSFJSRheb2rVjgQPv5R2i3+cp33qO9uxrIikStYRByJfP2knReafuPX3Et/7AFsKsHxW
         e2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732997721; x=1733602521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xY3CgqtBjAo1heIA0VA+1v4kAbI79KQR1JPuigQXkVE=;
        b=MgT3cIqUdmXLKmxag1yEpV5xsJhn0HuvW2LS+/PHjkECUjokF2aTkM8c6gNHUiUBZ9
         kBKMrosNU92aqorlbxGgHy1R9HdatFqhlweYkxB5lfwEBThHFdKLSCu6BpUYctmuxCkd
         R2rOCWHZ7uAmZVryvBrxgJ99/2zcys+oWw5hr0/fPv12m+onEglEIN594u3gebRhI7OC
         p7dAAEmXsiKC32SsWXhG09/ifmDPQPIqwJdsTLP2yveqneUsMmg3CwPTcaf6KWvlJ++i
         qQ+09GRxfy2uqwHO2sVJjiiil6+ehClNATrxM2EwFVuXV0yYDDvMAIv0M187cwve1RaS
         YSnQ==
X-Gm-Message-State: AOJu0Yz4FRHPmHR25w4jvJTppMPk/n6QvhshqF17IwTJOzUC2mc+wf7K
	1xC9JpSAOGBw2WvBDKXon9O7O/6CId0hqx4BJ+uXehE7it7trPe4xo77PVDWXMXDD2pwDMW1SyD
	bnEc=
X-Gm-Gg: ASbGnctdJdWU7itNd8w4abuzia7fw/LlISTgiMxsjqa0+u3vuUVuVfUWgF0IVC/l6i0
	7u46cgF+2JZZocXQDJ5Oj8+CuN4wKuEyM1mE9+4xOgZaQiz+lmXaPI2p/0w+BCwV0I128rRCkNv
	6u0lgIM36cBvIPecGlwmCuB7zxJF0kIoek5zlbsFXEZMHEG1G0aQOG7/h3ts7yb4r8H4lCggAw/
	xJUMVXpZQTU925vacncy2JDyYoRhD+QXobgKANgGHrgBG4JwNnTYGC+gUStidl1iwqNk4jAhwoA
	WzQ=
X-Google-Smtp-Source: AGHT+IEH4ENd5T+yfwH6+CuA9qbnun1Spjinif9P6cat/VT+IfnHGswn98NHoVQewaYjVsbmS/Uh6g==
X-Received: by 2002:a17:90a:ec86:b0:2ee:9e06:7db0 with SMTP id 98e67ed59e1d1-2ee9e068534mr1713062a91.11.1732997721434;
        Sat, 30 Nov 2024 12:15:21 -0800 (PST)
Received: from p1.hsd1.wa.comcast.net ([2601:602:8d00:3b87:cd3e:cdb8:437f:15c1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee2aff1b82sm5357714a91.8.2024.11.30.12.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 12:15:20 -0800 (PST)
From: George Harker <george@george-graphics.co.uk>
To: linux-gpio@vger.kernel.org
Cc: George Harker <george@george-graphics.co.uk>
Subject: [PATCH] Fix PyDict_Next contiguous assumption and pypy
Date: Sat, 30 Nov 2024 12:15:16 -0800
Message-Id: <20241130201516.18034-1-george@george-graphics.co.uk>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pos is not guaranteed contiguous, and pypy increments
past the end of the dict size
---
 bindings/python/gpiod/ext/request.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
index e1a2a42..4e49289 100644
--- a/bindings/python/gpiod/ext/request.c
+++ b/bindings/python/gpiod/ext/request.c
@@ -206,6 +206,7 @@ static PyObject *request_set_values(request_object *self, PyObject *args)
 {
 	PyObject *values, *key, *val, *val_stripped;
 	Py_ssize_t pos = 0;
+	Py_ssize_t index = 0;
 	int ret;
 
 	ret = PyArg_ParseTuple(args, "O", &values);
@@ -214,8 +215,10 @@ static PyObject *request_set_values(request_object *self, PyObject *args)
 
 	clear_buffers(self);
 
+	// Note: pos may not be contiguous and in pypy, is incremented
+	// past the end of the dict size.
 	while (PyDict_Next(values, &pos, &key, &val)) {
-		self->offsets[pos - 1] = Py_gpiod_PyLongAsUnsignedInt(key);
+		self->offsets[index] = Py_gpiod_PyLongAsUnsignedInt(key);
 		if (PyErr_Occurred())
 			return NULL;
 
@@ -223,15 +226,17 @@ static PyObject *request_set_values(request_object *self, PyObject *args)
 		if (!val_stripped)
 			return NULL;
 
-		self->values[pos - 1] = PyLong_AsLong(val_stripped);
+		self->values[index] = PyLong_AsLong(val_stripped);
 		Py_DECREF(val_stripped);
 		if (PyErr_Occurred())
 			return NULL;
+
+		index += 1;
 	}
 
 	Py_BEGIN_ALLOW_THREADS;
 	ret = gpiod_line_request_set_values_subset(self->request,
-						   pos,
+						   index,
 						   self->offsets,
 						   self->values);
 	Py_END_ALLOW_THREADS;
-- 
2.39.5


