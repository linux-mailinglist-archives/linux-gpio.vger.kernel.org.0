Return-Path: <linux-gpio+bounces-16237-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E55DCA3C421
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 16:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AD827A848E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 15:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF231F4181;
	Wed, 19 Feb 2025 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rueq5XES"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925411E3DE5
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739980290; cv=none; b=QzVy+oWsnS3O4DXOCi/29I4DCuHigpt0PAy5xyTxbpISMpXuqDBYde4HDX9hHuatzgY5QOrxKiKOdKI+kklz9Yknf6rvWpuLZckrinEGfQNZgxfLwbkLvBEFZ+xLEm1pdXZEDKyRVqnfyjYSv3y4Nj4jIyNP7Pv8bcxsEGUZTsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739980290; c=relaxed/simple;
	bh=LiS4mnlWu2zof0Q0NXCLUaMP7qwyKNJ4WDvYNH34N2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OT1Uw1ZapGL2TMHOgmq9tTA8ogXasyuVFmEVusf4GISlJge9PvzMRjxKHgsBdV5+siIa3e0Br0NQ7he9gkdn7rSfhzvrqOJd4fSx7IGIcFH5gBvKBc0tA9Kyl7r4UHiGTEQxMFN6GtuGi2LceOXt6Htm9RD6ss6irdnf/KjNSEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rueq5XES; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2211cd4463cso74448515ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 07:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739980288; x=1740585088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=abXA5gn58gOqmxfZxf0dJZRdbphFcAQMJmB/EVciDU0=;
        b=Rueq5XES7N+aLTeYR/2FdH/B62CfpCts5IbPKw88f6E7pa8ntyzDX5kgClhcQWFc3O
         n3yIhLNxw15QJvy0QVkmCyBDxdHQyFRmsAe48ks19NVa1XNwZkUM0aovj2DHDUUBDJHe
         SX794CTwDOV8m1Yv3z8cMWFuGlUATkspPDY08aQOtlb+BZRQ69Z/zbIX0WVkZniBUH9X
         D7NGnWicvmSZCw+lfIUdlFKSeDrz2fPw3hGZc6L9Wl8AASWVZvOsKZCZbMPwbBk0jLNA
         InL3JhviE2DKIlbFqd12fN6nRcFUviO1X3Sbp23mtAqNylcHX2mVaHHsXnQTIUDByJSk
         qnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739980288; x=1740585088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abXA5gn58gOqmxfZxf0dJZRdbphFcAQMJmB/EVciDU0=;
        b=kA0G81s3oHffhBMQ9KUG46VQ1JBlKfi2OznfY4LsX0/Z3ffY3JtG/4pV0R8JyAMLZu
         M2s0UWB/VZ2TWpUAjHJ/1+ieAUyEvl4m3YyOGX5BeXs6uYriTWa2zVwgvzWUbn7Q90Bk
         /HAX9mr5vprzN9dCyeeTcysUshBrXiemk2rC4NYTCLBKHkAiH4J53ZfM3PZAiA/RCUHk
         2BXrJQmRXM3BaD7SSApzgFt4tp3/D+c+UibasIOdyI9Pn9I+9RUDGgXOk7mV9L7NHiwz
         uAyG0WtCiJspLwG7ied1BD4U9nIaJ7lvKkhIA3vq1F6+ax9bFPnVgzNvkgW8ndJ37uUi
         A+Mw==
X-Gm-Message-State: AOJu0Yz8KUItEUa+6RPwKUDx+4k9BJF5GKzsISFKNxldK6H0bcFNFBVu
	VZ/Q9tMGuBhAj9iF+4+6aW8Io/Huv5d7JEW+WtV6za8WmmHXK2Umxrq4vg==
X-Gm-Gg: ASbGncvNnJ7S9Tu8pM41NK3cIvCWvsKsFDLXRkDBmFnPJt8gCMgkF7RdpYaZHmnlrRo
	VBLeyi7BPokOwwEW9Vgcvc6u0Z6o3w2ND/di6qIxVaLiyE51MGF0GO8YB/KPQycy8woAKAiuA5T
	QdvKBep/jZmIPTx6OjSDTIEs9JZvnzGgRzKMMBeaTy3uy4bxjTxjtRgta+iA3wolAE3IcYr5BNi
	i5JYmNURT7+Fof0PQ9x7NJPgA5BLUr9gafAsWZZaz4ZtVRGh5N/xfGSaEwXpddcDg/8DLtFTlv4
	w6eMlT2RmrEBbSjkQ3Lu99hPSk+9U+LM6gBDR+v85wtuD7Q2RSTR82Z9tFYyxux05pXthyhEyiU
	PrqNQs8H3
X-Google-Smtp-Source: AGHT+IG1HWjTJj5nsDR71+tKJ73MQa5ejvdVlEjAf2V+wAq3hP6eGjtpWqAgl/TPtlGfTZP30/8xlQ==
X-Received: by 2002:a17:902:ef49:b0:220:fe51:1aab with SMTP id d9443c01a7336-221040b1359mr343667515ad.38.1739980288378;
        Wed, 19 Feb 2025 07:51:28 -0800 (PST)
Received: from test-suraj.qjz2hk5f2gku1a3adsvczrat5c.xx.internal.cloudapp.net ([20.9.134.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5348f12sm107449225ad.46.2025.02.19.07.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 07:51:28 -0800 (PST)
From: Suraj Patil <surajpatil522@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Suraj Patil <surajpatil522@gmail.com>
Subject: [PATCH] gpio: max732x: Remove deprecated irq_base assignment
Date: Wed, 19 Feb 2025 15:51:18 +0000
Message-ID: <20250219155118.161718-1-surajpatil522@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Suraj Patil <surajpatil522@gmail.com>
---
 drivers/gpio/gpio-max732x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 49d362907bc7..bc30cb57e222 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -525,7 +525,7 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 		girq->default_type = IRQ_TYPE_NONE;
 		girq->handler = handle_simple_irq;
 		girq->threaded = true;
-		girq->first = irq_base; /* FIXME: get rid of this */
+		/* FIXME: get rid of this */
 	}
 
 	return 0;
-- 
2.43.0


