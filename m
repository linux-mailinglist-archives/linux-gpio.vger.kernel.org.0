Return-Path: <linux-gpio+bounces-16899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA922A4B96E
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 09:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F00B7188A9C6
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 08:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD4A1EE7AD;
	Mon,  3 Mar 2025 08:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0hpmpH8J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D431EB191
	for <linux-gpio@vger.kernel.org>; Mon,  3 Mar 2025 08:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990892; cv=none; b=fdpVUPn8pd+FgFVlNKEYhwQkMJZGN1tHdyqqI9PLr9k6QYpTjSSsk36GaqufqGJGUGDe3D5qztx4x+uo1jux18m5kaVruNUyL/3r6nLXfsZvPEyG73DOLQ4qsJGksfdb49dvW++TopwemrHlAj7HlJz5DhP9IsF2Vy/9Vs6CTbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990892; c=relaxed/simple;
	bh=Xu+R9dxCaKB3LBzWEXohsvaFOO89yN7GursH9EJ00LI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OruOcOno+uTQQywe3urIrc02W1O3sylN+H9urxuQhjXA/0/YvIaVcfAPfAF3gyz3YQJyLYu8ItFTFIpsucYB2LZey1y27JuFpgcQ4Ab7djsbAZ7BX53ie5iDG/wpSn2GInw9uTLUtfqx6SbrBwGlU6clRkvAN4WO+g6RR0UOX1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0hpmpH8J; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43aac0390e8so25612835e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Mar 2025 00:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740990889; x=1741595689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3zs+zZ8/UkKqB1ndx1maETbL/N7O50KZ86fibMQj0o=;
        b=0hpmpH8Jl6q1Cwqc2s+8ozRRG6bYlThc74/SkoPBjPvOpVh25bohEnt5A1cH1cCKbj
         wUiDipKl6mot3XxNLp3I+X3ZuRgvRj4hQ+qN0O81FiYsBD/uZrQH1jKTEmYyYj+00lde
         MfP9HU2ZsEQ+WDi+BanrBIT7QDLD2qtzhr+jiMTr/9a/c+yfu/vbwvYubFRgyr+um22l
         s8hJPB/GVTL3B+WPr1mguzcK4oqZbbLNB3dwM//7VCVQjK+An8w1SKoHWSCNkibAmghH
         2exFikaqqmDCxBPFm2Vt97yeMG1h7vSXbuz8447HJBPCavqbxllyku+dzP7pptnZxWOE
         xA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740990889; x=1741595689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3zs+zZ8/UkKqB1ndx1maETbL/N7O50KZ86fibMQj0o=;
        b=ROLEWGKLTw0G+d+TioqlxnD19JFqgr6bzooLLw39X9AAEKPs5bSjv/u0+dut+VJ/Vn
         UrBt6fVrIPJW7RWySsezJoGXW0ayQ+tfNJEuklI6fQCcCG1lwkXfdUKQTVbTcXy1MwVw
         lqk0fLaYxQbz/jEEQtSSxdpYxnfsjfuAOaxofLydtxu5LuVXCKDSIi3kbN71wOu7Ir1U
         m/1brOddh9/L5Myo0h+XWlskvx5UrKCb1MyFLbl4q3Ozm2Lk+2NPpLsXy7PXMNbe+Jm0
         dKp7bvC6K8sHVVm+LqrDqbtIHKfeuyNZhdCeeoFpaeI8LzBRkAUi+GVpp9GGE4XlJLVv
         dTuA==
X-Forwarded-Encrypted: i=1; AJvYcCUBFbxR9iBcLBrDEWCYuMt8EWD4qZaMNGxyTgjSf1p7JzTyMmMEWQ+35T7z6MBwRxLJypxOlb567SRK@vger.kernel.org
X-Gm-Message-State: AOJu0YxR4j6c6c0P/FyE+BfdrFo9F9v7nlunz9IjodqRi3XyH2MwZe6V
	UjgWFA2SVxPhzyh2+wnKa8aXqE094ghF+bDR9r/iuuoY7DKHuFeiCwOyiChpHb0=
X-Gm-Gg: ASbGnct8WJCDbSFhgMXhykdZcwFn79kG6DKJ8OxBEQ90T0GMdFN8o3ZpVY2nx/+AwU0
	e1zqgdeaVfZ+XCpAOo58SEv2Bt2g+HO7GktjQtDJ3BTs1/8X6E3vYRIbWyMMkYdPIbxgFgZz04K
	4p+AVQmbgzm6TfxWroTCA6v88pvQCj2fcH/cVpF14yw3M+LM+VXVreyhPwQokApvvICoW6PwPwz
	UT7ovkMr5X/1nq8cakYhf/5eUQqDIh/OsIqWSU6KAUVBQErJwj7W4JrI0IjuDPGEdK4NDkdFHZe
	zirXes6UqzsEc78FC/YuyY2+itnDq3+ya2xKFvFCEYxL
X-Google-Smtp-Source: AGHT+IEwuZAAiW0H5EeuN1Sr0107Xsyhqgh45iWAu7E/k1rlJKnPNTa6lf6tq6fInDdNw0jPCZD5fg==
X-Received: by 2002:a05:600c:190a:b0:434:a4b3:5ebe with SMTP id 5b1f17b1804b1-43ba675830emr79746845e9.24.1740990888929;
        Mon, 03 Mar 2025 00:34:48 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:664a:9e92:6aa8:6007])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532ba6sm180406115e9.12.2025.03.03.00.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 00:34:47 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] gpiolib: remove unneeded WARN_ON() from gpiochip_set_multiple()
Date: Mon,  3 Mar 2025 09:34:45 +0100
Message-ID: <174099088185.13023.12920341426631248647.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250227152831.59784-1-brgl@bgdev.pl>
References: <20250227152831.59784-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 27 Feb 2025 16:28:31 +0100, Bartosz Golaszewski wrote:
> GPIO drivers are not required to support set_multiple() - the core will
> fallback to calling set() for each line if it's missing. Remove the
> offending check from gpiochip_set_multiple().
> 
> 

Applied, thanks!

[1/1] gpiolib: remove unneeded WARN_ON() from gpiochip_set_multiple()
      commit: 8014097f1466f7e034844770c537b8dc7d98811f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

