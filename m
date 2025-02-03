Return-Path: <linux-gpio+bounces-15277-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B7DA25AD3
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E400F1881DB4
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2939A2054E3;
	Mon,  3 Feb 2025 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rmhBCEey"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1801A204F84
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 13:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589137; cv=none; b=ac3ZWXkedCY+3wCnfFdvPxQyZBU+LPjvq1jPL4XemdTLLV1gdBUFCFtPwuJPXSV6wpYqDRmwE9bt5jaKt1v2whwABJ/Zr0JZJkx58iVqVLBjJRdqBO5oL1YNNeimBwW6cDQK8YXgi8AFjjHRt4+qBbuL6qxF4r0ulKui6aj0ZD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589137; c=relaxed/simple;
	bh=2Z6aViihhJevZSvQW52dQ39lra8yrRAbRMJrzwKKcbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJcrSmlXqDWdJWaVN+ndPuG4dY24WXevEb5vQQd/M2GISHxgoni1UOlt0KGdshzqMgAeSvWM0yLlA31L9L4hLF7IglsBxtrJ9alkVAVAez7xir4MxITbA50rjSU5qKA9Av423aNyV/fQ9X/EQH7AY3i+vH4yUSsUZkweHAEG1nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rmhBCEey; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385de9f789cso3379155f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2025 05:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738589134; x=1739193934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KlHBIP/deu3QaBmiVSNrlbz/6nV4PYgoac8uio9NBL4=;
        b=rmhBCEey72CRrXjsQ8QM1bKg00vNkqe1BpCSNY/IWr0ABfG5LzDVNDKtggBpEyRAQk
         Mz8f5CHduv1MtS7sdQfNWVN7qkaSMf9nhCP3eN44fnP2Xi/Z3I5kPvSCTWNQaSuy7T8m
         JPODSwak+WCntlnDLkDR+tGVQCT9N0TivIfqtz5XI2YpuExQiG0q0H+cwwUKdugrcMRQ
         q7uLW9Dl2D1vZxzsyzXj0jN/6GL9IIDGz5UHue7mMWgnmbOcjH+3HT6aEqE3ipuj2o9M
         oGJVYdaQ48DaylsAHuuv5PCt1YGPdBYsCXH6ek/SIHAUbF+VMIqBUIsHkMTVH8SmFq+d
         rQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738589134; x=1739193934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlHBIP/deu3QaBmiVSNrlbz/6nV4PYgoac8uio9NBL4=;
        b=OL/9Ja1LjXTENfIgwVBbKoX21uwRpsDHkdFciyeOvJxFqftLxl1viRiUnshf8Giqy9
         kR9CBNd8PaTyJJp/gCpkS+HFOBUifTAJ/G4TCxMlLY62y42O+1qOxaUmVuPhGx0P+YHG
         QxUa+H+h8Kot6d8xvreDmsMklFn3QME6BGat9FX2ArYuwtPXjXZEhgFb/WWJr0dodCpy
         YhjiDAe7Zw3OtU2w+YZd3tvH2M+0DwicSzIqUQC5n611kO2JNmQKc25Sch54M4mB/W81
         x8HyXfy0YBkdw3bjGGFvw3HvVM0bauAVOvFU3HYi1nTqfgKfeQAIN0ZvGy8DWe1n1Sbm
         Z32g==
X-Forwarded-Encrypted: i=1; AJvYcCWzxMGLhdGxTkJ9TYnJpt5YSkxUNOYqexqSmULG+aBK67TTOUugGAoeoCdbYw4bxl2bxX5MuxuizqhT@vger.kernel.org
X-Gm-Message-State: AOJu0YzET56JoPV5dYkND4q05kelUJA3x71loY1y2OZWZsJh82RrRcgf
	7wpsAKmzCI4H+IDBsLgC4kgIqVnZSK9qkk+z1xG/qUzbDNENx7BIM/Rzum2pxGkjwXFDmn/QeKO
	NB2g=
X-Gm-Gg: ASbGncvl2S0hIL1iA6HxtlAym8+H+qONLsuQfQ1upEKFQU1aaUg1lTf3Ah/1PvAu81F
	1Rud7PGJrRggCS8dipGiypRwsKePXlGOxyMCiXO8pSZTbAXDRaWBSt8b4/JKqcSaGJnes21OAnb
	kfVmg5S7kQ9WugmUP3aywnlK9SxYdswBIkw/+ucjnLKGF+dfHZaNmc+0hdMR1LZjNyV51Gbiq9h
	cdHTg5CEVifAG0mc+9qM7zuasckFDpBkIgdpqEMKVw2iZd+Ik98gm73YyJ5XMvqC1Sl7gtdfNoX
	ZKj53Ds=
X-Google-Smtp-Source: AGHT+IElexIp9O2ZSg0HBNErx863hKyBohIVuQuxLcnt3gtq6j7avH5KJZShWr7YtoMvvaB0d/OiWg==
X-Received: by 2002:a5d:64c3:0:b0:385:e5d8:2bea with SMTP id ffacd0b85a97d-38c519460aemr17692949f8f.20.1738589134205;
        Mon, 03 Feb 2025 05:25:34 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:62d7:938e:c76:df44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b547csm12913959f8f.62.2025.02.03.05.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:25:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Feb 2025 14:25:04 +0100
Subject: [PATCH libgpiod 2/3] bindings: python: tests: disable device
 before releasing the bank
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-fix-gpiosim-in-bindings-v1-2-d2c9e0f3a29d@linaro.org>
References: <20250203-fix-gpiosim-in-bindings-v1-0-d2c9e0f3a29d@linaro.org>
In-Reply-To: <20250203-fix-gpiosim-in-bindings-v1-0-d2c9e0f3a29d@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pc23lDbBHrG6rFumP3E2gj/12FYEJ6H/AjY9/3t2evg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnoMPL1OUZ0xOEnyYV2meTdV0aqOqWOlZV/hKEz
 LMqya/MEeyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6DDywAKCRARpy6gFHHX
 cswcD/4ojukLQtoklInhAJe/qzRoI/7RZxg6ELqTI21XMwbvVKZ13s8AWp3FQdG45sCEEpneHwu
 X4zQ3/ZD+hBi3wrb3nuYJEuW7AdmN5v2tGt68UWDIXysYILNeWaQP1F/VXhEZP3mXILb3l5j85X
 3eEIDES//RkOsDEKbblv1ee57i3qDDPiLTAk9rSak0FVxZaTg/qo4tu6VMrKp4RgAhaj85bvLaq
 AYpbFDSSXQ+2u6lJh1fK93fN3J8ax+Mtedb8dKWrTTIxwdoJeoQoyJCy3YTZivrHV/vv4vLpdyu
 57tHX51Wn4pOsOazKvA0FHXuq9YzFmhlCWMM8JSOufMuMIvlHgXzf4lECa6nmquH+ZH9lVFVrqm
 9Pjn805zTsDKYkfe5dpBHQThz40URRQMRE0aaXhp1z5HW0hbPtFb2eF7HSs6kKjCNhSMzAP+Bki
 CeQ7TsQW7HjNT7uQrZeZ141xfq2yoRtjqHUo/leGBVlwmsQI/i5gs3Y/eD6dMxS88/i0wPt6987
 B6zJY/gqZQDWOh6xaxWp+VJ47hIZclf7jdW/vBvN+Ac7FbnpO6rG2hAnanOiT8dYlYeY5vDjyWF
 7OyHQr+NvNBFLW/KylvIhLgibJx65urC9hh9g9HNjMrp+swlD5d187EZrKEMWw+MjUwRiawgqzz
 b3lT6ZNNO9cjUWw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linux kernel commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
instantiated device depends on") uncovered an issue in Python bindings
tests where the GPIO simulator device is not disabled before removing its
configfs entries. Reorder the operations in chip_finalize() in order to
disable the device first (if needed) before releasing any other
resources.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/python/tests/gpiosim/ext.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/bindings/python/tests/gpiosim/ext.c b/bindings/python/tests/gpiosim/ext.c
index 272e6f7..cb5611a 100644
--- a/bindings/python/tests/gpiosim/ext.c
+++ b/bindings/python/tests/gpiosim/ext.c
@@ -96,15 +96,16 @@ static int chip_init(chip_object *self,
 
 static void chip_finalize(chip_object *self)
 {
-	if (self->bank)
-		gpiosim_bank_unref(self->bank);
-
 	if (self->dev) {
 		if (gpiosim_dev_is_live(self->dev))
 			gpiosim_dev_disable(self->dev);
-
-		gpiosim_dev_unref(self->dev);
 	}
+
+	if (self->bank)
+		gpiosim_bank_unref(self->bank);
+
+	if (self->dev)
+		gpiosim_dev_unref(self->dev);
 }
 
 static void chip_dealloc(PyObject *self)

-- 
2.45.2


