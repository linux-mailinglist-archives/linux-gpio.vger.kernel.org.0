Return-Path: <linux-gpio+bounces-31679-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICWEOwbDj2m7TQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31679-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 01:34:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDEC13A285
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 01:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E1F33037ED3
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 00:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F081626299;
	Sat, 14 Feb 2026 00:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="brDb8/fb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2992433993
	for <linux-gpio@vger.kernel.org>; Sat, 14 Feb 2026 00:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771029251; cv=none; b=Dfg0MEE2OXyqLB/TDwWV6s3HgRxB8F4D14/KxBXEktvkxJlk25bzQLm6DjInI49cuTr46YPXPGe+N/kcbyrDM7KNzCQ0qaAGBXtRw1yzLAreCqKUl/TyatTQLhmgCaXnSMIa/UvKU2yVs+c9SwOCothIzhModGYU7rm5CprFIkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771029251; c=relaxed/simple;
	bh=Ec3SbFTfob1e+f2s4dreSgT6PXF7rt3ydMpAhKVxXiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nldOECXZjRa2OLuMuK6/mFEhkDxkeXn5xrqyA2NQzmfUj0LG6B8GKOUDJi/l4ZqZCTL3HQt5BeNAutdrawdn69pejq+VjNb01uYXg4jlfExCjf+yo6RsTK5ZIlpl9fplqU1MJh26du3MkoCvx2PRyQNgBHYYLmAwkVvyncGw+g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=brDb8/fb; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d4c4b494fcso624433a34.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 16:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771029248; x=1771634048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+P51XJ9Fm0IpHOFd6Kod1QEZg9fv2OrgmqrfQ1nsGS4=;
        b=brDb8/fbzbhGNZQ8FXhvM8/JYYvYcbow1AyZoDio3WREChSkOeCnxWGzFU7Yd6/+ku
         +iMgyQuvdendMd7rptb9/jKZ0Q5M4a7PLqPgiGDvTLTEawYooSp1N54/WporHIh7PkNU
         tGfmnDblafyotdERi6SOkfudXRKy/beWevZPA9p6uPKRpKv4QmC/lW1JRFxekKVrPpOU
         o9woTIgrYLFNyVxHrOR5YzYfAT/G0je049i6Tu0GlKHoDnL83NEKuaC6AG+vy+58PcCi
         wj36wrCjcAew6NHBa6eICVZUfbR2hqn3cDRy7xoqiDj8RZiIUUZ2e9pl78skWXsT7Xg0
         TvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771029248; x=1771634048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+P51XJ9Fm0IpHOFd6Kod1QEZg9fv2OrgmqrfQ1nsGS4=;
        b=dkZcQlP1fqcALT1nzNc/rPjRJWZGHfKaQgxHgr4DcKDDZtsl+Ta+GpUhrhaNLaZQHx
         DR9l/3L1tVYGtYlVumV1D9BycutoIGLPOXm907i7iusjfVO9vVJC5LQ2fAVU+Ty1KaNJ
         II7gxVAjJKWhZFYjXuTb5wwRvBKApEMVU13w/rrq6wQc2+MuS7Mo6zzINAe2D+d0G1LO
         xm58a0kYLGSTkPhOsashN+m9QXUJhwGrt8DAzhTaFE7rt3etMrWdzbSu4PhdUMo3rREO
         Par6TazvuE6A2hCeOTpvusm4h6cimTrFHIRwHksVmmAwWNczwxk5/kz+WP2o5k785fDR
         6ndg==
X-Gm-Message-State: AOJu0YwpNP4VhfkQ2F3/e5b0I4W0+vjsK9XV+WQ9YWoSjML0RliEfaeY
	mCU7qxQXf0gW9/8M6NruyPL5s/erPes/LOS4oS3szrQpSjTAagPgTK3DRQYs538xAS7oS6CfMW1
	Ew4je
X-Gm-Gg: AZuq6aJEd1HXKmAnU4I8PTfEXRra3GI46C+Ut1Rw4gp1z3wt/KcA3xyjV2PnclNShZ6
	2LsuKeX3hq4iLzImc81yPXW/xHfSeO8meD3Em+mL5H8xddxwoKs4wiz4LhA6WHb+767F7IzD5kT
	Uq9JBllzthUe8fdUySpI8VhESblYyjLbR5Rg3Ls9izDbD43zYfxcAWQSoIz0AfRBcPiecfd9lD8
	nFT1p6GpY6xMhALmeVLrghqi9anqd+j3f4vZjC3iKUAvq0OLCn33Cm4O5IMwcKbGi6pQbDI7ZmF
	tw6hv3nW2n88LDy/SVsv3kY9153T0QkkRPsy/vMNI9GjyPt8WTWI3KDu9FEOoWulwLucZ2lJxt4
	55ezvnP8aKBr/FwdP/Ox2gd4WrwI76G/yPjCVFDCN7iXP1Hwg0QulMdHuwwjVHEUdhkj8CmLo9k
	X5QJkbYJw9xUEwmrqaXxfNSguEhwiLvBtaoJqGPdtF495EoU5/Qw==
X-Received: by 2002:a05:6830:7316:b0:7cf:cb09:b7e8 with SMTP id 46e09a7af769-7d4d0c799b7mr575320a34.36.1771029247972;
        Fri, 13 Feb 2026 16:34:07 -0800 (PST)
Received: from freyr.tailscale.baylibre.com ([2600:8803:e7e4:500:84e0:63c6:648f:4671])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a7720a95sm6857983a34.29.2026.02.13.16.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 16:34:07 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
To: linux-gpio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>
Subject: [libgpiod][PATCH] dbus: add -c option to gpiocli-get/set commands
Date: Fri, 13 Feb 2026 18:33:55 -0600
Message-ID: <20260214003402.3851492-1-dlechner@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31679-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:mid,baylibre.com:email,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 3BDEC13A285
X-Rspamd-Action: no action

Add the -c/--chip option to gpiocli-get/set to allow users to specify a
chip and line number instead of a line name. This is useful when a line
does not have a name.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 dbus/client/get.c | 24 +++++++++++++++++++++---
 dbus/client/set.c | 24 +++++++++++++++++++++---
 2 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/dbus/client/get.c b/dbus/client/get.c
index 4ca6f3c..62825a7 100644
--- a/dbus/client/get.c
+++ b/dbus/client/get.c
@@ -23,6 +23,7 @@ int gpiocli_get_main(int argc, char **argv)
 	g_autoptr(GpiodbusObject) req_obj = NULL;
 	g_autoptr(GArray) offsets = NULL;
 	g_autoptr(GArray) values = NULL;
+	const gchar *chip_name = NULL;
 	g_autoptr(GError) err = NULL;
 	g_auto(GStrv) lines = NULL;
 	GpiodbusRequest *request;
@@ -34,6 +35,16 @@ int gpiocli_get_main(int argc, char **argv)
 	gint value;
 
 	const GOptionEntry opts[] = {
+		{
+			.long_name		= "chip",
+			.short_name		= 'c',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &chip_name,
+			.description		=
+"Explicitly specify the chip_name on which to resolve the lines which allows to use raw offsets instead of line names.",
+			.arg_description	= "<chip name>",
+		},
 		{
 			.long_name		= "request",
 			.short_name		= 'r',
@@ -91,9 +102,16 @@ int gpiocli_get_main(int argc, char **argv)
 			g_autoptr(GVariant) arg_offsets = NULL;
 			g_autoptr(GVariant) arg_values = NULL;
 
-			ret = get_line_obj_by_name(lines[i], &line_obj, NULL);
-			if (!ret)
-				die("Line not found: %s\n", lines[i]);
+			if (chip_name) {
+				chip_obj = get_chip_obj(chip_name);
+				line_obj = get_line_obj_by_name_for_chip(chip_obj, lines[i]);
+				if (!line_obj)
+					die("Line '%s' not found on chip '%s'", lines[i], chip_name);
+			} else {
+				ret = get_line_obj_by_name(lines[i], &line_obj, NULL);
+				if (!ret)
+					die("Line not found: %s\n", lines[i]);
+			}
 
 			line = gpiodbus_object_peek_line(line_obj);
 			req_path = gpiodbus_line_get_request_path(line);
diff --git a/dbus/client/set.c b/dbus/client/set.c
index 6460dd5..44bed94 100644
--- a/dbus/client/set.c
+++ b/dbus/client/set.c
@@ -26,6 +26,7 @@ int gpiocli_set_main(int argc, char **argv)
 	g_autoptr(GpiodbusObject) req_obj = NULL;
 	g_autoptr(GPtrArray) line_names = NULL;
 	g_autoptr(GArray) values = NULL;
+	const gchar *chip_name = NULL;
 	g_autoptr(GError) err = NULL;
 	g_auto(GStrv) lines = NULL;
 	GpiodbusRequest *request;
@@ -38,6 +39,16 @@ int gpiocli_set_main(int argc, char **argv)
 	gint val;
 
 	const GOptionEntry opts[] = {
+		{
+			.long_name		= "chip",
+			.short_name		= 'c',
+			.flags			= G_OPTION_FLAG_NONE,
+			.arg			= G_OPTION_ARG_STRING,
+			.arg_data		= &chip_name,
+			.description		=
+"Explicitly specify the chip_name on which to resolve the lines which allows to use raw offsets instead of line names.",
+			.arg_description	= "<chip name>",
+		},
 		{
 			.long_name		= "request",
 			.short_name		= 'r',
@@ -133,9 +144,16 @@ int gpiocli_set_main(int argc, char **argv)
 
 		line_name = g_ptr_array_index(line_names, i);
 
-		ret = get_line_obj_by_name(line_name->str, &line_obj, NULL);
-		if (!ret)
-			die("Line not found: %s\n", line_name->str);
+		if (chip_name) {
+			chip_obj = get_chip_obj(chip_name);
+			line_obj = get_line_obj_by_name_for_chip(chip_obj, line_name->str);
+			if (!line_obj)
+				die("Line '%s' not found on chip '%s'", line_name->str, chip_name);
+		} else {
+			ret = get_line_obj_by_name(line_name->str, &line_obj, NULL);
+			if (!ret)
+				die("Line not found: %s\n", line_name->str);
+		}
 
 		line = gpiodbus_object_peek_line(line_obj);
 		req_path = gpiodbus_line_get_request_path(line);
-- 
2.43.0


