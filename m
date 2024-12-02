Return-Path: <linux-gpio+bounces-13425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D62459E0C0F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 20:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC097B2A77F
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 17:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB7B1DD9A6;
	Mon,  2 Dec 2024 17:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=george-graphics.co.uk header.i=@george-graphics.co.uk header.b="h46wZ0qD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBDD1DC19E
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 17:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733159619; cv=none; b=QzCdlLWa7DYQHdiLUMw3D9YQbUxjdj6Wo9WQt/lrjgxOV5PJx+GFjksdS3/thibBpZ1p7xFw4+g3eJ1ylWecHklzFvugacxyQiLq1o5RS7AAVhxgodbMnONUG17G5qLLvTQI+w4JKmmZtZr88HNAOuvIhBNxm8ptlbrUtvD/BxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733159619; c=relaxed/simple;
	bh=6x8hUv5X3P4GLjfj4z9O93vmVFU3mfLm+CK0nwWeRcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I8sVAAUwAy5PpcOXuMwP9MXxUzUaKxqa+JcXw0zxnoLYkLfYDGl8lcyfqV2iPgknBZF5aga47e15wPKgGx+aIrhG90v21kZn7eymPSX5/Xc9f+ZjQBvk4+xKCkLMhRpsq1ty7Evs2PUDsg6jTLNtMXH9jxV06eAx9+tmh67Ol3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=george-graphics.co.uk; spf=pass smtp.mailfrom=george-graphics.co.uk; dkim=pass (2048-bit key) header.d=george-graphics.co.uk header.i=@george-graphics.co.uk header.b=h46wZ0qD; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=george-graphics.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=george-graphics.co.uk
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fbc65f6c72so4271139a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 09:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=george-graphics.co.uk; s=google; t=1733159617; x=1733764417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RGA/gwiARNbK56fP3NpqhEkBiLvrO+qV81tO/LQFnE=;
        b=h46wZ0qDPs153M7msSDDe/yLoiRvOYf6NuzJjlSlYs2Eeu6FbzWiyOD1gArsBHNRA1
         RATvdzWoHdbxEKZg3/O23d/tBMRVAatKGAYlczc/HdOZvgsuyfMJNPzY0kOattt0+Tpg
         zsBIF0czawhHL7MypECBuxDNGbYtnh4+9HExO9gZnUW5zNlWuS1lFaJLyXyx4ru6vHVA
         A6zYCuRny8kgQiTQTeckWmFEbVhSkqBCDk5l00pH8gKv6KnS/CFVjQtY7wVFngCePX2y
         jAehbgXTnMteePXI/bvnCgVpGZTGEHse9ODtN0CqFECsviDbq2pYmVyVovVh1LlNs6f8
         NjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733159617; x=1733764417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RGA/gwiARNbK56fP3NpqhEkBiLvrO+qV81tO/LQFnE=;
        b=QM1K1GQPN0FPGcCRAzNSgd/PTs4QLhhnYs0rraLcWeQLpRSnxHW4Mk23QDJLWimctF
         ggiTzNieY9I7KnUTzOw9Gey0n8JD+O2D9Cjm27Y/K0JZlXYRB6Yf5gExzVhs0addqgz7
         0C5Ov0fZcC/FWPINWcj4khP5SkvTyC7tHfCp9PM2cheISR0RHEcusvq/xUaAl6Mv7d2R
         q6m8TJ8Zy54yhYK46YHxZrqZkeECad4qpcyErf5N4S8rJsVvzjtdfz0srjf6ZZPMTu9F
         OOuSnCWp+w7QMeW1EyaWBqqjIqcKQMjoR/+LJtOMaDEp0LKNAdTN8KPbLORW3LLUMBDO
         6vBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXye1l3DIiDDf/bA1KEbWuVNiT1OX5VLcTbomPzqT6Mp+JO81iuK3zx+kuxECcegeP/a41vYLbo5TWA@vger.kernel.org
X-Gm-Message-State: AOJu0YxZad/dS58It4mnQmwmyY+f2YuV2ut/nU5w4HGGNFIa11/tKa1S
	MtBLeAVWfJD6/3jUy41rU6y270whlAaz7+yIv/gjIyTpsLaxSVz1uXCzAo+TJZ8=
X-Gm-Gg: ASbGncv4W/Z7DnjlwaKIuD2m51eeUcugWUp59hELpJWJoq7IiFUxpwbmBtugkg/ZPhJ
	r/GBHZ53C11IV+JA0HzIMijt2MXdYXCOKqKAWTeJGV3X7KE3NdKzm3LOmNexk8t6gFtWwjFD19C
	IpSklJA9Iuxu0gcX5pGHnzJLG6SM+4Gpv0ioUBIcFmIsAcE6rBQvHrgWFl7gNLBAPHJRYBPPQKr
	cC69B+i9x+27S1z+mx/9ABKDAEeY40IK5oGbSmGeaylHWVJWxkGT1FN86sbcQqfsdxpSszXCBQw
	6Ow=
X-Google-Smtp-Source: AGHT+IGieKrL+HWYFLzvMDrEtXWH545EzARZu17AnZSWgikZX5mZguNL8au0DXOjTYTK8Ndv+KG5ig==
X-Received: by 2002:a05:6a20:748f:b0:1e0:d575:8d4f with SMTP id adf61e73a8af0-1e0e0b8c664mr39518813637.37.1733159616610;
        Mon, 02 Dec 2024 09:13:36 -0800 (PST)
Received: from p1.hsd1.wa.comcast.net ([2601:602:8d00:3b87:cd3e:cdb8:437f:15c1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c3249f2sm8117063a12.49.2024.12.02.09.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 09:13:36 -0800 (PST)
From: George Harker <george@george-graphics.co.uk>
To: brgl@bgdev.pl
Cc: george@george-graphics.co.uk,
	linux-gpio@vger.kernel.org
Subject: [libgpiod][PATCH] bindings: python: Fix PyDict_Next contiguous
Date: Mon,  2 Dec 2024 09:13:03 -0800
Message-Id: <20241202171302.51437-1-george@george-graphics.co.uk>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <CAMRc=MdyYV=UrtyTHya6V_FK2w+XqC=BU19LrYFeJCLYi9O6wg@mail.gmail.com>
References: <CAMRc=MdyYV=UrtyTHya6V_FK2w+XqC=BU19LrYFeJCLYi9O6wg@mail.gmail.com>
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

Signed-off-by: George Harker <george@george-graphics.co.uk>
---
 bindings/python/gpiod/ext/request.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/bindings/python/gpiod/ext/request.c b/bindings/python/gpiod/ext/request.c
index e1a2a42..997e6fc 100644
--- a/bindings/python/gpiod/ext/request.c
+++ b/bindings/python/gpiod/ext/request.c
@@ -205,7 +205,7 @@ static PyObject *request_get_values(request_object *self, PyObject *args)
 static PyObject *request_set_values(request_object *self, PyObject *args)
 {
 	PyObject *values, *key, *val, *val_stripped;
-	Py_ssize_t pos = 0;
+	Py_ssize_t pos = 0, index = 0;
 	int ret;
 
 	ret = PyArg_ParseTuple(args, "O", &values);
@@ -214,8 +214,9 @@ static PyObject *request_set_values(request_object *self, PyObject *args)
 
 	clear_buffers(self);
 
+	/* Note: pos may not be contiguous. */
 	while (PyDict_Next(values, &pos, &key, &val)) {
-		self->offsets[pos - 1] = Py_gpiod_PyLongAsUnsignedInt(key);
+		self->offsets[index] = Py_gpiod_PyLongAsUnsignedInt(key);
 		if (PyErr_Occurred())
 			return NULL;
 
@@ -223,15 +224,17 @@ static PyObject *request_set_values(request_object *self, PyObject *args)
 		if (!val_stripped)
 			return NULL;
 
-		self->values[pos - 1] = PyLong_AsLong(val_stripped);
+		self->values[index] = PyLong_AsLong(val_stripped);
 		Py_DECREF(val_stripped);
 		if (PyErr_Occurred())
 			return NULL;
+
+		index++;
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


