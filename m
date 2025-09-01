Return-Path: <linux-gpio+bounces-25297-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11116B3DC94
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 10:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1D3F3A5113
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 08:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462A72FB602;
	Mon,  1 Sep 2025 08:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nH5rfmXi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710F525A34D
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 08:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756715711; cv=none; b=t+tdh3A4CcNztlFKXCrAs6Q0pMDiiPZ3OWYjw+sWd70Ue7NFjXNL64Xg3+kTHqD4CKq5+kt8gMxmd2uHw8205WtJjjyd6S+4SEg9Zeyh9SVF+v9njjGP8VqqmXhqdiLqT7ut3Ta2uDbYhr25lE93+NuqCb/ItuuuGJaPyGrNg6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756715711; c=relaxed/simple;
	bh=9B/dFPXf5qRmCfwmEX1kHDMPcCU1EiMXUL0WBlti73M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OezpI5b59PFzPLwpp/GFsF7Psd9JwhNdbmoyPUMB9jwjgyh5vasNoWzdpTKZgwKmCsXvaAtOxVwTAs4wOa67H/jJ17wL8o/JhU4D+xAjpzN0CYZrVLwlcMWHuP6tuAddXjDT4qzwq07sduRpQW5EY8glDLfzWLlhp4mcU0Lry0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nH5rfmXi; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so2652282f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 01:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756715708; x=1757320508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkEUgU3PeZqoa7Gh6FJYLFeqeXuxbljYPa6B6J8/bSs=;
        b=nH5rfmXijNc+IH0YZyKl7wTBsD3KZbPTlXadC+m7RidqLA8hBkepGWev8ldU3srn91
         fd/QW52FSAGFqpr7eaX6M0yoRisiMXvURyj5l1bMqAGldHaMUKu0KXgrVZr9Rf7RWKx4
         Cjo9DrBmBjUpp+daaAXgCuuaa/5OTwgqayZvGb5RIqAAmVWt++bdbXUcufnvBCoQaXgL
         RQOrE4/ItAky20khWgyv9kcJ8y0tbCBdSBGOJN5dM2ls7Q27KPmqRfXxHE7PnStoqg3I
         lz1xgMC/HA9Iz0ATJ7Glb7e7bBkLCBZw9Dol3e+DbJI2Mzj5hbmppchQw2wE7fJI4zon
         OsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715708; x=1757320508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkEUgU3PeZqoa7Gh6FJYLFeqeXuxbljYPa6B6J8/bSs=;
        b=HgQcBIlhND5J14ko6eM9T7fnoO0W/Qj+jTANDBTadMu8Z7A9sSG+KKDIO4uoFKpBeK
         YZfQ+K5hls4nSUHWJkzWVdy9eMyk7hIAemjCsNigDDr3SKnhScHMt+jusplhdua0YSuJ
         S5HB9CnnCH9feGfCELnoZnwqu1Yeb7+Sth8SLO2uWpy1E+2U5WdnzmYaSJCZr1y4UpN2
         0hPMKVsDsjwpD0z4SXXxRNkMkkEsD03ltVQ76g29iUyhqheI82LWqLX8GdRm4Z9o0zpz
         sCOvkYlpWfzBR/vvAxfZKKSqatQN/ak1jsv2HD4QpwNxFnON4iQ3L1lXPcMyZ5j0qx0b
         YucA==
X-Forwarded-Encrypted: i=1; AJvYcCV1+Jj7n5a+ZiiaM757E4tPX5XSvP3ktcGkxFt8JpWWDWdux/Tlxm1NDYMclainZsaISr0KJEgtqpEf@vger.kernel.org
X-Gm-Message-State: AOJu0YwntR6WE7TTUOs3xmh1s/E0yhvTWadEqeZOMcdWK8B8NM2Ezb/b
	Sc+nLogYuiDagP+f92N96qm3OcXeAVbVq8kdDtFgUJNiX0wwEmMRI0116q2wnXXlx6o=
X-Gm-Gg: ASbGnctnvNGtFqabOsA6C/6bdlvkXaD7WtKyQlmHZZxk3JgEL3yMWhtzLNOxjnTgEN9
	/kywn1E3Jkr3NhpTGcVAQCUrzHnDKNpXmRG05rltzaC7f0gVj0daVwVjzh9iIwCRPKgCD5f3Wep
	7m2vJXtfso6+QIkGH43+ET4FVQNcKPGzJvMdKDt6VbvQIeiIKLBTllEge8rH+zxhthidRwo4cNd
	efyZe0dEljv/pobBkqkjxA/zvEmTqGnU0aITOZQ5GZgQ/v4XWFf7Xs19WJkY9itQ8ATUmkSe/6t
	/DFM7KWeeJewgs6Y5NfB89TtkuuPIu9poSAvIR8zSY+ulnzOoIhBTofQV/aqsNDTaiRdJgioGB/
	KXGqeqm9sieRedBmiadobCLw8EzKxDKz9s3o=
X-Google-Smtp-Source: AGHT+IF/Ymup7R3O0MPCtqJ2+k+DU7xZR1yHupvqfv1pSPCl3LAxQQVQH9psw2+EuEhuOEkaYXrt0A==
X-Received: by 2002:adf:b188:0:b0:3cd:44a8:ffcf with SMTP id ffacd0b85a97d-3d1dd81e4b7mr3682245f8f.12.1756715707570;
        Mon, 01 Sep 2025 01:35:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fab9:fd92:e2cb:ddcb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d53fda847dsm5307657f8f.0.2025.09.01.01.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 01:35:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Erik Wierich <erik@riscstar.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v3 00/10] bindings: rust: prepare v1.0.0 release
Date: Mon,  1 Sep 2025 10:35:05 +0200
Message-ID: <175671570311.38130.14635688801385630018.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
References: <20250828-rust-1-0-0-release-v3-0-0f9c6c1c4808@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 28 Aug 2025 19:43:02 +0200, Bartosz Golaszewski wrote:
> The libgpiod rust bindings interface has stayed quite stable over the
> last months so it's time for it to stop being a v0.x release and become
> officially carved in stone. Bump dependencies to the most recent versions
> available, fix some issues and then bump versions of the crates ahead of
> the official release.
> 
> 
> [...]

Applied, thanks!

[01/10] bindings: rust: make Buffer::read_edge_events() lifetimes more explicit
        https://git.kernel.org/brgl/libgpiod/c/fafd5e6180176247da3e1b57beea2ec558e7352c
[02/10] bindings: rust: add missing unsafe block ahead of rust version bump
        https://git.kernel.org/brgl/libgpiod/c/07b65bb3072ff4c4060d7ecde4902f5f1bfc1453
[03/10] bindings: rust: bump the minimum required rustc version
        https://git.kernel.org/brgl/libgpiod/c/ec4486fde14b9a504ad6cad9444b6328e0df841b
[04/10] bindings: rust: update bindgen dependency
        https://git.kernel.org/brgl/libgpiod/c/e40018f9ccebf0ca12626fc65ae88c2bcd1883d9
[05/10] bindings: rust: update errno dependency
        https://git.kernel.org/brgl/libgpiod/c/1430eb1e9163c76944ed68acb3e51160ead34b16
[06/10] bindings: rust: update cc dependency
        https://git.kernel.org/brgl/libgpiod/c/00c224897d1a5cf664a410736872d89750e5230c
[07/10] bindings: rust: update system-deps dependency
        https://git.kernel.org/brgl/libgpiod/c/4b9924ff3152c79188e803829c39660afa1ade5d
[08/10] bindings: rust: update thiserror dependency
        https://git.kernel.org/brgl/libgpiod/c/751a37fa3784c1feb4656bb89ae4996de7b9ff75
[09/10] bindings: rust: update intmap dependency
        https://git.kernel.org/brgl/libgpiod/c/efc39de44ad92c37b43f363e9cb78bb9dba44492
[10/10] bindings: rust: update crate versions to v1.0.0
        https://git.kernel.org/brgl/libgpiod/c/d0006cc3d57b0e8fe090a1596934340c34e69ab4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

