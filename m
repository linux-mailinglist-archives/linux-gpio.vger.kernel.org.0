Return-Path: <linux-gpio+bounces-17764-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A68FAA68570
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 08:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ABA63B81F8
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Mar 2025 07:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1428E24EAB7;
	Wed, 19 Mar 2025 07:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A6JEIqll"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D92211A0E
	for <linux-gpio@vger.kernel.org>; Wed, 19 Mar 2025 07:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742367955; cv=none; b=UPdMWPE+47qmw20lLkt+RnM7tttISJbInj195Pr6BMVU+wXshx4EbCMOjGAyGQuYFvMMWx14oDIm7lbDdus0EDZbetB6oQ0eCS1lxhGCf1xm3bVnIkFTWPgsitic338NT7CnnsdlZwF/g+If5Dq0vpvJirsxFvtgqxxE2HKpQeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742367955; c=relaxed/simple;
	bh=NHmVxf51ccPygdho6qBOtOezUpa9NGhtd7AYhIOwcjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UJX/AIeqq3UwowEALH44Y+nvnuwQROwBG9R3lv3NA5J9pGetxN7D0i/W777e4EM0wTxdYHXwgcx0g7v/gmN6zgb0hLTpi21mnDgM1nj+UHZ5spiRu5ynpACg0HzwFYLDbGUlVkuhlVToFQcmlAfMirEuPu0AvDknRY7kC9wtrR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A6JEIqll; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0782d787so28926835e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Mar 2025 00:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742367952; x=1742972752; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWcdnlxlz3RiOr5CYldhEXdBAGdjzbvGPeO0bYglxBw=;
        b=A6JEIqllxDnqhkdDdhnqnJ+zjkzBHlqwhgKtSbeo3D7e/DO9CscKEgUYoJ3tRoSHTv
         sWnKfVNZjH9a4YsFKxSabRuwzLNUXsXb3eDEAHj5JQT1Nk7cP65B8RL5Mg4SvteG5V2c
         PouK4Q8uncax/OXIiI4LUtwty6htzmy8SJdgEjJkJ9HB3NQUZ/3DO5/5WzsmsZuwe2qM
         NIlMpL+SRMKQMAeoLIZnKdbEWh5BtGIG9oZz1RqitcNxIB4YFTvv2NFS4nMd7DIU/QO8
         MIZCF8eK+RyctZvInXcrUQxHiDrgDGSlaA3Uau6FQygnhH81HDLC8sR/1KWwbhMjjLBp
         BfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742367952; x=1742972752;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWcdnlxlz3RiOr5CYldhEXdBAGdjzbvGPeO0bYglxBw=;
        b=T9rmfEuL8CBzue9pt/VarAYcCIMViOjXtrFsO6bSbTD4vmVRneWgKtF5uHE1EOTZ91
         mpOIFX479olf0lNX8Px1uPqibbpm/CXC3Qx8U1Z8kLwa0P97DRXt3QGkdHwowUy0OLmG
         VvwBqlqdLhwsUUZMnAb5UddfIzZOkt7cOA1/eh46ng3tLAXdJEmiIvAV7H+ntNnlegKT
         4kzmdio+zgBDyMUA566NRJhq6ERnEodKMKBYnrtmKzealboMeAXrSGySArSHoaA9TtGb
         vrX5n3W0N0tNV3xKfrcHDEBEVa9k/hic2iQOnh2eny/K4qB1YZe0GPY9kcIl2tC37cSU
         uCIg==
X-Forwarded-Encrypted: i=1; AJvYcCUOyB7XVu8uQOnS9NuMML1pn1m+r322IEagEmogyxLZ/xX213bIKLFTidEcsQesKvo++sYivSXYKuBA@vger.kernel.org
X-Gm-Message-State: AOJu0YwJn/ZcEJIhP93a4TEFkYU3rGlr9qZRPOohFBGUho4rdTjIwZNY
	4xw8bDWuQOLAJQ85Q9/WHofbVZuhcAiCqqMIy68MWTQ7udYoLihZMvJq3k7uVUs=
X-Gm-Gg: ASbGnctCLUcpwsQtyzl54WJNndPmd+fjvStEIXlujmo0dbJk9UVZ5lw9vlEWf8gIF9y
	mr2EoMQAVKH2MymEdUMH9JbrALL6ope5rW4glS8G6KpWfFIBIaDVcqtscodTooYDHz6znP+Ydyp
	UQ8j9FxtE9TaiYmvnsmtVdfUdJEvTUU2mhEXxjfcIU+23JxaNxExHPJwO5mBcMw5rFJlVpuao90
	7Pu0bVF3Y4WV6zY1Cz5LCb7a2fdQp34DhtuHmO9ZUBJEnKgvRpVeFRnj/zgWm2Cc8N4lZa/s8X+
	n8G+HKAeG81I5Fgayfzwa7ugM3Xxhi49zsfY3ECJMU4/tQMwOvLXwzEXobKg
X-Google-Smtp-Source: AGHT+IGk01nY8D5vZYwPJQciTgqBS35i2lX2QwN2d+aG31PMswpzNbfMSH2RxcqCh5zyBjomgO3hGA==
X-Received: by 2002:a05:600c:1389:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-43d43869a32mr8416005e9.31.1742367951811;
        Wed, 19 Mar 2025 00:05:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f331dasm9816055e9.8.2025.03.19.00.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 00:05:51 -0700 (PDT)
Date: Wed, 19 Mar 2025 10:05:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] pinctrl: tegra: Fix off by one in
 tegra_pinctrl_get_group()
Message-ID: <82b40d9d-b437-42a9-9eb3-2328aa6877ac@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This should be >= pmx->soc->ngroups instead of > to avoid an out of
bounds access.  The pmx->soc->groups[] array is allocated in
tegra_pinctrl_probe().

Fixes: c12bfa0fee65 ("pinctrl-tegra: Restore SFSEL bit when freeing pins")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 0246acba7703..11ecbd6a9b2a 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -306,7 +306,7 @@ static const struct tegra_pingroup *tegra_pinctrl_get_group(struct pinctrl_dev *
 {
 	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
 
-	if (group_index < 0 || group_index > pmx->soc->ngroups)
+	if (group_index < 0 || group_index >= pmx->soc->ngroups)
 		return NULL;
 
 	return &pmx->soc->groups[group_index];
-- 
2.47.2


