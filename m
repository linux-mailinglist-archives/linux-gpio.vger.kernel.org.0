Return-Path: <linux-gpio+bounces-36081-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKEnLUG0+Gm3zAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36081-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 16:59:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AC34C04A9
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 16:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E77B301389A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 14:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5923D524D;
	Mon,  4 May 2026 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vnni7daF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42FD3CEB89
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906414; cv=none; b=FI7A8EeZTJ62iFIOp5R8GDkIT2VrSAZChnsM4mxMZcDc0K+wZT448CaNsbXVbySO6H/tEa/2PetXGPHzgbatRl1kCSMf1+AY8gUCddeyDT3ttJ5lT5r0pWU2BBe86rbfhJ3slbQamEbvT5YfopH1Tir9UYBfpMi4A9hkdm1Kv+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906414; c=relaxed/simple;
	bh=KsGehUIs9yjLgFhJm+ALM6CihYTUD9IxFPyF+rbn54Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V0IxY7KuykE7tIqSmGVq5U2Rd8/YPcE6m0Lk91L3kjftk8+rbqAWB0gwjzecVv/HJqqTfj9hjl7urELS57YBZN0paqPxKJvlsakLZ40qOYoz/fRfkT5UgQ+Uc7KXiCIuEgOY6Ve7KYS8o+lnQmPUX9kup7D+ygWLJN0DoisKgwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vnni7daF; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35691a231a7so2879437a91.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777906413; x=1778511213; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L68A0nliiu2Q3xuxzZG34RHvsW2Cqh1HButFAloiLuY=;
        b=Vnni7daFHiQtPUTPwAC5VPvcWlkiSfDDTcHDsOguprYLJCPCctBmQbXXOymx4dLJNx
         kD6L/+pO886c3Zg+EzpQRwX3JP9kB7Gv1HkiKSejZ6L/CVbCEa2SRBJBLEZRn0D3rWtE
         vUL1Ljig/PPfB+MZi8fyK7iF30EXtU2eJCKUS2FH17VR96qwrwOgEzmpyIpq0dUTqa+i
         ObODjY94AR4wuogW3s7fqlOzeUofbVZfCNFIcks97AOif4vp+hU2mSf662o3x73kN5De
         Tz+y2YMqGR5H3SiH1+6KLQq5A+9jO0+M4vjHLM2Gu/U2JzaKk1w8eUiF1qEUyStlOJQo
         w6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906413; x=1778511213;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L68A0nliiu2Q3xuxzZG34RHvsW2Cqh1HButFAloiLuY=;
        b=HQtTZnY14JWy14YnM8qC+zMIxGLA9QH/Hzz4vlSQ056FcMtvPA2ahSVz88oXJi/gEJ
         zMWtedgHjxdk7owyoP8dHdO4i6KaiKhzL81dFGvYbCe0m9XVTFdlctaV9v5kcLueEAVq
         822/4CYXVXbabLAA6cicykoiMecAHuI2g2erv8zxPduNP91SkX/XbS/maX4gXvFHhaSO
         Qe7Jyz8JAkEfjAyHrKQVo1ni6nPnPvBv7PR2YZh+dOTs5WPWjgRPn8coyup6OrDNR8PD
         zU9tRaOF6Vtk31Jz/aDFpBr4cVw6D9CDMFP5fHpDnOGi0dbPJ8qI98f4ltDkJ0hzcOoy
         ciOg==
X-Gm-Message-State: AOJu0Yw6zMLBMX3CHSG+X09lscaT5fuUSUJkf2nFg5ibaWGI/x0WqXPa
	dhpT9bHA5OM0/+6fEacjEAF1T/GK1+FJupEC9ujzhHInmXimaQSk3rhe
X-Gm-Gg: AeBDietz6+gTYGAvZZMu/PLb+MlP4U63yx5I4C083mY2XsI/mcw9RDTtiyxp7rcH+9D
	HGY22z9wOMAErWsWIdpNFx5SO9VTWBVreYQyZZiiFMFHKE/9zTpkU13jBNbnyuGEoe5hso4O87o
	ltZoz7sCIsxokq2k0nW1dBh47nuwwxDYUVIabQ7+YQo3pGDwN1LqjC5FeDjiwg8Ph2X/wV93j1t
	ZX6Cs1PMp3FXgKxIlvz1P/r/2YEff0EVkq9hO4iaXWfcm/J07ZC/3XQCB3g9M7AwPeHI+s+zKJf
	XouUObWPx/9qspPP9KoZQPElPntqQZB0VoaKJi4tedbWPXkD/h7tEw4wi6vAGQPRwLBI7Z8xA4N
	Vp387fb4QtAIqC7OlnVC9TlT+I2rSbIyB4tiaK9uOK360mPL1a+7V2P9IYkO/ocjXJWbwju2qEO
	GcO+QanNRGFPXUMTtMT49uX/E99eKKV7GaVSK+Bhu/Y9St9uzU+ALznJ9s9tueJC4LVmSXmOoUY
	CWf68MHFyZmlHGVYbpBNsMBgOA5bg==
X-Received: by 2002:a17:90a:d444:b0:364:6558:99be with SMTP id 98e67ed59e1d1-3650ceaab7fmr9463975a91.22.1777906412786;
        Mon, 04 May 2026 07:53:32 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbb05798sm9926085a12.0.2026.05.04.07.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:53:32 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 04 May 2026 22:53:26 +0800
Subject: [PATCH] pinctrl: sunxi: fix regulator leak in sunxi_pmx_request()
 error path
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-sunxi-v1-1-c0fd0df52776@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOWy+GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwMT3eLSvIpM3eSUREtDMzPDZEMLQyWg2oKi1LTMCrA50bG1tQCZt7F
 DVwAAAA==
X-Change-ID: 20260504-sunxi-cda91661c181
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777906408; l=1142;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=KsGehUIs9yjLgFhJm+ALM6CihYTUD9IxFPyF+rbn54Y=;
 b=HeZnzJUAEwh2zXD8lRSUzBtxzjVKqCO0BBfYZRyGOZBJ5CwDrdBrjEiQHQdwkS1QwwsLUSbpO
 6SW0IlZZ5BXCjzD1FqEQUkVaPWVJsfKl5GiXk3mGGLFIUcMtZBXaX+U
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Queue-Id: 36AC34C04A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-36081-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

In the error path of sunxi_pmx_request(), the code calls
regulator_put(s_reg->regulator) to release the regulator. However,
s_reg->regulator is only assigned after a successful regulator_enable().
This causes a memory leak: the regulator obtained via regulator_get()
is never properly released when regulator_enable() fails.

Fixes: dc1445584177 ("pinctrl: sunxi: Fix and simplify pin bank regulator handling")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index d3042e0c9712..25489beeb312 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -925,7 +925,7 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 	return 0;
 
 out:
-	regulator_put(s_reg->regulator);
+	regulator_put(reg);
 
 	return ret;
 }

---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260504-sunxi-cda91661c181

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


