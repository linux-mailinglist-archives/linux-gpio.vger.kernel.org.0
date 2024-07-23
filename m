Return-Path: <linux-gpio+bounces-8366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC6393A48F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 18:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C3111C227BD
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 16:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFD1157A7C;
	Tue, 23 Jul 2024 16:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJg+wZi2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1585413B287;
	Tue, 23 Jul 2024 16:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721753402; cv=none; b=aLYprKwK5tmgbmn0thGIjyIAg9qoXShEV/cKfOMpCvlfDyXUGohKgEwzUmGG2PbhyotG7FmE/46TE4MjjwgLy8N+yGsNfwSLk39C4R5jjhsv74IQJQa9lGDL5+2POttbBmGdultaNQzXHa4waUZBTWdp8O5SULgVPT7e99fvLSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721753402; c=relaxed/simple;
	bh=bgRzib7ffK4t/fOJONVPwKLTPYzLnXKhHikn+D5UNbk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C2H5Bfy6UYfGTreqkVz217jOmuO/RzuuZ3Qa1/0juJHYdReC1S9CjI33F/HBGrBDauaJ7fBwOeCiu0P0fw/OWOdr69cNNPQ37tZDnx3p4Bn+5aDKSYNObrZ+ywH2G3yKaCqy0AQQJqDKuCnq4WuJR3QXdA4MRnp5YO5lCua0ulk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJg+wZi2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4266edee10cso38498705e9.2;
        Tue, 23 Jul 2024 09:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721753399; x=1722358199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CIXjbVlMzQ/E74zkKkld+Uu+AAnVMwiLGvKXFp+BrOw=;
        b=GJg+wZi2ZpT/hjngbuqMks6r2lUX5Jj3u1qpUe/tDNbczrjnsn1Dy5JLsFgFHqnBZR
         ajI2Qu1dZ4AsJOXcqakWe9QoB7FAbD4WHMjkxrPLoUCv8i6tU9YZZF2CwXkL8zxr4DoD
         2SGREfZCaIfrbsVAOLqs7JItEvcJRYyygmnZ/gg/1HDFxzSvVbyYwCtZqphhhhFCfrTE
         QPnl+nLjhrw8SNX3/qs8uzuXBGtohKCt2JGk3lxlDcb8TYg9ezv8XEh/9hbskpBXjCN0
         9M3xDhrYXQdDINo3ZUfjEclF1zrWK+y7NZV+tKD40kpiHYtVpJEgq1I3IPetMvl9el9o
         7VqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721753399; x=1722358199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIXjbVlMzQ/E74zkKkld+Uu+AAnVMwiLGvKXFp+BrOw=;
        b=fpLNKf4NrNwxVLELkAu+WM//M1l6t7Ket1AHyxDkIVgPcVfIjwXnyT+TJamYHDTiDm
         Yl8HXVXU6kA5blYMMY98xOnbdQLq7WFaAz/0c84C/rw4HCBCNSdIGJl0IlfRgxO8SLFe
         6qNqSanvmbaqo1SU8+8UoNfMEwCPPSNE/n3Mg34iQlJBfTyhU1yeM211RVPF6yLFbKoQ
         EJkufPZJDvj5SyGdHJ28icChUg7OKrJlFXEhgNNwuyWAUt6AyNaUQCGgvurp72scWYAi
         5fuIPOmMhQts5gGM1IHuLary6XDo7MgINO59TkZSt4zFdDwMhChIWIr072CqXc0y26JH
         YAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeBfvvTlJNuhRLx7nCSV/1ip4NOUScb1vp+VIG4H8IiNG9Ufw4g5Wx7aoqKk25qxfxjCKMYHXb03amhSFjKEykeEXZQS05lRwI9dfCZyaXQRKIlTRTOStiPo3xywZ8XE3ERRdrxkPAig==
X-Gm-Message-State: AOJu0YyKs1ANO6bq4Q6GV+/HfyEY5l6fk+dVaDA0xavkzjz+h7Wp886R
	36tyXQJsf/U/de0ac2RabjAZFYmMxbGan4Jl5OtZhaK2Y10fQXBN
X-Google-Smtp-Source: AGHT+IF5fAiKkcWS/KCYN1ZlTrAf5xl/dy8U8HtPAw0W8wO8y4qK0TOw3HRz/WQ1BqGJGDbRpL7KuA==
X-Received: by 2002:a05:600c:5103:b0:426:6b47:290b with SMTP id 5b1f17b1804b1-427daa61cb4mr71062635e9.28.1721753399207;
        Tue, 23 Jul 2024 09:49:59 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a8e42bsm210617315e9.30.2024.07.23.09.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 09:49:58 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Return -EINVAL if the pin doesn't support PIN_CFG_OEN
Date: Tue, 23 Jul 2024 17:47:44 +0100
Message-Id: <20240723164744.505233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the rzg2l_pinctrl_pinconf_get() function to return -EINVAL for
PIN_CONFIG_OUTPUT_ENABLE config if the pin doesn't support the PIN_CFG_OEN
configuration.

-EINVAL is a valid error when dumping the pin configurations. Returning
-EOPNOTSUPP for a pin that does not support PIN_CFG_OEN resulted in the
message 'ERROR READING CONFIG SETTING 16' being printed during dumping
pinconf-pins.

For consistency do similar change in rzg2l_pinctrl_pinconf_set() for
PIN_CONFIG_OUTPUT_ENABLE config.

Fixes: a9024a323af2 ("pinctrl: renesas: rzg2l: Clean up and refactor OEN read/write functions")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 632180570b70..3ef20f2fa88e 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1261,7 +1261,9 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		break;
 
 	case PIN_CONFIG_OUTPUT_ENABLE:
-		if (!pctrl->data->oen_read || !(cfg & PIN_CFG_OEN))
+		if (!(cfg & PIN_CFG_OEN))
+			return -EINVAL;
+		if (!pctrl->data->oen_read)
 			return -EOPNOTSUPP;
 		arg = pctrl->data->oen_read(pctrl, _pin);
 		if (!arg)
@@ -1402,7 +1404,9 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 
 		case PIN_CONFIG_OUTPUT_ENABLE:
 			arg = pinconf_to_config_argument(_configs[i]);
-			if (!pctrl->data->oen_write || !(cfg & PIN_CFG_OEN))
+			if (!(cfg & PIN_CFG_OEN))
+				return -EINVAL;
+			if (!pctrl->data->oen_write)
 				return -EOPNOTSUPP;
 			ret = pctrl->data->oen_write(pctrl, _pin, !!arg);
 			if (ret)
-- 
2.34.1


