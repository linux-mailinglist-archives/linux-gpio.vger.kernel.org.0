Return-Path: <linux-gpio+bounces-36978-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IIhDbr7CGpgDgQAu9opvQ
	(envelope-from <linux-gpio+bounces-36978-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 01:20:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D1655E41F
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 01:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B69D30305C5
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 23:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735A83A6EEB;
	Sat, 16 May 2026 23:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="XGRWecXk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D783A16AC
	for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 23:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778973541; cv=none; b=e2HSRHrT4HPchHZSwBQD0dJ9rdSRuex6DVmVFhiwNFsCZ3LvCDn11wzpp8lkXtND6KRKzVPDQ2GGbsP5N2y7mCX6dIDHcXGnQXaK+bS15I6Eei4VUZz9xm5TP9DyCeRVYlmcA9+CXulow/2nhhZyk3VptnGvRYW1lLRwn/+Weyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778973541; c=relaxed/simple;
	bh=yxjAXeOD8vgYHpYNi2nRb2U8lGvMYDcyt4MCoMgxNz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uKfp3sDoXDZX0c8VE5zAuDIdhiKa0RUnBOzDKp6oVhbe12191HFOx5ik8jkyjl17ggCu7X3orDTm95h2cxRzfOvLT+KdGZzuG4h4hT60/ChGWPGvboLpRPK/ftY3CRIgnNalBz5gFrg//3t/YRvcELXFI952aw6oX9Bi6cE9d9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=XGRWecXk; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12db2e415a7so396094c88.1
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 16:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778973538; x=1779578338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUnfFsool58oW+sRC5tpMK9MOqrwqv2manCcCe6X7bw=;
        b=XGRWecXkhtobTKZQlG46zaZAm34o3C9AA9gVr2yB0uDviFi4xxbnHQtsTFstT6xMi6
         YSnH2wTfJBT7cwFQaggRfl9RFopXStbHXByPoNN3A6pedzqzHfdKAryxcnCJZewe4A+X
         FtcVCQNVPXdYeIAWLM0MqKWaPGziopTZjIn1qaiU/gJrGr1iQrXOrd2luXzZ2PKs7UhE
         Lbcs2Y2FAF4VX3RVSHU5/0WQ2a+8nI+QDMs+kPRRWfaRCaQ9OPH8HD17iZamCP4Ft/Lu
         KHNgSzUC2fHSt53LNwqjNEsWXxbm+ySEzW7+imWPTTUdHjrQdUN5Ozl0b1M06DIEcAQR
         MV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778973538; x=1779578338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jUnfFsool58oW+sRC5tpMK9MOqrwqv2manCcCe6X7bw=;
        b=AAinKjhVB3zk/8x1GXE9/H4RX4Sg+b1YNAIXrR+SKtW3YVZPUN4SmjGHqjg3Rq1Jqp
         ehoHXuLLaKYAAVVfCfEuskCVV+zw9ETn5jon8gjvz+tFMnnS1P2OgCGBe7SKviTPeL8j
         0TEdHs5kevK1GOIZyfcOKMufcDYVhr/R5k0GCEzbeUzj5jmjOZvD94/8GYVslrW+/1NE
         PEE+m0Y0NFby6gl1uTHRNgwAmZlO0SZCUsvUOuV4gLsesYnQ/RsWaMjugCmLWhEhR6Ae
         jiTt7RV4Opz7SQEE7jxMGl79UA9QtXG0sRGwHF6V9ZFMGExYxQd8ibDCozHTt6mFTE3O
         BM5g==
X-Forwarded-Encrypted: i=1; AFNElJ+nwcSJQKJiE+QkwouyzHwAGJafk++l/BF624P6aiQhqnOU9ArTIwNRJ91iUGn1iquS1AwmniCxZylR@vger.kernel.org
X-Gm-Message-State: AOJu0YwkGxNvIfL3o9cpum8NcICKSjaLO4Fab9Z8rwzu3xrulmAZ5pHE
	MOA6MYsiJcgLSof4TyC6pO4CtDkGIFQMVJSspEx0/jqFhYMW2QSYJhoS7KqTcGDrM7Hgl6SfQSv
	UOJvs4+s=
X-Gm-Gg: Acq92OEBHksj2RVx23VcWv6tap9ES+6jEy2g6580cyBYOE8Nn6L3q4tAcMiJt3ryQQZ
	ircouUyExmOL0plmRxBaz9+p/8lF/B1aLLja3NAuURNXQj50uAl2Ld/G3cEiQWbvbFCNHspz/UI
	B+Y2pB2Nii/jAwcqXuB5Xg6tKvKMFa9mvSmBWWUOfD8J5/vKbpDYbot+cWoW5aIXUQ4s95WgLZW
	txifILT0H6rHEN4bQt3TBsjGrUc3idUt21IRD8ftk19VRKvo+0+dskOVeXHh2e0C8U26N+XAWT5
	w6rpYAqz8YxWC2QkwDSeMtyVjp9bNv38Azy+vZ225XCTLsldlQRtqW9NGpWA34ZgNg2LiL7tWME
	wByuBr0+jTTdmn65OqdDJceR1jqw5CvRLXqeKgFS0GXVz6mxIw0FSfL6Aw1cT6u1krqVNTHUBWE
	G3m5qOgyh0IUxv+fiQdKKIGywzH541sKrTMFl0
X-Received: by 2002:a05:7022:6621:b0:134:a710:d908 with SMTP id a92af1059eb24-1350451887emr3707639c88.13.1778973538361;
        Sat, 16 May 2026 16:18:58 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm14722254c88.2.2026.05.16.16.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 16:18:58 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 16 May 2026 16:18:50 -0700
Subject: [PATCH v2 4/5] hwmon: (pmbus/adm1266) register the gpio_chip after
 pmbus_do_probe()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-adm1266-gpio-fixes-v2-4-801f13debcb2@nexthop.ai>
References: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
In-Reply-To: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778973534; l=1739;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=yxjAXeOD8vgYHpYNi2nRb2U8lGvMYDcyt4MCoMgxNz8=;
 b=WTiOWdWghEIO6M71PDijdRA0E0SWlC77JtKTutsFSXf2+p8yo3CIbVwylMBta2u5GORRt7VpR
 WfxCxYPFXsSAF4CAqveVJLuBo0aBnPgglLTy0Y4rYcbslUwj/KD/i+d
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-Rspamd-Queue-Id: C6D1655E41F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nexthop.ai,none];
	R_DKIM_ALLOW(-0.20)[nexthop.ai:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nexthop.ai:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36978-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdurrahman@nexthop.ai,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nexthop.ai:email,nexthop.ai:mid,nexthop.ai:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

adm1266_probe() calls adm1266_config_gpio() -- which goes on to
devm_gpiochip_add_data() and exposes the gpio_chip callbacks to
gpiolib -- before pmbus_do_probe() has initialised the per-client
PMBus state (notably the pmbus_lock mutex the core hands out via
pmbus_get_data()).

That ordering is already a latent hazard: any GPIO access that lands
between adm1266_config_gpio() and the end of pmbus_do_probe() (for
example a sysfs read from a user space agent that opens the gpiochip
the instant gpiolib advertises it) races pmbus_do_probe()'s own
device accesses with no serialisation.

Move adm1266_config_gpio() down past pmbus_do_probe() so the chip
isn't reachable from userspace until the PMBus state it depends on
is fully initialised.

Fixes: d98dfad35c38 ("hwmon: (pmbus/adm1266) Add support for GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 57cb7d302cdd..b91dcf067fa6 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -467,10 +467,6 @@ static int adm1266_probe(struct i2c_client *client)
 	crc8_populate_msb(pmbus_crc_table, 0x7);
 	mutex_init(&data->buf_mutex);
 
-	ret = adm1266_config_gpio(data);
-	if (ret < 0)
-		return ret;
-
 	ret = adm1266_set_rtc(data);
 	if (ret < 0)
 		return ret;
@@ -483,6 +479,10 @@ static int adm1266_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
+	ret = adm1266_config_gpio(data);
+	if (ret < 0)
+		return ret;
+
 	adm1266_init_debugfs(data);
 
 	return 0;

-- 
2.53.0


