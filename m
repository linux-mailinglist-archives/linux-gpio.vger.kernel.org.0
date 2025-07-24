Return-Path: <linux-gpio+bounces-23756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CA0B105D2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 11:25:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C8F13A7BDA
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 09:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE99B25A2A2;
	Thu, 24 Jul 2025 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MVZcQlZ5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBBE279323
	for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349089; cv=none; b=BC0EO0me16a7VfQPirZ3xarnWaZgh++Y2DHWf7QcroSZ3+A1l1DpVg40jZgasJr9QJM+N6VA6EBgt2GF1NfPfATzbD0WX8+x5iSNUdhIRkNHo3klFhy161I5TF8MfpC+zWSkZRcbVsx70F+5etH5YpA4teWB5SC8CVJjBHbuw7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349089; c=relaxed/simple;
	bh=VXWj23n23v9DRHOjVdOiclkjWRwARJs0MSEGN7Pjt0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0oAtfcUv6fMjBKzlIQyWuBZYAsIKuY2DXZqQ5aVY9OO/wjNA76pAluy76Z5onaRqohygyPauUqCDifWZ0m9n8dyz/Y+W1SmgKZSfXEbXVv1nnoCMi82ma17rdVUW0toRziKja4etbLRa3AVVInorDTcDJHedIIRqEdeMkIWw7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MVZcQlZ5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso8072685e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2025 02:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349084; x=1753953884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6taTiAJxmvKWwV7MRUnViIWdyftorILSzVZsNGCp2D4=;
        b=MVZcQlZ56XtU1gZiXXNxnLZgZbI+J/ByIgZaz1DAg5WOG8QCGFJH8mTlpPfUNASShW
         7byn/M+HZ3JmuqzRkwqu2MUvBw7MY9udL1/pkfKzQuGHTn0lJAfErX/B3EaTFZq5astX
         P2ptAVH9twqKxKFf6Poof8OPqg/sNmtU+sU5FG8uR5/lckoUPtfVGkm2jlUbzisnPkZF
         WnT6QO865/gcwRmpmq5CRSeKmOC0LjODcXaUvxjz27rZJxaj1LnsVxrFfL/XMm+ng+tM
         p2hvW0giBWlj7k3QZGQKNTCDuTuY5VoaAfqpxeV5mPste+qYt/n1q9Vy8F75Vsxmc/yf
         7AUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349084; x=1753953884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6taTiAJxmvKWwV7MRUnViIWdyftorILSzVZsNGCp2D4=;
        b=qXmmKKzuxGeOcB0AfZpeusp215bpcu//URy5HRdnNfsnSJwq1oDJfoO8Vj8g4IFyqc
         bp5cWYvOmH5HuRW/OAzf0d5pFuig0P2Aq+OesudoGQ+cSkZOvDK97UdvTwwPpdbFoSZv
         1FkZAsnZEHitChbA+CcXAGFLTAQiFkSIXn+7JDaYJgAjSmw6/PZWCj8O6duan0+Ujtiw
         ydnOAKEdz9coWTiQhSAyF9DqiBAJl10Uh36QmcYBGYUhbylW3FfFm2tCTbCaJNVtq6v7
         97t+Na1lvFeOL3+yNOemLNhMc0kZZP+E4PnD2jbhgFUOqlc8/n+aY/zltxrtMVbjRjqr
         OePw==
X-Gm-Message-State: AOJu0YxjXwk3AS7fpb2YhCw4IrxZ/XtaaGUyJfyNFzdzMejwBZ2EzZtN
	8YkSNysomr6Om7GB7SuFSCvE+C1KHDP7l+oRgezm5E2AIrtzkh1OYfhHmv0xae+kOxQ=
X-Gm-Gg: ASbGncvf96fJ0I6H6v++H0acpCJFS2hvX/JKDD9aAy+L+LIzztFHi8h2VNVOZxQOEP5
	8BvyYKUmgjipYgYf6TD93NKWrCj2liLsbuJGLd6tKWAPNTR0SmcokbmaesRddkxyg1xnoQd+zQr
	+uZMbUb4zZxAtIX/pyk7PgrpqaG8FkT41lNuvzq/QHrlZmaxpPINNBzbyb5VhTaS56IWqA6jM+1
	7/XjsaHmUYJwOzxfKVH21VqPtA4Uk0UfpACT5/iOSSp5QuO5RpjFah3esLRIVoP2KaZsYgNovms
	hZ6tKY+ObaFn1G/Kee6i8Y3yh3ytaV/QMT9/CfYO2loF5d0HzGDAhM/eIO98aHqIgqsNn53BhqT
	+myKEUJbxDz0Mhrf0HIp9v7hRbLc=
X-Google-Smtp-Source: AGHT+IHK0dYi3xsnoZaYbdsoppyUow3KIWIi5jwOyXEKrEo3jgO5fkBiWGVoSb9P3rLxzjmZh7JVig==
X-Received: by 2002:a05:600c:1e26:b0:456:25e7:bed with SMTP id 5b1f17b1804b1-45868c97accmr58794135e9.14.1753349083444;
        Thu, 24 Jul 2025 02:24:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:31 +0200
Subject: [PATCH v3 03/15] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-3-af4db9302de4@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
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
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9XGd4dmoHWG203pSJBEuuDLVpVNcYHStbs3CKo1ub7I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvRgqw0m/InntV11HHUCE+MGVQkjCMalwIfS
 KMoPh5ezd+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70QAKCRARpy6gFHHX
 chrwD/oCtF7meIzX7ZXpLEsgWK2HnP775ycIOrhIwy5EPDMyiNJBCALS6V0nGhCUw2Z9MV0vPMu
 cMvZp0ZAetbm9VKmdQDWRldx4ebo8/xAdFA7QNSl2v9Py+AuX1OymRUpeGqWEgxZdMIMGLePvDD
 J41mLtcuKXxdpZzxVQkJ6eqotgtxLicQ3Kd5nyfAGpPv58pRiSOk8ShfVzgvbDt4Cm+4ZmI1b/g
 6ADxlGARBw7Iv6e0y3aarJZY40cDArbMpSeMsthPxd2ckA3YzpqfFpPoYaqZLzPJLzS9qs+JS9m
 FTPjtr7zEsks8DyXoqQmEomYi7djHBa34IM/+cSpTShC+uUPWxn5WIh+e841X0NjZvqiYltThhF
 TwrnuYapLpqUE4A51spxZbKr86qfYwSaIvQX3GQGjYh7PEcsD8bupfDFxuoNPxI3VJG7QGRDOQv
 WZ3Vmi7GS8vyhYTBQS8uXK9ltMPRVoPNgmGHSR/k0ZSAN6h8loFb6wWYuxhqSgvLEbwtaWqGgH1
 zm84NgtIT/M6kXtus0iI/i4ig4d4UjPmMI/Jhq9pjP9RBSMZu/EKa21utlbG/Go5IGqI/n2vHDS
 SwCRIsWrcI2So3cc+c6i7Sawc/UqzfwIcEMaOpwtlssOTUANHxZLwMt12cdVdexmaqY5wPjLhmX
 qFbRaYrqSoXO3MQ==
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
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 1737b88530c385644a360e8abe583416bd6d3fe9..aa71e02b661c992c117418af910ae157c4f75fff 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -36,11 +36,9 @@
 #define PINCTRL_FUNC_DESC(id)						\
 	{								\
 		.desc = {						\
-			.func = {					\
-				.name = #id,				\
-				.groups = id##_groups,			\
-				.ngroups = ARRAY_SIZE(id##_groups),	\
-			}						\
+			.name = #id,					\
+			.groups = id##_groups,				\
+			.ngroups = ARRAY_SIZE(id##_groups),		\
 		},							\
 		.groups = id##_func_group,				\
 		.group_size = ARRAY_SIZE(id##_func_group),		\
@@ -334,7 +332,7 @@ struct airoha_pinctrl_func_group {
 };
 
 struct airoha_pinctrl_func {
-	const struct function_desc desc;
+	const struct pinfunction desc;
 	const struct airoha_pinctrl_func_group *groups;
 	u8 group_size;
 };
@@ -2908,11 +2906,11 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 
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


