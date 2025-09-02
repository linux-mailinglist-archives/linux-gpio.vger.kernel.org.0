Return-Path: <linux-gpio+bounces-25362-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4C7B3FF7C
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 14:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9549A4E61BE
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 12:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559F931A071;
	Tue,  2 Sep 2025 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TxcH2LFJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250152FABEA
	for <linux-gpio@vger.kernel.org>; Tue,  2 Sep 2025 11:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814378; cv=none; b=aKQdOzgTx4a11V1K3NKaZ3Ruk0kTQpbA45vKwIRJvaMSWoDNDYQenmnTGwGmDzxUgf+Eh8NRvgAaIhWg3UkA7dM/j0qyHulIM6rNr/pVOaOk24quufdtv44Ck/DTuMC22XW1RtF6+hPkD8Bn95DFLjRK/b0yvqyJMrxS8ymXK8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814378; c=relaxed/simple;
	bh=z+Ha/q/rs6DEDpopmk7P/C764vi5ttqmOdlUzRZH26k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iS1XM5ixB/fpu0T8P9yW8WhCwxjtzzCn8/vQzrv/nEWn9hLc/q+XhV27V2gCrzdlte3M1pNKeNpDR9wQco7jtGWQDoz8w6QlcFyDHbKq7JeqzYbYUtvt57ggz/Nb1rqBGsSiL1MzClHBYFAckFzISHu1/9ijng1P5KVAtfIIbrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TxcH2LFJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b8b25296fso15503695e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 02 Sep 2025 04:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814373; x=1757419173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3eeGmPeTtaROvFQiYnK7dZg5f0Y1UOsb0zEkFq0B7A=;
        b=TxcH2LFJ8QfGVUwrvdNO087IHGUR0CTltY8aDXB65m3Y/bMVvQLVdmsltGGcLcnEsj
         WvATRwjI4FqQP+WAMRkQj48tzL+a8bwbZ9FDk4YGODVHGMNnJtvFd+2AR+Q2Jo4+P9jc
         vMiCDra8DMceNWgXyic6taoPQI6OJwT8PXBPUTGSOUjdqQ+pDddrJEQPKYClWPutsR6j
         yn5A1fNUFKOMqKMTMfCqNHTUDfVnInLQT5VIF9BeFWJ65/B304xx3dCWZAfATS+iqz+r
         xG7WYAbfIXHj+NqlgNwdJ6Yeg0FPPV+kIOv383mj6H7lEbSrKYB/TWDGEZIPedqyMfUP
         dOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814373; x=1757419173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3eeGmPeTtaROvFQiYnK7dZg5f0Y1UOsb0zEkFq0B7A=;
        b=KwrBLGRmYTT9AZ3cYuTE9kfgapiLHOYOFkVU2X91+64sF9f/FPacjPq/luiJT/Fhk8
         PoJyH1VDiMUFXzLXEt8SuJfNXjBGCmYACRpMAcyfCduL01hI1TlQfPOeFJzkx41LBI6E
         ly1tFn9pULpaPB+4iE8KHmHjnzXash8/lgNb//Pp0ltPg12JqgiQgpPwu8QPmnKtsWEk
         Tg3coBlDRa78y2lg4nZbtn0dJPHq9zGuuvonkoaBIwYNIPxsuyfDI7sbID/6EFPvQSxS
         vGUKQUAvHoanuUnOATl+F8UAkUy4Ak8oN/ALBT6jjDiPllciv3hG2G1EE5ySCgBoI9iF
         7Psg==
X-Gm-Message-State: AOJu0YwqIpGsLSTTmXnKGNfM3nouFDpxmlA8yn/LZRSCGZVWrPAnXugZ
	zwRyuHYP7Wt8Bp6+JEnaA9MOW0eamy+2LHoM9mwEJYmFcjt4LT1h59pD1oaRbec0eTE=
X-Gm-Gg: ASbGncsj+oHYsj7s9C48Gq3nqrgreKlX5KwQRcIqGxuLxs5bpRpoI3ebX/X0W03fX2I
	YkW1aNnZl5h8gW5mXbWbikrdpZ6q/ypBwXypSco7y/8pq+rYMQV7yUUruQOYWoVcZfWqQgJO88Q
	ohGAXXmjaZwuU4WssMgZzpxR/yL8CPCly2O+Uuy/k8xJmHBlUw/orjMAzMtTeFtmRKp1JkUDKni
	hK71zmsQUkAKuuRxsKcoH7fqmDs1Jq0qqVDnQmTwGO2m1BYWlIvXABFWAuO50yDMOztCimXtvv3
	4pNowM89eU+AHGcwDzQs9+J7KFptcbU35v5hZ3W2TkcCIS7E7V6KZS3qkC84EdmZt3l2i36UZdR
	JcMy5/XOXpT0Z+Uk9mn9sTGDu1Yk=
X-Google-Smtp-Source: AGHT+IEYts8jM0hPDNk3lR54JtI9fXY+q3XD1cCncBSU1T/7vcK/5dU1iwGu8Rzh1q6sfcr++Z7kQg==
X-Received: by 2002:a05:600c:138c:b0:45b:75f0:2d66 with SMTP id 5b1f17b1804b1-45b8553da82mr85384005e9.4.1756814372615;
        Tue, 02 Sep 2025 04:59:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:17 +0200
Subject: [PATCH v7 08/16] pinctrl: keembay: release allocated memory in
 detach path
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-8-bb091daedc52@linaro.org>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1922;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ybe6mZ39mB+QhhV+IKLIazviltUgUh6yCI8QoqBhqhA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwTMr8wKhS9jqc/gyJqLYlDuhik2dzTYA2mT
 1itmg9TI66JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcEwAKCRARpy6gFHHX
 cjI6D/47zG6CNa/8DApAwhxFDdmwXkTD9kK50B7xrkEpT1/JM58uqZdt8oD+hS1swsxXhRof0r4
 2n2Ji8TbCs8P2yCD2PbLf15A8uHM5PHZenScMw/EEAYyqe71x1+dtfd/0WPRmc70ZooKL2QWiAi
 WmY3xrhUzFT/mTiHSJ+Sl6fEv9P+P0aF1MaWbgDZ4jowuRSP9MOSc95l5y5xr0kfP1E16kxoCnq
 4ZHO+I9jSj8nAOC4p7vv2C8xPjIX4qljGd6Fxei7GyLJCsWCO1bVOuiBPOeuAHr5xFaE4ZRovYb
 F9lyE8LGGsGKHyJ/L69Bodanim6+VN85c4fQ2AcR89293cvQpDixNSz8mrBUiT+HmVE0IzxSLNy
 Sgp2dWrAe3TRtptr7mqR4lPuk61imcA5RCUU0I3oaXxd9hP+JLUTmSlMfA6LoTNWbSYRVC+4xDw
 Qo5pgteE310JQKtU6rQnNHGW+2O3jcyFn9mbGQuTqMr+vKyahvM7UyhEDX8ZW74zY27DSaD749J
 rGlm9BHlu4j2jQqztmo2Nn3sGXWBkw3q97eaE04xHGEZGWDzNSCFZD5lsOKMyFl1RzjaBRQfm3w
 5Vg4CQMYP/j/60BEEqNgzTd4ZzduOt28Z44HTEo2+ZFoduSKvvGzmVen+sRIF7N6c4O1baavetE
 suzeoiwgo1tLJVA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Unlike all the other allocations in this driver, the memory for storing
the pin function descriptions allocated with kcalloc() and later resized
with krealloc() is never freed. Use devres like elsewhere to handle
that. While at it - replace krealloc() with more suitable
devm_krealloc_array().

Note: the logic in this module is pretty convoluted and could probably
use some revisiting, we should probably be able to calculate the exact
amount of memory needed in advance or even skip the allocation
altogether and just add each function to the radix tree separately.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 60cf017498b32a9f36a1f8608e372951c2b8f12a..6aefcbc31309995ec1e235416b40aab3e4a073a9 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1603,7 +1603,8 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	 * being part of 8 (hw maximum) globally unique muxes.
 	 */
 	kpc->nfuncs = 0;
-	keembay_funcs = kcalloc(kpc->npins * 8, sizeof(*keembay_funcs), GFP_KERNEL);
+	keembay_funcs = devm_kcalloc(kpc->dev, kpc->npins * 8,
+				     sizeof(*keembay_funcs), GFP_KERNEL);
 	if (!keembay_funcs)
 		return -ENOMEM;
 
@@ -1634,7 +1635,9 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	}
 
 	/* Reallocate memory based on actual number of functions */
-	new_funcs = krealloc(keembay_funcs, kpc->nfuncs * sizeof(*new_funcs), GFP_KERNEL);
+	new_funcs = devm_krealloc_array(kpc->dev, keembay_funcs,
+					kpc->nfuncs, sizeof(*new_funcs),
+					GFP_KERNEL);
 	if (!new_funcs) {
 		kfree(keembay_funcs);
 		return -ENOMEM;

-- 
2.48.1


