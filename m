Return-Path: <linux-gpio+bounces-13424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AD09E0A32
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 18:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55E86B27A3B
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 17:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EAB1D9350;
	Mon,  2 Dec 2024 17:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=george-graphics.co.uk header.i=@george-graphics.co.uk header.b="YfPo3vau"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C99E125B9
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 17:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733159358; cv=none; b=efUac9OxZpejIDEtOJ1Vh79xSXzbcrLgnRG0zJ06csjaGyqpujmfn6eeQh4TLG6NPFznGdBjGhvSAtJUDtgZo0v7hbY4hVifa8OeAHaWQC8PWa22HSVXl15318S27Gdt9v+IowOAvk/EHu6Xn7hC8U4bBZ+hJS+7RVOKw8rcYTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733159358; c=relaxed/simple;
	bh=6x8hUv5X3P4GLjfj4z9O93vmVFU3mfLm+CK0nwWeRcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ze93wbRq8jS73hQtRTwx8/QdneWoI6EXfVY/BBQTDSlWDpiBFkRBLKbfTgPRJzM9WcHccBFxfY8ACCn3jW9F05z8DWF6fVNaKH25MV0lJinKQI07YCEHMONcCogwBctSv0Zv+ain2i50vO1+PGTM20nZveqjMhypgjW0VICijxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=george-graphics.co.uk; spf=pass smtp.mailfrom=george-graphics.co.uk; dkim=pass (2048-bit key) header.d=george-graphics.co.uk header.i=@george-graphics.co.uk header.b=YfPo3vau; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=george-graphics.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=george-graphics.co.uk
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21577f65bdeso11599785ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 09:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=george-graphics.co.uk; s=google; t=1733159355; x=1733764155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RGA/gwiARNbK56fP3NpqhEkBiLvrO+qV81tO/LQFnE=;
        b=YfPo3vauPjNQQAjgxz9V88rokJ3TfgGuAVYJuhUTYRwOE7UfVLgs/KpTiT7uELc9nR
         kkC2LLXRbFbnOBhMa8fVhrEvmnEdBgw98rwFFa/zpCRAYIp8YwGGm0+dmc+0Nbrg/4Yo
         lyVfbhLcouOABh0EYVXuvDM0MbvFpW1uuWzX7yT2bglEY/b1OVuvb78V5Dg6+z4wZjz4
         4/RSMEOWt79hSlDn6r87vu2qSLoRZRSNm5YXyXzguxLaW5yHuK+K9bf6QmpPclcPmvCR
         Tii89rnqYnniHqJZZYbxG1No4deYAAvJ523ygX0DKc5KSWsUEdyJ0IegaZwaYy7P6Tqe
         UNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733159355; x=1733764155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RGA/gwiARNbK56fP3NpqhEkBiLvrO+qV81tO/LQFnE=;
        b=pGfxycyIcI6/x4NpfKF0a4M2vxKno88O1ruarfIZh51jOTnyGJ6yoKT2Ldjf3d4oSQ
         sX7WFfASHSG41kLzF7E/2sGVPRfXSDjw1+M6c0M9j5TyBS/VQ24J6J94qaWasPudmQlL
         OorvVVtNzHvUgGb8iWVMJYfy6gU8n8jKwlF/0GSWSn6SFJri7esjSN47tiCGUZncJm2X
         fgWVYZmqMl1HBpoavAs85rUv+lo0Rr5V19OjB2OSWODzWLVvbsfl/mhbSkDURHwrU3dT
         cRswLXTPlnYzSeXLthmjcvqV0DsZgB3MURtRWriWfHmCNIl+ZuqC9x2wLCGDKwsjunok
         PR+g==
X-Forwarded-Encrypted: i=1; AJvYcCVQC+ZaHZjMltGUZFFWKQRWC4dNXqdN4x4alJCcX5G3kcFahmiVZyor47PPsO23EqlqOcFXhWJwIiSh@vger.kernel.org
X-Gm-Message-State: AOJu0YxifZTdcP7D0RY8OJCC8j3BEQVYkMZRspu+skDbZXkWnKighSxV
	WI+vjGTUTdNL29ZP9Fe7y9Tr6OG0VJKpMej5aXk2bKTKBNGrvHmTtVeCbSotvuMFhsJnPZFUk2r
	TqVM=
X-Gm-Gg: ASbGncvjikMurWcr8ZgKQVmGm3OXiLUcbKfVid8r6WYBPPNZQIjMCXZMKwryhcJL/1m
	5GHz1EyW4ZTK66c0qVNypHFjrVQScW+p5/PQhRu8ZME2g+VpUh5fifC7gPKVE8IfTH0Q+1QaR1y
	JOMVXDH4c/pwvD2/BN6RJTusyTCSEa1pwA/trq7LcOza9jVG4tUbnAgwBvqOtE0AylhJ8BHvBxs
	7BEzSO/1dnuA4PuEeNHca02ScMcZNM3vr1qN9PDRaoC+8KkiemOez4QRHRibrEFewQgTsD9Fxf6
	T7s=
X-Google-Smtp-Source: AGHT+IGyjVuV4pBk2RBjrEaS2kiLS8WbOs0cKTYDcNrfOkxJR6X9b6Ut2TmMgq1gDrSgYsoLzuqbTQ==
X-Received: by 2002:a17:902:f541:b0:215:5d8c:7e46 with SMTP id d9443c01a7336-2155d8c80a8mr145829105ad.27.1733159355368;
        Mon, 02 Dec 2024 09:09:15 -0800 (PST)
Received: from p1.hsd1.wa.comcast.net ([2601:602:8d00:3b87:cd3e:cdb8:437f:15c1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21589aa5478sm25518415ad.59.2024.12.02.09.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 09:09:14 -0800 (PST)
From: George Harker <george@george-graphics.co.uk>
To: brgl@bgdev.pl
Cc: george@george-graphics.co.uk,
	linux-gpio@vger.kernel.org
Subject: [PATCH] [libgpiod][PATCH] bindings: python: Fix PyDict_Next contiguous
Date: Mon,  2 Dec 2024 09:08:25 -0800
Message-Id: <20241202170824.51382-1-george@george-graphics.co.uk>
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


