Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72223498CD
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 18:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhCYR44 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 13:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhCYR4Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 13:56:24 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 513F5C06174A;
        Thu, 25 Mar 2021 10:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=OEsHTd9VHEuZfaQWzvpG+FxcEk7+095Kppam4iUyfmc=; b=nNZ+NMyuuFuksNSmO1feJ14bhi
        Qtbok3eHOCX6rD49ii+2s0FkTJtAaPWmwvJimqJhl89849URjtc3kWFoDPMO+PocJ4tTZHVCPZWGD
        jXABHqzmX4G+4jPy12OzNGVcnEOWfWm+V8xJWwuWT+TGVkieaSuXfZROVzdpc6yqVNH7yAlCPpMkU
        YdvvNH9YpOFRNFDgYT7CmExbNfP/CRyHggb5CtX26S9K3pXTDIIp1ZQsc+HesawT1ywoF0GjM3u7b
        oBdQcZLbB4tMZz/7uxjeec1TghHh4NxGBsW1N6P4Z8c5nAoSA6slkuS7Xs6gg3f8V/7QskSGfqjtm
        ejrc57sw==;
Received: from [2601:1c0:6280:3f0::3ba4] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lPUCp-00DTVt-CV; Thu, 25 Mar 2021 17:55:51 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH] tools: gpio-utils: fix various kernel-doc warnings
Date:   Thu, 25 Mar 2021 10:55:36 -0700
Message-Id: <20210325175536.14695-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix several problems in kernel-doc notation in gpio-utils.c.

gpio-utils.c:37: warning: Incorrect use of kernel-doc format:  * gpiotools_request_line() - request gpio lines in a gpiochip
gpio-utils.c:61: warning: expecting prototype for doc(). Prototype was for gpiotools_request_line() instead
gpio-utils.c:265: warning: Excess function parameter 'value' description in 'gpiotools_sets'
gpio-utils.c:1: warning: 'gpiotools_request_lines' not found

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 tools/gpio/gpio-utils.c |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

--- linux-next-20210323.orig/tools/gpio/gpio-utils.c
+++ linux-next-20210323/tools/gpio/gpio-utils.c
@@ -20,7 +20,7 @@
 #define CONSUMER "gpio-utils"
 
 /**
- * doc: Operation of gpio
+ * DOC: Operation of gpio
  *
  * Provide the api of gpiochip for chardev interface. There are two
  * types of api.  The first one provide as same function as each
@@ -100,7 +100,7 @@ exit_free_name:
 }
 
 /**
- * gpiotools_set_values(): Set the value of gpio(s)
+ * gpiotools_set_values() - Set the value of gpio(s)
  * @fd:			The fd returned by
  *			gpiotools_request_line().
  * @values:		The array of values want to set.
@@ -124,7 +124,7 @@ int gpiotools_set_values(const int fd, s
 }
 
 /**
- * gpiotools_get_values(): Get the value of gpio(s)
+ * gpiotools_get_values() - Get the value of gpio(s)
  * @fd:			The fd returned by
  *			gpiotools_request_line().
  * @values:		The array of values get from hardware.
@@ -148,7 +148,7 @@ int gpiotools_get_values(const int fd, s
 }
 
 /**
- * gpiotools_release_line(): Release the line(s) of gpiochip
+ * gpiotools_release_line() - Release the line(s) of gpiochip
  * @fd:			The fd returned by
  *			gpiotools_request_line().
  *
@@ -169,7 +169,7 @@ int gpiotools_release_line(const int fd)
 }
 
 /**
- * gpiotools_get(): Get value from specific line
+ * gpiotools_get() - Get value from specific line
  * @device_name:	The name of gpiochip without prefix "/dev/",
  *			such as "gpiochip0"
  * @line:		number of line, such as 2.
@@ -191,7 +191,7 @@ int gpiotools_get(const char *device_nam
 
 
 /**
- * gpiotools_gets(): Get values from specific lines.
+ * gpiotools_gets() - Get values from specific lines.
  * @device_name:	The name of gpiochip without prefix "/dev/",
  *			such as "gpiochip0".
  * @lines:		An array desired lines, specified by offset
@@ -230,7 +230,7 @@ int gpiotools_gets(const char *device_na
 }
 
 /**
- * gpiotools_set(): Set value to specific line
+ * gpiotools_set() - Set value to specific line
  * @device_name:	The name of gpiochip without prefix "/dev/",
  *			such as "gpiochip0"
  * @line:		number of line, such as 2.
@@ -248,13 +248,13 @@ int gpiotools_set(const char *device_nam
 }
 
 /**
- * gpiotools_sets(): Set values to specific lines.
+ * gpiotools_sets() - Set values to specific lines.
  * @device_name:	The name of gpiochip without prefix "/dev/",
  *			such as "gpiochip0".
  * @lines:		An array desired lines, specified by offset
  *			index for the associated GPIO device.
  * @num_lines:		The number of lines to request.
- * @value:		The array of values set to gpiochip, must be
+ * @values:		The array of values set to gpiochip, must be
  *			0(low) or 1(high).
  *
  * Return:		On success return 0;
