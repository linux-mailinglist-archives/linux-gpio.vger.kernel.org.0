Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 183082D9B89
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 16:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbgLNPza (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 10:55:30 -0500
Received: from www.zeus03.de ([194.117.254.33]:58926 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732365AbgLNPza (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Dec 2020 10:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=MgKAmJt9PnywVrtwDwlQHF5wyQO
        xjUEyO9NxyW/R5OY=; b=lShBQ9zgmn3jDec4KA5lpaB7bp4iDVNClRa0zzKsa6T
        44NHWs1N33yo+548EjZ1fQmTOc6jTiIz6MHWs6WMVnjxnGGFTgD8VpaMjz8+f7s/
        BBKEUNiDnC3/gOUrJaCJn3ZIoow7vB0bylFu87CUC7Ob88WI4u07M8lf5pZbM5N8
        =
Received: (qmail 2468952 invoked from network); 14 Dec 2020 16:54:48 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Dec 2020 16:54:48 +0100
X-UD-Smtp-Session: l3s3148p1@/bhgqW622q1UhsJO
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] Documentation: gpio: Fix typo
Date:   Mon, 14 Dec 2020 16:54:40 +0100
Message-Id: <20201214155440.2950-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/driver-api/gpio/consumer.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
index 423492d125b9..86e7676c5f0d 100644
--- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -110,7 +110,7 @@ For a function using multiple GPIOs all of those can be obtained with one call::
 
 This function returns a struct gpio_descs which contains an array of
 descriptors.  It also contains a pointer to a gpiolib private structure which,
-if passed back to get/set array functions, may speed up I/O proocessing::
+if passed back to get/set array functions, may speed up I/O processing::
 
 	struct gpio_descs {
 		struct gpio_array *info;
-- 
2.28.0

