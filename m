Return-Path: <linux-gpio+bounces-31171-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KY1N7ICeWkdugEAu9opvQ
	(envelope-from <linux-gpio+bounces-31171-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 19:23:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B6198F5D
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 19:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D74B63023A51
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 18:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00EC32693C;
	Tue, 27 Jan 2026 18:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oz1UvdCy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4492F39A3
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 18:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538222; cv=none; b=nRg4HD4svjBKZ8dTnqmbrjWTL4yRZOYh2C3togEwloj5RFvE8rrdOAgzgrL1CkOhngUvStiBt2N9Sj8lj6Y8ePZA7lEJduX2BmMc/cBz2PKBdPCHZ7bkZlnOxbzx5VXgemqzW1H/srn3wuLEzCkZ6o/Bga0LtyH/vQu04ZjIKCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538222; c=relaxed/simple;
	bh=gzYCg7eQFUgU4V294MJ/J3tLEbmiBq4eX3ZoJFJXYAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JMSImsoaQrFzdC30on3l24LcAlLidyWhvKyPvWAPgKmLehBFPOIUh7V1Rbd8H38QoxA1Cw5CDIAf6t/Rcq5Xq2qQMSt56cGQGRne36maOjsOLbZYGYRbZfqeHKL3GQPIm+Szg8+wwXlkIIHZYptYCGaDgMMlKvsVDRhaMfGq12Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oz1UvdCy; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0a95200e8so40662215ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 10:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769538220; x=1770143020; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cHYljc7F+EOphZrYZwqqhzIU0oWBEMS1jqV+v13KuA4=;
        b=Oz1UvdCyF3EenR5KV0RfVHjYheo5zba2iRMFf7zEp1rUOymh4uPu5YPVZa6innLSZ3
         wlq335W5mR2E3G8z73eqNfLY+IFzdHvpcAc48CtMLy/lEG1NQ2r1kqv49DCH8/w5FIUB
         CKb+EKTldhx5LOVcSSfLMv+ZOlJ8KNRdo3qiLW7vyRs0iM0jJGpBEQw38xJeKkJizDt/
         MMTzEXHIKhk2U8Ti1nXDDWDfjQ+6lyEj5d5LqX9w4CUZU5UakemqEmHoOdgD4ZcriRWX
         NEvJT5hn6dTCxYMoLE4tGnDxda3FWsLUyKrr4K4XOCzqAzmuiBDPE9emA2p76qxoW7ao
         /5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769538220; x=1770143020;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHYljc7F+EOphZrYZwqqhzIU0oWBEMS1jqV+v13KuA4=;
        b=SpUtJoeWqN1xezZpfgq0YhnMt8dizJ2M9zOvyYSkM6c6KgYgBn+aGklWaw6GdjtPA3
         XSdCoIs7Xh1sYWSbwuddh06zeWrVTXpeVBQqBAGyPH7iX6dJGrIeIwKjlDsEQftm54xa
         HUBw8X/odPgxBYt3R82Km3ihsblKAg5Da0yylplVkyUtflpIeiv+MnpEj8UC1AFw6Ddc
         1VMjkaJw8/eAPZoDmLf1Q/jJuoJQG/iLuWFNvOVhVj/chUxjbViRHItZFTa+PQ6nlQJr
         OEcCgZj6E0msgDsOrl/d6XJ0FzrMrkGVVuqQ/s7kGO4daJXkwxTepeT5wtx4RopmQvzq
         kQPw==
X-Forwarded-Encrypted: i=1; AJvYcCWHC3pHo/zdjxPGKZ5JHEPd1M4D9r4A6XoPZKXEucdTncUz75WsuyXv5DF/7AjwjdItvPQNebkZ9+o3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf3x5kQbIdJ3K0qCisEF44cdum+KW4WJIU2UcT/VK8C+V5vUna
	PFLp0CakUVxNHWMfa5gBTQjxn22H+3tLffTVHTvnprKFYI+z0UIARrcU
X-Gm-Gg: AZuq6aJe1iRR4SZ81i2XqbfapKCA2IbdUY2m3Ff/6f7SAinL15XhMNhejW0lhWookwn
	1aS11kv8VH7bS9Iw5F5mM9+qu7nipbbmmhTA/cm00RehP2R/YqTXsHyvaj5oSipktybIzVEbAC1
	zkkXk8o2HSH731MA1KoMwwMb5zxUTPDk5hEH8GAe+tYs+ZHMBXsH9342oIek3VfiD03mlJBmHZL
	j06i6Rrs2HMWOoj/wHbuiV4/NecOF0N9+G+AmWnxeJCbfu2X3mQfyrtJ/Iwc4QErvWAivQdZXGO
	9GKn+mHdi5bQB+LLLetk1YmAcwqHnPE3AP+ffGgnULshLoSq5FG9JXbLd5me8WiGLZjVmIMyRx6
	POefsINoNaKRXIlHqYDBNudo5waGM5qDL0MBD9zoTuT678aisj8yoGzpUwiAC/aTk5Yz/H5/sCy
	pkOkMDdnM3U9N2p7dhFgJ6yy0g
X-Received: by 2002:a17:903:350d:b0:2a0:34ee:3725 with SMTP id d9443c01a7336-2a870d5a11emr26284835ad.14.1769538220491;
        Tue, 27 Jan 2026 10:23:40 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b413d16sm610135ad.25.2026.01.27.10.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:23:39 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 28 Jan 2026 02:23:12 +0800
Subject: [PATCH] pinctrl: meson: amlogic-a4: Fix device node reference leak
 in bank helpers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-amlogic-v1-1-c8aeb2953dcf@gmail.com>
X-B4-Tracking: v=1; b=H4sIAI8CeWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyML3cTcnPz0zGRdgxQDi9Q0AwuzZIskJaDqgqLUtMwKsEnRsbW1AJ7
 T6qZZAAAA
X-Change-ID: 20260128-amlogic-0d08ef086c8b
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769538215; l=1586;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=gzYCg7eQFUgU4V294MJ/J3tLEbmiBq4eX3ZoJFJXYAI=;
 b=Q4t4AtxghLx54Bs7JL9WDYzt2BKTvug6RGwBm9/o2ji5s18HIKqk+SLQR+Uf5ULhZr/nMxqAW
 rfdWaFvBwCODzsk8RoeQjtM7lb5ct9ZqvdGk9SaGcFLGksgu179QNIQ
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-31171-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[amlogic.com,kernel.org,linaro.org,baylibre.com,googlemail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[of_args.np:url]
X-Rspamd-Queue-Id: 55B6198F5D
X-Rspamd-Action: no action

of_parse_phandle_with_fixed_args() increments the reference count of the
returned device node, so it must be explicitly released using
of_node_put() after use.

Fix the reference leak in aml_bank_pins() and aml_bank_number() by
adding the missing of_node_put() calls.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index ded7b218e2ec..40542edd557e 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -725,8 +725,9 @@ static u32 aml_bank_pins(struct device_node *np)
 	if (of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
 					     0, &of_args))
 		return 0;
-	else
-		return of_args.args[2];
+
+	of_node_put(of_args.np);
+	return of_args.args[2];
 }
 
 static int aml_bank_number(struct device_node *np)
@@ -736,8 +737,9 @@ static int aml_bank_number(struct device_node *np)
 	if (of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
 					     0, &of_args))
 		return -EINVAL;
-	else
-		return of_args.args[1] >> 8;
+
+	of_node_put(of_args.np);
+	return of_args.args[1] >> 8;
 }
 
 static unsigned int aml_count_pins(struct device_node *np)

---
base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
change-id: 20260128-amlogic-0d08ef086c8b

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


