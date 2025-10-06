Return-Path: <linux-gpio+bounces-26828-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3C9BBE1DB
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 15:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 804A14ED452
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 13:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC65285CA4;
	Mon,  6 Oct 2025 13:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="27ZSLKjA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D18E28506A
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 13:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759755642; cv=none; b=awhneQfXsFjmy2q9+gk0G3JEa3OGAUXXmw7GXm4xBFCw9a+qMjGoHo/3yHkHJ/hkZlZx2Fn95TOyTFthHwPgKviMWHYmzcmec7WkXLa6PclvzbLjkmEVb5MI5XbLDtBKKwFvWt8x1LAlywB/EaiY3TIQVuh6wAwll70iTiAXgIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759755642; c=relaxed/simple;
	bh=7Jqk+0Rw48ZsZIR+qXKKV2mT1aS0h7swJqBj47Ge5oA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6UjF+fktNSKHitdV/Klon3kOFwBaNnqU1HeAIPieoyUVeApMJfJHYNrBTbyYuyknHx4IAKaH1bDAH4vzEAiLWiX/7ptCyc5Lir/y1cSPap3Pp2NxvfYamikpNygp4vHEOeUYoozbfBGDLsUYiOdJ9XHpbaUwoxk4HdXpuM/LFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=27ZSLKjA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e2e6a708fso32182335e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Oct 2025 06:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759755638; x=1760360438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ra6UJLsRCiTY4w5Dlw98xmE+EwKNUja03T9QbZDu+Z0=;
        b=27ZSLKjABouIedOlIgPvxXPFf5g331lFoew8SRjeOhfFkbZ8fDVAgXBzUPYsnEqlkJ
         BBwaCSbNHctnsZ6DdCV2D/Xn+lVPSaSH6tFh5VAGwXWq0XR2yJK8g/KuF8Uay10OXT8u
         kBgP8j6h0+V69DFQZ/ost69Ie3O+p33cLItKVCpAM/Q7wYMC4EhWODvvCGhcNLG7hlej
         8wY66uy/btdIjW9X7jrEeNscL2jJM4rtLEVcwHp1r/jlhV1+xfgXfoyoAwgyf+mlwt17
         ioap7uwb6hXTem7Hrn199FeGzf9e8X8NPfsf/+ePFzZboxwdgg/CehEPa01CNXIwxzcC
         Bt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759755638; x=1760360438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ra6UJLsRCiTY4w5Dlw98xmE+EwKNUja03T9QbZDu+Z0=;
        b=mQZHSdJVeZgcyb+qIg5c+KuRRD/T3YCX1ebTi7lmQAWWhNTrP/8D+/kDj34K1Icn2W
         dE78/17g0aJWcaBvDQe5hvgRClkyIcEIb3gM5kONw0pnw3mTXfl50yxo1+mBqMgKWVcZ
         uSxvT/iK8PJUUyI0SILrpoA2FmYa6ZY50Lgt9RAj4QWswhAOzsXUay7mr16HqVKGyuTW
         G0mIUUYNd/Y/gDZd1ItvH3uK20WgJvR8BM0E1R2Pg4qsy/3JICrqAMuYDSu7qGVBygsG
         j8fPhiunHCk5iDXJyiGelo+wDa/lhgCFNglIaiFaxbmg4nnPLs5oCzYakZWG0EITUAzR
         Ffqg==
X-Gm-Message-State: AOJu0YzMAaFAxXOlASz3vpTfppaTTGrmbwWlEzsFnUIang1EGwkzVcC5
	JvQZQcLpBd9lazAF3wM2V+L46rSPUl1XEQBzeaHoBEldsksCQrc1v7TZrpw3yBenibo=
X-Gm-Gg: ASbGnctxy/ZH6nJnZMrMaGtERFshFxWOF32pigZgdg1jjsYxktup1zzT92/gefak4FP
	uGCXhxju9LHLqtDjUPO0EnLLclgeVR33UGN8W9ZrWO1HA7PJJFeY/+OadBOShLrtkbllebBWdxa
	057YBdbrpIxFigH0amw0Q51dUf5czQh3QSPRhoWd6DCDzu80fauWDsBvJkWUMSkyjuGkFNzm51T
	CbfSJYC/N8v8SGnpiOH3h+zFoaWwus0EkcEXwf9uQQ3qh/+SVnv2abqdNifoXsQg/wtkyu589Ym
	TlRMtNlWgUMo+E7kjqHwKqyBayx5IQItG1jTwKZvZ+Zdn8IqKsGB3spIDVDpgDnhCJMMPJVw+IP
	+aveNi8rQFhn+MfqBXblHWA+YehtOlbLYOQBpBSftHg==
X-Google-Smtp-Source: AGHT+IFgLzIgY3pkjgFzcgT7VNRTa7prqsen/gecYHE31rP7DqfrVJpmATXrYOO7DsFU0yHLX2VQ4A==
X-Received: by 2002:a05:600c:628b:b0:46e:4883:27d with SMTP id 5b1f17b1804b1-46e71147470mr88630675e9.30.1759755637657;
        Mon, 06 Oct 2025 06:00:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ed2b:276f:1a72:aac0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619b86e1sm249725965e9.5.2025.10.06.06.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:00:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 06 Oct 2025 15:00:17 +0200
Subject: [PATCH 2/9] software node: increase the reference of the swnode by
 its fwnode
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-reset-gpios-swnodes-v1-2-6d3325b9af42@linaro.org>
References: <20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org>
In-Reply-To: <20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=853;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sIF2HhSB+nj6SiXIxMNel4X3wr1KbNilnoWbpiOKTXI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo471vLK1Kim9deZ74HcxK7aZgD3whmeIXPRFm3
 KMWG/Qweg6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOO9bwAKCRARpy6gFHHX
 crY8D/4xCm2koNyAO0n6ZToGqSga0HZbAspeEHKSlOdzR+hLK7wgy3tiCpeIkn1vsGNDzZvfjG/
 Iu/rHEbo4OFbPnDz9bPMBqP+xe6s+9GR9NZiP03Z7e/PMub6BMnZraYcjpy4QN6KvjcSncdVulD
 a/tMUeKQ3gRwJEZV18YR/+o5zeZijpDqTJioG8hLg0Mp01pWBgogC/dz0AtWMFmjNjCdXX0IzXG
 nku+rFzKnJryquTRkJyTNL4c2hT8wZvR0D4uuuarJfsZMkNIyGMSRmeOrQwycBpujl71Xto8rP/
 YY6CojcJQ5/cZaU1SiU2j4OweLodeL5+WHPJXkLBMgvU4+n+CuTLhfw0kfFFWNst319LloP0iV8
 2NOAKcrmZ6A0ThSN6OfaP2gmSAMuU9ujuKazl0ppnYckr9F5ZA+IpYHpdbz9DB8Inic+U5BZigY
 aoG3FPKSxEE1AXEHdZzLeVLiBv1/7TkR+2U/8QqxaSFdX+bZzIAl4J1Hj5hwsgykZ64ojbwnV4C
 gJaslMY+7nrGc9VZTBj6Z0JPR7VVb4652BBj3ykkDjFKkpJiDb/+cLtOe2K7A0IexmhJxy5lADQ
 GuPu4B4vaA+LXGKEw74D+/yYgfPc+VVFApB1Xl7dPlsUJCLoUbjkfDx0copwxMQC7hgqU0mM7tc
 Gmrzs0jEt7n8Kdg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Once we allow software nodes to reference other kinds of firmware nodes,
the node in args will no longer necessarily be a software node so bump
its reference count using its fwnode interface.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/base/swnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index cc48cff54d9c3d4d257095b6cb4a7869bf657373..a60ba4327db8b967034b296b73c948aa5746a094 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -554,7 +554,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	if (!args)
 		return 0;
 
-	args->fwnode = software_node_get(refnode);
+	args->fwnode = fwnode_handle_get(refnode);
 	args->nargs = nargs;
 
 	for (i = 0; i < nargs; i++)

-- 
2.48.1


