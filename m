Return-Path: <linux-gpio+bounces-16748-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D89F3A48D83
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 01:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCB5716DD7B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 00:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3754C91;
	Fri, 28 Feb 2025 00:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjiO7Vcl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B2923CB;
	Fri, 28 Feb 2025 00:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740703500; cv=none; b=awIa1YQ34dqG21dX41cvHyraZcdVLHd75uRUN2H2OMr0TOCt98V7dCnFNjlBsGNtZ2GVPSs79wUc3ryyc9Dr6aMB9dbp2uKdcj7BVQq8Bn/d178++vMQgm/mVnwNGYHbJs/ltoBXfGLPqJ+tMb1FCEUpTBhWCbGkYzY9rSP+c4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740703500; c=relaxed/simple;
	bh=+BVA+LhlE0N6RUI8eaEd7kBrq7vA6h/z55gK4qTsgNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pOsaQhFZIMFK9XLyeoAdaUQ3Yn9De2u6r9Pt3PjJTMDwMGp43x8odk/ifkbni469Eo/0Hmukmnu71ohLCatgdnOZNfpAxmjDqrUDknGt2vTRSbTEo+F4OdcO9TN59EwStFsg5VSeaUBHC3rrDjtuYVja1WAEqE9AbaYf2ELwZnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjiO7Vcl; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e8978cca96so12679806d6.0;
        Thu, 27 Feb 2025 16:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740703498; x=1741308298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLTJSgWRvjc6CoalvvtWWj0Jwj6OQsGx1YUrViRKarI=;
        b=YjiO7VclNZMKrlsxvFqpnMczAgg2SflgNeJwWub3BaF+Lb5RbXs3Dn8RG/bUzOH5Qq
         v6RuJpsXEHN/HX4ekajW8v57qrETGNKWqzZxrWQUeluluv2XaZAmuFgmGEHR2+LX00rH
         KkMsotYwcQJdY4laBOo5AbEvIjoNl6d6NS0ZhKvtAGznkcqCi9NlhmY7tHHcyx9FHAK/
         ztpwsqWq7P4kJlQR/apInQCtHm5PvemxwG+yV8SEeZUf1eswGDm3oQH7XWdJJOVYTnXI
         U+EUCsgK5G5oDQpaPQ5KeGz8rvS/K8+EUjTpIefk5TEMdEe/ttKRjbP8B6sE3OQgVueT
         Cj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740703498; x=1741308298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLTJSgWRvjc6CoalvvtWWj0Jwj6OQsGx1YUrViRKarI=;
        b=W4VXyLiFHJfuQJFIUTHW/tKG78S4kMPuYFJ1pTchu8HfaSQ9Rjf7hZiX8ssgXdM2qs
         35YJL/3zfibU0BTq07WgBcH7Bt/mzrv4Z6jLNqTcdfg/0r2qOvBnedOsB1bZs5eIPDkB
         WyhrDGQt+4Ejj338JQpdWp7DSUr8TTs+MaZ+plrlS8wrMi9JPU0uFHZZ1yYbvmO4mcX6
         S0vc3xu1yvhoXb3Aq7HdWb05Oh7xNocHYZMYPPT8PsYz5VxS6tXG03Zu6I8025l094pT
         Am04n0+7xzNu1/yuK8divOEDoTOjCE3fGVfm01bUt7x0tmIxzny6Ji+Y6/X1poDvtNId
         8uXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmKa20jmEOomOYW0m8/SRU40PFPIiflzrGijxpyL8Ty7psU/3MaftKsil6QEahs4Qyx/DkrORxEEqt9pp8@vger.kernel.org, AJvYcCUzrMhK+1LFMCuP7BXrsHv5YgGNkLNWUnrqIkcM3kGK0tpJQn6eDvZdvk6+Vgjsk77eNXkp2k+JHyQc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvhey7/+CmfPst7NyBaY3HMZjyhfCCRfXsfenjaaev7ifwC8DN
	fWx21H31s8vRMjrbRbMNB1yfRpxOaGQuAiiMudfmCBNZGMhpCBz7
X-Gm-Gg: ASbGnctgqqdEJhdCOGGa44HI6olKSPvEFomQoYUAY3emcyoKcK9PUXn7SDromGPoopw
	CP5brxLxXqKIeyrQCjshDL9i9BWyjWEBCkSONLmKrObECemudM+idMnh0xClgH0eeM+MB/0qNkF
	njPGHSXeZ+1dgSuKt5JMDUA+nMUBiIvBRCrB4mMrqvfZuVS1Z1+FCxtmbdT8XKarZ7BiIvCpxlg
	1A56sW8GuIdt4qj/Z9UdPYgLD0+ochxOdn5jfaY4rk7guO4N+UJ2BI7pCHp1hcTavxShOMqrEuG
	pg==
X-Google-Smtp-Source: AGHT+IExRXiQaZ4T0Z6y1z1z0/2ROPkgKVD3wTCSJ4mh6iYNzRlAMui0YNy9pihJ29SSMbnFSyJyCA==
X-Received: by 2002:a05:6214:f2d:b0:6e4:5b6a:9d48 with SMTP id 6a1803df08f44-6e8958a275emr85405086d6.7.1740703498090;
        Thu, 27 Feb 2025 16:44:58 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e897651074sm16039276d6.29.2025.02.27.16.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 16:44:57 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v2 0/8] riscv: sophgo: Add pinctrl support for SG2042
Date: Fri, 28 Feb 2025 08:44:32 +0800
Message-ID: <174070346793.192886.6076012325463673162.b4-ty@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211051801.470800-1-inochiama@gmail.com>
References: <20250211051801.470800-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 11 Feb 2025 13:17:48 +0800, Inochi Amaoto wrote:
> SG2042 has a simple pinctrl device for all configurable pins.
> It supports setting pull up/down, drive strength and input schmitt
> trigger.
> 
> Add support for SG2042 and SG2044 pinctrl device.
> 
> Changed from v1:
> - https://lore.kernel.org/all/20241024064356.865055-1-inochiama@gmail.com/
> 1. Fix the binding documentation error.
> 2. Refactor the cv18xx code so SG2042 can uses the same code.
> 3. Add SG2044 pinctrl support as it has the same layout.
> 
> [...]

Applied to for-next, thanks!

[8/8] riscv: dts: sophgo: sg2042: add pinctrl support
      https://github.com/sophgo/linux/commit/5277657d53834cfbdbb9444088c1448b29bdfe98

Thanks,
Inochi


