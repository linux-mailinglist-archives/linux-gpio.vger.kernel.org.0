Return-Path: <linux-gpio+bounces-36940-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBeiD603B2ottwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36940-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 17:11:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA73551F01
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 17:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E1DC305C8CC
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 15:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429AD3C4B81;
	Fri, 15 May 2026 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbr0DdBw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C483932D1
	for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857271; cv=none; b=siOwUv9jeouGONksKwB1bryljfxhD0YdNX2i0DeD42Fr3lJ3CWx/QEUGHx4bQlafka+HK7wJ4qXDmX0WRmHJ4X6/lJySiqqgV0IlKWJ+UoxtqCEuqlWzWdlZd1LXn6dw0ykZtK9rhQ//tkyccMQPWmG/VIuDLG5Ub3wh9XtGF7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857271; c=relaxed/simple;
	bh=eo4JHGBXgYQCSe/DE7+pZmIYRaXAcJB3SjLOrB7Xcno=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PJyP62f6uZIWl2yyuyjg555SrCricZJJCIPc98KPCAGGsKD5XiSzVqE17TiPp3OyQIKt/t6kh6u8thdiFT0N6J+YxXMst+sqcGpZrJfDt1N04INg+UDVx+osRPpBrbeFpwswHut3PWW3FNybaGCvd0jJjBgumfL/g1yRuVG0FCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbr0DdBw; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44b7e8b65faso820321f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 08:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778857268; x=1779462068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=72ZekV4Qw/5wxdN6lentH6Bp50LjXJz/DgvExEUtVoE=;
        b=qbr0DdBwSBRNXbK0J6MniGJZaK8EWmzoRumWSknGTbvzFk9F68CKu/pNZqkwc4kQ8x
         T8gmrXw1weiGPMojQfVaVjnBe/m9y7geeVQOPBvW8AmTSxs/d+uI7GvKUp2Kvcb/pS9g
         pjs5qY4LT3stXVW+2eQqLebDAfH4jbp7Pq7wx73ULzCMoeI5U4HWxXMn6Ad85w0NML9j
         TIWoN6rtbEcULskmvIKJ0Vud1RFpieyUfHGBYNUmsw+dr3IyF+T2i6UtqtJ87dHQxwiM
         yFpRpKRNAA+QdkQbpCEXp0IWFsZPzTBAY7YJH5SvLztFEKntrRVBBmKK9TcdYbX303tr
         zLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778857268; x=1779462068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72ZekV4Qw/5wxdN6lentH6Bp50LjXJz/DgvExEUtVoE=;
        b=KfGJSN/0dZFuu+RJOnMBY6iHz7JIJ2Or2ZU3l/KXsYmOcaLPkbbh7fZPhLlqBnSXkF
         NbGfOInuYBil0500cCF0NJ6HQLbNy3ARdWup/9CmWJPlrgtLD2Gj8zJa2XCZn8DGuWFl
         7X00EOTeiFChaAI/xdQNcMzE2xdYIz3vvuxAXd/Ovt9wc0HLWBLNPxAcTGkPOgeHkpm+
         qgPYvRAE/2gsUaD3tH3LFPI1Y4v7IqnbR2Kx8iaZ3GiI1d0vpxGAJPM95kn2rOrlyj0g
         q4SxytKW1r/eATcJH1SQdF+Fqhel0uBX2Pm0vB0n4Jyh32NbNxGAVNuy3VwTpohGUUDO
         xDKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Wgfu3+EC4+Rtlta2aO1Y5u62UNQ4prHtluTdDeariyvieLOfD5eq9kH5ZwN8iXp5wo72e01CE7oa8@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRUSTgYJnmNecQMlibkDLIDw2SZjIEji55aZT3o4zF1HztCfK
	GiGAUDgkzNNQRcFsg3tCTSDrUOs/w0k4mDs1wPTL0ZUFNQOcAUmFbAiN
X-Gm-Gg: Acq92OGgUlLSArnMnye5wVssFQaPdFwDDb1IgzdBghTXydMZhL3tRHF61aERN+ZFpcI
	TN2Znwq14LruImOFUk/pbAmcDjAbBWrpgjIJE6wtXQrH1LkivreYxc+Q60oMJIpBdxoTPD1Efvx
	Fw5lZT69J3r1JyyTUjhDkEAfdVEAOktSqzGfKLP5rs5TgpPWPKxZNw7d9nxlvBZkltkMfYEs2Fp
	ePOevzYTErHOEPKOU6kelOLY5zX7YQN8p7a+45HnKlahiToCx5HjNvyCpjx2l5I3t5ezMY0YrQb
	B3Jqll8fwxl6Xg/Pf4dnZrL1lRgNCwyGQlxJkshgKVsbdI/RP4yyoWIdYfMtPxQrz416XCLmZTi
	1V9r5SXt7/RoTcr2lXwpqxnQR9kqIpHp+cNRn4wAgwR1t0bt+vHkMhkNkEC3z0mDNwkjjmVEUA4
	enXMW8dAZx2yc1CfvkUWipmu/em1ITXEgquaj7U7GWKsLD6hqGASnR3OTdOxz3v35ZXA==
X-Received: by 2002:a05:6000:228a:b0:446:9d8:bb6d with SMTP id ffacd0b85a97d-45e5c5a96d9mr2927060f8f.2.1778857267912;
        Fri, 15 May 2026 08:01:07 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767d16sm15909333f8f.6.2026.05.15.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:01:06 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: andy@kernel.org
Cc: mika.westerberg@linux.intel.com,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH] pinctrl: intel: zero-initialize capability_offset[] in probe
Date: Fri, 15 May 2026 20:00:49 +0500
Message-Id: <20260515150049.33761-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CDA73551F01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36940-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,vger.kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[sozdayvek@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

intel_pinctrl_probe() declares a per-community capability_offset[]
array on the stack and only writes the slots whose CAPLIST entries
the device actually advertises:

	unsigned short capability_offset[6];
	...
	do {
		value = readl(regs + offset);
		switch ((value & CAPLIST_ID_MASK) >> CAPLIST_ID_SHIFT) {
		case CAPLIST_ID_GPIO_HW_INFO:
			capability_offset[CAPLIST_ID_GPIO_HW_INFO] = offset;
			break;
		case CAPLIST_ID_PWM:
			capability_offset[CAPLIST_ID_PWM] = offset;
			break;
		...
		default:
			break;
		}
		...
	} while (offset);

	...
	ret = intel_pinctrl_probe_pwm(pctrl, community,
				      capability_offset[CAPLIST_ID_PWM]);

If a community does not advertise a PWM capability, the loop never
writes capability_offset[CAPLIST_ID_PWM] and the call to
intel_pinctrl_probe_pwm() reads an indeterminate stack value.

intel_pinctrl_probe_pwm() computes the PWM register base before it
checks PINCTRL_FEATURE_PWM:

	void __iomem *base = community->regs + capability_offset + 4;
	...
	if (!(community->features & PINCTRL_FEATURE_PWM))
		return 0;

so the base = community->regs + capability_offset + 4 expression is
evaluated using the uninitialized value on every probe for any
community that does not have CAPLIST_ID_PWM. The result is never
dereferenced when the PWM feature flag is clear, but reading an
indeterminate stack object is undefined behaviour by C, and KMSAN /
UBSAN report it at probe time.

Default the whole array to zero at declaration so unused slots are
defined (community->regs + 4) instead of indeterminate.

Fixes: 340bba73c545 ("pinctrl: intel: Improve capability support")
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 97bf5ec78..4fb4a3dab 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1601,7 +1601,7 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 
 	for (i = 0; i < pctrl->ncommunities; i++) {
 		struct intel_community *community = &pctrl->communities[i];
-		unsigned short capability_offset[6];
+		unsigned short capability_offset[6] = { };
 		void __iomem *regs;
 		u32 revision;
 		u32 offset;
-- 
2.43.0


