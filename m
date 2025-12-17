Return-Path: <linux-gpio+bounces-29667-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 109C8CC6436
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 07:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 927C73026F93
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 06:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E0130EF86;
	Wed, 17 Dec 2025 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3j/eoaT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CED830EF6D
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 06:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765953171; cv=none; b=Bjndvs0Nvzs537kLWIUEvWrqtFPDkyfU55sDmj19L3/UXynd1d1X3cgFY59vlKbccOE8jbPD/msqKHVA1dxMeyteYjEuF6G3fJd2JJH1t/C2hSexWlHLSfDb9IjWIlv5kATvyPOJmNoacIXOyQuhpMW4/AyO5JDaiUiLjW7YSFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765953171; c=relaxed/simple;
	bh=TTuLXEC9+smH6ECrXuAkOVYJpekwEPisXMOjlBy4phs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IDPguwiXYqLyfqvg6sOqnhj9pPi5oJiZ7MtyYJ5XWJk9nkYM6pedOnLTS0xopbe4vP830Wnium0JKvZfl0xnmJxuHCsdmNgSzuoreAC39TEOeN8lbC7rAYmVm0T3kfKKCtb9kWp0nLPNdyq5GBthZVDXSkanyOBbSDXTaoiGJAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3j/eoaT; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c71f462d2so3159656a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2025 22:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765953169; x=1766557969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRE1DknyyjLQmnJkmfNRcVBZ7uDHu9Cc8oh+v6J5iSY=;
        b=X3j/eoaTygFdrx6Al3xGhLcfPua0z1eiS+nADhsJgWS+QrJ8LRtMw/BZppe0Xt5w+E
         8pB6siS+UjLhdFYItf5W8j27l2uUDr/rw9IKfBMHB94MT9VuyxKIik50FzeYwqc648HS
         18sw+xYrLEYt7Eytodli/SYE0cFg2wRViXPRSTKMWBH78VppB3UXVZf/Z2ZOn8LZFe/A
         3BhVhpCmKYdZooz4UnEEzwbjNM+OiELMnVlsi1nt4/fRF3S9KjQP2OBlhFiHmfN8pdVU
         k9mZVAp35BvQ5wOPxR+5GSatnBp23kxpCyw3N4vrBRQyz3AVFpqEEpGXOuf7YujWptnn
         a83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765953169; x=1766557969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rRE1DknyyjLQmnJkmfNRcVBZ7uDHu9Cc8oh+v6J5iSY=;
        b=sLcgSejiADonKmmka2GQe0aRKk2YWGnW/CLoxaCqAQJ7be8A+BcXaC7DxAWAnjb22j
         3iA5T51Qy5GiR2zKJ2HdK1ub2ZHge1QEhyGkNo27PI0+e/+Qyuqe3LKtKKCoRd/klVnr
         Qq6m2if0Rg0+MXswNqtLTJ+ny5ygc4GVxX0Yq+m9u1yuYq+vQL+6dQ1jHHYKI7TWhUK6
         qf07xkG9aJ96GbGVj0MyX2SpMnHIdyq7anOrWz+7/7BTCu3TdQa9R7B4zOQI84pvQ2GI
         Nozc0Pn0Jl3rWv9etHCDjEVJLx4NyHu42L35fFfJKzBhM3GMpbSm+IUZEmGuM2rMVbTx
         iIOQ==
X-Gm-Message-State: AOJu0YwRqFeJr7xEM0NywVsPFDVM8LEz4YcAcuOQLw+Jd/bxWsXNZfj/
	9kzPMvxFBc4okHYKYZRjFj5TcYuN4xn6qqAbsgfmEdaGwk60mq3DdsmNIGY7rg==
X-Gm-Gg: AY/fxX7/Cd+BuzUuNoQYqhtg5SRvNXJafC1YI+fDjh0SqaxKueQtzxZ0BTQoWD6kdIc
	iueU9wimrmN5spen76lJ2qVMuQKSde+Ukd76V+ERmjQgcFSHz89yJ/RwdXSIwnN9/DjQKm6G3fr
	3VjW0yZMb87yXw9dCr4QeZjdLSibhEPgX9fCc2KDb1COrYyTA41s3lO/VNMrfb22an34Mbh7Zf8
	I+63t1ZSDjyM3lWBIHezPjdSY/QXhaZVXfRQk5puEHZDJseM8e/bzbnSAH/PGAMlZv9TRqT6Uaf
	kc2ckZO64NK+su6s5L3vOglumFEz8jugKkE5TnN5lIMLIyJ/FHBkD/ukVpzpW7lXeEUWsbjD5T6
	vN1sZO0KLCZ7Sp7yZOvM/nDcSZJYSJ8yxIMrsE5DWR0Rb6hXBelvunQlREQ==
X-Google-Smtp-Source: AGHT+IEn/70XafWsMhS3UvnzdSd44G2Qaqqp2HBIRN5fh+LzhsfR4LAxfIq4S53rCc7n4gsDuFetuw==
X-Received: by 2002:a05:701b:280e:b0:11b:aca4:be1f with SMTP id a92af1059eb24-11f349c5919mr9802347c88.17.1765953168938;
        Tue, 16 Dec 2025 22:32:48 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::c20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e304766sm61454672c88.13.2025.12.16.22.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 22:32:48 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] gpio: realtek-otto: use kernel_ulong_t
Date: Tue, 16 Dec 2025 22:32:27 -0800
Message-ID: <20251217063229.38175-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217063229.38175-1-rosenp@gmail.com>
References: <20251217063229.38175-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes compilation on 64-bit platforms as pointers needed a larger type.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-realtek-otto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index de527f4fc6c2..efcddbe01308 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -372,7 +372,7 @@ static int realtek_gpio_probe(struct platform_device *pdev)
 	if (!ctrl)
 		return -ENOMEM;
 
-	dev_flags = (unsigned int) device_get_match_data(dev);
+	dev_flags = (unsigned int)(kernel_ulong_t)device_get_match_data(dev);
 
 	ngpios = REALTEK_GPIO_MAX;
 	device_property_read_u32(dev, "ngpios", &ngpios);
-- 
2.52.0


