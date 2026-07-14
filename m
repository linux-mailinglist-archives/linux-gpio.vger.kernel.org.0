Return-Path: <linux-gpio+bounces-40034-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aTlPHfLkVWq2uwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40034-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:27:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D29751D76
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:27:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=YoIXecx2;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40034-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40034-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 98CC1302EC27
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9843EEAF0;
	Tue, 14 Jul 2026 07:25:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F303F927B
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013952; cv=none; b=R1zFSyNhM6ZnPbS+Y6OZ+oozKPjzM41bsRMF+flSyTHXXlM20UtpC0v6JhHzUakH6xbsKhjb+nb3KkyvIqxZWzRkdXgM79pPj/O0qTLBBqnJRlxwRjuSdxUSlx8om6YVGFfEaowAo/36U4le2WThiocvHwB91PnTwVca1841BZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013952; c=relaxed/simple;
	bh=fvu/m+rpcn3hmgIKPNxhMhPigeWKXUxr+xYgkr/uykI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DHEKRzDuu0TwdRWHxgSgv+sg2JYoz4ZUc71akDL5p0iDnJozzsR8O3DaYE1eBFHfGKvJR+tyfPuyYZEQ0glsrEgcTEBJqyqA4f/HxTGZX4XWLI0VwIEmAmJsAC5ksC+XrbzAFD4t+qO5PF236Ibrbs+vgx47SvZJQa3p/+3bfeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YoIXecx2; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so3602885e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013948; x=1784618748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xmgdis0KNSxiTcgJ05PgHtMXCrsCziLcVqNfaUxyfB0=;
        b=YoIXecx2g6FRdw7Q6oAVzlCg5N2AwQncNP/f3Naa4DJj4RQCO+gyqvvAWCy8etOEeJ
         q2/X98fHsxYPkgakkDnAcUEH5dnLcF3otoPbnShhIOqqJGho0aqJMZX3PS2BDMzb5s4b
         HzwraYzxPshBd2138xfZoM+1XY1gAwpM+pS4ScZZsbHW6ngJrUMY35/io+FriGwYWTSd
         E59mowORCXevVIQkFGCFGOa8Y3vbZrdpLhpNfKN+r5k/769VKjK1RkDhpu5l7gR79RhP
         8hhtxZm2aLazSlAf1IoXa2YPcWdexFsJSDi45MjNRSFXO9p+bcmC2r+Sewa2fB1CpleL
         LcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013948; x=1784618748;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xmgdis0KNSxiTcgJ05PgHtMXCrsCziLcVqNfaUxyfB0=;
        b=lEOqXU8kuvv3okj3kfDyPXtFa8VT0psAlXBCwzBdjNHdWp/cAE1UnJWnsLQN/f6IWc
         5dBfx6YBu5Be5+yb9/7aTTjafAH7eoymJA6+jk/Dr62FvN76RfQhkuoGki3OvHrPRLKX
         1EF/Jofsz+XnHB5K2bNspxE5gQbEv+pc51CtURl1KHkO6CdUt0NqWhz0pmCwxjo3U+z6
         oySiUN4R+Q/4t1JMm3rVn52kptf1oOROBGYTBiO1/KJQNA6dAcJ8EUUxHJegmwSm0GZ1
         9+I64re9qO/dK0DHwH3scwMu7840aZni3P44a/mxWghbjIRx3TG35WqhsMeyT0TwqvaE
         Sf/g==
X-Forwarded-Encrypted: i=1; AHgh+Rpc1NLsu2n4C9zc9x2DW7YN7DZR1DJ5eokQEBzfYjpwInAbefh58z+ZsevcUKuft5AjqzJVxI3/olbP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4kBIaNqoGGUNnVPMWwmyKDyubaY7i/0CkwsfGTbXZtFkyw3pN
	rdSgWhM2lY9HhwwrRVMXJu3aTHczQJ5iywoWE32twaQfAlCPE9Eef+L2qNpZjjE8DlY=
X-Gm-Gg: AfdE7ckXeqtkEepSxbR8q/O011iqdv03lgWERL7n0uiDtQ3fidsRDWWRHRpgAIPse/r
	3gv6TkXCaLtmpLTGIHDytm+v/T4J0JzfgVC57j7YTTFgGZBhjdPA6iLgtu1K1Ybw9gUsXvj/Gp2
	KwKGrzxit6JkZG8yRjR6pI/KUvpIk7ET1YAcSGI+IpcXqWW6jwHlErghS1a+VSCWc5PpfkdwKml
	zugNDCf5Xdkza2ILoh9nJKmFveNcqj2v0TtPlObP4EtNpREwx4SSD/dzyrM0epN2I6gvUK9lHpa
	Z+owiorj06T90PkqLchK/3dVmZ5u1VxMoKn2UDJ+8248N+0joWb3VwHBJJiPMXZGOZTip4eEYZJ
	xFIpLR1M7tO0rOpUOdtT3mMDhls4yZyMIcolg4K8IWRiTrqEroMBvIsBXcyFO1Q1pHMSyyaofCV
	3+vAKrfjuM8feMDm7cb8dg5zxOynxWxm5mBebBWErbXR8jnfgohgCUEnH65ExmgAt4oW/roQYJq
	W1Z
X-Received: by 2002:a05:600c:198f:b0:492:3237:ddf with SMTP id 5b1f17b1804b1-493f882994bmr119418695e9.28.1784013948568;
        Tue, 14 Jul 2026 00:25:48 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49510c8e220sm44969925e9.15.2026.07.14.00.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:48 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-acpi@vger.kernel.org
Subject: [PATCH v1 20/20] gpio: Unify style of various *_device_id arrays
Date: Tue, 14 Jul 2026 09:24:21 +0200
Message-ID:  <1f2d39342995533857417eb890628f7643b9a159.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3323; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=fvu/m+rpcn3hmgIKPNxhMhPigeWKXUxr+xYgkr/uykI=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqzQJ37CljIiAd06L78f+7+h+OezSONtc83VW9kqpvv9+ LDZZ/blTkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAmIv2Hg2HFRtZM5fgQZYut ZrO6nFS2a4uEyz81YOJa26u4donSome6/BferCquWRsjt7fBMLRtSxITu6xkkQlDeUR0qqSS+eU I8eaO700m36JFZl6uS5br1TBMSKgL5FESTrp8+0PXQi6P98IKt40r2j6p/V6VtV2xSc6TpeDLxf 93OI8mlx4VuV+9YtbO7EIei8U6BaJdM3qWdqnEt9u9jePSPm7NP/V9pIf9JbcJBa892Jo6Wz2Mh fI3KMYv9BMVTXsS8EN5tclzkWerbks7rVK9tTD4wsyYidKc5peymLSe9h2KiV57MPKEXDNHu7nx /jMhVef+nHwXfelJ/20H1rNO0xldGtbPa1zqenyzeTIA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:lixu.zhang@intel.com,m:sakari.ailus@linux.intel.com,m:info@metux.net,m:vireshk@kernel.org,m:westeri@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-acpi@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-40034-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:mid,baylibre.com:email,baylibre.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29D29751D76

Update the various *_device_id arrays to conform to the most used and
generally recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Adapt the few offenders accordingly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-ljca.c           | 2 +-
 drivers/gpio/gpio-mpsse.c          | 3 +--
 drivers/gpio/gpio-pca953x.c        | 2 +-
 drivers/gpio/gpio-virtio.c         | 2 +-
 drivers/gpio/gpiolib-acpi-quirks.c | 2 +-
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index ad5dc9a3a119..d9d7394d8b95 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -473,7 +473,7 @@ static void ljca_gpio_remove(struct auxiliary_device *auxdev)
 
 static const struct auxiliary_device_id ljca_gpio_id_table[] = {
 	{ "usb_ljca.ljca-gpio" },
-	{ /* sentinel */ },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(auxiliary, ljca_gpio_id_table);
 
diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index a859deab2bca..7ca06bdb2c4b 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -77,10 +77,9 @@ static struct mpsse_quirk bryx_brik_quirk = {
 static const struct usb_device_id gpio_mpsse_table[] = {
 	{ USB_DEVICE(0x0c52, 0xa064) },   /* SeaLevel Systems, Inc. */
 	{ USB_DEVICE(0x0403, 0x6988),     /* FTDI, assigned to Bryx */
-	  .driver_info = (kernel_ulong_t)&bryx_brik_quirk},
+	  .driver_info = (kernel_ulong_t)&bryx_brik_quirk },
 	{ }                               /* Terminating entry */
 };
-
 MODULE_DEVICE_TABLE(usb, gpio_mpsse_table);
 
 static DEFINE_IDA(gpio_mpsse_ida);
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index a2d85ab1d01f..09d0a65382f5 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -175,7 +175,7 @@ static const struct dmi_system_id pca953x_dmi_acpi_irq_info[] = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GalileoGen2"),
 		},
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(dmi, pca953x_dmi_acpi_irq_info);
 #endif
diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 42871db05ec1..062c70fe4671 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -647,7 +647,7 @@ static void virtio_gpio_remove(struct virtio_device *vdev)
 
 static const struct virtio_device_id id_table[] = {
 	{ .device = VIRTIO_ID_GPIO, .vendor = VIRTIO_DEV_ANY_ID },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(virtio, id_table);
 
diff --git a/drivers/gpio/gpiolib-acpi-quirks.c b/drivers/gpio/gpiolib-acpi-quirks.c
index 5525c467c21d..9bf5ba619107 100644
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@ -392,7 +392,7 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 			.ignore_wake = "VEN_0488:00@355",
 		},
 	},
-	{} /* Terminating entry */
+	{ } /* Terminating entry */
 };
 MODULE_DEVICE_TABLE(dmi, gpiolib_acpi_quirks);
 
-- 
2.55.0.11.g153666a7d9bb


