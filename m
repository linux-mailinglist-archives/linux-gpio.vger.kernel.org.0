Return-Path: <linux-gpio+bounces-10489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6C2988019
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 10:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F351C283A85
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 08:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CA5189506;
	Fri, 27 Sep 2024 08:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xicez5Jm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0481898E0
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 08:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727424763; cv=none; b=rxSYiPkl1ESAPPnIFUaWnofrynf9bzM3f0TezvHsG7Ii5BJ37nP545BiHSuMrSyvELrGQKLbGErThCmQIf2iruGwGVIhGA/jXrmV3P8mAAw6UxDXRunVQ0PIxr6qhDtQBL4VlLr/q9jJedJcTa66M0V5an/1k2B7VANOFpW4eFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727424763; c=relaxed/simple;
	bh=8dxly9FcGv3ndNC2tPvw58Cm0pIavEKGw8lqPsXU65Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K7GFFSw4kG5y43Su/N9DHnprnBZh62s1bdNhbhDYBG60j6r12dlXKexaPj0Lll2by+1knM6YQYSKTUZ+XZUtsPuBA6r7IOTgSsz9unDTE08dSM+EkzitxZg4Gx6IjazXSEnPbjIZP38FkqBHa02Jl9XzJBb3dvDoUk68bsU4GvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xicez5Jm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cb5b3c57eso17015985e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 01:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727424760; x=1728029560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GK4WPfMH/s92o2DS8Np1ieg+QJmpkL9MYONRuAiThSc=;
        b=xicez5JmM4vYZ0AIEy5lCe3R/wqHRryHMVitDVIS/DMG1KMoul9j2QwCxQz/8iRL6l
         EiHuIcodM+UPiEySEBTC+ML/eldvOJ0Z0rckqwdr5A2u3Z96y/VwueuOAI6CKHJ/bqMk
         TS4/HJxMMmNECsGGtao0Fv6Wq2IlLjlWShWmDx1jD3PhEr5zFdtyE/kOnNzBKj1QzLkQ
         x1P/0w3EKxaEmeuVeooz5oslv+i+YMrS7jkUAxtCt7eHkvkFL75hOw8OiMthtkoSXYMa
         odqFfsubTyOewrkn0YPBYuaSAYh+gyB2z6bDrKL6jSmwoi3pcLjweYKNbqyk3UETlWry
         obGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727424760; x=1728029560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GK4WPfMH/s92o2DS8Np1ieg+QJmpkL9MYONRuAiThSc=;
        b=td2Zfts7hyQubPIGcqdRcKXwv42bD1uYnzQLDNRul5Xlbc6hLJ33YrtB2KpgLsJR4V
         qqrAaLvDzSJAlmU7QbXqJm3oBbPGFL+IJGqj9qMeNM1Jf4K5z8UHontUoNsIVQjA6ZvP
         JJFvDFPsY79MkA9HTdM4iW1PwjYAw4Cgg22tzoAR7hQkobRr3SgumrkpKUaTpLt9dduh
         mXFU1ZJFwptpW9vB5HQmxNvtldly3BHr3TVfn1vM7f46EiCX5l1HeWIBJRxBFwlE50e/
         EZUNGNodlUfFxKmoamQw8KXKR8ulA68tt6FGpibFOFLBbz1HcORmduDpRGU/E5wUnKFY
         z85Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbPfSDqzo07HD9MaZE6dLChLrzIC0nmqa/9jw+V1zGQuf6cbT73ShkPvaI/IiFa4N2oCPaxb4Oyd3J@vger.kernel.org
X-Gm-Message-State: AOJu0YwOODvOw680DqvNGSuP2wBtpen92lrRVugZUk/ndhSFIxWNZTge
	52eR2IW3t2JiENBKN7DDw6qpCn/mJnNlbaHHUOe9sTI6IffBZAK2N+DMxlB1TPQ=
X-Google-Smtp-Source: AGHT+IGA96BFh2ZmVIR+8vCeOEhZgV0SbEoaN+Q3mUdvibhOkSgX90Sw2qlaUBi2zEtemH9rdbwGRg==
X-Received: by 2002:a5d:5258:0:b0:37c:cd57:d92f with SMTP id ffacd0b85a97d-37cd5a6095bmr1643331f8f.3.1727424760186;
        Fri, 27 Sep 2024 01:12:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a28d:27a8:18cd:2c6f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5730eb8sm1768948f8f.86.2024.09.27.01.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 01:12:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: python: improve LineSettings.__repr__()
Date: Fri, 27 Sep 2024 10:12:37 +0200
Message-ID: <172742475551.44922.5456292465322085282.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240920143203.6377-1-brgl@bgdev.pl>
References: <20240920143203.6377-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 20 Sep 2024 16:32:03 +0200, Bartosz Golaszewski wrote:
> Currently, for the output of LineSettings.__repr__() to be eval()able,
> the user must have pulled all the relevant definitions from gpiod.line
> within the scope where it is used. Modify the output so that all the user
> needs is `import gpiod`.
> 
> 

Applied, thanks!

[1/1] bindings: python: improve LineSettings.__repr__()
      commit: f6c8c3321d8f30979fa593a4f6546ff3dccd2549

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

