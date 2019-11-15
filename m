Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B600FFE064
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbfKOOpL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:45:11 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41721 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfKOOpK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:45:10 -0500
Received: by mail-pl1-f195.google.com with SMTP id d29so4795913plj.8
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mhy6RLeafK/iAD/QrQ/drYMOwu1/JmvZR9G9m8TgqdI=;
        b=L3u+5Ul6cPrXp8CLVzIfMhQbLC7tJrKxxkx3ka8lK8BXa4eiYQWlETnX0p48gMphQb
         iuoMqDhA4u/8gW3aCRknX0CU0QTphcYG3kuINeEOcetDrBBKjDVTa0H1Y2lduJIJNOIr
         mV2juGU2jrencb3AiiNnnLspNsPfs0DmWZ5k2zqI3CZQc4oUiIH5WB0B610FeKsTEInr
         Li2ZXRkgLIHAhZz9ScHlML7o3rBpnbpv18RRL88YToRKS+J+dIzXpLnqLIbuErol2IZx
         9d/7DgZD0bkb+wBN4zqwfh8eWhNNmxjAtezLICRBfq5WGypN+BDhj82iylVucwaTqfpb
         xBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mhy6RLeafK/iAD/QrQ/drYMOwu1/JmvZR9G9m8TgqdI=;
        b=YGyG9CjLOQnsCZHqzYWdWLesZ5UTgOCF/uawSTK+mFWCSaz7r64u1WbWJp7KiPp4vF
         oHfQUZD8t66WabWDAvKQGYgwUfKarez5I6o3ZsPzs/vp8zXtKbJaCeDKnoq34oxaSKrd
         +0uBdGB+a6bNsMzQ8CFPQI12RpFmDOjCq4LR/ohG3Awf1T46hviUgR9EsUaFwhERO+mB
         Jmq8Qf254y+Qq0jl3m23v+V3lWYCvIOLdFmZeVhCVTSyaWq9TD8/444EDgtPPseo4gn4
         NXJxt6tqql92SJ2rR7HhXPUApXGXgygiPYNNMhlPs+s6eWgMaCZM1Uu1yEboOzfOiVVq
         mzvA==
X-Gm-Message-State: APjAAAXUXND6WLXYPp0ioX6NcAOR9jHznAGunVb2sZ2Wzt6LdnxhSD8f
        E3dmgejdVH7YBDTe7RpzO30H0R9XM5o=
X-Google-Smtp-Source: APXvYqyz+l5L8Sc0Ih/sCjH80Bxdb9RIxtch4PmnE1vh9bjYsRPjLTA7nfH33sJF/InLqvVpZ/s62w==
X-Received: by 2002:a17:902:650b:: with SMTP id b11mr8976523plk.60.1573829109061;
        Fri, 15 Nov 2019 06:45:09 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:45:08 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 09/19] bindings: python: add support for bias flags
Date:   Fri, 15 Nov 2019 22:43:45 +0800
Message-Id: <20191115144355.975-10-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
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
index d3c15ad..de8d6d1 100644
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

