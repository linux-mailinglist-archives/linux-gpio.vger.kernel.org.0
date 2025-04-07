Return-Path: <linux-gpio+bounces-18267-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 657A0A7D4F9
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B7783ADB6D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69AE225797;
	Mon,  7 Apr 2025 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xEx3/Bbv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3442248AA
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009703; cv=none; b=p3C51idOb7s1rUCgAJ2FgSPR0C8zLjsBaFXWyu0JrRwbrp2VYJdBgYkcwqgyUl/vJPdPKhxXYxzT4FQaTwo7yzWF8tBQesLLI5NHTEpJTRbDbI4e3ynzzKp801a0+ga7DjyJ79cSZf+2vmd6S5jvUfRyK8mtTGlUAANpOIXnlaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009703; c=relaxed/simple;
	bh=9q6YfjKBU4iHst4g2/inErmTAvbaYan0ShJda2jB4+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tgq1qiheVwBLj3U314hZMk3b/uQbDjCGnXI7UdIgq3T414fn4exwXW0vJxt1Ez3f5+OL0Z5ur8KUa75ztwTHa0zWsbGeAzLjeUMBgIIrn2k+icW5Enk2Dlip0hJejyscQutUFIp1+OsprH/bbQJ6taTRua869krY/TDpWmd6Fvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xEx3/Bbv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3236099f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009700; x=1744614500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdvE0k8XW+pRvbIvdtqoQhVtvxjP4eoUH+Gj/6r4oq0=;
        b=xEx3/Bbv9Nrj8StgIPNQ7usDG4Fn7dR/ZAdHAY/uXGXe995prw7g1mGycBEJgy1GVC
         0FxsQGhsxftiO3fxXRVU8qPWUCXEU6QXOCUviQkwwn2N0cHGZ2RFjnPEyLJTDQkCa5Fz
         i4C8HBKs/M6BHE1g93Ta+g33Be5JkcnaiAOVMAMWpnW5zyLmuCTiAsUptV86bn7K8mlJ
         S75hRzZMZbApkSB/yukWncHVobeX06ow4gqc72cgpEjYaoT6hrjURjBP179J2/Vqg0Gc
         7IG9289oLInAlPIvsEtS84udNOIyxijJQ1FVexytboNhvXeIjTaSOoiX+EmFDT/koqFu
         ESlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009700; x=1744614500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdvE0k8XW+pRvbIvdtqoQhVtvxjP4eoUH+Gj/6r4oq0=;
        b=T1sQQOIE/k36rHe6UyDPfHg7tHq5sPgC4koipA2PqE0u1QfRBE/MPFJ2aJ9gfTghVY
         W0Gak2KEqBSLlMv9p1DCfjxEw/SVfy+6rw1g3WFp9Vy0/P2f8SquZOXFR9qHi5TfWU5A
         YpxQP0k2E40iobeWfjgIUclekT1DAaAGQSI1Oy6spCfsL/X/Z224PkS91leNbRy+7j7Z
         tP6cG2XsJ+3WzukJ8hMH7BQ8o6KiB/l62bseDIcmJeh4/ib48KCGbXX/m8Slw5QaZUqF
         cfyrdELMLe+CyHtnnErRjzlO6D7lqadRjJ5RYq65NOHB/OxJVTsGL9eOgGtVqG9HeKsC
         QU1A==
X-Gm-Message-State: AOJu0Yxru8c/ATQ+eXaB4+Ki5VvsM2cCqv2t/ky+6P4YGbsltuNmJVAF
	RI4diQzPzWS2996oWtKEJloqSeYyowqvLHhyx3GmajylkZIEYYSn1TvbnBeMJpI=
X-Gm-Gg: ASbGnctybr+C6l1r3rq9bHlw/2W7kc9HgSKQYNI2QERbEOGUaMMSZe/NHJzFHQgi7Ls
	3tMq8UDqgOMyJEF7zPGKG9YScuPbXrTH/63Yerh9IRLmfJQHY5Me9CkpiFKOycCrFcVr3Hk+P1L
	fnkte9KNyyjtpqvd1K1wJLCLex9Dsz1QG/9op6nWVY1MgkWFTbJoMsxrr69Ak3J29NF6GCtmSmT
	JX18/PxKO6McGmz8cC/OO4M6Gk9q5QsabdLNKclPlXcXj4fgXACJ5ICYypmdTnUd+4dIvhyr9TI
	v/maJn9dKR9Q4nfaVAl4AhiJ10TvFjeM9l86mQ==
X-Google-Smtp-Source: AGHT+IEyO+pOoooRK1MJcB/8n33lDt41igc9CoHPeMN6l7YmetTQHKaesiQ3k6PELQy53AGUVzMlMQ==
X-Received: by 2002:a05:6000:381:b0:391:2932:e67b with SMTP id ffacd0b85a97d-39d0de2deeemr8085655f8f.35.1744009700171;
        Mon, 07 Apr 2025 00:08:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm124328775e9.23.2025.04.07.00.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:08:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:08:15 +0200
Subject: [PATCH 2/2] regulator: don't compare raw GPIO descriptor pointers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiod-is-equal-v1-2-7d85f568ae6e@linaro.org>
References: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
In-Reply-To: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=950;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=DBshOKP0EN1ecc3DJA4CfRCDHgl/oC7Qh21dz3WI2GU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83nhfO/wkXQg6EzddBwCshuASuJdrqRh3Jw8B
 Weg8d0xHQ+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N54QAKCRARpy6gFHHX
 ckeRD/sF3GS3tKZAAnpXvUky4UTm0ygiK1VUFUDuBtGqaUH+fcqUDJUmWjOPCH240DtGj7v0zct
 LZCyeUMmfy9P+Hxg+z/CVUq/7t1AwytB7xt8JwcN2rdnZ53ffb2MFs8K6ipSc7chj2PPo6AM8tP
 /AHRaESyhxUGOf2llIoI2ZQnOEY0wG33zJoLL+bc7jGUrTrJul0szXdvmB9aGV3TZxQZA1ThBE3
 qgl7NSb2/DgmxQbykSZEc0urTn7bA3EW6BgySkQ5gUHzQszMh3uGBlN7+nQqOpDr3u0XS7dON81
 XYkVwGOvCKiIdmTn8bd5vXtefQcnrSvo29wB3Fm+Q2oruo1Tq0KCX7vxNXSFacPl0y90e/J0kkH
 lJLyxwtcZy4R2sme+wguC9x/3FQqc+AEzxf18YQlTJr8wVH6ZyqASo8A72A7ICbpnL+oqIqlXkn
 4FW+CajNZC/Mypjf99i4Xc3zQ1GtV/lVe0Xsd4fyVDJqnFrO8jP+2+jOF9hSFRnIUKGWox5Qsgy
 RIDIf6p9itvXCxdW4bSjOwomkq8Yc8CGwKo9OFnZIm1U5LYQX4/J5WBrsMiyZ0eXQxy2xh/KRei
 EINSWazoLzBv40gfA07wuBdN6Ppni+lKZHaeiAj9RGGL9+dJOl3ILbJ2GbLBZqEXw3TDs0voaCk
 Y4f3uMS3Q+eXpSg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no API contract saying that two GPIO descriptor pointers
obtained with a call to gpiod_get() (or one of the variants), that refer
to the same physical GPIO pin, always point to the same structure. Use
the dedicated comparator function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/regulator/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 90629a756693..7a248dc8d2e2 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2617,7 +2617,7 @@ static int regulator_ena_gpio_request(struct regulator_dev *rdev,
 	mutex_lock(&regulator_list_mutex);
 
 	list_for_each_entry(pin, &regulator_ena_gpio_list, list) {
-		if (pin->gpiod == gpiod) {
+		if (gpiod_is_equal(pin->gpiod, gpiod)) {
 			rdev_dbg(rdev, "GPIO is already used\n");
 			goto update_ena_gpio_to_rdev;
 		}

-- 
2.45.2


