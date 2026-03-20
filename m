Return-Path: <linux-gpio+bounces-33933-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EdABiBmvWlF9gIAu9opvQ
	(envelope-from <linux-gpio+bounces-33933-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 16:22:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E0D2DC923
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 16:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2DBD30D55E7
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 15:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 189063C4564;
	Fri, 20 Mar 2026 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXOlQhDc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F733C73E4
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 15:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774019746; cv=none; b=CA2hLfcnGXTLI/2gFA6cQoFYKyPh2ncm+ndsFUjvw0LbhpTDJoYSIDCOpZbqQ0nmrIbYQqJjma7uCaAwc96PUpMOgnT03qFd7iJPnlruOKdlf0AMq8JFbPMrKUpPcUDv4cggq+Nr7nNLASCzXeTodKrb1KqlaCgPaMfsM63Yh1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774019746; c=relaxed/simple;
	bh=wqnjcjNaie6UDTzmbysnfxNuiFNQP0Thq71AYiTlERg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HnUi/5HFrF1bevf9o/qofdzWI9cWF2S4kKNzDhvPIVyDo58xhT53K8DzBrLuy+1UbjSDhOGgu9GMu/gTXGjanV/bZP1D4PoMSNbRchw+w1G4emYQC2r2XUFC/GFsPPTMXtG+8zDufcge6RUA6qs8Fu/72nH8gHsgsWB8gDhoEGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXOlQhDc; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35a1cc6e478so1434414a91.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774019745; x=1774624545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOHGPk5doVf5PlHGyevPKUA2fqHQSdmXOjKYw+Hc8ik=;
        b=hXOlQhDcZZMDujEe72nGIxlJqbe70/SlX+HdrRp4I+/of1YtJsor+j6GfaQoaKrWug
         wiieToHGl+AGNJ6kdFhGQusDfmHpqwmBipm98iZbSV2C+zHddOQRYKv8bTJs+Y60eb3s
         QL8GxKnF0JKQ0qllCFpam2WNiY2Qj8RvloLhT9fQYFIgfntbXQVaBIqSb6Q70irBE2l5
         gXU80aYc88So5QhRaSzg0k/hMOkcdY7Bkk4Fz3+aVgdRu9CbhLgCehuJylXAi1rciOqQ
         5GkCeZ1R9rOghw85ddwPiOTZseG1Z0x/jUNxeZudwvU9wjNrH+F+utox1jwQkG5uUlCz
         nUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774019745; x=1774624545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOHGPk5doVf5PlHGyevPKUA2fqHQSdmXOjKYw+Hc8ik=;
        b=Sbmw7fEm/mfLy2cPnG65KBOTXO+vs4LqZDdNYH+G6wIzGktBhlEJNIJ9vsGlCoreD0
         PEDZFreoGTLPBucX0tVIehwVfLHHe67kOndYRHLkpnPL4VjIx5LKOPSkZMAovU7fvdXW
         j5L4A9aTln/+1kQu6CflIVsZf8Qkdwh8+l79PF478wpqi19Hmksjg5zO+yxWiykXwvrJ
         ozjau2pdssGH+bPOwpWIiWyPJeICgxCOJIkzHrAUQ+mfQD+CBYDOL0/TxrXEa4KUn8UG
         W1y2wR7/dD+UzzoMoCznLwNcfoAyC7GYPi2Ey49e5/OrBMWxo05zHARDcmRdkTZbf2H6
         64Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWulwvBzj/PwVl0AV2iPIZZXbkyLQ5J8EIp7x7ohv/2scZIypaTeTzsZGz96RRi9Y3u+AP8bZ8S4iqU@vger.kernel.org
X-Gm-Message-State: AOJu0YwqqxziU9WX4fOkbkHCDsEMsGUtDk8b30eg6fvDk56WZ01pERX/
	v0hTrOCOeDnwV7jYbIoaeCzynuWtwSBdZfmVH0c+2+yGGS3E73L7TC3c
X-Gm-Gg: ATEYQzztaRRXjc4+CPWObtC5288m6TyjCPYdBepO93TIlSQ35Fj9o+PvHX5BjEeOPjp
	JWWSJei/izch6tZ4cuiQsOpZCbd11IOXWjX56xEMgr8YH+7EPQfXNA9o0Ll3+GPE32N9gWbHXbc
	VU49Z4DVEsIkYIaO+Lpmv5AV3JgooYb//h+9HjBwXqikfprq61gx/1ew+C9BC9FpK0Vf9fsNzxJ
	Syl2ShjwNAfwxrPOPxvv+mE8S87LYEeaBwYF9DrGJPXB7YVqO8g444P85JvxJZCw7VnjJU0lJOI
	lorH+w5fQ3Qc80MWeK2D5g3pBpehbIeur4ks4bTGuxXZ4FlyLMVdxGEAosmMQc4AGcuUxrjy3Py
	IUoCFn5CTzPGxXlghJxMnXpkAWS68Bf+7OddrdlaW3GB3fw497yv9Ur7KDQPlPWSC1GusIUsIyH
	tUzwhxalicb718XYtoox9k66Jgew==
X-Received: by 2002:a17:90b:5603:b0:359:2d1c:9206 with SMTP id 98e67ed59e1d1-35bd2d35149mr2773896a91.33.1774019744963;
        Fri, 20 Mar 2026 08:15:44 -0700 (PDT)
Received: from Vivobook.. ([2401:e180:88b2:f091:d2bd:d651:8e5e:9b62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd3eb4bf5sm2284699a91.4.2026.03.20.08.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 08:15:44 -0700 (PDT)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: linusw@kernel.org,
	laurent.pinchart@ideasonboard.com,
	matt.porter@linaro.org,
	syin@broadcom.com,
	csd@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2] pinctrl: abx500: Fix type of 'argument' variable
Date: Fri, 20 Mar 2026 23:15:06 +0800
Message-Id: <20260320151506.10679-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-33933-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor15x@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.899];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 67E0D2DC923
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The argument variable is assigned the return value of
pinconf_to_config_argument(), which returns a u32. Change its type from
enum pin_config_param to unsigned int to correctly store the configuration
argument.

Fixes: 03b054e9696c ("pinctrl: Pass all configs to driver on pin_config_set()")
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
Changes in v2:
- Rebased on the latest mainline to fix the recipient list.
- Updated the variable type to match the commit message.
---
 drivers/pinctrl/nomadik/pinctrl-abx500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index fc7ebeda8440..858fbaebcf8e 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -852,7 +852,7 @@ static int abx500_pin_config_set(struct pinctrl_dev *pctldev,
 	int ret = -EINVAL;
 	int i;
 	enum pin_config_param param;
-	enum pin_config_param argument;
+	unsigned int argument;
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-- 
2.34.1


