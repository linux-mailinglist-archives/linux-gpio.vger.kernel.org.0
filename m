Return-Path: <linux-gpio+bounces-10882-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 552879919FD
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 21:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06AB71F225F2
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 19:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18229165F16;
	Sat,  5 Oct 2024 19:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="a2A2iU1E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F4C1591F0
	for <linux-gpio@vger.kernel.org>; Sat,  5 Oct 2024 19:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728156939; cv=none; b=r6Biip/myH+TuJyAlyPrhS19YWYK5HMaSEd20AqoEK7jtB34a/peyhJnB+4SZM8i/dYzb8lMBb3X7QrOzC9EEz+Eyn2Xm1tsaa5zSgx13lGvOrJRMkYTPbAN6bH0a+q/BuPJHYL9GuQYeuYresUZOf0TMPCnKYpDKCT96UPGq9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728156939; c=relaxed/simple;
	bh=benKogcid3gWGDiiF4qrE6LH9w7SY9gbrzcC5YO+XbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YlQ59bURePwxv9AUHQjl0XyX9WEDPjPE5oZnGZD5d6Nhyo+l2KekeVB60GAy0P8++FBmllGc1Al67C6j16nDrywng2ZKTjdDLvP6PUls58fD1ycZS5tHbsmGrBXS4ZXZW77aumBD6Av2ACpcPnDyiFnzRQjm1lZyX+aRCcBM+yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=a2A2iU1E; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20aff65aa37so27528605ad.1
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2024 12:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728156937; x=1728761737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siW7EdgyXTgOQPOyS518eaXhNYDdg121ayiXgQNhC30=;
        b=a2A2iU1ElvxHU/UALx3b71375MbkwGOjpUJijvwtltIvul6x7lsm9pz5npj2H5hZ3X
         cfOI6at1RfpqlGfi2dSUTCJZOmgl+l42dyy+3dcyUwyhLZf8jepXxMjgZmrARZTue5HI
         UK31TP4kjynrk9axd/CCNQ1FtSYb9Oc0yiBJmR7omLhqvOinDF3LCe9O9aBZ2CbbhSgM
         Jg54sxMpIMBIR0UiVNTqQ2OQ61BkmveJ4JEWL7q/O4yW+zw2K2hKR/LBznltKMFN1RQ1
         X7wokQzwyZXVg+dazkfbU3jD5DIezhUUFtGpXdq+TrUxRvfdMUwiamvgW65Ea8XPBQbZ
         6vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728156937; x=1728761737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siW7EdgyXTgOQPOyS518eaXhNYDdg121ayiXgQNhC30=;
        b=sHFaQfaiV6+6VdcFl29MUlSnaVkP4DWbZMAFOFHVmy8GbKPHQi4qotAEW2Hnr6mBAW
         +gjOAcphWiWm8ZVGtrMAS/IEyXWpDd4Z2L44PdRxBxi6jutAYXWH9ZcI35EvbCoReBTg
         R1DAVliYSAboNEMByOFWMLkoead8oa6RI9U0MeRIQvCiE9AafHkGpfTKVTHvtjGs4DR7
         gUqmjnPugvPyY/EomPGIN2MjvtiLxn0dDibHymUf5nvErzgjGGNQ8vH1mSKZz+9hc2f7
         5IThfaF/dpbGrc37KPr8O6WXl2hxLk8zALhJZMtyBU6Lu2bhBZNT2+dG3BrsYkNnevnf
         mhQA==
X-Forwarded-Encrypted: i=1; AJvYcCX4vCRgL0DjqW7JYaohyiBO5SRaZbmQdLvZWallpa66MyovUepnZYxWQku5ZVQjtWBMYiNxCWWMQMTU@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5C8lBNvGMakyM1xGb6/30wEYSOae6SEpyFjUN9mGR3lytg8yA
	kyNo4vQ8R6AEGFSY92/OEhqToMXXxv6UTeMTCr+o6UU/ykVz9n6jDIVxkAwBN3U64pa4P5uOlmd
	i
X-Google-Smtp-Source: AGHT+IHxAvGS4eyy68/Pp+oLN7B2msxCL0H1dN/Ea7Y+bzahoG21QB3NmwpOSm+LgTop+ynMkU/8Zg==
X-Received: by 2002:a17:902:ec89:b0:20b:982e:73d6 with SMTP id d9443c01a7336-20bff043851mr90330595ad.49.1728156937357;
        Sat, 05 Oct 2024 12:35:37 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20ae6dfa4sm2208372a91.2.2024.10.05.12.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 12:35:36 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 05 Oct 2024 12:35:27 -0700
Subject: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded
 mutex
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
References: <20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com>
In-Reply-To: <20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

Convert th1520_pinctrl_dt_node_to_map() to use guarded mutex for
thp->mutex.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 9331f4462480..d03a0a34220a 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -425,7 +425,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	int ret;
 
 	nmaps = 0;
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		int npins = of_property_count_strings(child, "pins");
 
 		if (npins <= 0) {
@@ -444,8 +444,8 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		return -ENOMEM;
 
 	nmaps = 0;
-	mutex_lock(&thp->mutex);
-	for_each_available_child_of_node(np, child) {
+	guard(mutex)(&thp->mutex);
+	for_each_available_child_of_node_scoped(np, child) {
 		unsigned int rollback = nmaps;
 		enum th1520_muxtype muxtype;
 		struct property *prop;
@@ -530,7 +530,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	*maps = map;
 	*num_maps = nmaps;
-	mutex_unlock(&thp->mutex);
 	return 0;
 
 free_configs:
@@ -538,7 +537,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 put_child:
 	of_node_put(child);
 	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
-	mutex_unlock(&thp->mutex);
 	return ret;
 }
 

-- 
2.34.1


