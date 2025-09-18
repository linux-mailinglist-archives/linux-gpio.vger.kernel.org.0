Return-Path: <linux-gpio+bounces-24421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B48B27C95
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 11:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08E9F1D08455
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Aug 2025 09:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857742D3742;
	Fri, 15 Aug 2025 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jCFTkev2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0CD2D0C6B
	for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248967; cv=none; b=tk8QDtBCwv0HoZU5uW5pxN2gbbtixTiigHTnnnokrW1RMgJxcq/Na+/7dZgrA9ouHpj0Nre3NCqwdTH7mBuBT2TK5R11YL76N6vJ4FozoJHcIGeVmGz+BdzJGwSLKKI8LD/+ki5wk6ZHuDVQbM2ibLi+ru0xpQf8lihKqmRJft0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248967; c=relaxed/simple;
	bh=eVcvBqQdVPNTqpfIQ1uOcWvSP+NDojr9eRpy6to1igk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LbwGAYn1azqGhB4vaSaEv1iE9YRLYzaVn8gbPzeiJmVYTA1VhX0cuOW8jEP8OyGJA5piBHW77+F/PfyNd1Vo+aN4IGmF/m9TJ08gxnmoRRgtOPE5RfGXfU098bVaI5sQhb1B71NSb9cTLa1/hRheptyP0h17wb9Ks/IFVLtZEbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jCFTkev2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9e411c820so938277f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Aug 2025 02:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248961; x=1755853761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ojzj3QqHYKTtweaj0hMdOf0hJWBOPE6yGgnAHCkCHqs=;
        b=jCFTkev2Plk8bz3re/jzfwWra49a9eF2rAdrkhtgY8gPB+PwMjkGC3i7Au+9USLmCS
         Ev947Ex2n92fNal2AzgxKjTxTUvxDgy41mDkkgodu8RRgxMKu6pOStf8qZBRNkOU0qFt
         Dwy9W/Ff3Mt9n09hiX2lbAk+dsvmuA1hsxlIReCIo1xLqfFZrMCgmJWrvIlLN7IUXUhb
         0pc5Vb9SZeznSTST6BIMgoISCn86l48bQBOML09TkDRtQMNUJi1Bh0g3PZLkgBpI4DIQ
         uiKFfwomuBlg27MvsXn6528X8KUiptK7sAKu4zCZFPZpXcllypdIiEWoydlmmN6GV+B1
         RaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248961; x=1755853761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ojzj3QqHYKTtweaj0hMdOf0hJWBOPE6yGgnAHCkCHqs=;
        b=uxcEJW929K3CeuA467JEAxpny/aPuO3w0lemFYTakEXNeRfv2x96Z0BJhM1rSX43m+
         OA2TQIgTFYviMVQZwWxhqfI2wsQ11t0M3RAh4WDVo2GSlvbUqlY5877Ldt/WXevXHVJg
         OThhzzbGym7VWrEsrE6Y9OKLC6R92z1cmmR86pq7O337/+1v5/RJ6+4JeYWaTd4aGtLN
         E4gRhXo/ImVOQa6vJnB7vJ8Ly+9vgrcrLTYeiyfp9lk4b+HGjjnfwraQjS2fwaOeej93
         Dy7+/xG3KGQKDcVpU9D1v4P7kJKUt4mKq2qMigeWSkq+RE+t3F250QnKdmgxsFYzIp2T
         ByEA==
X-Gm-Message-State: AOJu0YyVAE/30bhsZy0l8VMewxCzBGg5ERSqjPxgM7VRdPltTXAsbiYk
	jNscJ/T7YEbwCBkCnH3bTYksx+3GtGUApbxaVNQ0fYnlEV9oNTYEnrWReVZcP3i2T8Y=
X-Gm-Gg: ASbGncvy1Gq6+ZTmtZ3u04VD+gY837dS8yEpuDaAk0R9emwgWKkOne67gbMlCNJgEqm
	PCLtL6eDNwXQhYqYHNc4GRj54UTr0LeqmspwjKt2OtBr2O7vgBxQiroqtL55HH0ffeM5Tf65Uoq
	x/kuX+zdtMLaHPE9iOzkHFSwaV5o5OzdXShqkuoFrgXc4WU03LdsjAnAiXaczneEUeM/u4Xj6pD
	8nvPBCxVVSA8C9z9hRvD6e28gUmkSyTAehdgDQrw3Y2sN/xbS5QSOy/mWSFjWwEmKkIY0p1Zmmo
	HZeE9xpcSvXynHQtLYrIz1Xxve81khXhdNy/ZpdvapYz5zKK0ixAgqzt7tjgtfecb60PkecWNkE
	nUgobsD76R+QRAiN2FA==
X-Google-Smtp-Source: AGHT+IGtmJEYn4U7YmpLO/UnNwJ6EK4RcP2OJYWSbB46JlVxedVPjM8m1PM2GiWKy64gcAhtC/Ebng==
X-Received: by 2002:a5d:5d07:0:b0:3b7:9c28:f846 with SMTP id ffacd0b85a97d-3bb68fdd74dmr1039764f8f.44.1755248961432;
        Fri, 15 Aug 2025 02:09:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:05 +0200
Subject: [PATCH v5 03/15] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-3-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2038;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Q2YZTvBFgTu9mhuvELDYkYIT0089SG8/1kg34izHMkM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk3wzetzN7ylJyavj+6V+c1QQuTYpigZ2o4z
 l90cHMgWUaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75NwAKCRARpy6gFHHX
 cnvxD/0Ve0I/ieyHdgZy9d8hX4H7/zjce73ldaR9BK31igi4keB/jOhJI9WaD35KudjwoaUzGzw
 jgISznL+LSmsieGquZ8+gBRfeDFsk/QkyYOG8K5axtVVBr5cN6yvlPqE/3RsS+N+YTgyNuGbLz3
 3D0Kvx0W/BbHBYyiXduuXF0w47ZAanPPQIeTTrF2XJiwoFinOe9POqsFSEH1DnmaToCgV45o6uv
 XSFDNLIp+Xagtc/kXU3cGEPdgSqKK1eYR6znpNollDIzo08v+FU9a8dgAshxGM8OzP0F41sD1oj
 uVAI95wnWjHnUI+ljFBaGnnfo4fBgC/HqrxNMWogKyTUPZLR7IA9jvGoNOs4EEBDGL8GRCUfiMF
 KyL7e6DpCArbWK2HEuBRlZKngzG0Oa8V9FSW8EmH5qdI0soJjorpMeZXpmlMeRELL/NOoJZAhY2
 nFfZvCfD1+NjIN3pugMpjt8A/DRMSOLMoplZdIiG0tpHth5Qz+TmjQ4o642CundaDH99bRBb7yo
 4JM20LonHqzGzEqmyQ646wKUBqzowVpaLSC34ilA9XcwWx+OhyylRqAsH4mQf2VQEB0iko2OJxb
 X3jX4SHTXbdKXaoel6+wXODnpMTOBXpFUcWMHQLRNdqjv7BRt25Q9Eq+BqDBJtgXr/2udIPVNkE
 dmGtDLVs1fKVjTw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. This driver doesn't use the data pointer.
We're also working towards reducing the usage of struct function_desc in
pinctrl drivers - they should only be created by pinmux core and
accessed by drivers using pinmux_generic_get_function(). Replace the
struct function_desc objects in this driver with smaller struct
pinfunction instances.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 5f1ec9e0de213d587b68f41d3458cf504ee1b21f..eb6cd27955fbe462f479fbe92c785588caee5ebd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -35,13 +35,8 @@
 
 #define PINCTRL_FUNC_DESC(id)						\
 	{								\
-		.desc = {						\
-			.func = {					\
-				.name = #id,				\
-				.groups = id##_groups,			\
-				.ngroups = ARRAY_SIZE(id##_groups),	\
-			}						\
-		},							\
+		.desc = PINCTRL_PINFUNCTION(#id, id##_groups,		\
+					    ARRAY_SIZE(id##_groups)),	\
 		.groups = id##_func_group,				\
 		.group_size = ARRAY_SIZE(id##_func_group),		\
 	}
@@ -334,7 +329,7 @@ struct airoha_pinctrl_func_group {
 };
 
 struct airoha_pinctrl_func {
-	const struct function_desc desc;
+	const struct pinfunction desc;
 	const struct airoha_pinctrl_func_group *groups;
 	u8 group_size;
 };
@@ -2908,11 +2903,11 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 
 		func = &airoha_pinctrl_funcs[i];
 		err = pinmux_generic_add_pinfunction(pinctrl->ctrl,
-						     &func->desc.func,
+						     &func->desc,
 						     (void *)func);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n",
-				func->desc.func.name);
+				func->desc.name);
 			return err;
 		}
 	}

-- 
2.48.1


