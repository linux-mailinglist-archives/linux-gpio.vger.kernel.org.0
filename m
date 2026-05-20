Return-Path: <linux-gpio+bounces-37177-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGWaAlFpDWquwgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37177-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 09:57:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BDE5893EC
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 09:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 510B7302A6EF
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 07:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E693932D1;
	Wed, 20 May 2026 07:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFFkTIw1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0CB37D13C
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 07:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263402; cv=none; b=DpBpRfvMLE4wTFCidLLh3pvP0iD6d30WrMJs1c3aN0gLL+0nmz3eS9GmoAwsOSyPF7FcphlKZdi7TQyNeZqrIxOjd5GUy7gCsJ6rdiYXwDNQrnWnPJmA3WDY4An+cGKcdGDVROe8n0FK1tgnNOEik/CB4qtE0LohqOKu9Y5kAUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263402; c=relaxed/simple;
	bh=BnIfkijOqhETRqAvk4NXBGnVXN/QWwu0koX8lwy3/tM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViyDc4u7eqmfGA/F0nuVYkCxtqFVz/ns1qr+54BZuXTHFNjuuQ/VdZ211Gid88Br9Y2UdHNZGxbXfg7+wPFaNUVYSUGpXp7j6RZC8Ma5Xrj61X/bRClXHtWR8HbYjlKP4gb/7re3qYWgUBsG+myJ8l905DXjanIMyIIh8sKhFZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFFkTIw1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso33239765e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779263400; x=1779868200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZWSaEiPka45nin0aHf92f+9R1duVlyTxQYhDwK6lTc=;
        b=kFFkTIw1ndqYmpcDXM006kvjfbXWH2bTlIUC8TJTUqKrqXunB2sec/fq/2RNZIZEKd
         5Z/qKu5TQYvEpxfoz2MIBfVJ5oUtb8wHwOVwzoiuUqgsO3VK2RyCaQbAEiAReXfkbCyz
         JIJ2MJq1KAG9RMhEfW4xNqAOHtbXUsunLjcVqbwxfOvmxkGY4YU8m8pQBUiJIBPRwvjL
         NiHqT3Ky6hh6UQX3z0Z8zYb7Uh3T64WJrnXqNhR0R1eeX7JCeBFhln43w2guVlwAZWQ/
         ThbRD3aQ+QnAjhJqfm7VImCwcc6XSHSRyYcYIWtIAP1cMgO9IyYjZHSvaO1ldhv1JkM9
         55sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263400; x=1779868200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qZWSaEiPka45nin0aHf92f+9R1duVlyTxQYhDwK6lTc=;
        b=VgA0e2/cE4wLk2r75P6fSHdvrEumh9JOcX4gCPLEgWPM3s957NqagtkLFPv56P0hY1
         5uBjzAmaLIsJT8+cvQ0uADpfKKawAsrapRCqLX3/P0O8M4BlyIXyu9EdqejwnOPg+JqN
         PDOlteXpPWNArQCUsnGK5mUSVlTo9toXOEWYQWbZnwaLZnWcjj2smlaAptXLEq1/+z5X
         dgLkU/NxLdYH1QGNpl4Idr9VzWVxSp+PEm/iE0s2i6OGUJDlBHdoDFJzGm8Mno228JnQ
         aKu8vU7b4Jl84lW+fEGabjeOXnYrUdy6dJiO0rKmcWUVPTCr7e0qXUIewCI0OmhZi4KV
         jtfw==
X-Forwarded-Encrypted: i=1; AFNElJ9+RWQrEnVmZzWUkfVByB/TKvMd6MU7pllr/zJZIsLKB+zE1wd4wWZpgh1upb0uenVdz4nYa63xNvkU@vger.kernel.org
X-Gm-Message-State: AOJu0YxBpqa3WoglVit4RTmEjcU1ZYJNX/eMouycp4gTHFKooJgLoQiQ
	zHmMt09yu8Toce3IqCcpDAtAZ79IV4qzj8thn6M0wryYXK4sW0DSxYi+
X-Gm-Gg: Acq92OHk3dv7kgjj45h7uftsXWC0UxP3fcExhRdKOCU6Ax4FsIb8fPO/pMGBdgONIBC
	K9IIZxXiE22PL+FJNLb+PGY7kpeZdKQFp889HUFFdlunqGJoincmX73NOhlmWcV9wXbuIDg3rKU
	+h5keGlZdnc9YeZ9+opa2dZlftnHlMj8w8JYKt6mh+zAzy3Sx8Vg982ghodAFtgFhIfE0jiuUpo
	nD8CzGubJ9+dykzU8KrUjTPu92MOmKjS7L7YnBKRUfssYKb5g3D+Qxh/JZ+KQ6W3L5eXXSJzAio
	kHiXlEZ9AnvKROnQnZrccJcBQwe9+GHrrBoDngBNLDLnaSiA8utRTJ8+PyaDIEnpQORdG+pF/Zv
	JMEiO3PzBqCiCwTMQ/Xfy+ORZIJNARX/DgLpaEuQm+WudAKcllgu43m/BJKcgcRaPCRQ73QdgGH
	J7sQRPm1BK0GtBSCDIqFk=
X-Received: by 2002:a05:600c:5247:b0:48f:d1b8:9aa0 with SMTP id 5b1f17b1804b1-49007bdff16mr199799125e9.7.1779263399515;
        Wed, 20 May 2026 00:49:59 -0700 (PDT)
Received: from G614PR ([2a01:e11:202b:40:328e:213e:a3da:580f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fffb9aac4sm496536215e9.9.2026.05.20.00.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:49:58 -0700 (PDT)
From: "Marco Scardovi (scardracs)" <mscardovi95@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: brgl@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	mscardovi95@gmail.com,
	westeri@kernel.org
Subject: [PATCH v3 0/2] gpiolib: acpi: Fix bounds-checking and connection leak
Date: Wed, 20 May 2026 09:45:45 +0200
Message-ID: <20260520074955.55443-1-mscardovi95@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <agwfEMtEctXYC1oc@ashevche-desk.local>
References: <agwfEMtEctXYC1oc@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-37177-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linux.intel.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mscardovi95@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 60BDE5893EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andy,

This new series addresses two issues in the ACPI GPIO library while trying
to address your feedbacks:
1. Adds robust bounds checking for pin resource indexing when requesting
   owned descriptors and querying wakeup/interrupt pin configurations.
2. Fixes a connection/descriptor leak in the OpRegion address space
   handler and handles connection rollback in a transaction-local list
   to avoid wiping successfully established connections.

Please note that some of these changes were found during a personal follow up
analysis before submitting the patches to the community. They are reported
to explain why some of these fixes are made in that way instead of another.

Changes since v2:
- Fixed a global over-cleanup bug in the error path of the handler, which
  incorrectly wiped the whole persistent connection list (achip->conns).
  We now use a temporary local list_head (new_conns) inside the handler
  to log and rollback only the connections requested during the current
  transaction, and splice them into the global list only on success.
- Renamed the global connections teardown helper to
  acpi_gpiochip_free_all_connections() to clearly indicate its scope.
- Fixed a potential concurrent connection duplication race in the handler
  using an optimistic double-check allocation retry pattern.
- Introduced the acpi_gpiochip_find_conn() helper to reduce lookup code
  duplication.
- Changed the subject prefix of Patch 2/2 to "Fixes: gpiolib: acpi: ...".

Changes since v1:
- Reworked bounds checking in acpi_gpio_adr_space_handler() to validate
  that the requested pin range [pin_index, pin_index + bits] remains within
  bounds of the ACPI resource pin table, returning -EINVAL instead of
  silent truncation.

As always I'll wait for your precious feedbacks

Assisted-by: Antigravity:gemini-3-flash
Signed-off-by: Marco Scardovi <mscardovi95@gmail.com>

Marco Scardovi (scardracs) (2):
  gpiolib: acpi: Add robust bounds-checking for GPIO pin resources
  Fixes: gpiolib: acpi: resource leak in OpRegion

 drivers/gpio/gpiolib-acpi-core.c | 157 ++++++++++++++++++++++++++++++---------
 1 file changed, 122 insertions(+), 35 deletions(-)

-- 
2.54.0


