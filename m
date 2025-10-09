Return-Path: <linux-gpio+bounces-26940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EC7BC931D
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 15:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 918B24F35C8
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 13:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A42D2E7199;
	Thu,  9 Oct 2025 13:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnUICDUD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670F42E7166
	for <linux-gpio@vger.kernel.org>; Thu,  9 Oct 2025 13:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015146; cv=none; b=bSNQlRYpIeDGgnMNZcvx7+ytpyOdwJFG1TtnsewZA6lZ20sqQLZEWCXspL9FTPYgsfYErR6P1GBfy+vDJ6RjofxG42h2s80EpCDUxIkjNopD6vHyzP9+0yn4KGSmX7nLGnpqzTBmsZj1LXHYrYWlMQqf+UVTvq1FKArioSJknM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015146; c=relaxed/simple;
	bh=pNzDT/3hiVVZkJDjggXVU6EmIFHBdITA9OhXwVGnN+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i710o4UNhvgBuxQKYQ9jDo2/YMCJDFVFFSB//szYnGdFXiAVmKDV9b6cPoBVly9PUWy05B2ZAU5KuroqomgvZhr61OqM4a4EM4VTJ6Jq2UtTLZO6qXY9yzc9Ps7a4XTrBZg31wgFIA2q6Q3owpyqtZyv50D5VwC8dOn0ut7Xoew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnUICDUD; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-42f68a0a89aso8006465ab.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Oct 2025 06:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760015144; x=1760619944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zPiJLdRfcqYNWH1uSIYCPppVmQ9jPk3/mEgHCc3HEU=;
        b=CnUICDUDKsHI/cCWKNbpA9uBkz+H71H6lAtpM8ji24YLsj7GQ9HvL+mbpwU3p8an2q
         dvPp24fVzlvfyFBmJ0jqxiWObZgZQK+NSyTnyZSjJRXd2inIoGSQ423piPMfo7YXmwmW
         4HTC64REad+hox838bH8MKrAifKzin2EpDX3C+5JbhluMq3zX4T/iB/GVg1aEYl98t9/
         cDeu76UR3fhTRX0+4heKC4kVlKHGi7KY4vwKem1ulW1xlMHeu6vsyQBj3D8gKLhigHkF
         19P08JhIJlTl2IkPA7Llh2CwFkWZxNFgwOA/4Zf2z8TQdyCFY7HDU9JNDEHvkw4kmE4+
         pchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015144; x=1760619944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zPiJLdRfcqYNWH1uSIYCPppVmQ9jPk3/mEgHCc3HEU=;
        b=Df8+V6lVOOffNMEc/0lafprsZefbMjGqh4yEgNeG/563xxd7aFoj58oSv/ablx9otv
         yZLO9Ntjjy3AAREArGkdbWpbqDDYOgUPFb2bv1LRcKchgzqd1Ypy+tGYnxKooxhLJ3dw
         9itOL9Od/aq84YeQIjd6i7EbexqzStC+Gsb1eni0vIz5s6vp4so547OS2BnqhZO/M9DH
         Ih+qWnuv3ObPlPrANocUA+HTes/CypD/bK7fU0U1qJK3wScj82db/rCgk0K8eH8m5tnP
         IsFK1vy+UEtlfnBti99rT5yeb7cgNP9Dy+gB/h4bD20YSCMupPDXmxqhs77boH3XqPzr
         m4OQ==
X-Gm-Message-State: AOJu0YxvqkmZ3T7a4t8kQn2/vK5290g+NDbU+PV69RsfWZvoGLLVD/9B
	PScjKOgtulyYOeqYm0fMqjbsvwibZ4q+nfL5Ll2YI2WyHQHbEIE+5GcW5O/eeFhz
X-Gm-Gg: ASbGncuXMIz0QlLab1Jtp0oT7J9lsbM2rL6D97Uu0yLzFXBzd6vG2N/sT7rGU5v88tb
	8ETXBuBNd4TF+0a8pNz8nFdAifOHNPhouoRS9HfYvkZijvaUm8msGZH1omLS2XrTCB3FHBONyRb
	TAR/qB98JuLml2l5pcc0oDAYEaSLNMixuiKLqKpS7gckO5GQLQEtAGXl00NgceWvxjAx4ZAwaBk
	gbZ9KTcxe8qgES9k7Dnk9y1tjM18u0tkUi5UtwbE6ei8QMfvvQutUk4RZ2gaMGri6U7GJRyyVfF
	hpLMmi1F9pi++pAbnNsPboI35Hd++SJ8TbVfWKqbZY70LbW6wHOWRwPksJGzzgIIuHOlV3ghZFl
	JOvd7SbXtvbVvyoNeGxhBHuv9BxYIkI6leNQxCTwBrRAuoKtZW98=
X-Google-Smtp-Source: AGHT+IHtRr5YMBGfo28SMM2Yvq0GUgSFBX1x5j2w2qFgRXscOo7xwJdlpcHdeVKKI4b+dxKRmyK/YQ==
X-Received: by 2002:a05:6e02:2489:b0:42f:9649:56b4 with SMTP id e9e14a558f8ab-42f96495934mr5771995ab.13.1760015143749;
        Thu, 09 Oct 2025 06:05:43 -0700 (PDT)
Received: from vfazio4.xes-mad.com ([162.248.234.4])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec07cf7sm7899137173.52.2025.10.09.06.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 06:05:43 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: vfazio@xes-inc.com,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 7/9] bindings: python: ext: add ability to query line name
Date: Thu,  9 Oct 2025 08:05:13 -0500
Message-ID: <20251009130516.3729433-8-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009130516.3729433-1-vfazio@gmail.com>
References: <20251009130516.3729433-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Investigation has shown that the construction of the Enum values to
create the LineInfo object is expensive [0].

Add a method to retrieve the line name from a given offset without the
overhead of generating a full LineInfo object.

[0]: https://github.com/brgl/libgpiod/issues/149#issuecomment-3319448712
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/_ext.pyi   |  1 +
 bindings/python/gpiod/ext/chip.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/bindings/python/gpiod/_ext.pyi b/bindings/python/gpiod/_ext.pyi
index 1beb80d..31fd352 100644
--- a/bindings/python/gpiod/_ext.pyi
+++ b/bindings/python/gpiod/_ext.pyi
@@ -47,6 +47,7 @@ class Chip:
     def get_info(self) -> ChipInfo: ...
     def line_offset_from_id(self, id: str) -> int: ...
     def get_line_info(self, offset: int, watch: bool) -> LineInfo: ...
+    def get_line_name(self, offset: int) -> Optional[str]: ...
     def request_lines(
         self,
         line_cfg: LineConfig,
diff --git a/bindings/python/gpiod/ext/chip.c b/bindings/python/gpiod/ext/chip.c
index 1e97d7d..98435d9 100644
--- a/bindings/python/gpiod/ext/chip.c
+++ b/bindings/python/gpiod/ext/chip.c
@@ -147,6 +147,32 @@ static PyObject *chip_get_line_info(chip_object *self, PyObject *args)
 	return info_obj;
 }
 
+static PyObject *chip_get_line_name(chip_object *self, PyObject *args)
+{
+	int ret;
+	unsigned int offset;
+	struct gpiod_line_info *info;
+	PyObject *line_name;
+	const char *name;
+
+	ret = PyArg_ParseTuple(args, "I", &offset);
+	if (!ret)
+		return NULL;
+
+	Py_BEGIN_ALLOW_THREADS;
+	info = gpiod_chip_get_line_info(self->chip, offset);
+	Py_END_ALLOW_THREADS;
+	if (!info)
+		return Py_gpiod_SetErrFromErrno();
+
+	name = gpiod_line_info_get_name(info);
+	line_name = (name == NULL) ? Py_None : PyUnicode_FromString(name);
+
+	gpiod_line_info_free(info);
+
+	return line_name;
+}
+
 static PyObject *
 chip_unwatch_line_info(chip_object *self, PyObject *args)
 {
@@ -333,6 +359,11 @@ static PyMethodDef chip_methods[] = {
 		.ml_meth = (PyCFunction)chip_request_lines,
 		.ml_flags = METH_VARARGS,
 	},
+	{
+		.ml_name = "get_line_name",
+		.ml_meth = (PyCFunction)chip_get_line_name,
+		.ml_flags = METH_VARARGS,
+	},
 	{ }
 };
 
-- 
2.43.0


