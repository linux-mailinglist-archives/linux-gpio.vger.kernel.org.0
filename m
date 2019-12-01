Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C79210E03A
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727213AbfLADY7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:24:59 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42898 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADY7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:24:59 -0500
Received: by mail-pl1-f193.google.com with SMTP id j12so14609855plt.9
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ji4XS3PkDfmdwlRr49EB6DYi3k4STZ5B6ixXS4OLMWw=;
        b=MxjhaYIihvK3Z3D49beV4r1+p86unpaVj0+cv3w3CGEQGu6t1bFkvlcdaozVF/BVva
         4+JmAPopzBAGLO6Naxbwo/3EC6I6eIUGSGlukkC7BJTGaztEsSZ4PyicWa78ra82sywg
         rHCfnafbpEEI3chuxWhL9BIvI4SizE1+HdWX5JeAwCqpN6H3GU6Xv4BXSRo3P+dlFg/3
         v2Ki10xdY+P0sPWKOHac/zvMzcuPQzaluHTXqv8w9ZarQDAO7NDyZnWRWUpjoCsmNkxv
         Sonr5u5WE55amSNDZlCYdxmHqdGPjL9LDUlpuQGVPwNE6QGBAwkPu0jxLX8MjMqzWSp4
         wHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ji4XS3PkDfmdwlRr49EB6DYi3k4STZ5B6ixXS4OLMWw=;
        b=OVJfKFABtH//KWygiXiwuDA/JyJpINYGmgpr29QXau3JBiKSyQFMS/VyXM8lafZAJo
         ciFo20MgsiiJknflfjwiF7tx1xcAaM2hc8gLs02LowJ2QAMEGz8af1FhOiPK2TQGH/Uk
         IpRueRfHcVoCktbTK8g6RYJULvnJThzNeJGKOs1Hs77ZxHrRrB204jdC9GaXjUE/+0fy
         xxTNUb1b0RvGQTgOeNRlaJpCwBQ5ZifOeBU4AIiulVgUYeDKhkWJ4DgZqJWPH1xc18R+
         i75rpt26rOedSAagcQLZtNsj5q+FBE1t5OeYobnJIqczOuOWPvlinXGc9BR2ORxjeStB
         +Ksg==
X-Gm-Message-State: APjAAAV+rQj4aUsMXxoPSx4+VZQoqXuoKY9j78w06ubaFZjNbt+YGRUD
        3pSiLkXeQwdT9KXnbFABGvTOEOhr
X-Google-Smtp-Source: APXvYqx0AE3ihmIWz7FpKYqZPD3+UKGVhTyHHhqcNkWIv2DJKmuvz/i9WbY9QAxZMqSOa7K8W6m8mg==
X-Received: by 2002:a17:902:8f96:: with SMTP id z22mr9256774plo.11.1575170698518;
        Sat, 30 Nov 2019 19:24:58 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:24:58 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 05/20] bindings: python: add support for bias flags
Date:   Sun,  1 Dec 2019 11:23:52 +0800
Message-Id: <20191201032407.23589-6-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for bias flags in line requests and returning the line bias
setting via a bias accessor.

Based on initial work by Drew Fustini <drew@pdp7.com>.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/gpiodmodule.c | 82 +++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.c
index 2f6ef51..4723771 100644
--- a/bindings/python/gpiodmodule.c
+++ b/bindings/python/gpiodmodule.c
@@ -60,6 +60,9 @@ enum {
 	gpiod_LINE_REQ_FLAG_OPEN_DRAIN		= GPIOD_BIT(0),
 	gpiod_LINE_REQ_FLAG_OPEN_SOURCE		= GPIOD_BIT(1),
 	gpiod_LINE_REQ_FLAG_ACTIVE_LOW		= GPIOD_BIT(2),
+	gpiod_LINE_REQ_FLAG_BIAS_DISABLE	= GPIOD_BIT(3),
+	gpiod_LINE_REQ_FLAG_BIAS_PULL_DOWN	= GPIOD_BIT(4),
+	gpiod_LINE_REQ_FLAG_BIAS_PULL_UP	= GPIOD_BIT(5),
 };
 
 enum {
@@ -72,6 +75,13 @@ enum {
 	gpiod_ACTIVE_LOW,
 };
 
+enum {
+	gpiod_BIAS_AS_IS = 1,
+	gpiod_BIAS_DISABLE,
+	gpiod_BIAS_PULL_UP,
+	gpiod_BIAS_PULL_DOWN,
+};
+
 enum {
 	gpiod_RISING_EDGE = 1,
 	gpiod_FALLING_EDGE,
@@ -358,6 +368,34 @@ static PyObject *gpiod_Line_active_state(gpiod_LineObject *self,
 	return ret;
 }
 
+PyDoc_STRVAR(gpiod_Line_bias_doc,
+"bias() -> integer\n"
+"\n"
+"Get the bias setting of this GPIO line.");
+
+static PyObject *gpiod_Line_bias(gpiod_LineObject *self,
+				 PyObject *Py_UNUSED(ignored))
+{
+	int bias;
+
+	if (gpiod_ChipIsClosed(self->owner))
+		return NULL;
+
+	bias = gpiod_line_bias(self->line);
+
+	switch (bias) {
+	case GPIOD_LINE_BIAS_PULL_UP:
+		return Py_BuildValue("I", gpiod_BIAS_PULL_UP);
+	case GPIOD_LINE_BIAS_PULL_DOWN:
+		return Py_BuildValue("I", gpiod_BIAS_PULL_DOWN);
+	case GPIOD_LINE_BIAS_DISABLE:
+		return Py_BuildValue("I", gpiod_BIAS_DISABLE);
+	case GPIOD_LINE_BIAS_AS_IS:
+	default:
+		return Py_BuildValue("I", gpiod_BIAS_AS_IS);
+	}
+}
+
 PyDoc_STRVAR(gpiod_Line_is_used_doc,
 "is_used() -> boolean\n"
 "\n"
@@ -752,6 +790,12 @@ static PyMethodDef gpiod_Line_methods[] = {
 		.ml_flags = METH_NOARGS,
 		.ml_doc = gpiod_Line_active_state_doc,
 	},
+	{
+		.ml_name = "bias",
+		.ml_meth = (PyCFunction)gpiod_Line_bias,
+		.ml_flags = METH_NOARGS,
+		.ml_doc = gpiod_Line_bias_doc,
+	},
 	{
 		.ml_name = "is_used",
 		.ml_meth = (PyCFunction)gpiod_Line_is_used,
@@ -1030,6 +1074,12 @@ static void gpiod_MakeRequestConfig(struct gpiod_line_request_config *conf,
 		conf->flags |= GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE;
 	if (flags & gpiod_LINE_REQ_FLAG_ACTIVE_LOW)
 		conf->flags |= GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
+	if (flags & gpiod_LINE_REQ_FLAG_BIAS_DISABLE)
+		conf->flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE;
+	if (flags & gpiod_LINE_REQ_FLAG_BIAS_PULL_DOWN)
+		conf->flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN;
+	if (flags & gpiod_LINE_REQ_FLAG_BIAS_PULL_UP)
+		conf->flags |= GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP;
 }
 
 PyDoc_STRVAR(gpiod_LineBulk_request_doc,
@@ -2313,6 +2363,26 @@ static gpiod_ConstDescr gpiod_ConstList[] = {
 		.name = "ACTIVE_LOW",
 		.val = gpiod_ACTIVE_LOW,
 	},
+	{
+		.typeobj = &gpiod_LineType,
+		.name = "BIAS_AS_IS",
+		.val = gpiod_BIAS_AS_IS,
+	},
+	{
+		.typeobj = &gpiod_LineType,
+		.name = "BIAS_DISABLE",
+		.val = gpiod_BIAS_DISABLE,
+	},
+	{
+		.typeobj = &gpiod_LineType,
+		.name = "BIAS_PULL_UP",
+		.val = gpiod_BIAS_PULL_UP,
+	},
+	{
+		.typeobj = &gpiod_LineType,
+		.name = "BIAS_PULL_DOWN",
+		.val = gpiod_BIAS_PULL_DOWN,
+	},
 	{
 		.typeobj = &gpiod_LineEventType,
 		.name = "RISING_EDGE",
@@ -2381,6 +2451,18 @@ static gpiod_ModuleConst gpiod_ModuleConsts[] = {
 		.name = "LINE_REQ_FLAG_ACTIVE_LOW",
 		.value = gpiod_LINE_REQ_FLAG_ACTIVE_LOW,
 	},
+	{
+		.name = "LINE_REQ_FLAG_BIAS_DISABLE",
+		.value = gpiod_LINE_REQ_FLAG_BIAS_DISABLE,
+	},
+	{
+		.name = "LINE_REQ_FLAG_BIAS_PULL_DOWN",
+		.value = gpiod_LINE_REQ_FLAG_BIAS_PULL_DOWN,
+	},
+	{
+		.name = "LINE_REQ_FLAG_BIAS_PULL_UP",
+		.value = gpiod_LINE_REQ_FLAG_BIAS_PULL_UP,
+	},
 	{ }
 };
 
-- 
2.24.0

