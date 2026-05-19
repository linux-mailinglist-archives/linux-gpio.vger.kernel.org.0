Return-Path: <linux-gpio+bounces-37101-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEBeBYa0C2q2LAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37101-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:53:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B89575CD1
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 02:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50A473024716
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 00:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC38282F25;
	Tue, 19 May 2026 00:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="FokCYGVf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8092F2F5498
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 00:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151959; cv=none; b=D1IIutdD6Z0QtYzks+a21AZx7emyZ2Dtsqxz24Tpke/n2/Ya9qTaOa5Z2fFq4OQqovNIuHMmNxmksEr8zkkrOFIClJNppt0aSP6+I3Yf/C23NZW2D+6yeF2ISQRgGDA1TtYaA1zyrl1ek1934PHkfw6c+a6h49XlojEIg2yjuAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151959; c=relaxed/simple;
	bh=FDObNUWMvwjjzrN2IkV6Cgo3wEKZLI2a8RqN+knZ8DY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXcAqp5iyMSgCV4VV3/HSMQI0pf+IEgY6JW9M4o+oROtC2I8kE/sPUOVTXHQgia6IhyP5MYmOvvPOH0fqB7o7hZLBZBvqyq7qqMdKldD0zqjHOqz6YxCcllrG/OkbC/x2QlkyNl1GCUbR43KXVPsKLUUQKorvSlnPCcNbBdq5WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=FokCYGVf; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c1a170a50so3668520c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 17:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151956; x=1779756756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/5ooRxhmqvebnRUuOuBr2iP+EihWYORWSHfWOHXOBo=;
        b=FokCYGVfbUh3NyYoQHX98CPim+tFdcPD3ttErufWDJtZIqPQbdnPeRsCt/cv+gInSR
         BAdSdvFMUROPobIGUgaWJUaodkTLlj0Lizu3cM0FW1Pq8CzEj6O8W7liMNbEpVBbXxeG
         v6vRGyj+YiNdB/sJYyCCbA/9da4qzUi5uTnFINwKDTPQA8qUOk8oqfbYwyk7cIF1eW0s
         u+Sgofk85lc1fhVYTPG9ZKi4wwkehkoyx1YCKxf+ZvcodoAO3O2wzaKPMSfgxK2UhEj3
         b+ny1xDjhaEVM0qBav3u1kA3jdlJFQlgpvwYTL3YWOTIeMHW1k+PJFbjvMmTTn91b+eS
         ev3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151956; x=1779756756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k/5ooRxhmqvebnRUuOuBr2iP+EihWYORWSHfWOHXOBo=;
        b=mBLaxT/mCevB5kwiEd1wtfHyJcSoVV35EgbAqhaLUOXilHjnorPX7h3mCb/jvrFucw
         ME3TQtUkRun53Dr9F+FqCN6NDZYjnQDTjG01vMcWXinO2NAmZz9+TJwnODk4YhcH2HeC
         9ApZBoPM2aczlMlZHkqqAkTxUbCaTY8iORGn0MEyykleKvBPUPzmzs5wJVFgHsftFbbS
         Fff7z7MQLeMciq9uEaeETrRDnpiFsdC1ccumpy9Yrkd9lEOlu8aEu8giQza1dByxd+Uy
         l2W0ZokoltdMtCc/YKQlGmlkkROW3RingncQKfIfagc7GRkwDv6Imt6heZpjYzba1Moc
         7fbg==
X-Forwarded-Encrypted: i=1; AFNElJ9Gp25UqIsFcLs/i4zZHtKRazn5kjTKFHImucbMmFI+DzbDIibeIK/cB1/JSeZm9ArZ3EmX9I//DXla@vger.kernel.org
X-Gm-Message-State: AOJu0YwEqNHCqkul9l+6v+KMYsizRJueRrGt+DU30Y4fh7AsmjchOgid
	ilAucAnz04BE9MjU3PQYojk+488Gz5OVpG0N0TSvx65kS9BxHXk1vCORBwt4BLZyxGy/MNCFDNg
	6FPShxpg=
X-Gm-Gg: Acq92OEcaT6icNl+bJI0pvakNJCGCGWo9cn0J9O2920I4h+TY33iESkJ7dKlbpmap2I
	Ma8TQsNwVPMBlFed+cNdEoPTAac4r8kL/c2QlABiWjMAd7t1jDwXdNXYWrIi2w6Ql2JMU1nS9l7
	6zLoiPSBSuKyAzCe4zAXnyFa8YZ4nGseCdsGdwU/Ur7Ubnkfy0PARMOfovIPJUUG5IEobkjuo08
	2SYzreG7OG9+fTE5WfT3KPAHXTl9p4beemQj8W79onfxM9VaPNM7D+Y/KA+6sxBZ7QmTL9szDrX
	4knyv0g4VYrUl0WGKI4huPwV87w6s4quwj1fokBcqZxnc0gupNEYFxSh3XTtvasHm5qKleuPnq9
	wKIjYcvbNoJwBZo10BSCmoCkpz2n30/wQoHnEb4n7yJ8tl14i2/1IHpXkuCDvoDHm4lithZsr/4
	SrnTjmlwWJXp/EoYoqod2QcYGNCg==
X-Received: by 2002:a05:7022:f88:b0:12c:2dd7:9099 with SMTP id a92af1059eb24-13504945cc6mr6484019c88.30.1779151956046;
        Mon, 18 May 2026 17:52:36 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm22546633c88.3.2026.05.18.17.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:52:35 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 18 May 2026 17:52:31 -0700
Subject: [PATCH v3 7/8] hwmon: (pmbus/adm1266) serialize NVMEM blackbox
 read with pmbus_lock
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-adm1266-gpio-fixes-v3-7-e425e4f88139@nexthop.ai>
References: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
In-Reply-To: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779151949; l=2029;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=FDObNUWMvwjjzrN2IkV6Cgo3wEKZLI2a8RqN+knZ8DY=;
 b=o4T0vpm7vwd7nU4PKFq3LRjfSe8OC/WKKKQElG1ohtEyZMkibITfRtuoo4iMw2HUrWZ5T/jQj
 fdKq75w5UTrA8wEIqtvyvFpSdRLwy/IkjcE+xsu56FiOHl5FTYfOXj8
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nexthop.ai,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[nexthop.ai:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[nexthop.ai:+];
	TAGGED_FROM(0.00)[bounces-37101-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdurrahman@nexthop.ai,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nexthop.ai:email,nexthop.ai:mid,nexthop.ai:dkim]
X-Rspamd-Queue-Id: F2B89575CD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

adm1266_nvmem_read() is the reg_read callback the NVMEM core invokes
when userspace reads /sys/bus/nvmem/devices/.../nvmem on this chip.
On the first byte of every read it does a memset of data->dev_mem,
walks the device blackbox through adm1266_nvmem_read_blackbox()
(which issues a chain of PMBus block transactions), and then memcpys
the refreshed buffer out to userspace.  None of that runs under
pmbus_lock today.

Two consequences:

  - The PMBus traffic the refresh issues is not serialised against
    pmbus_core's own multi-step PAGE+register sequences.  A paged
    hwmon attribute read from another thread can land between a
    PAGE write and the paged read in either direction and corrupt
    one side's view of the device state machine.

  - The NVMEM core does not serialise concurrent reg_read calls, so
    two userspace readers racing at offset 0 can interleave the
    memset of data->dev_mem with another reader's
    adm1266_nvmem_read_blackbox() refill or memcpy out, returning
    torn data to userspace.

Take pmbus_lock at the top of adm1266_nvmem_read() via the
scope-based guard().  Patch 5 of this series moves
adm1266_config_nvmem() past pmbus_do_probe() so the lock is
guaranteed to be live before the callback is reachable from
userspace.

Fixes: 15609d189302 ("hwmon: (pmbus/adm1266) read blackbox")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index a80fb2ea73bd..051f4f188ec5 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -394,6 +394,8 @@ static int adm1266_nvmem_read(void *priv, unsigned int offset, void *val, size_t
 	if (offset + bytes > data->nvmem_config.size)
 		return -EINVAL;
 
+	guard(pmbus_lock)(data->client);
+
 	if (offset == 0) {
 		memset(data->dev_mem, 0, data->nvmem_config.size);
 

-- 
2.53.0


