Return-Path: <linux-gpio+bounces-37021-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNnOLgXGCmqa7wQAu9opvQ
	(envelope-from <linux-gpio+bounces-37021-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:55:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C105568333
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E6F03010BF7
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A1F3E16A7;
	Mon, 18 May 2026 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0Zj9g+o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40673D25BC
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090855; cv=none; b=Jdij8FnaRhCbQZQiLrz+69gK5Cr3HmrLkCxyvc6O+5/ucyqaMAIjS5fq/tEcyjYFqgiqe8zI/1KzznnvOS+YW2Y6Jpk7ZUa4tKnaqIXTOa9Y/QBQa71rObyWIEdMFqoSczdeqBMSh+ZqJDAKSC+uyN35mu7Q13A/jKfM5hTYRuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090855; c=relaxed/simple;
	bh=aPiBeLh3lG8cPL7Jg0LLmBRWc+do16dLJX/xIZLlA8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BGJDhGCzmuMOVGTLAvcVb3//9NDAdCo/7O3IcPQfDN6YAQRc0pMmOZOVj8K1BPdsLIw4rsJNeJtgK2860y4mDn7Fki3gKtRpx+46a7T7UrU5yu1B/IAGvUugyqedItv5/l4Vc4XmNYk3XVpqfPbdw7zTh9PS68EeqaZjqkeczLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0Zj9g+o; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so10329605e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 00:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779090846; x=1779695646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZIry/uS8ZFI2nZX4B4am8kKwMyHaZt8EZw4IRUQPLU=;
        b=P0Zj9g+ovGFgKOw3UnqgrUclw66/GYvhgCTM3YFrbNIX0/fCp6QcAnp8WoYHDUw7Iv
         TkNbvkQAuoEIfw/dlqttv4qpS5QD+VSGU76T1phXUG4ZjvbGLG0ju35H5aAej9DJyOWV
         d8FE+7JRenK144OoW7ck/JK/z75SYJFRQ0XewUewLYVQQ+gNGTTynoJeK2OfCy46IRHf
         VyYlF35LcNTR5Q2QaurVP2//vjG1An+fLgLRS7h7Fwt/NJrxduapgpa7sREHOWySl5sR
         w3hCozRuZ5txmOqmxcbS+ULKxL/DbV1CKWO9khwBsmybZs1N2e2wCo7CvhfTsTCB0ZYP
         ceuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779090846; x=1779695646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZIry/uS8ZFI2nZX4B4am8kKwMyHaZt8EZw4IRUQPLU=;
        b=Gt+O9TAJ8IEebSRoJYiYJQAnFnKFOt2g2b3PA+rIiOMkuonpL1fM2k0WGf2GAjmESI
         rCS4yBJn0Q92Iuhwcz0zDHAZl9xSl8WKxbeT1qXDnqzcjiOK150Hf5A0Rcq77mmF5xjO
         2OUuSwpP9n2cy2CrAT3qF+zDYnnH0j4g/kdGYU2GAvR9BzfX/vmUdw8HPfGZnQuxbwuO
         Q2paRmhQNSnWiQjEmtt0LOHZvcgX7cr8DcuxHHgBP+zeZKrM6OZM7/+pI9ow49SdW1Lz
         uhhEfNEl9QArNreIHZIJheLzzYBNUx2rRa5sXS7eQCK4Kr0EfpUQDTCNz47Eh0EnvM9R
         DtXw==
X-Forwarded-Encrypted: i=1; AFNElJ/NkG24bksfYLX0Y6NIkabD2cqbbyrHKI2/ThlIfiCScfsvdHDhIPUKvg7cBS7iBw4icH6euFaVzJl9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4l8CnfB2TkON5cRdw7uji2ukalLDF9MAUUp0bIanlVcbOu+Ts
	1CExkSOWN6yRSCxaYpGNh/7RCIw/pSohrbH/FUyeQmD32PepsCNOVCac
X-Gm-Gg: Acq92OFHKTybef1YraiU7ToZzk08AwzuWkKs577nF6xmtSyC16fwf2ADCbLzORN45zc
	jWRHyikpWe5HqPxTG21TYyS8NbPjKK8WiyOT2eTbngH3mwVuPA/gtcHsHwtb5wYU1ang6ueASN2
	vdmG003J8Kmd7XcgGcCfwKqPnFysmUxLubZ0DjI+Kbfw7gLJAljJgMLyLXnMzI/6ax4X6i0w5aZ
	jW+YmYoFFBJdrdzYlSbEYTw1PI3lM3q7YEI0+FCnlRJ6zUctZh7BJ9hI2MCiGEmuy7oWGho3YSO
	O0CIKB1aOsM9dy3zTaBwhEWyBvpUfGUYIwqlJshpKBRwpeEnMY0A73wfOFgoKHGbkz2DwNvAhZW
	VcD0Ln+KF680N/6RCMCa1u0wiHyliyP17cd/yHzU4UnnEvJ9jusdeklt+XqiQfrmzLkGOkzshqF
	GCUkzc59HdWhIYLPs=
X-Received: by 2002:a05:600c:34cf:b0:48e:5990:9698 with SMTP id 5b1f17b1804b1-48fe651588fmr217217785e9.24.1779090845805;
        Mon, 18 May 2026 00:54:05 -0700 (PDT)
Received: from ROG ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feaf14d22sm102788835e9.3.2026.05.18.00.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:54:05 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
Subject: [PATCH 04/12] gpiolib: acpi: Fix resource leak in OpRegion cleanup path
Date: Mon, 18 May 2026 09:53:49 +0200
Message-ID: <20260518075357.112584-5-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518075357.112584-1-mscardovi95@gmail.com>
References: <20260518075357.112584-1-mscardovi95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9C105568333
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37021-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Assisted-by: Antigravity:gemini-3-flash
Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index 90bda2d7da57..4c8cd2038aa1 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -1240,7 +1240,6 @@ static void acpi_gpiochip_free_regions(struct acpi_gpio_chip *achip)
 	if (ACPI_FAILURE(status)) {
 		dev_err(chip->parent,
 			"Failed to remove GPIO OpRegion handler\n");
-		return;
 	}
 
 	list_for_each_entry_safe_reverse(conn, tmp, &achip->conns, node) {
-- 
2.54.0


