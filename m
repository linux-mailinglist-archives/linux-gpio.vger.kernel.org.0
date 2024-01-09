Return-Path: <linux-gpio+bounces-2097-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F2E828D39
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jan 2024 20:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7205E281F67
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jan 2024 19:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32273D0C1;
	Tue,  9 Jan 2024 19:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hdrjNfLE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1721F3C694
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jan 2024 19:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e5521dab6so676405e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jan 2024 11:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1704827920; x=1705432720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6NMEsq4phHvJ7jczkNQvlaDaQNp47jP8Wsqk8+GEc0Q=;
        b=hdrjNfLEbH46OrqGOm57z8fmMKbY7P1yRt8xurdNO26RMhxBOntkWiHvP00nHxoCcM
         N9pnyYQ5kI1m4ucx/WRmfdVIOuDzZ7By6wIfuzOj7K0hO0sX/iSVnbYPomXY8bGEywPY
         xwxODOpO+xsLLxBo39lwisMJYnt2+Mh4QxMs/nN/5G0W5DnTKP66qF8XDTQlJP5r16pX
         dHtaSVD0UO/+C6dNJlD/es80pylM98EdF+ZycYS+5jrq6AaTI70g6JS8l2IAw5NeYWeY
         CjU+s38J5r4/TP5slY/Y78DBJXAsN10Bn6iCbNpFIgShxK+Bzv/XjrGu5cR3fpamO0+R
         Bauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704827920; x=1705432720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6NMEsq4phHvJ7jczkNQvlaDaQNp47jP8Wsqk8+GEc0Q=;
        b=EvTEtNO3zzD7a3ZAKidt46Au7Pn3moXC+ycnZWCW8PVL/37dQWhgj+Bq7W32E7SKTb
         jO+wBBfvRM/mpSQMJH7AQ240OXI7EiTH0p2/Bk2ZAtWabdMm4S3aGAOvexrNB0tiU6IG
         JdwibxOkVak0lNez+zTn19juX4/D2uwz/7Oxtw7fh6ssubetQOoaav53XVyr+XFaM42H
         iSGTT6+pk5nsOGmeQuW7TpMxAanAkGyUVeGO4O7so7wGcJb+V/M+IlWaio59l5SbLqQn
         0UtVDDXoTOb7QlD9EZxeYJENEWRjc+O/M2GZQVDcNORg1O/2gpCrJqUzsHt35Enjj+xC
         2l4Q==
X-Gm-Message-State: AOJu0YyAUojqodLkoBVQWDDEamrZahmGRBGgKUDmD5k6hVDzoCZy7LvQ
	rntMu9LqZc5yOLXMJlypM5yuM1d7Q5xOiA==
X-Google-Smtp-Source: AGHT+IHLuMH1XL6spPQGi8IfTEcGyMxwZeMnOK7MpMaOyjGAsDRqqw0T0+D/lSbm0Qwgibwe7TjFpQ==
X-Received: by 2002:a7b:ce0d:0:b0:40e:3a6f:9b1e with SMTP id m13-20020a7bce0d000000b0040e3a6f9b1emr3420451wmc.109.1704827920227;
        Tue, 09 Jan 2024 11:18:40 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f70b:9940:beaa:1728])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c35c900b0040e418494absm4530342wmq.46.2024.01.09.11.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 11:18:39 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>,
	Maxim Devaev <mdevaev@gmail.com>,
	Phil Howard <phil@gadgetoid.com>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH] bindings: python: fix package installation with Makefile build
Date: Tue,  9 Jan 2024 20:18:28 +0100
Message-Id: <20240109191828.73100-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The modules are installed in the .egg directory, and therefore cannot be
imported after that. Additionally PIP tries to remove the global gpiod
module if it's not invoked with the --ignore-installed option.

Specify correct --root and fix the --prefix switch.

Link: https://github.com/pypa/pip/issues/3063
Suggested-by: Maxim Devaev <mdevaev@gmail.com>
Reported-by: Maxim Devaev <mdevaev@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index 804b214..65964c7 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -36,7 +36,7 @@ all-local: python-tests
 
 install-exec-local:
 	$(PYTHON) -m pip install dist/*.whl \
-	--prefix=$(DESTDIR)$(prefix)
+	--ignore-installed --prefix=$(prefix) --root=$(if $(DESTDIR),$(DESTDIR),/)
 
 SUBDIRS = gpiod
 
-- 
2.40.1


