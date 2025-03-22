Return-Path: <linux-gpio+bounces-17881-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 772D6A6CC6B
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 21:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02CBD170863
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 20:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BC7224236;
	Sat, 22 Mar 2025 20:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aUzx5zG9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14255175A5
	for <linux-gpio@vger.kernel.org>; Sat, 22 Mar 2025 20:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742676076; cv=none; b=ZK8Wv5zyR7PKv+VPtv5qdJnbhJQRIOxbF/qX+TCEpUAvOQa2lAyD+r8OsYiMQJyybNLdvIpACIgdjbn5cFTFNZPrqXV+lu629w1c7p11l6qSTnz/WVew+rXHp+3yoGPWnNqIVRmo4dh4GdUKQvkLzMzShX8PyNkXx+iU1S1xKJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742676076; c=relaxed/simple;
	bh=LwBJYMsJYUktbRQ6otngx8bzqBlb0ojubWE1QXX0KHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Lkp2j0MH9aY4ZL5KYj4GXYsZ3wvYkXjVPzRECPxuLWCy1jpuIfjiNatZr8WfzIlMITvdNt8cos0iLsAtmKCo6MnOMK/eZgOGiCuK/ngAQQOhFic8Ni1Wiy9GELkTWEGNdNVtYaDESH1/qYin+m6o0EhAvTljxouXGp0icbPSe7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aUzx5zG9; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bef9b04adso33477751fa.1
        for <linux-gpio@vger.kernel.org>; Sat, 22 Mar 2025 13:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742676072; x=1743280872; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FUewnhPveYbMp0RQIUPWHuOlIZ+ySSlnCxxoPsJrsKM=;
        b=aUzx5zG9Kft8MFTzZZjNyEQajFv02ibcNg8LmFQvNvLcTqczgwvn7aYZA+iC0znBzB
         1vWHCmhbMKRk3eRVvmfSgEDsjjgOrD2OkOhhhsA1Kt4ShrAV1kX/boyzgKRFwU7BJuTy
         ULJvDmbKMRamrCUUHI3yfoatSlbXAKBhwmE1ntola6EXYrzT2L79YPOfBor14ubmhubc
         tv4s+/SEsGHq8C0LPo9uXmR6Y4jNiy3tj/KGG1Jbg1pIobGwxy+y/lsuWVqW2Baxkqkx
         7XcwUQ8e7xESvu+Ki/18SO8dXRQGvaa0cVshDqrmFlpoM1WVnJf2emZjRuVh8ZuQ9S71
         R9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742676072; x=1743280872;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUewnhPveYbMp0RQIUPWHuOlIZ+ySSlnCxxoPsJrsKM=;
        b=OR9JQqS/n0baK1RukyJqqD49v2HahR5m4zotXWIWTeTAXkXKgKv7AkkuGDPQqMU97H
         eI85rKIF8eTP48Fk3iAOKAptftn2X18k1bhzF4URmlMPXGzoo+2XwGYJ4Vc7DBXvlI7o
         icVlrKo6G/2KFAg8j4uVMg/ArNyK3K7uOcW2L1wqKYaQdujiQSC96e5XR+lJCPtC7Ll5
         TuybjSkZe6sIUaM9F4fgbZHykRZ8jBZA+Grf2uHn7FE5J/9ESCQr5pE1BO+6UIIDoUxM
         wb/bWAc+zyRqy+sXLbb/kjgbIO9Q/lwMv0dbVX6a8oP8zK7UhEGV+xo2zyJpldLpMMeq
         Z8MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfhEal2E874fxCmU9cdm/JzdQ13/gJEq6C5Mk/Av7xeHW5pvCR0QcSRVwzd9FcurfWZ7fzrg9xqdM+@vger.kernel.org
X-Gm-Message-State: AOJu0YwgEGgtJFDWYAhLmo/5pHsFtoY79yZ47UrGEOSZXzzJttgvYmHH
	xw3rnkLlvLIvbQr5NX3m1HXk7syxUJsDCLo3ptwtgSp6qTAMZmPnqNVYyKswlJ0=
X-Gm-Gg: ASbGncu9MDxn7xGhmGnOf6BB3FNbbYKALJd/LdROab/ssobKBupm4o9QBVn0D86st7k
	UhYN0NY4EiDXQBFHO80aOhUHGh3rVGSV9yi34yLxtmbUNhSvNNm3p2SE0Mq8HkGrNi/ThkDZt7d
	02JHCP2T8BVsXg7Net0BaLy8DA0WdYv5nSb28sQ31g5YFPsWmXxw9LLFmePK+QR7jKjXpfQz66L
	2YSFzREsObRR77XmdEiM1TnQZculLy64VO6GQuBPP3HiM1CgFGc7OOV0rPOVXuIb8KZ22/t4qTm
	uvI5T6eyy+p7NmtRnck3wy2J4PzyUXQaTVhTS82LEBIFnGVVz1iMl8M=
X-Google-Smtp-Source: AGHT+IFWulKmrt/Fawx5d9lDfj0JEWXAuETvklOC2nGphGq7Aqxzo72C0qq9xY5yapTClxN+c+1eWg==
X-Received: by 2002:a05:651c:150a:b0:30b:c96a:775 with SMTP id 38308e7fff4ca-30d7e2225bamr26429521fa.14.1742676072078;
        Sat, 22 Mar 2025 13:41:12 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7c1ab2sm6849771fa.11.2025.03.22.13.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 13:41:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 Mar 2025 21:41:07 +0100
Subject: [PATCH] pinctrl: amlogic-a4: Drop surplus semicolon
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250322-fix-amlogic-a4-v1-1-bd5ccf9ca1bb@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGIg32cC/x2MQQqAIBAAvyJ7bsE299JXooPYZgtloRBB+Pek4
 8DMvFAkqxQYzQtZbi16pgZ9ZyBsPkVBXRoDWWI7EOGqD/pjP6MG9A6ZvWXpnaWFoUVXlmb8w2m
 u9QPddXKRYAAAAA==
X-Change-ID: 20250322-fix-amlogic-a4-55a05e1402d5
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

The kernel bots complain about untidy code found using
coccinelle, fix it up.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503212354.Hx2qaDRe-lkp@intel.com/
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index 35d5540b8eaa2378197d7791ef2470ca6591f693..ee7bbc72f9b36c0c6d5bec76780711f9db3c155d 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -856,7 +856,7 @@ static void init_bank_register_bit(struct aml_pinctrl *info,
 				break;
 			}
 		}
-	};
+	}
 
 	if (def_offs) {
 		for (i = 0; i < AML_NUM_REG; i++) {

---
base-commit: 693c9ecd832669c55e8d8067eba064440d9a4709
change-id: 20250322-fix-amlogic-a4-55a05e1402d5

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


