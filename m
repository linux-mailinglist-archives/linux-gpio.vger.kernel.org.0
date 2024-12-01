Return-Path: <linux-gpio+bounces-13370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FD29DF76B
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 00:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64AA4281456
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2024 23:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC03D137C35;
	Sun,  1 Dec 2024 23:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=george-graphics.co.uk header.i=@george-graphics.co.uk header.b="UfwTUtKf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA1B33F6
	for <linux-gpio@vger.kernel.org>; Sun,  1 Dec 2024 23:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733094944; cv=none; b=KN4qB03c0Ao0cTHpKENwx8jHIU/iew89T4z2u5n0bel/2K3Z99xZSwXglBJexWn9gndVK0vzoWQpJ78y2vnc2mos41SA0RLV9ogfCBiXHolT0J8cdJyuO2BG1dG8WUggJFAMuqU+QeOxigvUzS14EQAuVxgP+j7X2dILPHLamD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733094944; c=relaxed/simple;
	bh=+cAOTP/hZ8/MIoZoJe99oVP1Q7ST0CGOfHwqxqhTZAY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RqxvnUAhMoX/Lx66xSzJ4RNBrP7K/npgyXbJY0J1ha+I5TfdnvIxTwi8dlZbTwng+x/TOZgOpZogOHhMpY45B7qU2SPaeHyd6M+lxDQKs2IXiJ3N1G15vyqkysSm2gpnfbksh059WhrXP9IAKb340YeYtydrMdiPp52wusiRtY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=george-graphics.co.uk; spf=pass smtp.mailfrom=george-graphics.co.uk; dkim=pass (2048-bit key) header.d=george-graphics.co.uk header.i=@george-graphics.co.uk header.b=UfwTUtKf; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=george-graphics.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=george-graphics.co.uk
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7252b7326f4so2955951b3a.2
        for <linux-gpio@vger.kernel.org>; Sun, 01 Dec 2024 15:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=george-graphics.co.uk; s=google; t=1733094941; x=1733699741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yU7qw4WUbAanN2OQcCZzHQvdfrAoo1DGjescDkcena8=;
        b=UfwTUtKfM9jsYqJ2qBTHdlCtQzY6W0V7MA/7kY3sVvEk3W5xpb5vMXTm7et5UOI+Dl
         kcibikM2nhChXBTATwn2he1TaUxj9sb9qmW2kdMJusbWOig6gNgb8udzFhExsmFdGj5z
         ix2VgHMiLJ4i3fcQuF1l7mfOHWswR/B0iAZ3Fnm5fu3JBivhjA2oKImojkCPC83EpzLx
         joKJDSyVAFDh4S16vJxG+4CmJTtIMJKcjHtGj1GiA4cElNdnCflFZjpKfFDXRbpUWa8J
         S7PZoPOO1+AeZOOShavL1feNjAcj/CQstY8fcDY4g8ir1qyWVPKA3J+GSPLK7uSvTNnv
         4Kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733094941; x=1733699741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yU7qw4WUbAanN2OQcCZzHQvdfrAoo1DGjescDkcena8=;
        b=iEvFnTW5CrpZl/0RcdQqNaHxH3hk2SY9A9CG8cOAoZKwOrx9Kdk0MaM/sTCLyQo24Y
         Jh9TMrfzCZxqAdgLe+IKGt4QsO8xgteghKCjkpFh83rKxWQ2K+ShQmlSlNplLNb3qRTv
         D+FW20o9/yNdEwodsYp9M7Cr1rbUIMzCfN5yCHGiuXBghRQOaxCxjJH3Uwk39lpN/LTV
         dBHCj+gT2rNNsaXsH4J98gV+Uv6YonRXs1g9ZeCEDNDSdGJoGq8J0o8qQdf4uzG43E6y
         5HOR4f7gsr0uh0BONiMOscjQapzqeeL1iVRkZP8uHynBQE5Xi0tktd4VUqwLccIGQl8D
         8zmg==
X-Gm-Message-State: AOJu0Yyl8DOb6/T+UMA09RSuqQ4rErMb4z+lHDdQCf8BsSz7fhk6/9DX
	pD8Xj6hPx9ULUdrkHVTYub1LsAhZPsV5wvzVLXuRBJSNA0FG8ZOembQnwNflF0WVZMqQBWdgBxh
	quyk=
X-Gm-Gg: ASbGnctDXJfXIOdQ8bJh9S0ODet0TgHEIeDMe1tJE8EPK3Yscuj7oS6L8m2khrAeU+X
	V1DCdYAa2vbOC3yj0wlVDMa9zYQ+7/P6/Vk8lDlPFjJ+YKC5CrAEmXF6DttArH0lmCr3aDutppe
	BYq+JSeBAa/A7C2CGg/tqWh89rjM6m77c2sTBQapll6rrKuHQZQ30NJpezG3wL81NvTt//Hkym/
	4YqB2yranBTZoCxG+/O0gWXLMwld06eX5wAeAcApPd6bdo2HbuE+9rh2G5yrtf0vTUcYzOObXZT
	F1Y=
X-Google-Smtp-Source: AGHT+IHdSdoNlGWZOnOdRK//mm6cVZT5Ctdo3sEYWHRUEZJvJP2o3FgOcFVvgzFJUo4ozBaeDvO8+Q==
X-Received: by 2002:a05:6a00:3a1c:b0:71e:14c:8d31 with SMTP id d2e1a72fcca58-7253013e41dmr24411394b3a.16.1733094940765;
        Sun, 01 Dec 2024 15:15:40 -0800 (PST)
Received: from p1.hsd1.wa.comcast.net ([2601:602:8d00:3b87:cd3e:cdb8:437f:15c1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417fb944sm7151722b3a.91.2024.12.01.15.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 15:15:40 -0800 (PST)
From: George Harker <george@george-graphics.co.uk>
To: george@george-graphics.co.uk
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH] libgpiod: bindings: python: Fix PyDict_Next contiguous assumption and pypy
Date: Sun,  1 Dec 2024 15:13:14 -0800
Message-Id: <20241201231313.42935-1-george@george-graphics.co.uk>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241130201516.18034-1-george@george-graphics.co.uk>
References: <20241130201516.18034-1-george@george-graphics.co.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PyDict_Next does not guarantee pos is contiguous, and pypy increments
past the end of the dict size.  Patch fixes reliance on pos for constructing
args for gpiod call.

As per discussion here https://github.com/pypy/pypy/issues/5142

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


