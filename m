Return-Path: <linux-gpio+bounces-33229-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMieKr98smkcNAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33229-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:43:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F23C26F187
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 09:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C1D63027962
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 08:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6B9389100;
	Thu, 12 Mar 2026 08:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="STRLuv8I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646AD33A6F7;
	Thu, 12 Mar 2026 08:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773305009; cv=pass; b=pK2CoiE3zsc/K8Ao8Xe/pZYtbWUNFfeT6YU0aN4Beim+O+niauXVAOJvX43UwtGQ1EjHDoIomRAixQ88upsFbq8vzK20JHRNeOL93LQavQKaNACA+zkCOe4U5OLsLWBvCPeshHOhGQOPcArwOxzbMSzmEZW55l55vMkZMe/RDnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773305009; c=relaxed/simple;
	bh=huf4sOli/OdrIpvyc62HdS32Qh7swj00LsrEz3KIWnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q5O1kxv0iMK560EgRZ48em45e4qAa4x5AoD3HTK4VstVrBsR/Mgkm1BzvkfS3A/8BVyOE75RrpHxTbgMmTEkjeK7vnBb2NLUFikqufSQ913Hhkj/zlKichbKGj+F2G7pBeeTPvv90GZyguCRfEoyb+09ZHFZDlMtp6mT75pATsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=STRLuv8I; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
ARC-Seal: i=1; a=rsa-sha256; t=1773304995; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QeMk9MU0ILTZCpd0gzBtuN0lJS/nAc72jRVK29cEKgT2vWxAqgeJZRdlMW7yGSUDiJwy722rwXOKVjeLkHO1wjPc2Ie5SfuWQcDCH/Cyus+E52fVSdd9iZgK3tMIOgJB3m2J1qv7akKI71864KYYoKfUgJh8FxgzUn98Otk+VgE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773304995; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lLFFlC1eFZuQ+K5xs5pEbHt15H+wC35wY2TANwxBsOA=; 
	b=Lz6re+TwBUzKyUq/9Px0Oye8BZhUPKElvZrPNQKV6OqnP7VqNyg6JBMlDkgUFHrkU+5mokDGc8q5z3fV8+M2a/YAm/y6vBahupsT3vvoS4XOpWPFCtN6QqK7qOJwfCc3W5S1hEgMvMvgNVcEunmh7r+lzS/7T3xHIqFvpctMhmg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773304995;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=lLFFlC1eFZuQ+K5xs5pEbHt15H+wC35wY2TANwxBsOA=;
	b=STRLuv8IF+HH5vxvnpJft8h1XKUbKuwze7E+Gb4nFV1rX3bDD4qhOhv8u2shi2Am
	9bWmB84OPz1BTSq+QnnlPUMFVu0oVBngzzYqBZ7tM8jSZKJ+cKsKauNHaxZK3GgXoBB
	/7iPzd2HP1sG4WO1t65nre2gyoA9TtMFnoNC5M8k=
Received: by mx.zohomail.com with SMTPS id 1773304994180870.4146837004669;
	Thu, 12 Mar 2026 01:43:14 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 12 Mar 2026 16:42:42 +0800
Subject: [PATCH 1/2] pinctrl: spacemit: return -ENOTSUPP for unsupported
 pin configurations
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
To: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773304980; l=2486;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=huf4sOli/OdrIpvyc62HdS32Qh7swj00LsrEz3KIWnA=;
 b=B3MbVb4iVOeA0XP3NHfpH4p1KIgTU4BPfBNQ6hM1nRE+0L4walRbWHRavIXqIsDZnvnmncKDy
 yMmVWx5fDz/BMpuRpwjFuDW6yIZZ9VoH3ty6IdykLrHL6wdbniCEHKI
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[pigmoral.tech:s=zmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33229-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pigmoral.tech];
	DKIM_TRACE(0.00)[pigmoral.tech:+];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[junhui.liu@pigmoral.tech,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,pigmoral.tech:dkim,pigmoral.tech:email,pigmoral.tech:mid]
X-Rspamd-Queue-Id: 4F23C26F187
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Return -ENOTSUPP instead of -EINVAL when encountering unsupported pin
configuration parameters. This is more logical and allows the GPIO
subsystem to gracefully handle unsupported parameters via functions like
gpio_set_config_with_argument_optional(), which specifically ignores
-ENOTSUPP but treats others as failure.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/pinctrl/spacemit/pinctrl-k1.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
index 62cab6f6cd0a..b0be62b1c816 100644
--- a/drivers/pinctrl/spacemit/pinctrl-k1.c
+++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
@@ -674,7 +674,7 @@ static int spacemit_pinconf_get(struct pinctrl_dev *pctldev,
 			arg = 0;
 		break;
 	default:
-		return -EINVAL;
+		return -ENOTSUPP;
 	}
 
 	*config = pinconf_to_config_packed(param, arg);
@@ -740,7 +740,7 @@ static int spacemit_pinconf_generate_config(struct spacemit_pinctrl *pctrl,
 			}
 			break;
 		default:
-			return -EINVAL;
+			return -ENOTSUPP;
 		}
 	}
 
@@ -814,10 +814,12 @@ static int spacemit_pinconf_set(struct pinctrl_dev *pctldev,
 	struct spacemit_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
 	u32 value;
+	int ret;
 
-	if (spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
-					     configs, num_configs, &value))
-		return -EINVAL;
+	ret = spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
+					       configs, num_configs, &value);
+	if (ret)
+		return ret;
 
 	return spacemit_pin_set_config(pctrl, pin, value);
 }
@@ -831,16 +833,17 @@ static int spacemit_pinconf_group_set(struct pinctrl_dev *pctldev,
 	const struct spacemit_pin *spin;
 	const struct group_desc *group;
 	u32 value;
-	int i;
+	int i, ret;
 
 	group = pinctrl_generic_get_group(pctldev, gsel);
 	if (!group)
 		return -EINVAL;
 
 	spin = spacemit_get_pin(pctrl, group->grp.pins[0]);
-	if (spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
-					     configs, num_configs, &value))
-		return -EINVAL;
+	ret = spacemit_pinconf_generate_config(pctrl, spin, pctrl->data->dconf,
+					       configs, num_configs, &value);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < group->grp.npins; i++)
 		spacemit_pin_set_config(pctrl, group->grp.pins[i], value);

-- 
2.53.0


