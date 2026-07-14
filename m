Return-Path: <linux-gpio+bounces-40015-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ayhtCWjkVWpkuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40015-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:25:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB24F751D0C
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:25:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=Uky3VLS8;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40015-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40015-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4ED43303BDE3
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8283EDE40;
	Tue, 14 Jul 2026 07:25:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6813EDE54
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013917; cv=none; b=UnG+ZX24rbUMVFYOZ5wJR+M59RJMYa2Chef+Lh1dieTN2Sg4T5TWhEdPTLcQ+WoyM0lyRdlMFmlorih2pujKxP3N5QLqrEA39hBq/F0NTIBzdZLpF9+bZJt2bRDbS6cJUq3SFWyHF4xWcy2NPmf+9Qo5HUY7BWiDOLFxQbGVP2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013917; c=relaxed/simple;
	bh=kPZuTME3boeG2MrC6mpNSfxJ8R4eFTDK/auZCtUoPjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lL2IIZb96/Uy06hkWMJs2h3SwcTC9wwDHOBndhO/gWIyCr7frX/J3Dl29aEnvpdZDtTA8p3NoER7LSc8ilwaThA4i82YtFazz+/0FS20i9w3/cgD5XdrLlwKHpdmwANsHBCDeQHQnTRj+s5mL5PeRoTgSIl5bwZl5855yVLFUDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Uky3VLS8; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47dec32798aso4017970f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013914; x=1784618714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UERlSXH7BI+otfrBEKOfsKPrqfU+Ml4HKaAHy/e32Sg=;
        b=Uky3VLS8aqS8qpVAjLzSk8sAlcJvYyjbAijO7KlEfxeBrJkpI3J3xhGb3pJKGBnhjZ
         dBl/cDlGKWQwziOG8/cBRLT20g5/ejR+rzMJzCu459YuAwCzvKbxHJjWesmDIIOUEzie
         c+5RUUiLwm/H9z5bXB0+mbj9BnCsTL+npkvkolhMfbUh2TGwtau7U9/nIndzCIB4CiAI
         QiJB7fogt9kufMSjMLaLiU7TBel0DJyVJhKg5jkNSGtSqY76pUozbq34n7pacFoUE8yB
         yWEwvafflYrWwwreS/Y3inJ6bKuliR5OhuzYlKHvqjUPYgNiJOwfA5xWJZ/AsqFBbWXi
         MVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013914; x=1784618714;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UERlSXH7BI+otfrBEKOfsKPrqfU+Ml4HKaAHy/e32Sg=;
        b=rICreM1fYZjDBevlwUBXFGT1ej2GLMn77NWNitJNqyPMmxXHD/CsnGhiESQYhlMser
         gsgBZ9XlpC3nHUtGZxQDCxjNnQ5CPW+AAv6ENxED0CD8v/ZSnyTFl3e0Qwnv39IjDqZb
         PyTyKfhih305/KQ8PUmi5lDRIvKGaEOXeauXdt5V3/gwncXdvBtDPejgnCtmh0MJd4bX
         ocG1dwEmQVgAE55f9j2nb0A6q8zIHU9fHeU1JWNARKnrM0/M1PDFis5+tA9TSAmWM9oe
         5JQNwvcM+XYWKmyDdNME/QbfVL+J6Ut7I9t9uwx1fQaojfvHK2y1fftJ8pViI1sry1hs
         whcg==
X-Forwarded-Encrypted: i=1; AHgh+RqDNYKx08gyokNw3Eo+n1pLGkP+l2zE/rmp32KGVnSbCahm+m1W+GR0x2y82thi/0yIZ4wW6/xHc+qh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0CwPkWxG9tt9jExK+45EqWpclqJpidpS03nWnpv9k2hE41uQA
	uT3zKrQNDAL3p75B36BJz8eJCGhlJy+p7x6cw0mceLpZsKw/bypFlQ4wwAWAyicejOg=
X-Gm-Gg: AfdE7cnsadQ9TE/FALwk6l5KAhOVPdzE6rH+lsfwg0BGP7mG5T5T7uS3TDZ1fMCcftY
	jmPie9KaG4mBkDGgR3m/1smCgXXzeCZuy1479AXT18oFTjtoPs/2QmkRr6dvq7TWfEjVDHS8xZ9
	fSQx/6A07QmSynSxZPJvvoo/PkHV5hSTjxT8hIBbec/5bRA3yL9MH9Jy9mmwKxXWeKXfhnGRDwW
	pI0e6ns9bLq+oG4Ob8aoTb7QBPhBV+oAxNAJkFk83cz1BMFIjI3uWBvhbC4l+tOyPeJem892gJN
	3MWoLRI+4nEj/kHL3Zo3ChARkZPSOhD3Vi4UzHIoqHP/ebxvhOINC8oo7qyFbpoC8B+8ds2e9Yx
	46qR8zezTlTsziZexyAbG/JU8+HWu5ZN6LeuRvU0waNiiz+Sr39nEFza6AlpWAol/KRrjnRc8o+
	x2b8WM0zJMB/PMfBS4u6Og3cWMO7zl5+JRfRWYK5YhKORpY8BvKZGdBKdX+V8M/QLnzbjRmCKUg
	jR/
X-Received: by 2002:adf:e18e:0:b0:47d:eddb:c11c with SMTP id ffacd0b85a97d-47f48863ae1mr1526022f8f.27.1784013913633;
        Tue, 14 Jul 2026 00:25:13 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f464a9879sm6673408f8f.22.2026.07.14.00.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:13 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Yang Shen <shenyang39@huawei.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/20] gpio: Drop unused assignment of acpi_device_id driver data
Date: Tue, 14 Jul 2026 09:24:02 +0200
Message-ID:  <81812a13ef9c8a27de3e1ac53e70d5807102cd6a.1784013063.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1804; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=kPZuTME3boeG2MrC6mpNSfxJ8R4eFTDK/auZCtUoPjM=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqzQJ3IGMw1emdWd+aW2fZ3eLXc3azZZ7yfJy661phZ83 zyzLHprJ6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQATuW3CwbA1P3/3q0bT9gN+ /KVat5hLzmivNtl4LKGZpSDva5OneOuBlOkzBOZsCblYbWfjFbVN85jO9aufU+yVss0tpTOsU/J ev5SoeeZ+UPt4DPN8UzYtjxMMPZmCmva3//7eze/fxzujQ1D+LMOOn7OmPPjBsH3hw1syc3gtcz xPrpCPyrtxK7Ywc6L/m6go7njRGju91OMTFnkoe13ufWl9WGpS+M3FjIyb+pftWVFxW/H+pxL2c 7Jn+zSMXn0LWeDe5biSn3l5XfCWxMniUYyiMm6tEuLnPTn8StQObfBgL1aTLX61KbB03cOrL3pd p+rNaVI6d0WT/yMnR8ECNasDpfu+HJbPdr3eueOrknQtAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:shenyang39@huawei.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-40015-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,baylibre.com:from_mime,baylibre.com:mid,baylibre.com:email,baylibre.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB24F751D0C

The drivers explicitly set the .driver_data member of struct
acpi_device_id to zero without relying on that value. Drop these
unused assignments.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-hisi.c   | 2 +-
 drivers/gpio/gpio-mlxbf3.c | 2 +-
 drivers/gpio/gpio-xgene.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index 42d41cf87ac7..3b65ed4592ee 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -222,7 +222,7 @@ static void hisi_gpio_init_irq(struct hisi_gpio *hisi_gpio)
 }
 
 static const struct acpi_device_id hisi_gpio_acpi_match[] = {
-	{"HISI0184", 0},
+	{ "HISI0184" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, hisi_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
index 566326644a2c..7d747958f2bc 100644
--- a/drivers/gpio/gpio-mlxbf3.c
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -271,7 +271,7 @@ static void mlxbf3_gpio_shutdown(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id mlxbf3_gpio_acpi_match[] = {
-	{ "MLNXBF33", 0 },
+	{ "MLNXBF33" },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, mlxbf3_gpio_acpi_match);
diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 809668449dbe..22d22962963b 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -194,7 +194,7 @@ static const struct of_device_id xgene_gpio_of_match[] = {
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_gpio_acpi_match[] = {
-	{ "APMC0D14", 0 },
+	{ "APMC0D14" },
 	{ },
 };
 #endif
-- 
2.55.0.11.g153666a7d9bb


