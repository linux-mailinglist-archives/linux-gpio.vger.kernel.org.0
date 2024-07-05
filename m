Return-Path: <linux-gpio+bounces-8056-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A6492804B
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 04:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C53C284018
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 02:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7CD41C93;
	Fri,  5 Jul 2024 02:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntimj0Ai"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D8F49632
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jul 2024 02:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720145862; cv=none; b=lXTzJi9hG0w9u+/0zeAg8I5Ws6yVDCHyglQ3cR701O5PjiwR28FQVRU2GLQUfrRjk3TUC5x8EXqIAPQhLgPgbzYzgEebv3c/yQ0lMdFuqYmErm4TZuDWJfy4cNtoNrvkR79zpsW/6jRy/LfEu/eZgUiN2bRi6nSwq+F5i+TMAIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720145862; c=relaxed/simple;
	bh=O6zGnu8+G258cbZUELfeQT8SFTGrnn0/650oCYATsSU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IvHwP6cszOPvUq6JqiaucxJGyELFgjxDpc0yamgizTm0eNS2SNUZDiv/iy7LwrAxiINaiZy0bqVCdKQQc1AA4whh/evVzHtCNDyPxN/Q2oxkGlxSv2awtrjPYNAb8nWibjAdT0FgMSqbpU4r7MNHvNE4eFGkjsPaKH+bva+/HU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntimj0Ai; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-75ee39f1ffbso756246a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2024 19:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720145860; x=1720750660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/H81/vnGlj02uvWLHxrqfAY2uzznqwKfIpChpXaBmTI=;
        b=ntimj0Ai6CzIWSUTR72RlSycKNryZdxUHfZYSmxgzTRqMoG/EcBcKzC6WBXazmnw4W
         Eo/LkCdvo7RoP04WkNOvhO67xN5YkXO4B3+R0S55TSf8nzs663fk5z38flU40MV9h2uH
         LDQfRm+tOU8VfKC3ysr2kFgrdN3j8019r1BVfK6VgdRLq+ruieV6SUqy9bau5uGxZf8Y
         J8C7HSIXt0qEkIS1dt8uzvPY6v7f2KTE50fPzsNtKfmuma16J/rWyyrnCxMWmwL+K63g
         oY5S5HPwBLyvoTZrUbXFOOBJK3K91LfVSWRiJxoLrPbxLpHmhxXKQckPa/DupoaAU92A
         +c2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720145860; x=1720750660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/H81/vnGlj02uvWLHxrqfAY2uzznqwKfIpChpXaBmTI=;
        b=SQ/cR7StCKmwp63aIOfl/OZe8nCsDN5fCHA+u6dReEsO7WNx6Lw26MZVYOFkdKHgR9
         yNMFo/qo1vClyhmhj+sOjyQWF2M4CqbHnRrZ1/QoM2OaokIbhaAjeBfigCSf6XxUeLzR
         Z4jyhkqEonbaRmde4JU9/S55hScDzmMDDZg214AYqHMfSeoGz2lthKQ8B1jIzMEzLan4
         jpaDIQvQPpbr+otv+XYpTsWAERLs/ZUm04ReYMCnG839VwkPXJQc1SiCjnaDMnm6Tt3o
         unoFrFVEk9P6PLml506Hem4pl9Jpk85b9CtPEQ7iw7boNpZ61lE0ZeSkHqR1J/8iPd+/
         tcAg==
X-Gm-Message-State: AOJu0YzmuOgJBDSd0q/ZCcq58tNT1dZc11qBNHWrbe90XG0hgWLJ2r3Q
	CwB1jeLBd5okEKnyZG7DbfjWat5oW+GJ3FaMdrLFD/E3G8xOGjtWcpmfSw==
X-Google-Smtp-Source: AGHT+IGI4qhPuH2czX2pgybQXsBC3moYROEui7ggLGIiBX4iStQEPHnYrmJ0fqQt6PiTrQfCBYx1oA==
X-Received: by 2002:a05:6a20:2450:b0:1be:c63d:302b with SMTP id adf61e73a8af0-1c0cc73e621mr4057903637.21.1720145859843;
        Thu, 04 Jul 2024 19:17:39 -0700 (PDT)
Received: from rigel.home.arpa ([118.209.204.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99aa6220dsm2222964a91.38.2024.07.04.19.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 19:17:39 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH] bindings: python: correct spelling of repetitions
Date: Fri,  5 Jul 2024 10:17:31 +0800
Message-Id: <20240705021731.43143-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In another one of those spelling quirks, 'repetitions', which is
indicative of something being repeated, is not a direct extension of
'repeat'.

Correct the spelling of 'repetitions'.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/python/gpiod/chip.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 19c62cd..47bda11 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -252,7 +252,7 @@ class Chip:
 
         line_cfg = _ext.LineConfig()
 
-        # Sanitize lines - don't allow offset repeatitions or offset-name conflicts.
+        # Sanitize lines - don't allow offset repetitions or offset-name conflicts.
         for offset, count in Counter(
             [
                 self.line_offset_from_id(line)
-- 
2.39.2


