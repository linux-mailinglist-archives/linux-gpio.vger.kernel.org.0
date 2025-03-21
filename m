Return-Path: <linux-gpio+bounces-17870-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7655A6BEAE
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 16:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10218189DC79
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 15:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CBD22C33A;
	Fri, 21 Mar 2025 15:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0HM4ZdUr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF6B227BAD
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 15:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572194; cv=none; b=C3rNFfOvCX2LMf9TQtWSzshAv9gdBgKvvDpXOimbzSGKEGppk3jnk8THN/Zq2vnn+89PD9ssNz3yaU86JjbtIKlJr143zuH3sib76NS6o1HbkmstPGJ9LTYwWOrSgGvW7bDkvr2WHb6rVQ1vFo42q7m/xgEWethHXXfX4/ERoEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572194; c=relaxed/simple;
	bh=7OKHQYItsHJqowDVAvvbjLqYjpAIU2xdGIEQwzoW4CU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tjD6Y5wiI4p9BvvKlDtNXqMmHkObX0lIoMc1XvwaBP21+APmsxjolz59q07yPUeSCIMKbwuhvBudTmNWrvwbqkJLF2cZcO4TBNkyWcFtIa124hmNX+P4I59mZ/iRhffH52zEbpmnXi6NoZach5g0MVLMKJPC/1FnAOeRECNj+C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0HM4ZdUr; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so1757693f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 08:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742572191; x=1743176991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJRuevggM9BCuwKtfZ7IFoWvomRPS19U+6lJSmLRj9k=;
        b=0HM4ZdUrW7caStmrIICgevWgLmgZDNYlJmuB6tsEn5yWaexDeO1XqdR+3DCkWasgmW
         SG+q1Wvyn80KJVDUP2l33znW/wkxvoAZAtfp7c13pLL8nf2GF+An4EGvkKy8Kho/td+w
         dmuD5fdwAyPTIskfteFEDMjdIswf+RUdAKvHXqQcb6H5k/LvZ6s1bi2Ws/jGLDCGMJxZ
         0BeoCZeDEqpIs3+weU0muM/nHR+hHnyzkc6BsgKCvTej8xkEVUs+3fX5kEVPe0DeBFEr
         xB4j1um2dotIjTNHXM9olSwBtOeOfYN3edPiLYhfnp92Gv1L+HdLJ+qI0Nd96LEdO0Ei
         kjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572191; x=1743176991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJRuevggM9BCuwKtfZ7IFoWvomRPS19U+6lJSmLRj9k=;
        b=hARyNZ2p2K9FO/t5BK0JMM5lpwTd+dZiye7Hu+Q+istK7M2Q3H9MmovfDzIHrYPpLc
         j1unLopvYSo6oFcGOXS7KBRELw74QL+x6W54ago6u4gYLFssOpu3V6O4UX+J/IEUwkMl
         t8nBrzkba7QwcH4l9G/AlqO3FjgKSzgX+Z+LF5tKy9kAQkj5o9WNWRjsVxOFSNxgEBb+
         G4eZsUeg9Z3p1OfIm8+QhDHMGFbVWkuwpY525qL5pQXXEI7qmMpHX1ncJgu2yZb0Ykz+
         A4mFCbo2lGzg/yCZzwu//f/tUVGY+QvCEH9bOozortwj2ohrCn2L2xHd4GtWvr6xxiIZ
         db6A==
X-Gm-Message-State: AOJu0Yx4ztpwq/hcamu5fd7K2HBBSlKx4i/7sDhGaXSqdlVIkDfx9a9Z
	dEQ3gQlvb6yXcxVP6nb3DWOB9Vd8oG8hx9Fki2IRz/CHzxtsGf+S5hATO50lf9j74t1ahScmPbX
	x
X-Gm-Gg: ASbGncvGNmOJoTxw/WrituvPdkrz4lUWeiExpHGq77I1OdArC0UfP40px/dvlKRa4PY
	ODip89RuzQcK14voBERacDNlojZAWCf6g1SYe+6kVmrDOa6sta/VBfeVM0c5VwrUpFUN/+yio75
	M5AE9d/KF4IR5ssdyf9qoCA2M3SgDVpiSZnQ1xP0kLRDmk+94fKKMzIlQNYjzO4IxvvBGfevS/h
	OMz4IAi3FXDNki+CIUVLL40ebDVcAN8pOWJULZAgbtdwK2vYuGnwIEKP1CnbNjfGapMo5ls1ds8
	hMm6a7QAoNPBYPXGLcKaLKBSZAuVC0b60RaFew==
X-Google-Smtp-Source: AGHT+IGoMK71oHcnm8gGvUy7+eexqEWpSgYvAKRXst7E/Ia5gJhiHUVUXQvYPze1X3KyZ1IImHsKoQ==
X-Received: by 2002:a05:6000:2cd:b0:391:3406:b4e1 with SMTP id ffacd0b85a97d-3997f900ef6mr4131661f8f.15.1742572191553;
        Fri, 21 Mar 2025 08:49:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1aa4:f3ec:847a:32d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3b4bsm2664406f8f.25.2025.03.21.08.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:49:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Mar 2025 16:49:38 +0100
Subject: [PATCH 6/6] gpio: TODO: add an item to track reworking the sysfs
 interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-gpio-todo-updates-v1-6-7b38f07110ee@linaro.org>
References: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org>
In-Reply-To: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=oXnm7kFeWpxFuHmJEsF/8vqjoynKGvtwa0r5iOnzF38=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn3YqajgZ7/ioHcsB+lna5BBxd5JgJmhmErvNPc
 xMN3wPkHEKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ92KmgAKCRARpy6gFHHX
 cozWD/99YTP37CBb+/F+umsRv41EwDFQ5yT321295LWC80OXMDkfntiLNtu4784iaRX6HgJEaPc
 BDoKB1L//OQHwsJ91n9yvYnYyzwd0XmzDzWCfmuMh4DMjaWkLv32D/+l7k6FqSpoTq/FXu8pdg7
 omxhRx6XQ/b+EaJq7syWKEBCvDAqO8wS9tX3DTh+ELRF4tKzIV1WBV9HuzzCog9TUXP2g7Pp8w0
 8+ON8sEYBP4O7XtbiV+K1RZQLurqlkZyJPWu5wk1eCtIagsb/1r2Lhd7OW0QEYJKnitsUomUH6B
 i+TSyd2GEoK3jmVER8bnp2KKpOdMo5bLrh+585tplArzwPKGRLsC9W82M7j26ZQr8JIzg37opOH
 um3i2xfNLIHzFZBmx5V6Gj657MX3JgIz+Ox1VOFWeJo1EP8BwGjHuAlvWDV3rIvBvSZWV33Hbny
 niceejOmkhfC7BagUfT/BT3Copi6ns1EiLqnN9itUFB3T16pqf1MtVKFMdkwSPCXRQFPr+x9RNM
 wMMOEt1iqAeAzdUF7fZP7mhTsKDbv9HzkfYim98fmI7QDZVcG6oiDuOp6Sf1s8/GzC73M5z83v5
 bdSQqvNT7lnIASDvDbV7ywfUO/xv6Nv5l8mX0aFkm/So9krzW3gBB6gnHeBtv63FQcaS/I8Zf/9
 elTylKnoeEZtyHw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It seems there really exists the need for a simple sysfs interface that
can be easily used from minimal initramfs images that don't contain much
more than busybox. However the current interface poses a challenge to
the removal of global GPIO numberspace. Add an item that tracks
extending the existing ABI with a per-chip export/unexport attribute
pair.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/TODO | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 3abf4805335f1..b5f0a7a2e1bf1 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -173,3 +173,16 @@ value back to the caller.
 We've now added new variants - set_rv() and set_multiple_rv() that return an
 integer. Let's convert all GPIO drivers treewide to use the new callbacks,
 remove the old ones and finally rename the new ones back to the old names.
+
+-------------------------------------------------------------------------------
+
+Extend the sysfs ABI to allow exporting lines by their HW offsets
+
+The need to support the sysfs GPIO class is one of the main obstacles to
+removing the global GPIO numberspace from the kernel. In order to wean users
+off using global numbers from user-space, extend the existing interface with
+new per-gpiochip export/unexport attributes that allow to refer to GPIOs using
+their hardware offsets within the chip.
+
+Encourage users to switch to using them and eventually remove the existing
+global export/unexport attribues.

-- 
2.45.2


