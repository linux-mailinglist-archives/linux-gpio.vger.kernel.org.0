Return-Path: <linux-gpio+bounces-37351-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PSuHBM4EGoaVAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37351-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:03:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 049DC5B2ABB
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1E6C308A8F2
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 10:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B56F3D4112;
	Fri, 22 May 2026 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EILeOpz5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBB43D3D0B;
	Fri, 22 May 2026 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779447445; cv=none; b=NdqOysnTkHVYymSuxUsfAN2ldZkOweKkfQXoiUZZg9IzNiA42JhWGCBLGRedu4UKzkfJqsU/W8jLBtqyGsa35bBranDg+pbRVSgQbBrw/hMSqNvo6Iz/PDHnV9ztU5Slhz7Xg+RwQeZS2kaANK+TPvLF7MwhePO0D/HKayivL+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779447445; c=relaxed/simple;
	bh=qdqK1EsGTgN4Ri/xWzDGyKvrTyQWgoARd61f7xRYFag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gQ5pD+pf1kScq4W/7cgtaVhBNoGTnyVKRqQ9Wv9DOxl0/BrxRy9zZ3yOg9SUFo6QidRQ12fJyhLnmR8kgZWcJr05LM0SZSR1rC6jzkSmZoN39aGtLq+QQHbpfl0j6d+eEQEiClIj9RSnLQyQBvunRKNaOA4kYOxunzn85Pv8WVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EILeOpz5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F541F000E9;
	Fri, 22 May 2026 10:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779447443;
	bh=M3QzBpzp8PKSLTs8Fh7VnijRuahgmdSKWCHR05/Qmo0=;
	h=From:To:Cc:Subject:Date;
	b=EILeOpz5jzP4wgCwhpNz1A17WwYffeG9Dk6/sv1RODSkr+SJzJaKm6PgwZLR+ad2Y
	 O1mlfBESXCEzQPhvQcyGwLuPt7O/MNY12VP6/WuMJrOIJKqeUT2R0Rt7VsU/SvetLZ
	 stobQJ1M1SXodcnvm1kOdfvp/tGKaXCfKEpU+dBLRUg84y+nipwchpvt6vE7emh6Zx
	 RnKPvhdMDQw/T5gkco8wxA5tPzrzvb5++s8v0AURxtyXv3RWSJDqWeUNuyZUWohSTy
	 R5gs4WI9lcOkHtqW63OD0Uxu4jNZz0/SGLMmpuulhkHXlm63z3kc+64SAVNm989VZy
	 a9ZDoyl6/Ej4g==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	brgl@kernel.org
Cc: claudiu.beznea@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] pinctrl: renesas: rzv2m: Use -ENOTSUPP instead of -EOPNOTSUPP
Date: Fri, 22 May 2026 13:57:17 +0300
Message-ID: <20260522105717.1727837-1-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37351-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: 049DC5B2ABB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The pinctrl and GPIO core code make exceptions for the -ENOTSUPP error
code. One such example is gpio_set_config_with_argument_optional(), which
returns success when gpio_set_config_with_argument() returns -ENOTSUPP, but
reports failure for all other error codes.

Returning -EOPNOTSUPP from the pinctrl driver on the unsupported pinctrl
operation may lead to boot failures when pinctrl drivers implements
struct gpio_chip::set_config, the system uses GPIO hogs, and the
struct gpio_chip::set_config implementation returns -EOPNOTSUPP for the
unsupported operations.

Currently, the driver does not implement struct gpio_chip::set_config().
To avoid future failures, return -ENOTSUPP from
rzv2m_pinctrl_pinconf_set().

rzv2m_pinctrl_pinconf_group_get() is used when dumping pinctrl
configuration. pinconf_generic_dump_one(), which calls it, makes
exceptions for the -EINVAL and -ENOTSUPP error codes. The documentation
for struct pinconf_ops::pin_config_group_get states that it "should
return -ENOTSUPP and -EINVAL using the same rules as pin_config_get()".
The documentation for struct pinconf_ops::pin_config_get states:

"get the config of a certain pin, if the requested config is not available
on this controller this should return -ENOTSUPP and if it is available but
disabled it should return -EINVAL".

Return -ENOTSUPP for the unsupported pinctrl operation.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Hi,

As this is not a functional fix I chose to not add a Fixes tag. Please
let me know otherwise.

Also, this is build tested only.

Thank you,
Claudiu

 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzv2m.c b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
index 827b3e91a6cc..9029d1947bbb 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
@@ -661,7 +661,7 @@ static int rzv2m_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 		}
 
 		default:
-			return -EOPNOTSUPP;
+			return -ENOTSUPP;
 		}
 	}
 
@@ -711,7 +711,7 @@ static int rzv2m_pinctrl_pinconf_group_get(struct pinctrl_dev *pctldev,
 
 		/* Check config matches previous pins */
 		if (i && prev_config != *config)
-			return -EOPNOTSUPP;
+			return -ENOTSUPP;
 
 		prev_config = *config;
 	}
-- 
2.43.0


