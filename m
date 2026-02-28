Return-Path: <linux-gpio+bounces-32349-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNeWJ31Ko2nW/AQAu9opvQ
	(envelope-from <linux-gpio+bounces-32349-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 21:05:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3647C1C7E18
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 21:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7CB133A692B
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Feb 2026 19:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE133D6CD5;
	Sat, 28 Feb 2026 18:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVgm9GZK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CF833D6C7
	for <linux-gpio@vger.kernel.org>; Sat, 28 Feb 2026 18:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772304740; cv=none; b=XMifWVxnKh0xwTMXptQ5LumXwAH8rNBKOlUFMNs3FCnRGkyaSORGvz/Hh626kLLzd8xwL1eduNmtczJjbSSCe58P+W6oZPyH2VyGIkeFtxgLrVXugYkVn0DccfphFkGW2hP5qMIWJm6j1SvSpsny1HciUabDdFdvQYCXPcfGsks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772304740; c=relaxed/simple;
	bh=vw71S1IGUCgtffHZbwcKCc9MtGxGHy1vl0XOVm/5E0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VB7XCRlAvqDrZZTrAmerHfCaIII4H9C0jcQ/dUqBW+QOqOrFkqSjOwl2Bptix+Omn8cvbxf3cnt4NRpA259NTsCbxs1Q13d9xlNjBrPPXxkBNvvekg9In6CTWhhrvvFbAw9ytxRL0z5TsVmGnYsYy4oKWRAcOrNqX1xk4eN2UAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVgm9GZK; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4638e6bb8a5so1298751b6e.0
        for <linux-gpio@vger.kernel.org>; Sat, 28 Feb 2026 10:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772304738; x=1772909538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G9RezEjbhgLFRIMyS2HFU/5jEzFTTwSRiCs/g/eiF6w=;
        b=BVgm9GZKGDeeb6HF5WtuPlLSmDNx6MeCzJ+hRx9D9mWl/XYqgA8la/k8tKH114LxVO
         rTvPumjuPLITtsYd7NzX7llVOpVKsR+klhxyk+CzC29LFnFCyJzZyuUP3+aY2ejSavXH
         sknVj9jh9s9U7PJin/UTnVwYnj3nZTTgUJjttZz8r29LQdlOeQZFe/2Rpqm0Tt7LfCCV
         MESbHiGR2QiJUEJVku0/WM0OPv3GyC/LZ06wlpw0ksBk3IBw8y2EogiHlsjWxRRLKUuC
         PoWdh+yJiVnw+OfU/q8NUCHJT06my6loY1WWFSs7IVb4cKn16VXc0pWR4X/YgOLeK2QO
         YW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772304738; x=1772909538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9RezEjbhgLFRIMyS2HFU/5jEzFTTwSRiCs/g/eiF6w=;
        b=sKLRbpIcpGW+yj0/R5smEheDbNoQy40MIzdpDFr07+mPAczsoWAVjGuhEK2Iv6kHlp
         zofGp2Kh32/SY/u7LoFib36GDebHkndoBXfnTJCMF4jWdGZO9fZX1ccC75OFV/zzUgkx
         TFf7YZKKEq03b+IV2EsloZh5nmgeVx0zttuihA0nTIR5I94m9+278dGOg7cy2kvXO3At
         F8F6R3IB02UuVj0+hv1c0CQbZ4Qh81l6rm1O47jweCqtWHPF2mirNZaArwuaSqDKICdC
         BcS55tfy0RNq64QZY3jFjq79rw79mlQLAgPKny4CcqxO2ZO4UHZcXBBy8Wtd98JjxEnK
         /VkA==
X-Gm-Message-State: AOJu0Yw7fYkLwHK2gAG9K1khUkwvQj/F72v5u+JLbZ7RcLWz1Cab1TpJ
	u6kw+cno/1oSxHQLf6VtxOWDsnZSZbTkXOyos4w2jMxuYnizM8Wu+/b7Jy93MQ==
X-Gm-Gg: ATEYQzzsTJVRRDlkKRYrbYBxxzRtnKRGJHMlMaLbnSfQ/vVwDe/775To8jNwTMCx5I/
	AYtw/efhB3LKj3plvdWivoE42H+11LdxAXtePVF6SsleFJjE3Ng3dGnlimLG/9Wkc0ua/G2dUAO
	oeABi7mjEHNRrL3l2oIdKiOVdVjI30JxivWH2IixXAlYw6efDiM4eoVf/drUeMFWe93fXi5eQez
	cPHvZPivYvOK4ab/05MVfG5OlNAih9fb6qa0OuvnS3ePvLD0is49hVSqFv5LCW5W9HaSU6sGzQy
	rdEPko1IiRSOlI5eoQrQz2hJsv5KFVGX8sHgmX8ShI+E5eGUFjejuJL7fP0lF/0+S97ttjChH9p
	EOSBzYWwLTdDD44d/e+tSJeEAlsTlQ32ocVXLuzBInOLIXPMSuU+1VSsS860bh8RPb6Y5ZTPoJD
	KM/O7LOt2kSC9TuCQvFzYEJwZk59yEWMQXdYNeFR9k6KmqMAWXWFaaGQRs2E4+iA==
X-Received: by 2002:a05:6808:1b29:b0:45f:65d:e864 with SMTP id 5614622812f47-464be9d784amr3609612b6e.18.1772304737735;
        Sat, 28 Feb 2026 10:52:17 -0800 (PST)
Received: from Zephyrus.localdomain ([131.93.209.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d2c9fc2sm7741252fac.18.2026.02.28.10.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 10:52:17 -0800 (PST)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: remove egg-info during clean
Date: Sat, 28 Feb 2026 12:52:13 -0600
Message-ID: <20260228185213.31442-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-32349-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3647C1C7E18
X-Rspamd-Action: no action

The egg-info directory gets generated when a distribution is built so
should be removed when `make clean` is run.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/Makefile.am | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
index 2ae8ac8..19ebb32 100644
--- a/bindings/python/Makefile.am
+++ b/bindings/python/Makefile.am
@@ -30,6 +30,7 @@ endif
 
 clean-local:
 	rm -rf dist
+	rm -rf gpiod.egg-info
 	rm -f gpiod/_ext.*.so
 	rm -f tests/*/_ext.*.so
 
-- 
2.43.0


