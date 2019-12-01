Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1E5710E045
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727394AbfLADZ1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:25:27 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41101 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADZ1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:25:27 -0500
Received: by mail-pl1-f196.google.com with SMTP id t8so14563231plr.8
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PLqKnxX/r2speymXHyY1cZxsYpfZ2h6VV37qu0ndkpY=;
        b=vCt1qkWJK3BOD6lFtnzmMaz+ELMebLzSKyDxeMwMfs1mxr7UkuR0K1B840cYpksr4r
         xbVkm2VoDyUB1W5ECQjoC6cV5+bUw8UaLjlqMZoDPka0V+bY6iA6y/xGDuGRSMiJ/FN4
         aVVnLiVuiDnm5H5+UQv8cGXo3KGQaPt0o90Wq5ve2alZLWn25luiWMKdljhT+DGPnL6t
         ShMRIs/QjfRU265PQp3SBqIKJ6iFBjLIs5h9Iwr6zXTpNBmt4Y/cXuel+FQLLh0QHL2k
         fV5pWKDv1QiQ0AkZ/Q8Xq3U0VvY1ccBapLylkqrkGIax748qc+nlmcQX+CHNtouqjLq1
         9b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PLqKnxX/r2speymXHyY1cZxsYpfZ2h6VV37qu0ndkpY=;
        b=KYjzr7z7AAtJ6NXuMgPrU6HaBFWWhVja2o1gfy7SdQjqwWbdMZ/vG0RNCu+edTjp7O
         cOqbIwI0jq2CdBPTA4Ri+J9mhdLIvcMDWQHGJ9aLpg3KQrJIVdd4f2TVd6Z77Bdbr1gT
         EwKaRQLck5HPznZi+ttOEtXidObqrecn2JX2A2OgAEtO2Qqn44Qfu82zwaH7iUoY8YxV
         W9Ol9p074+rOaBtG0hgd0GXcEaHwhee8ouNmSyo69K0XiHOWWPd6cZrTFXQBd2QCT4mw
         TiwfEw97RfnByDSSY7ylJ0mqqk6VM3T6TlkNDjyGf9cIy5SuWQB6+cTtK98RnZy8fjUR
         Guaw==
X-Gm-Message-State: APjAAAXDK52+F+v1V6kZRObK0J+nnK++53gtRbtKzM9/f1fI1KJtJchI
        ulcwfAt8ISAMfkyyjxSNw1NwOdnP
X-Google-Smtp-Source: APXvYqwFgVnSLVbRXwCXOmAnEWEYznSrlwXK9VpZu46Hkf41B0x2f7bdRE/ZcPv8ZEVqY7Fx/IQntw==
X-Received: by 2002:a17:90a:2664:: with SMTP id l91mr16389907pje.45.1575170725587;
        Sat, 30 Nov 2019 19:25:25 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:25:25 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 16/20] tools: gpioset: add support for drive flags
Date:   Sun,  1 Dec 2019 11:24:03 +0800
Message-Id: <20191201032407.23589-17-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for drive flags to gpioset so that line drive flags
(open-drain,open-source) can be set from the command line.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpioset.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/tools/gpioset.c b/tools/gpioset.c
index 347fb2e..610ff75 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -24,6 +24,7 @@ static const struct option longopts[] = {
 	{ "version",		no_argument,		NULL,	'v' },
 	{ "active-low",		no_argument,		NULL,	'l' },
 	{ "bias",		required_argument,	NULL,	'B' },
+	{ "drive",		required_argument,	NULL,	'D' },
 	{ "mode",		required_argument,	NULL,	'm' },
 	{ "sec",		required_argument,	NULL,	's' },
 	{ "usec",		required_argument,	NULL,	'u' },
@@ -31,7 +32,7 @@ static const struct option longopts[] = {
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvlB:m:s:u:b";
+static const char *const shortopts = "+hvlB:D:m:s:u:b";
 
 static void print_help(void)
 {
@@ -45,6 +46,8 @@ static void print_help(void)
 	printf("  -l, --active-low:\tset the line active state to low\n");
 	printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
 	printf("		set the line bias\n");
+	printf("  -D, --drive=[push-pull|open-drain|open-source] (defaults to 'push-pull'):\n");
+	printf("		set the line drive mode\n");
 	printf("  -m, --mode=[exit|wait|time|signal] (defaults to 'exit'):\n");
 	printf("		tell the program what to do after setting values\n");
 	printf("  -s, --sec=SEC:\tspecify the number of seconds to wait (only valid for --mode=time)\n");
@@ -53,6 +56,11 @@ static void print_help(void)
 	printf("\n");
 	print_bias_help();
 	printf("\n");
+	printf("Drives:\n");
+	printf("  push-pull:\tdrive the line both high and low\n");
+	printf("  open-drain:\tdrive the line low or go high impedance\n");
+	printf("  open-source:\tdrive the line high or go high impedance\n");
+	printf("\n");
 	printf("Modes:\n");
 	printf("  exit:\t\tset values and exit immediately\n");
 	printf("  wait:\t\tset values and wait for user to press ENTER\n");
@@ -183,6 +191,17 @@ static const struct mode_mapping *parse_mode(const char *mode)
 	return NULL;
 }
 
+static int drive_flags(const char *option)
+{
+	if (strcmp(option, "open-drain") == 0)
+		return GPIOD_CTXLESS_FLAG_OPEN_DRAIN;
+	if (strcmp(option, "open-source") == 0)
+		return GPIOD_CTXLESS_FLAG_OPEN_SOURCE;
+	if (strcmp(option, "push-pull") != 0)
+		die("invalid drive: %s", option);
+	return 0;
+}
+
 int main(int argc, char **argv)
 {
 	const struct mode_mapping *mode = &modes[MODE_EXIT];
@@ -212,6 +231,9 @@ int main(int argc, char **argv)
 		case 'B':
 			flags |= bias_flags(optarg);
 			break;
+		case 'D':
+			flags |= drive_flags(optarg);
+			break;
 		case 'm':
 			mode = parse_mode(optarg);
 			if (!mode)
-- 
2.24.0

