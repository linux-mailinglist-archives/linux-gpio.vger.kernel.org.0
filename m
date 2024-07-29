Return-Path: <linux-gpio+bounces-8432-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7C893F364
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 12:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E3451F223E0
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 10:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EF6145334;
	Mon, 29 Jul 2024 10:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAuRh2to"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283921428F2
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2024 10:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722250684; cv=none; b=DsWStpItJnA8Hq3XrvejEGSQkFj8S6/JBICFAX+8+44hye8r5jCkXJqs/pmOOI5mkEcC02VZsi26hlO4lBB9iVweB33U7JdG1/zCqQSz9yV4F+GiT+V7VCQaYy1BMF6tAIbggTs9n+CLppy2hjq14MAn3FwasTE2Cy2lYa0OSAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722250684; c=relaxed/simple;
	bh=s7cZZRmxsDwzRd7DEaAWeVvYCa/invyf1ZkL3j18qD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K6Z9Kw8Uf/EtiQasI3fYFcjIAugph1xJ8IsMAIuL6W+Cte8eXuKZYobyBmE9qL/vPDG27KYVbIuvSU4Sf/DP2QkzGQfKZP27r8DXSNifoM+/gEJ78Cu9J69qhiPKzqDSC0UgFJaFfTapthZOxGEgGJLeWudAqd1p4V77L7iHuIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAuRh2to; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4281faefea9so3033895e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2024 03:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722250681; x=1722855481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYhIC7h0t54lRSrKMID9eYSGpD9atbKVN0wYx/7oAOM=;
        b=SAuRh2toMrzCglKheE4p7zWT70+BUOjuT120qAuNoyzakirWRNX5QER4E0H6PB1Inu
         xjPtmNR/FLpFVVBT3847p8mX0a6Y/zRdsL27yq1b54zHiDskTC7pwGI12b9o1innw0IZ
         VRgGZrqIj4nomE6wJKWXFlPKldgouzv/hItTIn7Mb7oFPoH8N69H+LFvUzN5GIflG8bU
         /BpXS46vyhVFYv79FF/Lrzd44JvGFwUmFEFnNsXnUgYWymLajMplkBPe5xyz59+3HN49
         QNSyLJGPPLLrVVbirDHQcQKZ7anGHhwy2XgEJjvboND0RF/gU/LIeHuKXXC+yrqgseSs
         OLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722250681; x=1722855481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYhIC7h0t54lRSrKMID9eYSGpD9atbKVN0wYx/7oAOM=;
        b=mbZyE+Bu1nwwCoONu4i4kyLROxZq/Od+7kVUGn8i673buhg4Z28Bw0oE+P176oU0ih
         ++IcxHgewkTotWubX1cHtkdwVhcr5QPxf3sE5iPkOZHR1mOc1wjFMKCqH9mR7XT7cRWx
         YTEh6/rkvDLwGMGhKY2UqfpF54UsWRyVCQO9SFXzLAl3sWLs5Xp7Oid+AMUK1aK7zhdV
         grtv9jogUf1buIxQ8Fn+1me2umNTowuByNE0T7RDhWWBYPUZdRdIS80bYZ53k/+5O7pA
         UxP2x7d2IoTB3BhMHP8lau0SAT5FLhoWxDF8z4ueDANbTMOO6w0bcp+oIsgo2hEnlUpZ
         wojA==
X-Forwarded-Encrypted: i=1; AJvYcCVRQpZvwr4vrW824fsPdhvAQgk9i/BA7BdcjUJxBbXXnvdX4u50uXMaNLCfBL1qt2OinOLkfTA1nQg+PlIas0NF+6/UsQIL1I9X/A==
X-Gm-Message-State: AOJu0YyGpwWdjqWl3Q8TW2XUgyUNwTmQuYjBLXdyzgBk3q6EsMdYBu5l
	JUg9T7NIzVFOgJtny8mjkQgO8bYZG/nnoKWPzRa+vH6Yyr77c5Nz
X-Google-Smtp-Source: AGHT+IH+TjAXXUq7uQOJP5RbhAp0jgZiUnsHhIatqHciwABgZo65ZGSw6ClcImNxRKdJk2EwfRGXIg==
X-Received: by 2002:a5d:6b85:0:b0:369:b7e3:4983 with SMTP id ffacd0b85a97d-36b5cee9e5bmr4390940f8f.1.1722250681097;
        Mon, 29 Jul 2024 03:58:01 -0700 (PDT)
Received: from fedora.redhat.com ([67.218.243.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367fc8a7sm11858068f8f.59.2024.07.29.03.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 03:58:00 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: brgl@bgdev.pl
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	ipedrosa@redhat.com,
	javierm@redhat.com,
	perobins@redhat.com,
	linux-gpio@vger.kernel.org,
	warthog618@gmail.com
Subject: [PATCH libgpiod v2 1/4] bindings: python: gpiod: avoid use after free
Date: Mon, 29 Jul 2024 12:57:16 +0200
Message-ID: <3d8b12dd60eec59d4184c0bcc7d575b4eccbc22c.1722250385.git.ikerpedrosam@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722250385.git.ikerpedrosam@gmail.com>
References: <cover.1722250385.git.ikerpedrosam@gmail.com>
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
Reviewed-by: Kent Gibson <warthog618@gmail.com>
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


