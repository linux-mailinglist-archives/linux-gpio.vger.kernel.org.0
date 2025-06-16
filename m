Return-Path: <linux-gpio+bounces-21648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5A8ADA9CD
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 09:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB1F63B472E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 07:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467DA69D2B;
	Mon, 16 Jun 2025 07:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Z435ZTsM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752CF54BC6
	for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 07:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059846; cv=none; b=sYmu4WmUQpv74LHJ2HTiMd2P3Y5rDiqxsXbx3aySJvluKzkFkLecTR7KBmb6iEaYk5mWGvSEvwBg9n4ljEiEtCk6xRi5s927wKlZn/bto8/AqwNF3oy6ZYd6kGyEwMnoXlCdNc2yAKzV9s4bN5s5hLfkr92nTX+fFXFZnXMjbkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059846; c=relaxed/simple;
	bh=96OTwG6/iG28bTHQxzabxipQYNEL3wxef+/smJwNLYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eCsrgAEYHrTJq64i6PcvQcoUThmvfrdEKiiZ35d8WRadIKkGwhlwYVg2kdfumuCLWV9Aoz11jf2bj76wDfEVs3ZINrNVjCwPuKnPaC+2F1qcCWESh4UVt1We1WaHM76621pEdQiTC6r5Ftz3qasgcUkugTJLaFmvJlOOhcmJ5cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Z435ZTsM; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4f379662cso3677788f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jun 2025 00:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750059843; x=1750664643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMMpwu5AAcujXLKEmXFe7RXmxtH0nNb2sC3DH3erLCo=;
        b=Z435ZTsMXuSTzLbdaj9DvTUKeNXMw6SSI8SBIBb0ij9yKQBdAWP01HdNDmzvU0YflM
         elW+Tga49TwVO7cMWk2OIIJWxE41HvpqmJfGrQ9ajy4ItCaM4AGxfd021N/VzaCzRzK2
         Ylr4cGsqXlnWTemFF8JcwfZi1GmuSltB2NIOyLVyi1Dafo3KOl6OwUrKsY7enUoZhZvW
         24+4oRaqKi979kKXuzGZp3HazdKjYzECWadIIrErFHDdMdACSHNa6shdP4jpyVt+ryf6
         gAsID2mQVBdNXqoNe1ElUnLSB72ATk5S+1YdPLsuLHWekNG57PDfCppQ6aQfj+pyUf7T
         CvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059843; x=1750664643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMMpwu5AAcujXLKEmXFe7RXmxtH0nNb2sC3DH3erLCo=;
        b=tKC2PTNqy3UdFSdIIXQKnzFrRmHtwYlXuf3jS74HdcFE8Vgc/PAhNSgSt+1250is+U
         U7I80m7XfDALfPgFg/xel2BhpCFVvNpO+fWfhKmPxNPllXRlIcQi6NYrkbXyWWpfspzQ
         eXnNDC3ofRJQe/ZVYPq9fsR4YJ6IGw+tJESIB2MHp511REAKNhs2jSkeeniXCORRYEK8
         TH7MQuAzlscf2nPNoHZERJtO9XYXeR2KngDGPM9OrzX+Wofz7kyH0qX8De9+c1bGpPXp
         LLbNSfjZwWoPFx0oWFzgqYY3QMCfHGztAORJPxe7CGrDcrFB/GAX0FAABBtphPSxo+9e
         1SaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7nL0FKp74rL4+mL+WYFntp5/4wTCKRqFXc33pXkAHqje5aFK1yblUbByP0JLUVLTUCpGYN/j2CKAi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/qTc9i0SOxMGKXoU8lxo1zGZg+ZL+DoXd6jm6e9I8R0AAXg8Z
	gdNhP46f/Pig4NWpy3LR/Vp8UccdYMuANziI8Rp62h/Jvi5U7IYvndBNKGSVqEuarZI=
X-Gm-Gg: ASbGncsWVuSSauDUrdO4Oas5D9lvDehtl8EE5vCGStzQb4E3dkQshK9mP8R82HB8RhT
	rBNgLKan8GY5/SbZxMPBuQpnkb8p7iHxp2wJu0KKvOHMISnq1kVn7jLiHK1l4kY5uXXCEHQ4k6n
	gb+d5Yxh3ZSCK3p3SDD5mftvoV8SPQUSQXmbHa7WV18RxmfLuP8HkwCIqHSjHFHaldrreDPAQjQ
	HhZ462FGiIHNGah+1F7ZgZYEYgxkKYfElCZaiCQqKPGa+EpvBCiQdvHkX5nPpBUclS6vII4krUz
	XP2qD30mCMpmYgq+r3eoaT8LmSdpZ3F5jkJUkavBcvtHbJIfPgdxYwgDgcLQm80=
X-Google-Smtp-Source: AGHT+IFyiwrOAI2w1hU8cdsv4G6PwQ9rykHzyJGCDN95ThomN6k4mm9h9BfNGYN1cWwJ8JWTOJssQg==
X-Received: by 2002:a05:6000:400b:b0:3a4:f2ed:217e with SMTP id ffacd0b85a97d-3a5723af786mr6649593f8f.42.1750059842782;
        Mon, 16 Jun 2025 00:44:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2618f0sm134543945e9.37.2025.06.16.00.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:44:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Vivian Wang <uwu@dram.page>,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: spacemit: Add missing MODULE_DEVICE_TABLE
Date: Mon, 16 Jun 2025 09:44:00 +0200
Message-ID: <175005983908.15867.5595150226500672210.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
References: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 13 Jun 2025 17:25:33 +0800, Vivian Wang wrote:
> The gpio-spacemit-k1 driver can be compiled as a module. Add missing
> MODULE_DEVICE_TABLE so it can be matched by modalias and automatically
> loaded by udev.
> 
> 

Applied, thanks!

[1/1] gpio: spacemit: Add missing MODULE_DEVICE_TABLE
      https://git.kernel.org/brgl/linux/c/e6382fcf989074566bb9a54bbd3c514d7bb99397

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

