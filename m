Return-Path: <linux-gpio+bounces-10550-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F890989CAD
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 10:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E889728152E
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 08:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C7A17B500;
	Mon, 30 Sep 2024 08:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="M1FBCA3O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5994204B
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 08:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727684562; cv=none; b=lv17AvG3GCuarkFPh1toMwOY1CuyeKaJ6DSRNJQFQ7wUyTj4IwNpoglHaFJa5mLIYnyItL8MpaG9vCTixMvPtoIN0SikswsjDbfoAbPf7CKBJMFvNo4JbNvCdl7j1G4bnBvDgVNszZDUY6kROHugI3Z0SgP2TvK5kLuYapi4cWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727684562; c=relaxed/simple;
	bh=6YzvxFc0OtmpBz3sc718IpGWLOo9ygVf1orfvqyStEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QaDG04m1EjHL3ThhM/8Cs4qeKaqa4ubP+JzRUk6AC59CXqaHLXosV75v1CT79tUOno6CXteDi+au6NmUvakmzk4416ngVynA4rMlFXWzVyzxNQeZBD6S6fChRG+o97xubvE6lND5Pe36BFLYkicQ/X9AiNeWu/anwDR+5+5XO3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=M1FBCA3O; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so37680495e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 01:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727684558; x=1728289358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53rT25eutJ7NmOD1M64j/GDvUg24Hj2OoCeQw62hUO0=;
        b=M1FBCA3OwvjMbszpnUD0tNcxkqwR/AFfx1lpWPHEUYfqUbRHEEeAzPqIZJEjOHdizz
         ao9aioPyli6+vpqSqQE74y3qsIHh3oohLNa9BFdOlHQuX+nQ/I4Oz+9P11fhFDXqgM+P
         XknvAWNYFBtp3mpLxBCoWWUbnHqWBiqd6cBanbhYyBvgWlELo2NaFiRwPxuFKqG5dTIN
         AE91n23BP0Yi7pFdlEdGB3s7L8GZO45+GQ2oLevJwUTPuCQQ/dVbEZQLDZnrJCS0+TMF
         xv3wnALSzZeRKA4bmDzAmji6UJdAOMHk73D1wWv/ftnefKl2UHWjLMCwU9mrvn330vrt
         C+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727684558; x=1728289358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53rT25eutJ7NmOD1M64j/GDvUg24Hj2OoCeQw62hUO0=;
        b=G8t70+0ph8dhMmTUzJVBD6ppioGjb9hqX8Z5Q0AwCt6Aw4cjbC02EFaxW4waysziIf
         bEKBFzHwVl3Clul2WMTSCmF8sACyjSf/KSZOmubA5zTs4dFqiZad25CFmrTXb++KXSa9
         6Tr+7p9rXd+nkAku/TbQx9+9KGIih1BjjGDy3CeAYakfAxO/O2Giu1Qq2l5qRB6x32+c
         /eR1qZvcr13J4bwuDaxEVkDG4yquNp7g0gX0D1h/ysQZiwZsLz2HJoSgr3H2Kh/GDisB
         905S6vHMNpeVIkQ/+8B3robrb7504AeLk4JjXAquMhjzYcs43XYk8JURSmqeOw6NwVGH
         rq7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfkg5ixqXtLUs8bSg9WqTN91zg3pJuxnTKbPUcpvC4G+ak4axxYQiR6t+k0R+cZCxQ9mH2noPFKzhV@vger.kernel.org
X-Gm-Message-State: AOJu0YzMuCNUoRvqoyxA/6tgi2UiovVz44znNB/JBM75u/I63tLGMdbJ
	6gDAX1a4yvMZ4AyDo/1Oui+t+gt9SvjffeoYCzmygm7z2aCRnelZm8vElG76QRA=
X-Google-Smtp-Source: AGHT+IEfKa3GdrtNbdd0h0skGiKIsQMcKGrfFtF7F9+rOtTSNRxJVGf+uRUJrfWaTT0Wrdg13MNFuQ==
X-Received: by 2002:a05:600c:a02:b0:42c:bdb0:c625 with SMTP id 5b1f17b1804b1-42f58434ea9mr85146865e9.14.1727684558281;
        Mon, 30 Sep 2024 01:22:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8791:e3e5:a9ca:31a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d01esm8522655f8f.3.2024.09.30.01.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 01:22:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	Shivam Chaudhary <cvam0000@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] Fix typos in GPIO TODO document
Date: Mon, 30 Sep 2024 10:22:31 +0200
Message-ID: <172768450503.13259.11286847878445459912.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925154657.38704-1-cvam0000@gmail.com>
References: <20240925154657.38704-1-cvam0000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 25 Sep 2024 21:16:57 +0530, Shivam Chaudhary wrote:
> Corrected minor typos in the GPIO TODO document:
> - Fixed "ivolves" to "involves"
> - Corrected "boardfiles" to "board files"
> 
> 

Applied, thanks!

[1/1] Fix typos in GPIO TODO document
      commit: f53ab43553ea32ef535cad320c92f9d124890a2c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

