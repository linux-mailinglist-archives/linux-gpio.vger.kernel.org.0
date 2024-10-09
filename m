Return-Path: <linux-gpio+bounces-11080-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF09995CDD
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 03:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DC73287189
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 01:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178ED2746B;
	Wed,  9 Oct 2024 01:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="eOQXGq2Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0FA1CD2B
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 01:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728436663; cv=none; b=JRqgixmzKfpycSg8Z/gDxn1jAk2ZGDfwwH9+ll5qiGcg4cByV69gAF0gyb2gt38qAlHPc+tZLv3nLHiCOfftUpO6UyZxGOxuGUOIfiwmcZAkac2VosWnM/GWPUUkpU5XpDQznv5RAOH+9KKv4RKMLMtCHTEjGjbuYlLoOlYh2ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728436663; c=relaxed/simple;
	bh=1mJpiNVP/4OrjcFTAp0TvKU8K5r9YHdExKD16255m4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VV7VhFp0D9+iKK91oqHsfCRReiQe4MRgyQf64ZMi/7HL7g6zyH3rvUKCGpyqrSBb3nkRhWN23aQyr99J4JtIvK+OGNeSD1e2vboN/xC+5+59m4zk82PALE2UxB4/7bzQiKWw0a7vKdBbQu+5CrSKHUIIVuzj1UhWwFP5BhGo8X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=eOQXGq2Q; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e077a4b8c0so277130a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 18:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728436662; x=1729041462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2dcGg6sikxvnM8Tn6Zg71r8Ca2eyP6yTGUfifpMwTY=;
        b=eOQXGq2QJ2iHr1jNBSfI/Q0VwfCSWUHvG2RfC/p9KtCQ8HOjOlcWJjI8gYiaDNiqBn
         fQ6QYz82bTZDGJ10B0uU3JL/Zw67DTRT4DABHUKBQuDJo+exQvQWefzOmesGX2LILOTq
         HhcKpgfTqeeNESvKt0G09WZki+FMe7ROW9TgLpgnxZOrDJiQA8CTip31wokCPyYCnffA
         yVsCGiuAh6dPll1CPa8sdkKxKVdolLQv5wZDYTUDiAZO5wdGXjlen57yCHAlrCQP4grm
         vp+OjOTUAt+VWgcmPzkkNYiJd5i3/55fjN7cJsWc/l9Bn71LpqUjbeVNRlzs2MY/qz3Z
         vZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728436662; x=1729041462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2dcGg6sikxvnM8Tn6Zg71r8Ca2eyP6yTGUfifpMwTY=;
        b=nRIt7y7NfTwUWpV+EMNvRj3FzdgvsQN4+1+cNedlru3DiYkVKFsjZ8m5aeWsdQdRkU
         yy3odDHb+qw+vpDM3o4GmCjfm4l6KP9fjQAhF+BcnkrL5akhrcGpFE6efe2O76iLdYX8
         7EEaaWx4rQbk/2JrXM9ws7dWlJmlQ7zfY4DtVejowOxPU8rwAzTwpWmraulHY7VWQdjD
         ROUDf1myynXuQSN3ReulVqGYwbXUKEp1UFu7FUC2cmiHj33lo/qaeZ3mNS4MKpWfK7jK
         4j6PzT9Nr8+C5lA1Iizf44m8t3XzciFWSGSLjh6y+HqFke7Kvo+8R1YFQKoaGrzCA+PS
         FQGg==
X-Forwarded-Encrypted: i=1; AJvYcCX4uU0SNaVFVtMc+lG/4G+xwQYeGVs9Yt7BXj63alBXPuVeItdEtXY8hcEumOELoLzEIkcun5Ouo/Zy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0jyoFHn7NjNDy1eShCl/5V1Xakq7tjOTzuy0OGW176/1OXQmK
	j95T27UNC2QVyZeqHUdRrjk4Ug/lav9/NMBOIvBHcmrzcHsiB/W2jpz+UTT9p2s=
X-Google-Smtp-Source: AGHT+IG9ZtD9Zd3q75GN23Imw0rYHgFKjP1aIT3fz+CqmO5yL/j7FoVtSH5hft4DRnXSIhe/CGKLbg==
X-Received: by 2002:a17:90b:503:b0:2d8:7a63:f9c8 with SMTP id 98e67ed59e1d1-2e27df3a73cmr8151836a91.14.1728436661766;
        Tue, 08 Oct 2024 18:17:41 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cbbc2sm61076365ad.78.2024.10.08.18.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 18:17:41 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Tue, 08 Oct 2024 18:16:46 -0700
Subject: [PATCH v3 1/3] pinctrl: th1520: Fix return value for unknown pin
 error
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-th1520-pinctrl-fixes-v3-1-5b60db446a49@tenstorrent.com>
References: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
In-Reply-To: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

Fix th1520_pinctrl_dt_node_to_map() to set the return value before
jumping to free_configs when an unknown pin error occurs.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202410022336.xyWlV0Tf-lkp@intel.com/
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 9331f4462480..265a75a78d5a 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -499,6 +499,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 				nmaps = rollback;
 				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
 					np, child, pinname);
+				ret = -EINVAL;
 				goto free_configs;
 			}
 

-- 
2.34.1


