Return-Path: <linux-gpio+bounces-32175-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIqmLO/4nmm+YAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32175-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 14:28:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDF519810B
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 14:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FDD630EFA9F
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Feb 2026 13:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991E53B8BBE;
	Wed, 25 Feb 2026 13:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6bdsSvb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6481434F49A
	for <linux-gpio@vger.kernel.org>; Wed, 25 Feb 2026 13:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772025814; cv=none; b=SQQppjs8m4GCy1c4ojW7rnpzjNlXq041/OWODkvmKDBdpV0eiEQlTcMyIwks624j9bhSY5GMsXDw2kkYHaieeINCMuLrEH9+P/9l+H7xKY0TraSR6adR4M8z/yeajZ8h4AlunV62kH+gQ+rqEdeQVY8U3HLzgWCGehjU2p7w6Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772025814; c=relaxed/simple;
	bh=YS/sXiuj2czShLDQXAAPbRvZRuP6Pa4lzIjqWXq2+0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wtu+lSaEsYYIhrUqnzvyuGMGD8z6tHJX31KF7PVFfYZS89VoOEV1oB0/6Z7l1JSCf3AnUoVHYMCq3ha8RMIxMGNrPk6X12ErYEPgCo8i4YAZoK72tm/R8BRrpfG/LILFj8CZZpmGklB4HKZTSCYzghNRmG8CXuDo0rtwcWuY6KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6bdsSvb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a95bfdb31eso28286065ad.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Feb 2026 05:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772025813; x=1772630613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8MyfCwShsdn38owSIBBapSosmGxnp1Wb39JER6IFqU=;
        b=S6bdsSvbtGRUJSJNKeoyfk4u3eKF+4BWhPGsMHbNf0Eul3hLiQOs3gmaBTPsKLA6uD
         0lMzuBS1P0Q2nHM8pcMCQgQEQ+IPXAhzqKwHUY0U8gQHbc2UrXzAjurvRFNFIAX7lHQY
         7zIwsCuwUPV9lR/T7qrDx+dJnfhWopuWRNm6cUQUiUskYtriV0Yu/JyRu9NFxn1t8GiN
         /kGWZK7zcJuHsc3ddbNHTuRjN7jOtGXvecQclUdmRlSKsfsCxA8852IdfBrREjN0HKgJ
         M7Qv6ujVU/dsYMuZLXWvA2KyuIKK8TABi+ihS0Vs5wwBkptesVIgE3lPCohLH/AQhQOa
         Htkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772025813; x=1772630613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8MyfCwShsdn38owSIBBapSosmGxnp1Wb39JER6IFqU=;
        b=eWuTQV04hcurWBPxXP8wd3JoWZx+f+0YELdzg79cq2YdqklnPsRPZcdR7wbNDWZl07
         tQucuDskmfVkvERUc+GWPHASCNhyoWhh6a3lzx93Nst0PNajL+2jABdQF6xhBt1NqV7g
         J9i7KvfEO45rsitSpJj7e1d230NujqyT8NaAISCydmOJES+o/FoyijtdNL+T+cae188t
         fJkEY7jD7Xw061EMUDHRY96lfUoJui5/vJWpSXrrD9E0aTqvyDNCjAu4YKcA+2ArWJRu
         UfR+2WBMZfHAtMe8ofOydi75bHV0UwkV/9qyv4eSH93PVK7qOVBdFRD5Ipdtp86EYrRz
         scww==
X-Forwarded-Encrypted: i=1; AJvYcCU0liLX7NY0TxjP7J/GCNtMIj26wo670UptOqI74VJC8CSuq/YJ/kcE09PArFhBR02uSdefUOfzt8SB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9z8RR6DMTgDQ6cp4faNvBGEYfJw4CpozKGg/uAVPs9OmySNrN
	Lb/l5kTz9F016SWEaKiV7i9sWwyF7jVM3T1reyFmlCDQ5eFHSmiZTbOA
X-Gm-Gg: ATEYQzza7cVhvhoVyzg0OXS6rKUp7iY+Y9JFX2fD/oHcjeTyFkC4ng8m9xbX2aqEbx3
	RSWJcHNc5ZMe68iGnTT+1I1deM6feyLxxOSQx3ZRJeIRFv5ZodWKYSwYDnud6S0x58N8+MIHDuR
	JheaiaVnxS5XOR1FfTVLCzO0ixa7i/zb7CzXZiJMYeGd1aV8A1NZVi1AtYUOxCk9uTx0czxTS6l
	QzwA/etKbqaJ7Csycg5FgiTq1n4HU5q0fvVHuFrCr0jRSyqyzrXnyu+dOsB4Roy7eINtBCAi8oW
	QepNy09jKooAuSOggHdS+TJncoIlpvT5pcHLpUu2xsaeb/MdbxIFa7lMYaBtLuVYoqsFXqr1/mC
	qWI68xvjfswmJisKzKoLhnynJeuY/vmr0zUkJK5s++r7Y0cRSPNlGK543OKV+FaQYADaHGzwGqY
	tc3SXKP7b7O3EXJZ5P4O++J0aRG9l8mZpFDf2KIym0enM15szSoBEtrZvIe47zmkOfYicXJeJLM
	6B0GDt9oyQM
X-Received: by 2002:a17:902:ce84:b0:2ad:ba04:40d2 with SMTP id d9443c01a7336-2adba0442b6mr39747335ad.25.1772025812509;
        Wed, 25 Feb 2026 05:23:32 -0800 (PST)
Received: from pranav.. ([47.247.29.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f9f5sm142245925ad.77.2026.02.25.05.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 05:23:31 -0800 (PST)
From: Pranav Kharche <pranavkharche7@gmail.com>
To: linus.walleij@linaro.org
Cc: brgl@bgdev.pl,
	linux-gpio@vger.kernel.org,
	dan.carpenter@linaro.org,
	lkp@intel.com,
	Pranav Kharche <pranavkharche7@gmail.com>
Subject: [PATCH v2] gpio: gpiolib-swnode: Remove deprecated label fallback for GPIO device lookup
Date: Wed, 25 Feb 2026 18:52:59 +0530
Message-Id: <20260225132259.26815-1-pranavkharche7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[bgdev.pl,vger.kernel.org,linaro.org,intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-32175-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pranavkharche7@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4EDF519810B
X-Rspamd-Action: no action

Signed-off-by: Pranav Kharche <pranavkharche7@gmail.com>
---
 drivers/gpio/gpiolib-swnode.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 0d7f3f09a0b4..d6ab5bf0d2f1 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -43,23 +43,7 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 fwnode_lookup:
 	gdev = gpio_device_find_by_fwnode(fwnode);
 	if (!gdev && gdev_node && gdev_node->name)
-		/*
-		 * FIXME: We shouldn't need to compare the GPIO controller's
-		 * label against the software node that is supposedly attached
-		 * to it. However there are currently GPIO users that - knowing
-		 * the expected label of the GPIO chip whose pins they want to
-		 * control - set up dummy software nodes named after those GPIO
-		 * controllers, which aren't actually attached to them. In this
-		 * case gpio_device_find_by_fwnode() will fail as no device on
-		 * the GPIO bus is actually associated with the fwnode we're
-		 * looking for.
-		 *
-		 * As a fallback: continue checking the label if we have no
-		 * match. However, the situation described above is an abuse
-		 * of the software node API and should be phased out and the
-		 * following line - eventually removed.
-		 */
-		gdev = gpio_device_find_by_label(gdev_node->name);
+		
 
 	return gdev ?: ERR_PTR(-EPROBE_DEFER);
 }
-- 
2.34.1


