Return-Path: <linux-gpio+bounces-36992-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JkA1K0XHCWpzpQQAu9opvQ
	(envelope-from <linux-gpio+bounces-36992-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 15:48:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D96E956145D
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 15:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61B943007E18
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 13:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2EB2571A0;
	Sun, 17 May 2026 13:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="wtbcRcjs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74E1405C32
	for <linux-gpio@vger.kernel.org>; Sun, 17 May 2026 13:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779025729; cv=none; b=VbkxKF+nEWrLaKg7AXs3xY2n2Fs9eQkxjwvmxkJJ3JMly4AEoKKufduIB1bZ4PVoxImdfw83tDGMkvq8pC2XO/kZUEqd85glSMui8bC1AUvGZkd+35m527K0XIur2POWHDAKn+bEYH6EHrcCjktedhKgLt9t9bh9zQKm+U1HouI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779025729; c=relaxed/simple;
	bh=llm3BR9vyJRLkM+KxZg8kzpo9X0LN60HerxEE8MpOlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jywehxhk1ms5hQpn5Lczc+pHWIuE1XDx6o1gvcrATsmfFmSBYK3GbrncxMkUeuI6+c2ZB0L97N7HBNDZWELKnvIwnEjygGRhVzMqa1qeXVyclvPKYOToDLvbKM1K3QimYMKzEeeuCbxZl0cELTRwhia6vz06kO7verc8dH6cpd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=wtbcRcjs; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so14787835e9.0
        for <linux-gpio@vger.kernel.org>; Sun, 17 May 2026 06:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779025725; x=1779630525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/HO/Q9WW5c2MsVl938awFdYf6dLUefJDaTnkMc5UHgA=;
        b=wtbcRcjsh6c36rhvE0CoCPXYItIZQNjkEV0PwJPmI/r6UVHgg70v6f2bdPm2lwU6jl
         PBc0OawMaWbjgpU4e7WqzJFtKoJqcK3ZGgTGK6mK+LmwOvQbODGZn/i0y1awQOThItmn
         rq7k2cvsfMHpwNDekNIfLDJLZa1ftHkAHUfw2+e4nYJDX2FEaWFbNKkq3v4SAcsLIl4g
         wgARhK37YfC3ALdsOTNaf1dpGX6xW6uOij+qBGWIH8cN4JWTZRmOo2V6JO4WBOA7GL/G
         l4b36c3UZ5JuoVjk94T0bL1/nIEwner4A+rdFbjumNb5Y8ZDUV8YBooenEP2E4Od0Ggr
         7hAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779025725; x=1779630525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HO/Q9WW5c2MsVl938awFdYf6dLUefJDaTnkMc5UHgA=;
        b=XHpwHGA6rECI/FHXgL2J4KTnkuEWbyVYnvb6CzJRwbRNj0T79v3eyvRceutaG3kMHh
         qVr+9VrNsby2B4JdpWiy4KTpXrXBjxpWdedH9tsBGGB2ZzunXeeVqUJRZxaFYaWpCoX9
         QxjP+e77UJePODvO8cZNytRL/w0n0aoNr4vuBr3d7TVS04U4MNHfJDLDkW9OSGnMBEvn
         ejjR5G9/h/553TfBymyyZeX25Wzvs4/PjexkdR7lSeobGHPJqwF7z5YAOgu9PLB/TzLE
         lDyII7JwZp1IaCaXZ9fRVME+bWby9SI1reaBkPOQZABYbcAPFPhMHqKC0zmod3QVPYao
         55lA==
X-Forwarded-Encrypted: i=1; AFNElJ99/qm4tzJRuLhoT3OHqTt0e5ORdQHG25ZDHAYeln2zyIyWsGD7dFTsp8AOoRHjxqJdPqM5E2fkkUEy@vger.kernel.org
X-Gm-Message-State: AOJu0YwicZTkLRi/UODFKy0XQcO96++4qTuHAijUYXaqpJy64weW9LEF
	TiYq0CBYy0WyH4O2wcRYLNkvNm5gbFMN7eAPoLq6Kfft/oJG5wUrKCLSDbSM3uHBVmV4UdOjQFg
	9EUNXFDw=
X-Gm-Gg: Acq92OFeSCAweWF0XiPiN+9IaAi2AeRrhRgoNS7KA/rHdBqgoDSSFGVlfQFx/6sSYHT
	bNzro6azeHQ5eu/8AYBKp9cRnCbgQEjHhsnF/dOhfMuGZv4QIYbksACJXlZKXUk0dyT5VA/ylf2
	j04Qfuq6NBtDP5Kvj48t9ZyX8KBxWkaLsDQGyO0spTQT3jYQXGBQuZpksoF7t85lLFnDhGJwIp3
	WLh7egmXnCpQRdcUK54zrVeE5NlEwt0XD9+T86vv44/Bv5XAvyd+0/pi+bCcFpLW9x2/jGu9xxC
	PLO4I6y9DF8pyJtubKR1YxLsEp6Y5ZwR4Ut60XqqUDdwswFt1SpD4H6n7cS2P7tHxDqvpZWIpZK
	U39I7n4sZXSUMBHHcKSyF46E7kSaAcUSF/kTgMurDFf7urU07/MkOfB4hXsW5b8rOxya9Z+Ao97
	HFjkfOaIvCg4Hj+Q12D8GeD7165BXtimTuVY/IkrnhKCixYyhllQ==
X-Received: by 2002:a05:600c:3b07:b0:489:1a3a:9e45 with SMTP id 5b1f17b1804b1-48fe651e127mr163181715e9.26.1779025725294;
        Sun, 17 May 2026 06:48:45 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe5694f2csm192364145e9.4.2026.05.17.06.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 06:48:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] pinctrl: Use named initializers for arrays of i2c_device_data
Date: Sun, 17 May 2026 15:48:35 +0200
Message-ID: <20260517134835.588648-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7455; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=llm3BR9vyJRLkM+KxZg8kzpo9X0LN60HerxEE8MpOlI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqCcczX5WHIjQVgJIrdoab0TzuSsPtITk8KvT5/ JAqnUNJWDiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagnHMwAKCRCPgPtYfRL+ TqE4B/0RaZuWgXIK3/Z0rsG/rgO7lPj5ln4snG0CNP2zZINlX2N3/htR3zo0iGvAmOZLWHuQDLZ XpzGgogsvJxbnIX+RzSy3+UC5AylhoVO1u4TbP1E39l9m9PSX1yCtC7dL04VqeHSZACfh0/DFlh I4ni+YLIvuX5j2lnC+1QZzh0uAVDTS1gbK62uwDH7P9ndwd4OwVl9ABRT4e7+DDeaWJGykW5pGW Y1/mD9Wv9DzXEkEkddGV14mxAk6PgvjvA8x2NIV1mR+uBOtmduEotYyOjTTfgswiqP8aypzmSwQ hRDIMQHbUdrC05aBmd7PdFzGhOVTRJ9sztPOkhIu7NjGHZZt
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D96E956145D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36992-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cheri-alliance.org:url]
X-Rspamd-Action: no action

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
i2c_device_id that replaces .driver_data by an anonymous union.

While touching all these arrays, unify usage of whitespace in the list
terminator.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

the mentioned change to i2c_device_id is the following:

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	index 23ff24080dfd..aebd3a5e90af 100644
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
	 
	 struct i2c_device_id {
		char name[I2C_NAME_SIZE];
	-	kernel_ulong_t driver_data;	/* Data private to the driver */
	+	union {
	+		/* Data private to the driver */
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };
	 
	 /* pci_epf */

and this requires that .driver_data is assigned via a named initializer
for static data. This requirement isn't a bad one because named
initializers are also much better readable than list initializers.

The union added to struct i2c_device_id enables further cleanups like:

	diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
	index 8a082ff034dd..b2aac7348d22 100644
	--- a/drivers/iio/accel/kxcjk-1013.c
	+++ b/drivers/iio/accel/kxcjk-1013.c
	@@ -1429,7 +1429,7 @@ static int kxcjk1013_probe(struct i2c_client *client)
	 
		if (id) {
			name = id->name;
	-		data->info = (const struct kx_chipset_info *)(id->driver_data);
	+		data->info = id->driver_data_ptr;
		} else {
			name = iio_get_acpi_device_name_and_data(&client->dev, &ddata);
			data->info = ddata;
	@@ -1630,11 +1630,11 @@ static const struct dev_pm_ops kxcjk1013_pm_ops = {
	 };
	 
	 static const struct i2c_device_id kxcjk1013_id[] = {
	-	{ .name = "kxcjk1013", .driver_data = (kernel_ulong_t)&kxcjk1013_info },
	-	{ .name = "kxcj91008", .driver_data = (kernel_ulong_t)&kxcj91008_info },
	-	{ .name = "kxtj21009", .driver_data = (kernel_ulong_t)&kxtj21009_info },
	-	{ .name = "kxtf9", .driver_data = (kernel_ulong_t)&kxtf9_info },
	-	{ .name = "kx023-1025", .driver_data = (kernel_ulong_t)&kx0231025_info },
	+	{ .name = "kxcjk1013", .driver_data_ptr = &kxcjk1013_info },
	+	{ .name = "kxcj91008", .driver_data_ptr = &kxcj91008_info },
	+	{ .name = "kxtj21009", .driver_data_ptr = &kxtj21009_info },
	+	{ .name = "kxtf9", .driver_data_ptr = &kxtf9_info },
	+	{ .name = "kx023-1025", .driver_data_ptr = &kx0231025_info },
		{ }
	 };
	 MODULE_DEVICE_TABLE(i2c, kxcjk1013_id);

that are an improvement for readability (again!) and it keeps some
properties of the pointers (here: being const) without having to pay
attention for that. (I didn't find a good example in drivers/pinctrl, so
an iio driver was used to demonstrate the gain.)

My additional motivation for this effort is CHERI[1]. This is a hardware
extension that uses 128 bit pointers but unsigned long is still 64 bit.
So with CHERI you cannot store pointers in unsigned long variables.

Best regards
Uwe

[1] https://cheri-alliance.org/discover-cheri/
    https://lwn.net/Articles/1037974/


 drivers/pinctrl/pinctrl-aw9523.c       |  2 +-
 drivers/pinctrl/pinctrl-cy8c95x0.c     |  6 +++---
 drivers/pinctrl/pinctrl-mcp23s08_i2c.c |  6 +++---
 drivers/pinctrl/pinctrl-sx150x.c       | 20 ++++++++++----------
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
index 02a24ac87ea4..bc94003512cf 100644
--- a/drivers/pinctrl/pinctrl-aw9523.c
+++ b/drivers/pinctrl/pinctrl-aw9523.c
@@ -1033,7 +1033,7 @@ static void aw9523_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id aw9523_i2c_id_table[] = {
-	{ "aw9523_i2c" },
+	{ .name = "aw9523_i2c" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw9523_i2c_id_table);
diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index ace0be5ec679..093ae7c1dae5 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -1461,9 +1461,9 @@ static int cy8c95x0_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id cy8c95x0_id[] = {
-	{ "cy8c9520", 20 },
-	{ "cy8c9540", 40 },
-	{ "cy8c9560", 60 },
+	{ .name = "cy8c9520", .driver_data = 20 },
+	{ .name = "cy8c9540", .driver_data = 40 },
+	{ .name = "cy8c9560", .driver_data = 60 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cy8c95x0_id);
diff --git a/drivers/pinctrl/pinctrl-mcp23s08_i2c.c b/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
index 94e1add6ddd7..f3dffa3c74d3 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
@@ -67,9 +67,9 @@ static const struct mcp23s08_info  mcp23018_i2c = {
 };
 
 static const struct i2c_device_id mcp230xx_id[] = {
-	{ "mcp23008", (kernel_ulong_t)&mcp23008_i2c },
-	{ "mcp23017", (kernel_ulong_t)&mcp23017_i2c },
-	{ "mcp23018", (kernel_ulong_t)&mcp23018_i2c },
+	{ .name = "mcp23008", .driver_data = (kernel_ulong_t)&mcp23008_i2c },
+	{ .name = "mcp23017", .driver_data = (kernel_ulong_t)&mcp23017_i2c },
+	{ .name = "mcp23018", .driver_data = (kernel_ulong_t)&mcp23018_i2c },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mcp230xx_id);
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 1d6760ffe809..b59d913513d5 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -839,16 +839,16 @@ static const struct pinconf_ops sx150x_pinconf_ops = {
 };
 
 static const struct i2c_device_id sx150x_id[] = {
-	{"sx1501q", (kernel_ulong_t) &sx1501q_device_data },
-	{"sx1502q", (kernel_ulong_t) &sx1502q_device_data },
-	{"sx1503q", (kernel_ulong_t) &sx1503q_device_data },
-	{"sx1504q", (kernel_ulong_t) &sx1504q_device_data },
-	{"sx1505q", (kernel_ulong_t) &sx1505q_device_data },
-	{"sx1506q", (kernel_ulong_t) &sx1506q_device_data },
-	{"sx1507q", (kernel_ulong_t) &sx1507q_device_data },
-	{"sx1508q", (kernel_ulong_t) &sx1508q_device_data },
-	{"sx1509q", (kernel_ulong_t) &sx1509q_device_data },
-	{}
+	{ .name = "sx1501q", .driver_data = (kernel_ulong_t)&sx1501q_device_data },
+	{ .name = "sx1502q", .driver_data = (kernel_ulong_t)&sx1502q_device_data },
+	{ .name = "sx1503q", .driver_data = (kernel_ulong_t)&sx1503q_device_data },
+	{ .name = "sx1504q", .driver_data = (kernel_ulong_t)&sx1504q_device_data },
+	{ .name = "sx1505q", .driver_data = (kernel_ulong_t)&sx1505q_device_data },
+	{ .name = "sx1506q", .driver_data = (kernel_ulong_t)&sx1506q_device_data },
+	{ .name = "sx1507q", .driver_data = (kernel_ulong_t)&sx1507q_device_data },
+	{ .name = "sx1508q", .driver_data = (kernel_ulong_t)&sx1508q_device_data },
+	{ .name = "sx1509q", .driver_data = (kernel_ulong_t)&sx1509q_device_data },
+	{ }
 };
 
 static const struct of_device_id sx150x_of_match[] = {

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


