Return-Path: <linux-gpio+bounces-11456-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D87659A0F23
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 17:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E5C21F21E39
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 15:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB23820F5B1;
	Wed, 16 Oct 2024 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLjCybD8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000841384B3;
	Wed, 16 Oct 2024 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094220; cv=none; b=kuIs4Vilvi4HDOvm4W1qg9XO/8uhslSRUMqWGHnFCWxbld6IR06rFkHMcgEIub4m7ZlhVESGNq7EGxmePvOJ8jGf+tzFJBt+dCcxVEn41V2fi9adxZrzNt0FgzLWMyJuP+SCVnevynDl89kMoiwEQHxsD3Q5iryjPx7R5sLq9A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094220; c=relaxed/simple;
	bh=s0zuWFZqrA1xNhiWqkN1RpOJaujmruNB3zL8OEcD4YY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WqsBZnTVme9sxpV1TG3CMV0+vWmJaoOXP9t+ZW8BAJYnXzW0flTGMDlQVUxaKoJBCOpEXuzw38GSaLtxXhkEuA7qWyELieQvsa9cG4/23R0LK4khWoicgnqt2+fIfs/9BMjR6pBZN8aiBj5aGePK5sJ38g0ht0akeRlTtIsG5Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLjCybD8; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d462c91a9so4361551f8f.2;
        Wed, 16 Oct 2024 08:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729094217; x=1729699017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSV2gT6gYSM6is+LiuMw8VyGopCJDfUv1Rz7V5M5H8Q=;
        b=BLjCybD8Gh5RsXM3vUmo1o0wNhiP9LjFGv5xw2cEi/yOPUmu7+MVeFLYyqUnOAtW4r
         se/9zB0Jb362l1P2jPOt4BdMC/FV+phIR4Ztfl64m97e9cN6iy1ulYNSbqVc04OOVtBS
         J5fGLA9jzhfo1Gg7f6MKqdwyDyU8swJwp+HLdD/bV6ZpJdhebD7hpbIE336y00e4hFqb
         MNUhu+9yE0q0tKC46ied/ad6j+0zLzyj/YkV0eC/jfJ4SPgCGs8cAiO/THiecDdGqcJx
         WAuVejLkjWf+8dGEYp4RpfxTkp35TtT6/8yfZiaH21fNSP/mxaIaaOZw/19tawpZjKu1
         X9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729094217; x=1729699017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSV2gT6gYSM6is+LiuMw8VyGopCJDfUv1Rz7V5M5H8Q=;
        b=hanpqtjIR5HK0aWwKBLNueZptWsCKL4Nc9xohKEeWEe+dAxAI6aBOzKmmkqPUhe1Wc
         j98S8fX9sNE80uvp6am19CuCEPLEXRYdzWVk+c/Kok6/XYcMXsi+y98onlpsXu4LuNIr
         ZlDouS6VDhezkYu0wMUqQn6VB8UkpNIOAyYw5vh2iv2AZoICG9jQ65dvufoQlKO0Rygm
         hpUlGZjWLeau4RgvQzMsvk8ix5DegqpaBtV+KG9ikgE2cWmoOP/QSgdDYcZBfXtgnHS4
         Iiyhsfb9XQdYkHx4yJ1+ke65bst0sGLvtaKcODMqbVmY8+s6KOjh4wmYY3z+38Jow3Da
         VWiw==
X-Forwarded-Encrypted: i=1; AJvYcCW6oALDCIgN5dzenJsMIGLBjvlcXZen07jZ7Uu4qXWZ7/8HYcSYbcs5V5OqH79NhfbZRFHHxOCYq7nm@vger.kernel.org, AJvYcCXZzHY9Bsmowjr13FsjeIpJNqiwLjWVHK2TH9YlbO/WCxIP/HIvM6sBw8YZJpz7qVHj1O0B9/oekPwDrkXA@vger.kernel.org
X-Gm-Message-State: AOJu0YyCxtpxeHR32FtTtN50POe2Cqv36/dTIEEadIeE0KxG5WcpzmPH
	fxtfbm/TGYz/8r0++1SL/ZP8HCjG48z40QC6cVI6gbISAgM6JLoK891LnXOr
X-Google-Smtp-Source: AGHT+IHOR2UNT7/i2C2WfH9ZYqyeeZvzUE5Gft4JCEzBjsMC2BFhtrQ3WsW8dmMbkRpoEtmcH7dsMg==
X-Received: by 2002:a5d:48c4:0:b0:37c:d2f3:b3af with SMTP id ffacd0b85a97d-37d551847e0mr14768048f8f.5.1729094217047;
        Wed, 16 Oct 2024 08:56:57 -0700 (PDT)
Received: from localhost ([194.120.133.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf8567sm4661078f8f.76.2024.10.16.08.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 08:56:56 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] pinctrl: th1520: Fix potential null pointer dereference on func
Date: Wed, 16 Oct 2024 16:56:55 +0100
Message-Id: <20241016155655.334518-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The initialization of muxtype deferences pointer func before func
is sanity checked with a null pointer check, hence we have a null
pointer deference issue. Fix this by only deferencing func with
the assignment to muxtype after func has been null pointer checked.

Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 7474d8da32f9..e641bad6728c 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -803,11 +803,12 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
 {
 	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
 	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
-	enum th1520_muxtype muxtype = (uintptr_t)func->data;
+	enum th1520_muxtype muxtype;
 
 	if (!func)
 		return -EINVAL;
 
+	muxtype = (uintptr_t)func->data;
 	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
 				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
 				 muxtype);
-- 
2.39.5


