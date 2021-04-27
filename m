Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBBD36C8D6
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 17:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhD0PnV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 11:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236398AbhD0PnP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Apr 2021 11:43:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E01C061574
        for <linux-gpio@vger.kernel.org>; Tue, 27 Apr 2021 08:42:29 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1lbPr1-0004O9-8w; Tue, 27 Apr 2021 17:42:27 +0200
Received: from afa by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1lbPr0-0007uh-Lt; Tue, 27 Apr 2021 17:42:26 +0200
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [libgpiod][PATCH] tools: gpioget: add new --dir-as-is option for GPO read-back
Date:   Tue, 27 Apr 2021 17:42:24 +0200
Message-Id: <20210427154224.30372-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Both legacy sysfs and new character device API support querying line
state of a GPIO configured as output. But while sysfs /value can
be read for these output GPIOs, gpioget unconditionally muxes the
line as input. To ease migration to the new user API, add a new
--dir-as-is parameter that doesn't force the line to input.

This is especially useful for GPIO controllers that maintain their
last configured output state.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
-n is chosen for the short option because it's the customary short
option for dry runs, which sounds similar to what a gpio get without
line state configuration is doing.
---
 tools/gpioget.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/gpioget.c b/tools/gpioget.c
index ceeec566683a..bfbf5ea748be 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -13,11 +13,12 @@ static const struct option longopts[] = {
 	{ "help",	no_argument,		NULL,	'h' },
 	{ "version",	no_argument,		NULL,	'v' },
 	{ "active-low",	no_argument,		NULL,	'l' },
+	{ "dir-as-is",	no_argument,		NULL,	'n' },
 	{ "bias",	required_argument,	NULL,	'B' },
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvlB:";
+static const char *const shortopts = "+hvlnB:";
 
 static void print_help(void)
 {
@@ -30,6 +31,7 @@ static void print_help(void)
 	printf("  -h, --help:\t\tdisplay this message and exit\n");
 	printf("  -v, --version:\tdisplay the version and exit\n");
 	printf("  -l, --active-low:\tset the line active state to low\n");
+	printf("  -n, --dir-as-is:\tdon't force-reconfigure line direction\n");
 	printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
 	printf("		set the line bias\n");
 	printf("\n");
@@ -40,6 +42,7 @@ int main(int argc, char **argv)
 {
 	struct gpiod_line_request_config config;
 	int *values, optc, opti, rv, flags = 0;
+	int request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT;
 	unsigned int *offsets, i, num_lines;
 	struct gpiod_line_bulk *lines;
 	struct gpiod_chip *chip;
@@ -60,6 +63,9 @@ int main(int argc, char **argv)
 		case 'l':
 			flags |= GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
 			break;
+		case 'n':
+			request_type = GPIOD_LINE_REQUEST_DIRECTION_AS_IS;
+			break;
 		case 'B':
 			flags |= bias_flags(optarg);
 			break;
@@ -104,7 +110,7 @@ int main(int argc, char **argv)
 	memset(&config, 0, sizeof(config));
 
 	config.consumer = "gpioget";
-	config.request_type = GPIOD_LINE_REQUEST_DIRECTION_INPUT;
+	config.request_type = request_type;
 	config.flags = flags;
 
 	rv = gpiod_line_request_bulk(lines, &config, NULL);
-- 
2.29.2

