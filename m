Return-Path: <linux-gpio+bounces-24051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4220DB1CCB7
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 21:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02D937B0922
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 19:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0E92BE7DF;
	Wed,  6 Aug 2025 19:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="msRzrxYy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08762BD025;
	Wed,  6 Aug 2025 19:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510169; cv=none; b=cFkD++vfxypUetCJOzhvkGTGloAeFiYSiytOmkNb/8BRMGvSwV86gpBSYcwxyWSbcS+2OUn+ATQZzcA8SKreFy2PxkN+qGnDphOy6OerZtT6213n50A0diYr20dn2s6ce7Dg5v94rAnho9Qx3DxMu5WwRa66o2lkALCqOMHywhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510169; c=relaxed/simple;
	bh=qR0f7+2myZroc5aHe2DgoF1ejM6cM8ke1Op+t79yHwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GYLFI+3fOibm5GZW5hcf+G5q1803twhJ288sgaYxbVKlCJxY/9Y3yQl5yMGP7ficapOvHRhr80J1pr15UHZBibmOiTc7NmFLZDNT8j3ZzmsJJy2recBrQ2AO/sJ+SFvyvUr/iMq6lePMozibCFOL0n2leKQyQ7AA9PdlHBEbg1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=msRzrxYy; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b8de6f7556so126532f8f.1;
        Wed, 06 Aug 2025 12:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754510166; x=1755114966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhsqaL/YWAGfuyflKkkBsgoLyQTs69o869Pw+hMnTTI=;
        b=msRzrxYy4VJYdOOwfeYWXB3XlF6n+UD5S5BVGbhdFT+vX9U5mf5DuWbkTV0fr5qttB
         ld9zxRvyh4NoWkNjXvSqAR51lEqYPLVEu2z9A6GRbrG6Ld+9R9SC+X7dN1CeR+tSK64t
         6oDBJS57SE610Oa2rEjSIike60g0mDbn0YXF9jnckMZQ7Q+my6GhnhOB9BPV/2l7b0+M
         zN3ZmqQlqd2EVmFAYoEoN7wWoB66+6j+BGx2oB8IdsiVE4V1CbqnaevDP4+IXOTHZeDC
         RAw0+3QHG+oc1FnVPS5JoUcD7IP6/nI1h2aGOQV9yqulc8lmzLq6GEi2i7IJRNV7HgZK
         quQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510166; x=1755114966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhsqaL/YWAGfuyflKkkBsgoLyQTs69o869Pw+hMnTTI=;
        b=uajbzwdAD0EpD/lhO67jBRcJMHrhDj7Rl5rzoIHR6ZAYy+RjsAFpLDrvGuB25fE6XO
         1oEZcw+BZ6MR0y9htQSKl71GiIL971bfLER8rBnHkk2hijgIgG9jI7WZPFno6NJUJJLH
         AXzZ/5slRsU27aiV8dJCr94jQmw+882HU5+RrVT1aPHCZsLX/1YHdbgn9UYwV7b1blsm
         4w9iufCxunllscEX5S3ROD7q52BC46644yXL1zgwvnYnnMqKL4s9R+YYlXI5+OG5WqHZ
         tWy/jU6iA9JirH0Zr3voN88HToh9uvFTMgC6KjHiWAF7ZWkGJo8Q52Udiz8LHYnGdMGH
         czjg==
X-Forwarded-Encrypted: i=1; AJvYcCX8x+MQaPOrlVi3nidCSW25yDjEXmBwxHNGohLo7I04cc9bXx4L111CVtRhoi+eo6b+N2SVSQu/5OCU6sqC@vger.kernel.org, AJvYcCXNuZZ++97gUjUy03Z1Yy9Q6VD65Jg0se3SwmzrbeXJoUwevH3MmzuQFdAF+/l5Ph/P9fjSAfjlcogr@vger.kernel.org
X-Gm-Message-State: AOJu0YwZgHX+hvt3Uk/f3blDIPMUHcsROIjSn+qVIFyob7FLg7wjLt2O
	d2TXXnK2yRza1YgCWTVBiP8slqMnQoEqwUcP6gQrvBP1g9Y4qTV+xZx4pEm9Nw==
X-Gm-Gg: ASbGncsqdHKD+mB0x+f9amrEW+eIIKVneTbxSvC7VPhyzGQxkS8CpzeYqYUSiGgi1f6
	IRg/IADTWv473hQIIC34jf7ind8FydECy5HIMEx7YIjQptYyHdEK0Xf2ol6eRuJcCD3kmRzfr0F
	TpxX9qboWm6DI1SjHjRwNKkPCCFUrkpzO4AlE5+bhviTl3tOnnER6w5QmqDEWK6PSlH9j6EFm4l
	yDAn2ZJJbqOuhkHDCllzrbSzPwP53D9AJc6nW3KhHFuh5icqxy6D1gvOIxMhjBozw+gN2Hh1NX/
	AkCL5Mh6m7274TCjzEiXPGy3fZq/9O01b49Va0BZB4yshO3Zs4ZhBAN/DeO3C6fQqgrOhAzRGrX
	6RR2K/upi8b2EbKhiJxQPweXmPzgyFc3inzQXZsa0ptBCiJPkFFBXZb41T2kxIryq6PVpiCwQPY
	6aHkObm1Dw
X-Google-Smtp-Source: AGHT+IEBtkMAyVnsCiHUJEO+DrLOrj4CHp1OP3CwGtKnlXAkii8yYhy0V5y0iFKGJdk+LxZDzG6n8w==
X-Received: by 2002:a05:6000:250a:b0:3b7:9af4:9c75 with SMTP id ffacd0b85a97d-3b8f41d483emr2806655f8f.30.1754510165950;
        Wed, 06 Aug 2025 12:56:05 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3bf93dsm24137782f8f.27.2025.08.06.12.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 12:56:05 -0700 (PDT)
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
Subject: [PATCH v3 4/7] pinctrl: renesas: rzg2l: Remove OEN ops for RZ/G3E
Date: Wed,  6 Aug 2025 20:55:52 +0100
Message-ID: <20250806195555.1372317-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The RZ/G3E pin controller does not advertise PIN_CFG_OEN capability, so
there is no valid mapping for output-enable bits on this SoC. Remove the
oen_read and oen_write callbacks from the RZ/G3E driver data to defer
OEN support until PIN_CFG_OEN support is added.

This is a preparatory change for future unification of OEN handling across
the driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
- Added Reviewed-by tag from Geert.

v1->v2:
- New patch
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index cac7f2814376..491cf5582b6c 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3344,8 +3344,6 @@ static struct rzg2l_pinctrl_data r9a09g047_data = {
 #endif
 	.pwpr_pfc_lock_unlock = &rzv2h_pwpr_pfc_lock_unlock,
 	.pmc_writeb = &rzv2h_pmc_writeb,
-	.oen_read = &rzv2h_oen_read,
-	.oen_write = &rzv2h_oen_write,
 	.hw_to_bias_param = &rzv2h_hw_to_bias_param,
 	.bias_param_to_hw = &rzv2h_bias_param_to_hw,
 };
-- 
2.50.1


