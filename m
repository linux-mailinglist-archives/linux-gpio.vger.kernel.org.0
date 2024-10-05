Return-Path: <linux-gpio+bounces-10883-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 822409919FE
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 21:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43E9E283CCC
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 19:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFFB166F2E;
	Sat,  5 Oct 2024 19:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="W5KV/Kca"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2842D15ECD5
	for <linux-gpio@vger.kernel.org>; Sat,  5 Oct 2024 19:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728156940; cv=none; b=bG9Wj0v/douBJIun/N4H5dMCbc6mkAjmaUfjw2B2FuTdbPgta2Wxw4/xUMBeUklQZqlaE5PR05iyDWu4CWowT9RYOEdGTR7Z3k+kJZ8y7iVOAmjEj5fH/HGgSdrQmHLNz8aFeUqix9oI+BbHE2Gumgqqwd6bnY2bqszfJhyD9g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728156940; c=relaxed/simple;
	bh=La/A5ykybuQZr/7rIq9G2hRRwTjZREF5LCrLt2DcFno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RCUeicYGVeRs9EariFumP6M1hF2mT/rvVCwJQsQuqxtv3Sz6RGV/XcztUT3ifYJZZTJFk1Tpyg/AHPHHvWrINQqIMNh6cI1VNtAbBgBugvoHjO3tk6+W+lHf4Qcd3wEwmVHY74g34sp8oxDpXKJM7ZSxU+xuoa6CzwH9dpOUohQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=W5KV/Kca; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7db637d1e4eso2270529a12.2
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2024 12:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728156938; x=1728761738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oB2Efzb4PfNe8Kk04ZtI/HUIlV7fy8A7d3zUOzv2nEY=;
        b=W5KV/KcaETcrZk0O8hP6vNTjLFBqzCD+/AtcFqeOmmX2l9BeRIEfOuM/OIz8RzSXDA
         FdS45qmqS5xCVp8tt7HeupkVNcM8/FtkMrPZ9ieISXV0/mpvoTqRy4sxNuRcWXevhLU2
         5ljcDO1qj3kywk/V/7vw937YExtos/inAyxt0/Ufj69RtYz9vuUZukedmjDk9mIutg7m
         TtxD23IALfLmk4f55hi5X4/S/6BAFaZ38lmsOe+F03ZcbIZhYGi7UxrYy8ugkYK+PwNq
         d0WfrJKabyZ5PUWmvXyyBInK/B5+7InagNYj9+AfCMhDyMderkQWMnRxN/dXw88BhNUo
         EppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728156938; x=1728761738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oB2Efzb4PfNe8Kk04ZtI/HUIlV7fy8A7d3zUOzv2nEY=;
        b=n78+B97wqfOqFsjjbzY8z2rOYXB6gJl5B0n+wWkHelcNk0nUgPjewLkpDHeG9vpJIy
         QROlFgJUTfyeoEKEqrgHHW/qFglWsCZjhMjuqhsMYesRboKGKY0UI4H49glV9KB9EROP
         8tz+/7W5hl3QCNT0vZtymtCDQ3og3XKpaj99n55j1BAJAgx9NBmuNue4Cru4QxqaD+dV
         B1cY10G+spTtBLgJ9MdVYnrRZcQjZF0rZPpVQCHsmftyMOQvekrvany3zInSq5gTrhsR
         FRO32n5g5+sal1V1kA3/ArmwtnBupfbIEiNJOyniY+MFriOVmAjM2Be7lLDh3r5jnk1V
         JnSw==
X-Forwarded-Encrypted: i=1; AJvYcCXGgz2Wv6NlgHQpzEtA5QDdA9PXVuqqjP0MgyxWiRE4z1cjook98O6g4GtHb3goPLbx4ViBD/G3F10r@vger.kernel.org
X-Gm-Message-State: AOJu0YzHeAiJ0uzHIKBSZtWExMI7mm0Tw/XvaCgnxl03k/VULCQRIOT6
	xVfmbkQh/ouM9EHTMzP4iBMA6DBOvA8udH9OwmHVKbW4edMVRY1s0lPVIWTkce9K/mJSVX4kzn+
	G
X-Google-Smtp-Source: AGHT+IEOkp++mkE9wG5kj6OwARC3IfLV+wMXPUcPDx2A5yXrs5mQUofUYyfpuNdJVwdTIyJVMrft6g==
X-Received: by 2002:a17:90a:e2d5:b0:2e0:778f:d774 with SMTP id 98e67ed59e1d1-2e1e6213064mr8573006a91.2.1728156938138;
        Sat, 05 Oct 2024 12:35:38 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20ae6dfa4sm2208372a91.2.2024.10.05.12.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 12:35:37 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 05 Oct 2024 12:35:28 -0700
Subject: [PATCH 2/2] pinctrl: th1520: Fix return value for unknown pin
 error
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241005-th1520-pinctrl-fixes-v1-2-5c65dffa0d00@tenstorrent.com>
References: <20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com>
In-Reply-To: <20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.1

Fix th1520_pinctrl_dt_node_to_map() to a return value upon an unknown
pin error before jumping to free_configs.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202410022336.xyWlV0Tf-lkp@intel.com/
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index d03a0a34220a..92834b6718b3 100644
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


