Return-Path: <linux-gpio+bounces-24048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ECFB1CCAE
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 21:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B20D56445E
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 19:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DCF2BE057;
	Wed,  6 Aug 2025 19:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSZuhiU7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED40228FFCF;
	Wed,  6 Aug 2025 19:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510166; cv=none; b=d3kCFst/EAiYfgllEV7IbJO/8qwdTTaJhGCbC86cHXHIEK+R+PHI7leDR9JsuJB5zRtyuy4Nni+cVQ3WaFLaUQXa2sXAQApSOusSn5dDxctGAOEY/n8M4LdLjx1JOH4iS2V5HI0Rh+bUJKWtx49SBolMm3AFyUghTNLuepkp+RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510166; c=relaxed/simple;
	bh=S/mlqYI6Z+Ktx+7BpCUgghvToM7zkdlgWwhDz8LJjpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hl3m9/ayem9JyIHFIlZlTNnPEDAnyG07wSU68wBjD4GKpHYlEniHxwt/5WtUAcR5Kkx4dU6upWfXZlFvC8ox4BRm9DBjSqjXMzBQV1Ryzr5YoKaf7LoWXUgQ7nUN+vQBnS0jzqlVB1j/CzyEzKBixc3P9GQulLV/wOxV7xiGkRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSZuhiU7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso136541f8f.3;
        Wed, 06 Aug 2025 12:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754510163; x=1755114963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lndzTJloZWmoSCegsNaxjR93LRGyn1RiWsLmsfASAy0=;
        b=YSZuhiU7mAOixrrfweoDJ9uZfAJJ7LoLoo684z+c32q5LBy8J7Hy9np6qtyijqfQIN
         nKAbBzt9Y210gNrdpL8IPA14i7hsMQqAYYB9tbXsOBi5OK+B02QRK6a40YiYrX/STaAa
         jQfK9OTjBLiQMoPmiJO771/2WLGzOX090EVGR2SWJN7ckksTwIQIn/n9rr2bnHblA7Bo
         pi+LA8YGlcBLnR+2Ov2Fb0aHlTcghll4+uHOhxgYLR34B+j/59GIHeYQM2PdlXkUtXM8
         FlBymBrSL+RUu7isCl6qj1mHVaJoYNh3VqYigyJiZIO9LnbP/TQQBmH21v2MIuM1/D6n
         NfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510163; x=1755114963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lndzTJloZWmoSCegsNaxjR93LRGyn1RiWsLmsfASAy0=;
        b=wk60sb2fPWNYb/9tGb4XFCpv3/3jwUoAXuDwOgbncgcXk8xjbUt/oXm495E0aSMciy
         16W9w9C9fUhH7qpoIA1JY4RYVvz6ZTlh4gh+Lo4oYZHTEY2DUHfFW/CXtdPw4DP85AMw
         kl9XgboNJAAaIWfF7jI+ng8fUXdLDqFHnBd2oTaCZY3zTVilAaJ91o8XiZZ+j7NM+1AE
         mWd++6uME6FZCJK21nzzLfm3ldBNGRzeaLwKIowYklGiVA+L76ZWYPrpqkynBYC0AGHY
         j1f2QnlmJPsjoTDLYTSb17CKX7d/2n8+2E5uW72HkHfZhJrsgsQVCZcxsNfDhVe2rXpF
         nGRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUokqnerdxs/qkeE6s3KJIxBALlUmpAaLOCDDjcWTcqbKXwwc43xfQyZtNtO/OxOAX2xHYR6z4qLSIts0uM@vger.kernel.org, AJvYcCXlqteQKG0Yz4oYb1MSMWobRk1GJ1zg41lTjJVNhA6CdrX4Ja52ifIK+u8n1hOEXK4Q1ZePo4qtrl1N@vger.kernel.org
X-Gm-Message-State: AOJu0YwIRU0DeFXFDnFRb5SHvDEPbKA+WsBIBrHMDAbhcPFa6G988Jg8
	5wqc8QjPb0AsBczUeDSSf5CH7SIukZtajQ0+xRWMm4flINlkwxwifgIp
X-Gm-Gg: ASbGncun9IDCTI51FEsT4T4tN6jmBAqmbeCrWeYpSffTimXLZEyQKasFatEzCOKsIYU
	2OzizT1Q+6EBuoOAjmH6uuWPqc4n6NzY3Tffm4ThW1gB9Z24lumRob37GGcGCQ3OEd7nosS3pYk
	2032wE3mEW5evdMnMOcEEEIzlrZFQ8qVfhqsD9uRXeMT7QwFSPjTCVVQMl2trSpOuDZYidPOwkZ
	yLIpxfc6/TP1deCqm1zVJ1JL9WU7skvUFN265nCdhMGEiZ49XTzHFviNPodLbp3yO9udyf3dh/8
	aMgRpluQn7cjfNVmGLE8o9BtGrpnZs5dQHTn/Z5x84YpIV7BolSgU1x4pFZMCDjueKYX+JfsLLm
	cAMORHsrSM83q4yQEr8QheLxYehhlWwbIJkndsqWjUHBnRbGzhXD+Fj51CWZZ+AqzoF3aD8hwDR
	Fp7M38hC7w
X-Google-Smtp-Source: AGHT+IEX590HnhLVNn8sJz7rYvsqxMwUFZmJKhNpOCuZQaS/yep2ndnCdPtGV2ZWD9Ct01VEgQ7OyA==
X-Received: by 2002:a5d:64e7:0:b0:3b7:8473:31c3 with SMTP id ffacd0b85a97d-3b8f4160b81mr3419751f8f.9.1754510163037;
        Wed, 06 Aug 2025 12:56:03 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bf93dsm24137782f8f.27.2025.08.06.12.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 12:56:02 -0700 (PDT)
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
Subject: [PATCH v3 1/7] pinctrl: renesas: rzg2l: Fix invalid unsigned return in rzg3s_oen_read()
Date: Wed,  6 Aug 2025 20:55:49 +0100
Message-ID: <20250806195555.1372317-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250806195555.1372317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

rzg3s_oen_read() returns a u32 value, but previously propagated a negative
error code from rzg3s_pin_to_oen_bit(), resulting in an unintended large
positive value due to unsigned conversion. This caused incorrect
output-enable reporting for certain pins.

Without this patch, pins P1_0-P1_4 and P7_0-P7_4 are incorrectly reported
as "output enabled" in the pinconf-pins debugfs file. With this fix, only
P1_0-P1_1 and P7_0-P7_1 are shown as "output enabled", which matches the
hardware manual.

Fix this by returning 0 when the OEN bit lookup fails, treating the pin
as output-disabled by default.

Fixes: a9024a323af2 ("pinctrl: renesas: rzg2l: Clean up and refactor OEN read/write functions")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
- Added Reviewed-by tag from Geert.

v1->v2:
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 2a10ae0bf5bd..af4a40ca0a98 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1124,7 +1124,7 @@ static u32 rzg3s_oen_read(struct rzg2l_pinctrl *pctrl, unsigned int _pin)
 
 	bit = rzg3s_pin_to_oen_bit(pctrl, _pin);
 	if (bit < 0)
-		return bit;
+		return 0;
 
 	return !(readb(pctrl->base + ETH_MODE) & BIT(bit));
 }
-- 
2.50.1


