Return-Path: <linux-gpio+bounces-37406-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GdTLiOBEWo4mwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37406-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 12:27:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3895BE817
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 12:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05A32300E3B4
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 10:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97BA938331E;
	Sat, 23 May 2026 10:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+a694oT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35948371876
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 10:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779532036; cv=none; b=mtxlhiXbElufeTWB+7goNjIqZxWD1mbntli2zC5kzxw/z7sSqBjZWL8G6BsfM3HJMMc8n39td+cokv/g0kMEasa/PvbtsbqwHVd4bnezmUSSFXN2JFbdIwb9dPYAJVGAyVCyBQle8SIUI3DM3zSFb8aKxNqYxpHvFDbtqSVW8FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779532036; c=relaxed/simple;
	bh=qcgqBwja4CHu5wwuF/A96Ah+f+QE9tKst8z6RkEiVGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FRseL1xTFZT3cpnHQ9WUoqaKRM3enbf18SIRlrOd//+yEWT8w6CwNlDZAi/3XIPJibSOaYzqrucEb3GTLNdy3ig/OwIuYfX1mbCyfeUl3zZk42qXBYlU7IBNbyYapvyC3J8cjII2pU/aSGzja5t5MQT+rSUAxnntSrneqNM7C6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+a694oT; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-83d31ac4017so4055828b3a.3
        for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 03:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779532034; x=1780136834; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k6UvRxauUxHtkSOdYEC9vPPJYNErnPXZyVXoKgtsN7o=;
        b=D+a694oTsnZrYLPAtZGj3RWvCypEZ0Fk/AAjUDhjl9ssZ9dS5zwRB/LzfnJnr1UfCp
         XsMB+xiixi5ek5uegAoHSYNhiDXNDsV0sFy66AqBOrCzIS8mnga7W+R4Co/eGA7w6S4w
         Sz+zzLDCxDZRAO9EMCiUlvzE2HpOcoV2/ensJYr+HVzRlyTJJ3ivwwvBZyOfJ0VfI/+D
         CmQb1EooCzN1cwL7dztBBaS93RWy/1wi0c1zpNtvzs8Z6nZjqbmVCzAgZ7kPcNn2aeXD
         Ub+LhyJibHrE3IgzSioqQ+lAVZVo2Std/8D1gCcAcqB/slbte3E0c9vpZc+FIG5LcA17
         4AEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779532034; x=1780136834;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6UvRxauUxHtkSOdYEC9vPPJYNErnPXZyVXoKgtsN7o=;
        b=JaY+GG5QBsjLZOZPxFb+dDqKfOSfijZcnE9vo80evmqgIS9c8lU4f4zWDTNp6MkduU
         Qa5S0svdop5dPN+8NdPG61pKjwB4OC8vsbu+wCvfStyQf80dBkOPiqk2a1pY3lp8CQO7
         6DxP79/PPwwmDtShTyr/sToGZ8SQhD9DZw+CGbX0R88W5/ffzrVPp7h8omxgCTm76nSc
         EYYAv62eM5Z98Nmd+ZVtvhFvk8Hd5QMeNIEefNbZ+YB4qQdIqVqCUuC14cMm1beBhXTd
         FYswaxgHjZln+jEStgoqUHZNIH1IgzxSXfukNIoEFP1xMkwy+I6R3o+hczIs6tqODcDl
         +h0g==
X-Gm-Message-State: AOJu0Yw68Jd96sRKUJjDR68IVuYDnZN+3pE8h3oqs8OFle2Tt1eiOKLb
	4DMWI522BqunFB9sWn0c3HF+lABMNxYnIk2/EjlnAZPp/widGGWhSXDV
X-Gm-Gg: Acq92OGq6m09waDPy7XuY7jTJzPykY8XmmbcBEJCgx1o+8idO8BWsbDUfUwpCf9kPew
	XbMtVQSJ09G4Ux3Fe2D+XG8WbnpjAE0pc2bhDPFFSk0MKjtNE50x+a87EYd60NZ1jN9snd3Tdhw
	zE+8SgWao3qFyYVhsUgPbEl+fvqWpb2pnIMOwdPpI+4rspW0uQXkDOLXZoVfgIf2gXcpUUlqlu2
	J96JJRlQKO79BjbsWqEYGxAhbHfsZa6t1k8+YlxzSDnZIcfwctv4SLjU2kVL4pK0AiyHI3RIFZb
	ddHJUJXUEDOGCyCyOFZShVkXhB5wG2sehUwE7L9DrcQm4Dtjy09LBE4hniMvHxXbGELr6MLDxHB
	pgq2Z99io7iqBjkg9ZxUvLag9WNcxBZmZCk7p/1zz8uvz0qYmChLE3S7wYHaUxGfCmNUD1ZyTbS
	pkUAYiFNVl0dBAS5+JaO/r0cS+TMS0Hyz7zpNaX3C6V9RUouqYHxMI5v2G+wYbiyyY19YnhNb3E
	RHgqjX1H6Im3LeB6w==
X-Received: by 2002:a05:6a00:1d86:b0:834:df57:9d36 with SMTP id d2e1a72fcca58-8415f66dd37mr7142262b3a.25.1779532033889;
        Sat, 23 May 2026 03:27:13 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164e9e522sm5137201b3a.36.2026.05.23.03.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 03:27:13 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 23 May 2026 18:27:05 +0800
Subject: [PATCH] pinctrl: imx1: fix device_node leak in
 dt_is_flat_functions()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPiAEWoC/yXMQQ5AMBBA0avIrDVpKwRXEQutKSOUtIhEenfF8
 i3+v8GjI/RQJzc4PMnTaiNEmoAeOzsgoz4aJJcFz2XGNrJ6dzOj5WJKVKUps0p0ykAsNoeGru/
 WtL/9oSbU+7uAEB6uc0wSbwAAAA==
X-Change-ID: 20260523-pinctrl-imx-b198f8391abf
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779532030; l=1610;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=qcgqBwja4CHu5wwuF/A96Ah+f+QE9tKst8z6RkEiVGM=;
 b=TDWZmut8c/UsJuZ34Imt8NoqEeM0PpEU9Mu+fWpsx5fO0+0lK/CKvVOP1rGb0JTH1GYl6LIQ0
 m4LTlwTPTOgB7znVwyNrGhXUgbS3V/d65TmQ7AYntqW1v8GFhlfnklw
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37406-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com,pengutronix.de,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0D3895BE817
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

for_each_child_of_node() holds a reference on the iterator node that
must be released on early return. imx1_pinctrl_dt_is_flat_functions()
has two early return paths inside the loop that skip this cleanup.

Replace both loops with the scoped variant so that the reference is
automatically dropped when the iterator goes out of scope.

Fixes: 63d2059cd665 ("pinctrl: imx1: Allow parsing DT without function nodes")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index b7bd4ef9c0db..4a6bdaefa42f 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -547,14 +547,11 @@ static int imx1_pinctrl_parse_functions(struct device_node *np,
  */
 static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
 {
-	struct device_node *function_np;
-	struct device_node *pinctrl_np;
-
-	for_each_child_of_node(np, function_np) {
+	for_each_child_of_node_scoped(np, function_np) {
 		if (of_property_present(function_np, "fsl,pins"))
 			return true;
 
-		for_each_child_of_node(function_np, pinctrl_np) {
+		for_each_child_of_node_scoped(function_np, pinctrl_np) {
 			if (of_property_present(pinctrl_np, "fsl,pins"))
 				return false;
 		}

---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260523-pinctrl-imx-b198f8391abf

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


