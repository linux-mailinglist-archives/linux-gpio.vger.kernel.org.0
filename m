Return-Path: <linux-gpio+bounces-8243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C11B3933C6A
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2024 13:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E271282786
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2024 11:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6342E17F4EA;
	Wed, 17 Jul 2024 11:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4g9wFR9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D223BBF1
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2024 11:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721216281; cv=none; b=txvUmpLpC+WuA223I37z6sR/pPbdRhOTZC10xAxmGLM6VvakflRL8LATcPoRZOQhYaBpPW6zjP5aqK87xzkdAmf+rIQYUQhlrv5HngEmU4RhxLuE0LcGSMf4IPslrvOdANAHNkw4J7wMxySXhRwPr0QZNdPmN+zsiU/lYv6KB6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721216281; c=relaxed/simple;
	bh=nDaKwEhGWwlT2me1BhTjil2n1UNUurU/Mz63ebnFIKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTH2oOweXIvGo5Hh/dAhCZiheYRR/4FFax0wQwgeFeuYP4xfMV/1psVYmBexz+V9Z7JKcUb8kkpCO5uboQ2l07hrKJgGYthkEbB02g1KTizaCOukKoObfRQsxrW5Li71V2OLZYlh355q6I4T4/0FLlIecjEz8W9vdMsXeUcWnS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4g9wFR9; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eefeab807dso5645651fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2024 04:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721216278; x=1721821078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6kXqplDLSO/w59wyHz1CzCg9tivFVEXGEWclRYM6C4=;
        b=b4g9wFR955dXlrfnUkkGW7+U7muqn6axj3mNvLxeTso9tXMDUbfbG8JJUJKdC98DUx
         wAeaURDBaOa7Ds7J1PQbf2WnK2vY7EMdfXjFsQKXQ/SVicL0KA5z9g9SGg0+rAiSbwBt
         es2wTkw+904gvjIyLJOC54/IAvHYVrSxC9TteCDeW8jr2Mt3z79AChg9eKR+KfUnq71e
         ojB/Am0i4OMDm2TORYAwNiAX8siWO8KHj3mYI6W8nDUfqyt1kGgizwn7zLNt9xHaAAm8
         2IV7IrPPA50o0ZzzwgmU0RthNCr1pPOy6yjA258UFBdSHk79/ZOYPxCH95sYTpbHZFW9
         t7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721216278; x=1721821078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6kXqplDLSO/w59wyHz1CzCg9tivFVEXGEWclRYM6C4=;
        b=PQyUuJEMqZMuRmUsMywrIwb2lCwOniHReKPHRheugRlmk346MFqAy+WTw2rKsHmVDv
         hnZ56HgUsuScrHt4opYq7DDJtezHmh3ohw+pY3AEkUPK94AerJhaU0eAface+t4U4BbZ
         dL4cxORpSs8q1kbpLf7ttn+WiDfi7g7HrilCW9Nce9ELYQOxim5vMxLdMwTBsdr2RoqU
         Ccc++wPoX/jSQn0DTyusePAHJT+DZc2hqyLmxjXonrvXSpCND7jnN2d6s7vP0x8MYjWn
         AGG0W9kLN9WrBVZAQJZ8VPGiTwEr82q853lGLD7BCzfSwhpdWVdwcWvWK2Mq8PnIAPL0
         osJA==
X-Forwarded-Encrypted: i=1; AJvYcCXETPjDaseqjHnwobjjbyCC/NdjYLyzh3qyGPwwLxAqpuUbxnrXZO8X7S/ykfgedkNdBqi6MA3Nkr+fqzO4sbYNYdrPtORQOq2OKw==
X-Gm-Message-State: AOJu0YwV10vf+heff76hx2/1LpEENyNIQUOdanJ+2hLNT+IElYm5u+Md
	ZY1cPRSgpWaZpWLm6xMVv0Yh5XZdg6vhFGUvZGGCGfUF0TxMTS3nC5xMihCF
X-Google-Smtp-Source: AGHT+IHurOR6hYVY6XPcdgzj1rZWohIhBSymJBZaXFYmnsKJJQfN/3Q1vJpqQSJ0sLc0nlu6uQzjUg==
X-Received: by 2002:a2e:7c17:0:b0:2ec:3d74:88ca with SMTP id 38308e7fff4ca-2eefd0bd59dmr10149901fa.25.1721216277799;
        Wed, 17 Jul 2024 04:37:57 -0700 (PDT)
Received: from localhost.localdomain ([67.218.244.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef4617sm165705635e9.41.2024.07.17.04.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 04:37:57 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: brgl@bgdev.pl
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	ipedrosa@redhat.com,
	javierm@redhat.com,
	perobins@redhat.com,
	linux-gpio@vger.kernel.org
Subject: [libgpiod][PATCH 1/4] bindings: python: gpiod: avoid use after free
Date: Wed, 17 Jul 2024 13:36:41 +0200
Message-ID: <250744d18d2d9f067daafe6c1ed426e75bf5b76f.1721039339.git.ikerpedrosam@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721039339.git.ikerpedrosam@gmail.com>
References: <cover.1721039339.git.ikerpedrosam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`req_cfg` variable is freed and then used, which would generate an
error. Avoid this problem by freeing when the variable will no longer be
used.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 bindings/python/gpiod/ext/chip.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/bindings/python/gpiod/ext/chip.c b/bindings/python/gpiod/ext/chip.c
index 28cf504..e8eaad8 100644
--- a/bindings/python/gpiod/ext/chip.c
+++ b/bindings/python/gpiod/ext/chip.c
@@ -274,14 +274,16 @@ static PyObject *chip_request_lines(chip_object *self, PyObject *args)
 	Py_BEGIN_ALLOW_THREADS;
 	request = gpiod_chip_request_lines(self->chip, req_cfg, line_cfg);
 	Py_END_ALLOW_THREADS;
-	gpiod_request_config_free(req_cfg);
-	if (!request)
+	if (!request) {
+		gpiod_request_config_free(req_cfg);
 		return Py_gpiod_SetErrFromErrno();
+	}
 
 	req_obj = Py_gpiod_MakeRequestObject(request,
 			gpiod_request_config_get_event_buffer_size(req_cfg));
 	if (!req_obj)
 		gpiod_line_request_release(request);
+	gpiod_request_config_free(req_cfg);
 
 	return req_obj;
 }
-- 
2.45.2


