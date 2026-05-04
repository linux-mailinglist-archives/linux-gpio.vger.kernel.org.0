Return-Path: <linux-gpio+bounces-36089-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL7CJh/5+GkG3wIAu9opvQ
	(envelope-from <linux-gpio+bounces-36089-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 21:53:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8BE4C35E5
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 21:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E477300A333
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 19:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9729D3FAE1F;
	Mon,  4 May 2026 19:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pid0jbtW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DF83A1CF3
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 19:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777924378; cv=none; b=mFplOU6BdqZR5RPUAG/ZKElyDjmEL5/ZKDX9N8yf5dvpEgX6bsnVTjUQMdtZ0wyf13jJadAAETpob/Q+tCrnBNSI64up237/qfCmhTo0V/ah0IOSZbJVHAEtpfnTK173eWfLIGfiVHsKMdKhBE0khR04IkLsvsYtj94JUBuuH1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777924378; c=relaxed/simple;
	bh=ifidHNU5irM5qjO3QNIcH7tee1npC9TQ0CwmI71PyF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bn8OsnzCnpXsETn5dQIjcY8PUCCAZa7Cf+JfrYnQ5cWVvq0wwL1WPh7OqCFEIVbOvFkpTaH4ZXmz1AjpTlYJdbyyVuzzE0GKQ6lWz7ZRG41LwzlRpBYrmrceMRSdDZeHudHXsSEIZsadeaLoN2neEJfpW+uPt95YTnxrLdrTUjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pid0jbtW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48371104ffdso6051165e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 12:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777924375; x=1778529175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZliWhjaOVg4TC4//3lDJ6/NQGwrR52dly8kqcGvzQZw=;
        b=Pid0jbtWIlN7iBVyRCp6abBYgt1wTFy3+KJOB/31sWnOquhUPrbct0Z+dtju5iL581
         nMZFiUisGWt64TLp7eFE2ebjeLHBtDu05xPTdKLyLcqjPi2CZFlqhaHveGPFTb3gavNL
         iYDBwW07nRNRpfNHebyDxnCMkB8l7GkvSDeGjiP5Tm+TAs7VeA5OEveD2mVnE1KXkeQB
         l6mEpyJw3XYgxh7OdcwoazXlVUZlKiFakHyUE8J5Zobisxb62uG65F526iYkn3jsnxYu
         FX+VTaTa2ULcF85oS/WaKPcYW8KYzu7b/gJSpFtAbylyEOvIP0JPKPfU5mQ4pw8ImxU9
         OYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777924375; x=1778529175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZliWhjaOVg4TC4//3lDJ6/NQGwrR52dly8kqcGvzQZw=;
        b=mwHZnDh/9GlhgtiLkCRL/GOA+XDxSMOhW4w1ltRaV00zbOIQJHbQjr+ejdux2LIOAA
         6v9FpA5172hO23kQBREzudmVP3Dsd9ZlMa6MYUYiwPexroZS9dd+bg73oe4J/g8CLJVg
         fU6nVDHV8bl5GUezsVvBBt8OZhP+XEkQ2aYxXqubvGPEmr5BEsar2u4AwmPkgjaHPkDF
         mC1NOlBX/9Cb1IF+FfzL1NeQaDocVIUgAY4RGlkbHSyMGO3pVuSuGRe4KksGPxee4qCT
         MTrDTOONRcuacy5UAxhpG40iHWnhZbRRhl5KjzUTl3bug0S70wuvtjRRm7i+5LgYZSDK
         B7cw==
X-Gm-Message-State: AOJu0Yyaj0RKAOlkUNbERJjUHHYpNI58YoM9rCHcCEC9W6vKyjrExu3n
	95MRuQHpHclQSDhV5P3BEqrH4AjhN99y9+U147UA7lKu3xqGfW/ksDW6
X-Gm-Gg: AeBDievSVNmPtnlGN9GMq25l3fWy27TDUe5rq2AAEd6BQDwgFpllEHrVNxMNUJUVybp
	ufCbwA43tJXOvs4mG64pdEYyGDVFvnuWxlskaa0/iJxzOkcABM9mmQDUq7LqcOfGQPAPVaImkA0
	rWnfnKRYlqgebs6nFuQgISIMXaSj/f1BCm53S9LTpf0vCMwxVRYK9+aiLmRAazI/mQsabSFyDzS
	NgObJCydE8KGWoQ4qEZ1h5tXV5ANPOlJVkFxKu7ptd7gdGuXVT3VmnDR/epuB0UobeUxPDABF0i
	eQIdbSZC+t36/4pDri2HhnqLAV76H+hVw1BTxyYNr7tVWBlB5Jt4vbQejKUFu6FtX4dUBzJXXjm
	Vm4chCXVk+eb9LJg9hmUZsT+9IN+vQPm1tJWPgWu8fHeJK/AfiQr8/tqLDOm4N3GrWVLN/dNwsa
	X8Eg6PO3VuhxQumjCN9zYRrSU2P3bvuh8=
X-Received: by 2002:a05:6000:2b09:b0:43d:1f22:7114 with SMTP id ffacd0b85a97d-44bb52ac56dmr4386315f8f.3.1777924375206;
        Mon, 04 May 2026 12:52:55 -0700 (PDT)
Received: from lucas ([2a01:e0a:354:c290:234c:5dad:48b0:9188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4500d7351cbsm378524f8f.15.2026.05.04.12.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:52:54 -0700 (PDT)
From: Lucas Poupeau <lucasp.linux@gmail.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas Poupeau <lucasp.linux@gmail.com>
Subject: [PATCH] tools: gpio: replace strncpy with strscpy
Date: Mon,  4 May 2026 21:52:51 +0200
Message-ID: <20260504195251.53771-1-lucasp.linux@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3A8BE4C35E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36089-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lucasplinux@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,checkpatch.pl:url]

Replace strncpy with strscpy in gpio-utils.c. strscpy is the preferred
way to copy strings in the kernel as it guarantees NUL-termination and
is more robust.

Reported by checkpatch.pl.

Signed-off-by: Lucas Poupeau <lucasp.linux@gmail.com>
---
 tools/gpio/gpio-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index 4096bcd511d1..d5d194be7cc2 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -82,7 +82,7 @@ int gpiotools_request_line(const char *device_name, unsigned int *lines,
 		req.offsets[i] = lines[i];
 
 	req.config = *config;
-	strcpy(req.consumer, consumer);
+	strscpy(req.consumer, consumer);
 	req.num_lines = num_lines;
 
 	ret = ioctl(fd, GPIO_V2_GET_LINE_IOCTL, &req);
-- 
2.54.0


