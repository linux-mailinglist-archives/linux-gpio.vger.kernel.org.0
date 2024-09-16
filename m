Return-Path: <linux-gpio+bounces-10175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C3979B82
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 08:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B5061C22C7E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 06:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F12285C47;
	Mon, 16 Sep 2024 06:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2ePCXuib"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29555446D1
	for <linux-gpio@vger.kernel.org>; Mon, 16 Sep 2024 06:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726469390; cv=none; b=jd7F90OqhPjVsnzuPAdrS/FCkfhFPuTM7bMxXxOU+fw4wKDZ7AcJpp8olFITnluGmfxx4u3OwyYgUEcqNENXxVZepP5kq20WtiBCU5/ba7tEvqz56tN4WrMcTwkJRriPVqKCeSLkNPpr261LoZXU0TeaqVWQ1yisv2M0LDnirKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726469390; c=relaxed/simple;
	bh=yYAtac4EekLjU2rvegDNeGCTwH8ot/tacVa2TMsRLpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iwIsjtsPcwMuTZhK5CdOLRdO6OhpxgNzC2Q1ujjH6YQdcwsMgQvWl3+3wp4sOPG1jn1AllxaDnJf+cZtwGlojDiMkHrEu4AyCq4KDSGBeOHxgnDcD6TlxbWjEAzrX50qf4AGvThoL5hgwphDhOe1mORj2xFYuozKkEBXlXP9zM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2ePCXuib; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so39886955e9.3
        for <linux-gpio@vger.kernel.org>; Sun, 15 Sep 2024 23:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726469385; x=1727074185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MChXPX3pFZ76RGIM09rJTxp0IgQBj0mj8Xw8ifgVxrA=;
        b=2ePCXuib6yZ3/1SW/W7nUJLEAfXIUpVH0EsnlRjhVGQ8gMcJOQ2hjjo7rgCDtTwisj
         s+e/y1fFUtWGAFx7yyMA60htDGix3+GsjulJnt9xhqsE2RZHyUBr3wP0zoC194TSXGD2
         V2SpPjyCJj5l9XeG00FWRu1JG5HT3H18DtPi1QGL4qLX5Oe5LAPwS41YXHvI34Pg7wWt
         Sr9/7cYqxfWUg2xX3bRRhdsjx7X/rvr4Ryr/bgLL9aFyH1YrHhM/li8Fq3jw8orQpJFs
         CND9G4clB+xE1SQEsLKPTFUvOEF6wMCCqPFw1VbB64sQ9UvGoGyVj4CNr2K363q0KyiO
         83ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726469385; x=1727074185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MChXPX3pFZ76RGIM09rJTxp0IgQBj0mj8Xw8ifgVxrA=;
        b=n/zI8pWRxBDUAM7uw56paEuYRRGxP40LS0Xp9ymh3vQ5YC7Msvjk3pFAKGNAu6Dzrn
         LoKUmZlJwqbm2zNCnVlKE4a6fCLNMooQiXiQ5IMvuewte9eY6WgrBM38gbm+ccZuUrcu
         pJqKnA78QmxAWwtVeypX9DErAQvYv79Ztl/lig6xNbvDfDDzawsVl+l6MUVNp6TgQymP
         tZ3LRW/fkM56Xg9HnGWOuCsRu9S7MJJwCs6n7Jf7A3KGBgKfJj3lOvxK/ec0FX4FBK55
         BvGya/hMTny+WFXDppiqsVrGxQ5RmFzWCiUTkn9SQEyTWSWz14tNbZcB2vhuuS2l5XZC
         YRYA==
X-Gm-Message-State: AOJu0YyWAQtwuQpD9iXveNjl8U2osDoVlwTxvXxtz/5972U0kD/aD1rx
	RfQnoIVDWgplSr1KQcbiObuHTsgwWBTutKTcej+Jc9KclfVKhphzHVskr5zPGpZB1vOExuk/cfr
	l
X-Google-Smtp-Source: AGHT+IHhtsBFjqqDAK59OTZCDnJ1bg7UySmaK0LwxPRV4LA5o1ZtcykL1NO3YeBxq1lqk6VjfQBKtQ==
X-Received: by 2002:a05:6000:1042:b0:374:c287:929b with SMTP id ffacd0b85a97d-378c2cfec24mr7862566f8f.4.1726469384501;
        Sun, 15 Sep 2024 23:49:44 -0700 (PDT)
Received: from brgl-uxlite.nice.aeroport.fr ([193.57.185.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7800243sm6255188f8f.86.2024.09.15.23.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 23:49:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] bindings: python: add py.typed marker
Date: Mon, 16 Sep 2024 08:49:40 +0200
Message-ID: <172646937037.185947.895898662546471898.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240914183302.15768-1-vfazio@gmail.com>
References: <20240914183302.15768-1-vfazio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 14 Sep 2024 13:33:02 -0500, Vincent Fazio wrote:
> Per PEP 561 [0], the marker is used by type checkers like mypy
> to recognize that the library is typed.
> 
> [0]: https://peps.python.org/pep-0561/#packaging-type-information
> 
> 

Applied, thanks!

[1/1] bindings: python: add py.typed marker
      commit: c840e17a9ca05e44ec823b77843ab0e8b88691c3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

