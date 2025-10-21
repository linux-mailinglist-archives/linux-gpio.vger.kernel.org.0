Return-Path: <linux-gpio+bounces-27351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A93BF564F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 11:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E7D953524E8
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7780E32AABE;
	Tue, 21 Oct 2025 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sSxrXbZ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9513B31DD85
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761037312; cv=none; b=ESQ1WamOhCah67YsCddxXcT1lpl6Sqgm24cwOwO0GNN4gdvNCwcqvgtEJOCUrrDU7nXEA8Z3GKXJS8175DTpcVjO6UorT+w3ilWUBo/sYbXDKcl/d3UfGjdXiuUaHMB4+VIiHsN//o2Jgy/d5qrb/p2Nk+eg80GCVH2RcpKrjDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761037312; c=relaxed/simple;
	bh=szz9PjhinWlosFCtfgUMabH2tGBOEZwddGuYY8agzcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UxaR1gt3H8cOvwuVk7wWhq2iXupECKP7EKASS9ZFAi822qkXh8oikdbQLMFqdcTDTyVNw3z6jHQ0xODTXidHtQGeV59KKIFojDqk59JzUg8NqIvdHiKARVycdBbTtdCOsKFA7qetfnlpxSxDB02zCOUSC0Ou7GZ02HJ8FXr27sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sSxrXbZ2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47117f92e32so34699215e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761037309; x=1761642109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TeCc4wabnDNTUm28psVc6W31FsugP3f390k1jrgAp4=;
        b=sSxrXbZ2mb47J6V5a61JL4qnnH536vvl0WDsEo8lrUl0tuHYYCQj/Vpg6Cj+gVHUJh
         bK5eX9+7zuLv3/6CPcrwOPrcIcDF7Aw0DNAp4LQ7eciq4vDvnwZo8iTf1KpddjOi+kpi
         rvx2oEo7A8/c5sOnwhZmUrv06FeV5GjpFrVKke8vXISsDdB0ZDbuwCSA5MDEN5S5/rfr
         jgZ5x7McOryMlIUmnY5wJzMHFP/D805qAH5jm/SANGU0ALmNi6Pxq+YBsPhi00xAEIUx
         MDipLRt/5xJ0qnbqT9lWaV2J1LiHCG+bNJZYs5cTfgeEa7anBFiTRM9Q35o9ykDL/rCF
         RdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761037309; x=1761642109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TeCc4wabnDNTUm28psVc6W31FsugP3f390k1jrgAp4=;
        b=TdMIlIfnPLcCY/8qHNX3max1vKg56zWju+g38w1y7DSVwWVrK77GqeacFm2efEdqse
         nSbRtNEZMatUCHi2mzgpD/IyGguoKoZ8BOkfms/JJKu5Ppv679OpNi1zrgvyxnCtceYD
         E90nKOzrdY4VtBi+JhNNaJ/HsnuPfBzPJixjBrYIWzEuEXlC/eflH6ncl6VRwzma5rme
         /jTyHXCHVG/8bF0r6v2qkxEtnRJFAh68zAcSFBHvc6Ja5Kwy7iOc+fHEkpaPG9EUOf1g
         iRMeeujoG+bfE5GHavsXBQbc2zffNcRxf9LvspdZeuGk+bpnuLwuaCOpuMelShfLpa6g
         +vsw==
X-Forwarded-Encrypted: i=1; AJvYcCVcs32EIkoAZwtWCkYVgasIcoycmlLUpx3Lw1jGYSbOj04AZRGFrgW4eBFEnkxBHcCqi0Uz7Rz7BJYK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7K03wJ7ctm9120SAbcgkUYmdE5dyZMxGYzr99E8NvLu508Gka
	P4hpEousRAKC0SZmpR4BSBHC4Qsrj4j120qQtxBKpyK0WQzFKLFCUP4iR+RmZTAE+oY=
X-Gm-Gg: ASbGnctf9PhQL1N/ZXbeq+xz2rLNlV1l8F59EObrPjVUIEYEeU4wp0dw6Uv0tAyUQXN
	LDoTxy6lNzYkz6B6xAB7/Btm99wxdXDOCbKrencYw1tLktL452MgIP54AOAcrL41tU0HSK4tzhu
	ZQJdae2RzzFZodk8879gZXCqYvbo0+ISeLqhsPCqebM5IJzJcPkDTFYzEB1mxmy+UnOfZwRvdve
	N+qkCAhbjuK7XFLxduUXjb8PAN9oCKTlHZLHAHgRwpn8jQ2ZljDIk8XA2WFaKPDLiPdQmmgJ68w
	0ZvFCiKUGquX9oVPFcwyFkgj3E8rN/BFtHUpfcw7OSnE7S+016exCVtjYqb1lnLq9qCrkta3ClR
	h7/5IqMI3zaBcXqilqcWQ0K4fDesTWxfT8XVtqDVFARPSLTswq9jRXIn3WmHi1MQeXjdML4TL98
	mvOL0o08vKz7LNav3Y4V2EysA=
X-Google-Smtp-Source: AGHT+IHMsE5J6Bs+G5AtSF92sEFlNjDdhFMO6owKbMYPxNmFN9+p2p/mx4kaXCI9o6w10dVqttxFpw==
X-Received: by 2002:a05:600c:154b:b0:46f:b42e:edcd with SMTP id 5b1f17b1804b1-47117925d59mr91801885e9.38.1761037308222;
        Tue, 21 Oct 2025 02:01:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2979:9ff9:6677:97c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d972sm191369065e9.1.2025.10.21.02.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 02:01:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: latch: remove unneeded include
Date: Tue, 21 Oct 2025 11:01:43 +0200
Message-ID: <176103730244.11215.11595127566271255643.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251015151605.71203-1-brgl@bgdev.pl>
References: <20251015151605.71203-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 15 Oct 2025 17:16:05 +0200, Bartosz Golaszewski wrote:
> This driver no longer uses any GPIOLIB internal symbols. We can drop the
> gpiolib.h include.
> 
> 

Applied, thanks!

[1/1] gpio: latch: remove unneeded include
      https://git.kernel.org/brgl/linux/c/d09ec3dc7fea7b2f5f5a159470d43cced39e994d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

