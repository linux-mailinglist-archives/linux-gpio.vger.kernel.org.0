Return-Path: <linux-gpio+bounces-31341-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NQ1E442f2nmlgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31341-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 01 Feb 2026 12:18:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EA61BC5BA5
	for <lists+linux-gpio@lfdr.de>; Sun, 01 Feb 2026 12:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 122A63004902
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Feb 2026 11:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C09432A3FD;
	Sun,  1 Feb 2026 11:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNZPwrFf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F9B324B10
	for <linux-gpio@vger.kernel.org>; Sun,  1 Feb 2026 11:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769944702; cv=none; b=kN6z89AZsmGwa4aXhO8WpYnNJjL6AtyT2MfFTdv3I9jquR707rde6ShVWQY2+y696LzxOLN8keL8nuGhevPbdPQWnMUyNj8Y03tT4k7yO+ajgOj6YpW4EwqmSgEv45O3lopaGzkJts2zqoUzXKKfeMSxvMNa2dFS47BMH6GXayY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769944702; c=relaxed/simple;
	bh=DT/AC0f3v8zTwDpTqWISUM92EMD8mREJDDZ5pNdtZYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/QcaM/8t4vMqaT8EWQM3HSMv4bly7BcFSkvwJKi/MGXGx0PdtMJG0AjDAYiYBk2G/FPdze99iMRzL4iR+qddzKURdtKYHDPMRxGojr3B41exjQhScbcurY1+H3aO75kz0HjQIkiQDuseta/qkb+2K+7XcF17rtm4I3Vw3EvTso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNZPwrFf; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64c893f3a94so7117144a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 01 Feb 2026 03:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769944700; x=1770549500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGn3i/O/y+GdrcNDRMS16OuGNGT+puPLYW3aCy6Bi54=;
        b=lNZPwrFfUVHJobP8737sLm3ff2MZU/dhdCu+vC14sb67nOdJXNh1rmUzZL4otHpH44
         DsT+CKHkQD6hRD6bODQuD2QQ+TXy15OhuTO/EF7pzwHXLjSVTr5Mpa4yDgPf4CHFEVev
         fMIvu394le0JZPH/9UgCjPDOQF/L69B55aFVyW8IyFiJPMllVgkt313tGlq6vBhm6lUy
         Pa66ggn2e8ZIQCGNnjiVX9V0Hn23aAlq3t9wTTHvoH0ekLxCtVU7cgC6Uc83b5thu7OX
         851g2upf33kOCRRf/xSpOe/Y5VdToKdkp/9s2+GRD3ihjXTLu4Dd+6i6DUCpERo5lzOu
         yFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769944700; x=1770549500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lGn3i/O/y+GdrcNDRMS16OuGNGT+puPLYW3aCy6Bi54=;
        b=hS6kuRzgQvLTdv37FtEQtkEYs03ial6xA22vlt92CaV1R1x8ZnA5dp0HK1p1YlFUpm
         kBPJD7I1thJTRD63OGsXYz5WM32j4EBmxSe4oeNbNNuAcSDbddtmfH7XAeix0+LprzUW
         eWO/dxecXupDwXZkVu9TJPuze9JJ3iEKkoNT/9+N+30C4TvoWlyPS61QSsEuNLLMv9L7
         SWMDr5JIz3RT/loCrJd+3sucVsvzNKouJDzARF7GLG64ZTk3PPePhqTAFDQdPKjxhPCP
         /8a9t2QKECsYHfdR4xJD5sJ2qU+cuOFj45KW44jtkc9EBX8HDqR72ov7dxLV5nCcHvq7
         KMcg==
X-Forwarded-Encrypted: i=1; AJvYcCWpEusY8A/5kBXDaj4ybKV+F0B3AEOyIlEBKriRGtxISax5cGWu93l7TJjINpsp+Endk+sNtjQ8LU+r@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7XndBsM20C6kjpE5rW0QHcelfva/+S7B4U0jI1b+CW3BqW0GI
	QRNvF0vY7baiMSJcgdpBmKQ9OrlsTLqjxKmJg51w4xvr0ZS86NlxZsY1
X-Gm-Gg: AZuq6aIqebLmAKFgqdYQX6J2/+JeyfEEcjBysojVNu/ti9tNWaBmoaf3nXRJuHG8gRk
	NXSESniMwGVDwBdAdgPcTVnbZNv9rTYPzt4X8GDjljSxIrqp+IE8YP6cyTYV/G356HzkqeasXiN
	zNCLSqva4HkBnZXqnzSMeJ+2FcpdoAE2xvhKFJ38q9AfIgZmui27GvKTxdlbJ4NQE890SUhn3Tc
	HZDVbPR3GOXAnXGf2pzypOmBi0blESFr/xmS/6T9hcApqWQ1o8jFQquE97p9fHyoTS+aQ7pFalO
	vT8x6o/xy9oZaaA6OW8+djaFrYgFrwZH9a8MAtK0uZKwtSGnePgS4KxeI0wEFeC61QVHIE/zzDa
	90uNrN1EzbNA5m8zucnY1KWYHDSTlKU0EkGhIW+wFedprpyszjhVw9dE8haR9Nm2/owkZKJB0Wy
	hNb4eXe7dvzTsIm49ZlHYQOK4=
X-Received: by 2002:a17:907:3f08:b0:b8a:e013:9c5b with SMTP id a640c23a62f3a-b8dff1f35d0mr611231766b.4.1769944699726;
        Sun, 01 Feb 2026 03:18:19 -0800 (PST)
Received: from C-PF5D4647.localdomain ([147.161.249.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ed6besm714713066b.60.2026.02.01.03.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 03:18:19 -0800 (PST)
From: Jie Li <lj29312931@gmail.com>
X-Google-Original-From: Jie Li <jie.i.li@nokia.com>
To: wsa@kernel.org,
	linusw@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Li <jie.i.li@nokia.com>
Subject: [PATCH v3 2/2] i2c: core: support recovery for single-ended GPIOs
Date: Sun,  1 Feb 2026 12:18:12 +0100
Message-ID: <20260201111812.18945-3-jie.i.li@nokia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260201111812.18945-1-jie.i.li@nokia.com>
References: <CAD++jLnk_5KG_q1aCtpOrTCbhtK-FxXH6BhPFSwukyt2F4uxmQ@mail.gmail.com>
 <20260201111812.18945-1-jie.i.li@nokia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31341-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lj29312931@gmail.com,linux-gpio@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EA61BC5BA5
X-Rspamd-Action: no action

Currently, i2c_init_recovery() only assigns the set_sda/set_scl
hooks if gpiod_get_direction() returns 0 (output).

This logic fails on certain SoC controllers where open-drain lines
in a high-impedance state are physically reported as inputs. This
leads to a "deadlock" where the I2C core refuses to assign the
recovery hooks because it incorrectly assumes the pins are
input-only, even though they are fully capable of driving the bus
low for recovery.

Update the recovery initialization to use the new
gpiod_is_single_ended() helper. If a GPIO is configured as
open-drain or open-source in the firmware, it is safe to assume
it can be used for bus recovery, even if the current hardware
direction is reported as input.

Signed-off-by: Jie Li <jie.i.li@nokia.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/i2c/i2c-core-base.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ae7e9c8b65a6..11bd801418e8 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -446,7 +446,8 @@ static int i2c_init_recovery(struct i2c_adapter *adap)
 		if (bri->sda_gpiod) {
 			bri->get_sda = get_sda_gpio_value;
 			/* FIXME: add proper flag instead of '0' once available */
-			if (gpiod_get_direction(bri->sda_gpiod) == 0)
+			if (gpiod_get_direction(bri->sda_gpiod) == 0 ||
+				gpiod_is_single_ended(bri->sda_gpiod))
 				bri->set_sda = set_sda_gpio_value;
 		}
 	} else if (bri->recover_bus == i2c_generic_scl_recovery) {
-- 
2.43.0


