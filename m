Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 335FDCC04D
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 18:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390233AbfJDQLs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 12:11:48 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:39861 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389835AbfJDQLs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 12:11:48 -0400
Received: by mail-qk1-f193.google.com with SMTP id 4so6301765qki.6
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2019 09:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R07EKHfHzY/HdNN/noW7yeQ0bjZQh+4YnPBELSh0yDA=;
        b=VQzujsrLoyjMGoF+OydWTdVN4MTRcjjwjBmukKfhbJRAF6AYFjhPetMQ1bYs44uwlV
         ADu/wSEZkfv2RUq9r5hsQ6i22oY9MNbphvSBy2qTEWZdmXcikMCIYbBHT4hKQ5Z6+hSJ
         ZCj4PYXzV20KgYCbrBv2oADF+56ljQP9vdkIzCnqXZ3i5o1mGAEC26KrbnhAbAIneuI9
         N59FfrmAZYV/Z7CLmYs1RhPZTEq8k3XVNpr34DbXWF0/lwxAAJR62dcs/UKOpFuLK58K
         e9HRXdmh4ut1ZK5d3as7TKTO7k24rFRLIL0SmRxDKwAo4HRVhAH3ljUWjUyk5BwZbIJ8
         z70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R07EKHfHzY/HdNN/noW7yeQ0bjZQh+4YnPBELSh0yDA=;
        b=qENT0HhSeirynyt/dCv7Ng9EmiavMUzY6QOFDYSFIbQn4jI3j5zUywa1Ex8fJEnltd
         Y6mTpLoG6viNHnlIT0uuGyXuoIV4raBfpBFVA6Fsvhiy7565P1Gui/kd5m+gL6njD/7n
         8VeShHknMMaEMLtnwG+VJaBeScCeYLytfKm3uBSLk9LQAe6zGRGMRNGCT8FhFUB2ep9p
         LMLFKcUqAUYdgLnOJnmmPsfWzCGx4y+Hv0G9pOXnwIr9yE4+a2vyIx4JsAblfhYG0Ij4
         HZ6OKgKzcIU3njCKWPU9Qidi9D2eoX6zIhp8dTYvM9ux6Dk+mQD73e5FtvKMnIoQdF8T
         3r8g==
X-Gm-Message-State: APjAAAUCUg4iyV+rtb5lMWZDyDIwB8X9j/rG2q78yl2TLpIGxZSxP608
        +zYhyHMyH8LgnGXmILF5S2IVeJ7l
X-Google-Smtp-Source: APXvYqxSoApMia1dbC0AXmKJgo3gnV4M1IeFH5QhGBxGAQDSh8bsezSDPQUXN8MEXLHLGya8b3cTSg==
X-Received: by 2002:ae9:d803:: with SMTP id u3mr10475938qkf.131.1570205506072;
        Fri, 04 Oct 2019 09:11:46 -0700 (PDT)
Received: from dhcp-172-16-33-230.uml.edu ([129.63.116.33])
        by smtp.googlemail.com with ESMTPSA id i30sm4517303qte.27.2019.10.04.09.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2019 09:11:45 -0700 (PDT)
From:   joelsavitz@gmail.com
To:     linux-gpio@vger.kernel.org
Cc:     Joel Savitz <joelsavitz@gmail.com>, fedora-rpi@googlegroups.com
Subject: [libgpiod] [PATCH] build: check for python-config in configure
Date:   Fri,  4 Oct 2019 12:11:26 -0400
Message-Id: <20191004161126.13814-1-joelsavitz@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Joel Savitz <joelsavitz@gmail.com>

Currently, configure succeeds when python is installed without its
development components, i.e. python-config and headers. The subsequent
make will fail when gcc cannot locate Python.h.

This patch fixes that behavior by throwing an error at configure-time if
python-config cannot be found.

Signed-off-by: Joel Savitz <joelsavitz@gmail.com>
---
 configure.ac | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure.ac b/configure.ac
index 41321c1..066c1ad 100644
--- a/configure.ac
+++ b/configure.ac
@@ -183,6 +183,8 @@ if test "x$with_bindings_python" = xtrue
 then
 	AM_PATH_PYTHON([3.0], [],
 		[AC_MSG_ERROR([python3 not found - needed for python bindings])])
+	AC_CHECK_FILE(["$PYTHON-config"], [],
+		[AC_MSG_ERROR([python3-config not found - needed for python bindings])])
 	AS_IF([test -z "$PYTHON_CPPFLAGS"],
 		[AC_SUBST(PYTHON_CPPFLAGS, [`$PYTHON-config --includes`])])
 	AS_IF([test -z "$PYTHON_LIBS"],
-- 
2.21.0

