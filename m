Return-Path: <linux-gpio+bounces-36022-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLpwNCpS+GmQsQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36022-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:00:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6964B9C8F
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 10:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B20E302F0EB
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 07:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F34313546;
	Mon,  4 May 2026 07:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caAf54oS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14703126B2
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 07:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881352; cv=none; b=eanZ/pxPrTntpydO6msbwvuNDHT7rWOIDX9Ayiq61mTW9X5ZloAcWdKiGqn1uMJkhccgbNnpXdngZFozBvUS9n+SRYJJYt9DC9g7mLcjExzVcFDPwq85gEM3/Ix9qsfYFjghjXPw9piidTX/6K5ExjipQP34Vlf+4qrN0R44OiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881352; c=relaxed/simple;
	bh=SE6qI0Xl7qswPzN1wYO0K6neazhV8iSlXtF69PMSKp4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MWjumSOFpAfnpMi/ChWHvEBJyXEVfAahLYmYJ2iakbyFRIMmEeNcF6N3E7aRFxzKY24iD8ttc6YxgNhXjoG4TJZf1gMkxscBE5l72LDwqnCl1nxoXEEMRa7GakiUHSah7DJ+ilQqCwz4KBp8oUROObOBgsVGhSygRD2lowinNBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caAf54oS; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-364d72f2986so2437937a91.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 00:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777881350; x=1778486150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BE987k6Fe6R2JtnCpGKYS5lOUEtR34vfgtyl6STircg=;
        b=caAf54oSr39UGSzgQ4XeVE1iZB9fmwGDL3uZ4ohXaPRpzivvbBEyww2iyf/8nFToDZ
         o7wCaTP1a/i15LvscCnpydB8evcW7gG/3aZ7qGciMm3zRmgLZ3pbcSPtHI8xbQ3bzO2t
         hQ1xjIkaIG0Oh3OHj6JmsaqfNXXIJc+W0OvaHpVTFXaHJEZZAdnxfURLLZdetBcaszap
         5/CRQ3P0mErEHJt1iWLatWE1EUlGO8tx9cRypdvhHy6tcQk4IqhSBMpCTUiXsVfy4X8k
         67SmG8f0AaScyI1rFRgN2O22b0pc+uBXNS+xB4/9y+ND0nRKurDUE780KtsL0DXoMY9+
         VB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881350; x=1778486150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BE987k6Fe6R2JtnCpGKYS5lOUEtR34vfgtyl6STircg=;
        b=FWs1U3+5vtYn/mgyUurOJozp5y4IO+HtJtZmehApkpdxbtbqOctiEF6dPSWQybcQRj
         UcLsiP4Nr48frU/8iYODbnFnH3WjOzgsLokCmW7fNIV02FbPmRdt5Q1jeeJIYHVyU2WM
         q4TKszJz6a+ye7uqUC48NOLvEP2qTm/KRR5iDSZChRyWQw5m/Kj8eYM8v+UegxaeN+OG
         7zSvwzm8gTDeU05GHBex8PvIQ43h7dz8xW5RE8vAJjpjtMJ2dYRBocmn1SBGMeADnthH
         iSiX+UIcGksy8nwnia0p+yPfPvltbNnpKySMfI3nAZGG+uWgJwy7eKZssVPYR3yH2DjQ
         CW2Q==
X-Gm-Message-State: AOJu0YzClSCXxLRQ5R7GzlyBFkuNF1Ue01dPQhylGp15cBEij9N8esjh
	bqBDNDkZjFhnzohMG4SpCCZa1Ku5w2yhNvTf6UH4BQLQ8sHpOP5FQwjcQ1CNipNvMi4=
X-Gm-Gg: AeBDievsRTg91MjjUkjO6NuZwQClyrjzVGS7cWKlvysOGb7ZNQI7vBzJmvaGR3LZ20D
	9BD+UACKD0fufpA+3YLgdSFT0nqnFKdNC3iudqHbamPV7DjBMdvcPp74zaAIEFmEACJYa9DeJV+
	4R7gYG4PUvBlTHqJn0GUoT9s46BPWofuIJ6PLQT7gwj5KQSfVqIBHWYbeJ6HIM/8eIPRIwswb/y
	Bqxic3hlSJGKrtHwjdsK/9xYnBCdihgXlzC5A+GfOpRQDCa+xrD8nPkKQIw7LeaS0EjFl7Ef/D7
	vXUzCHPiAdEor7e3tRVpQ5fNhTcZ6DnXXvzqGgo9M1Mtq8Ru0Jvt5XVbeKxym60X2g2JNb+iY5p
	C1qmjWcQxfqJmRqWu8AwXL6S1bAnWeSGZfEioedKHfP8f1pb73bzJOeAnu8eIcWIuOZWFPdjOps
	0C0VX01QPMKZXhI7O5LxFPNYG8/A==
X-Received: by 2002:a17:90b:278f:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-3650cdb8085mr8761111a91.9.1777881349582;
        Mon, 04 May 2026 00:55:49 -0700 (PDT)
Received: from 007.. ([59.66.153.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae0f67esm99898255ad.51.2026.05.04.00.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 00:55:49 -0700 (PDT)
From: Zhang Xiaolei <zxl434815272@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	warthog618@gmail.com,
	linux-kernel@vger.kernel.org,
	Zhang Xiaolei <zxl434815272@gmail.com>
Subject: [PATCH v2 3/3] tools: gpio: fix ioctl name in error message
Date: Mon,  4 May 2026 15:50:36 +0800
Message-Id: <20260504075036.12190-3-zxl434815272@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504075036.12190-1-zxl434815272@gmail.com>
References: <20260503190016.13439-1-zxl434815272@gmail.com>
 <20260504075036.12190-1-zxl434815272@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2F6964B9C8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-36022-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zxl434815272@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Use the correct ioctl name in the error message.

Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
---
 tools/gpio/gpio-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index 930a38fe7911..0d52d58cc6b6 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -95,7 +95,7 @@ int gpiotools_request_line(const char *device_name, unsigned int *lines,
 	if (ret == -1) {
 		ret = -errno;
 		fprintf(stderr, "Failed to issue %s (%d), %s\n",
-			"GPIO_GET_LINE_IOCTL", ret, strerror(errno));
+			"GPIO_V2_GET_LINE_IOCTL", ret, strerror(errno));
 	}
 
 	if (close(fd) == -1)
-- 
2.34.1


