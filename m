Return-Path: <linux-gpio+bounces-6977-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 654DD8D515F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96E3E1C2305E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA625579A;
	Thu, 30 May 2024 17:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jR0fAmUc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58267558A4;
	Thu, 30 May 2024 17:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717090961; cv=none; b=aJzc0hkvRRSVAqwpXq2NLnQILgXYY/fMcoa/qaKLMOxUgHD76zSM30zUAL4v33SiYLH24rkOtYNx6CifW697KCcyz0Fk4MMLwhpKD5VxHOcV8qK1cSkHuAlUkLK4refHG3jE1uKZm9Qsvwhv+2pr+aN0pP8MfwuQjcdnPTeTP/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717090961; c=relaxed/simple;
	bh=YnGPCLS+ou+N9rrc2pH7ZjLQeq1ssWPcY0dePVLp8wM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D18tUl7Nc6fOAAt2kTiaYEApw2rAtSBu5cdpx+r04+QLJdy77QOJfRFBf73UC+MiY7KbwfRMCXuyh/B78iBSC9qD4p/VebcJjq8iG0Vy2F2OXu12rk3oinkFsqIsWp85mjE9gfO4rZ2en5HeckLubPTlyu/0Mo9amhBRVTM/v/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jR0fAmUc; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70231566377so889427b3a.0;
        Thu, 30 May 2024 10:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717090959; x=1717695759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOPkcCLUqT+qwmWUiEY2AMuOiTv2xstNir1iU4Gtb0c=;
        b=jR0fAmUciTgUIzIzqsNQixsWpp+eVjsobgCfUhXHyAeKJBhkb09lKIMeiCY8ZUVi9t
         CiVOQHDj7FaX3dvGJ8yeNFkOeNAy/A6TtmraF1tsYGm73jh3FOnfiidahdNNXJuV+JA0
         JiMofjxeaavUMH6DE+SPfEwhhdpkBhF4RZUDcAr9PJ+YM1GrYvdREP/glIqt4ge2osuv
         MHDgh1rSsw2KIpm9DisZme0y6L4ekdN3lUY9PCNIcCn3PwjlzTjJj60bt3zMPpGO2Rjr
         8/YkLocURpBhN4aSNCIMwY8IK+6zTuPaHc43HkewKxnYCvEdMGQRErC/ivYa+hGkVBss
         7gEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717090959; x=1717695759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOPkcCLUqT+qwmWUiEY2AMuOiTv2xstNir1iU4Gtb0c=;
        b=AH7PsRv0VMtAhxImOhdNER8OEsU6vC7Sa61W6wk8U2ZUK6OHkNbcYGuqwQVxSneFWq
         jpjT5cro29htanVtRRagOs8+NnTjk+jYxkNG4zaQtemxaDSnhk2DpD1/KV51cTTjEfiT
         E1yU4g0tOpuNZLCi8QcV2540HxOabqRqmnOo3W6riJcpHntw5vAx5VG6VDHIsNOE40GA
         v/6HtOXgif1WvTpeT6WlkxglXawdNgeF0r/15l4yHDDqwj4lveJxzIaII0POJwyltjJ7
         ETap2Yh31SsFGa8AsrWDAjA/l0s41PenWMF5Vaq4UyYjrRliTNfPhXPcILMq63t0PXX5
         x2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUofPwziRKyHQcPJgzY2KMU35THpfNksYzpDY4/fCAjKRy2bEZ9atg5K9Yc1IEyL6Pe2Yz0qFGCorwMcDFVsqg1PdMuMePLtYStPHK/x+A4P1uOiNZPyw+jK846/4gPwR7FnI4M04e+nUFscSWMusCa1pzIC2TjoJHyJdd+pHcIi83FYxk=
X-Gm-Message-State: AOJu0YwgmAQyLNCGkXXFgXA9Lvf1uI4hsfmGfsp9J0jQBdV2bnFJL4pK
	Jfs8yJXpcLNd/WrK96lt63mvBu5yHqtWy/yWEhDJw2RsyI890hJc
X-Google-Smtp-Source: AGHT+IFx7VInUG2NFOA9YQpsTQeRct+UMrQxhh+ZEAzGqINZCPes7Mr+g9AfRxHBFG1ToL1B74MNMw==
X-Received: by 2002:a17:902:da90:b0:1f4:8d80:2352 with SMTP id d9443c01a7336-1f6193f8a95mr30753285ad.16.1717090959566;
        Thu, 30 May 2024 10:42:39 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:3bcb:e05d:a577:9add:a9ce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63240c947sm450105ad.269.2024.05.30.10.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:42:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 12/15] pinctrl: renesas: pinctrl-rzg2l: Pass pincontrol device pointer to pinconf_generic_parse_dt_config()
Date: Thu, 30 May 2024 18:38:54 +0100
Message-Id: <20240530173857.164073-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Pass pincontrol device pointer to pinconf_generic_parse_dt_config() in
preparation for passing custom params.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
- Included RB tag

RFC->v2
- No change
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index e60049b66203..ea1a08d272a1 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -532,7 +532,7 @@ static int rzg2l_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 
-	ret = pinconf_generic_parse_dt_config(np, NULL, &configs, &num_configs);
+	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs, &num_configs);
 	if (ret < 0)
 		return ret;
 
-- 
2.34.1


