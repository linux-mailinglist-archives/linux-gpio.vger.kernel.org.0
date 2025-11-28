Return-Path: <linux-gpio+bounces-29185-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FCC91EBD
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 13:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E9824E9E53
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Nov 2025 12:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86393101BD;
	Fri, 28 Nov 2025 11:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RYz2pkfO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354E830F921
	for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2025 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764331160; cv=none; b=MHmx7F4zpgetIp4oycW/dYspDWbKDPy4CGzZOhEL+UlXo1UTboRAQN13pEquKm/IFz6afQS99RYhdnXiWuhJa1ui7bumyOE46VpKqdfY+fkj9qF9ECTf26m78AIM1xBJ8Odvf49edGrqG1lL+Ql12I6CyhxYTv+a9Ws/Zg2qMXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764331160; c=relaxed/simple;
	bh=FlbAgT3Fsp2QFJzt34+r8ldrh8ZXqT2HNPYCtznDzS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BN3C5vg6p7tkHKwETM4Tam8f8bh9vqbVVhWypWOiEFijPVYjolNSoc5IkXzegCuwlZIrEpV5Yr+FprWn4maxV2COFUToESf5ZOXi2LOnmSWDDjqTwZ96UtGdpzYpKldJ+GmRETrhmNDK+f22g79KOgI64uSg5PPt7aE5E/hLZcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RYz2pkfO; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so12001375e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Nov 2025 03:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764331156; x=1764935956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vzfBzGWa4ODlWjmtVQJGXcxzSl0srJUX999pZiDEZM=;
        b=RYz2pkfOC3r0KSprW4Padgmrs0rX8dI5UmoPz1j2XzZpKqn7l7gM5bHjI+aneNdYCb
         ZasOLjyJrTuVaiO2+50NojV8ldqAbxgVwFKO+LuAnBVKqv6e4NQFVdhVdk2VS+kWKVaq
         prfKfXdabAYpJFy9iPPNS+/dBejuf/Sp9aBS6dZu8ESfY83uOcGR3ZRWgvElxqf7vzzj
         LaGyT1fWMcbqfUz15wtgjkc2m2dNemEjAVhu9mnYHPZFBrjSUdPpGTrNABtli15MOXtY
         DCixrXWz/k+QtS+8E5IAZjRkUeET1MO9LCytWM3Dr5ECt4fbM3y6Rgfe+uyTCfJn1qT6
         1Jaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764331156; x=1764935956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4vzfBzGWa4ODlWjmtVQJGXcxzSl0srJUX999pZiDEZM=;
        b=pnjeYvzqLLBzw1mTc0aUw5SHnRzrySqxOvLqSrm94p+Em2A4KoEkaGsejQ7hHSKjOb
         VTVdMg/4knmvc0YGO2PsvIhYamAOzmbif1nz/N846I9QAw7kCr7gNM3RviTc7SdDpIkv
         NFDX6jJboMXGECFjJga0kvyW9M2OqvNcEruKWAmMV7rE0BDKhTAL6D5hIl3+Vl7fhe10
         jkRXJGxCuPvfCOjmCaG9ljCQbMVzzmmWPEzxBlYHzf0Qmzea1ttUOnsNbqlrKkw7j4OG
         FEqMO48yjHKwtO+RooZ1DYkoHBxUOnBxiuvf3mEDLR3h544uKsrYOTfWV7HPTJ3VFTy4
         CC/A==
X-Gm-Message-State: AOJu0Yw6D34THMnyUy8jafin/smz1S7lD4VThC0nVF/zZj9a7TyQ9YjJ
	5RvzCaDII9tjWAJhTYH+m5mYajJ1RCqXXNCljLwloMjDgpH5sY6hh9LYtdk6SC/8/JtiQm/zB2L
	wXVWz
X-Gm-Gg: ASbGncsalU4VhtdaB5dnAh53sHMuOwwsGDDzKb395AB8JKTuw/sabJNd2Ad3J1HvgWu
	SbBIue2Sp2Ze1iUwUL3+0p8lujq3PDOGwHAhLaKm5EMhHl05WShIEDh7TrmTMKZEj1hWrolN9eU
	CUOfGMzVnQ21C/Im713Ep1Z6H2EwBFE0dA0uAVgd9Uwp+ESA6wGoeDJl6PpaW3Ufqq00XvlkaIY
	2IJKu1ZRZyacWSRw3aXeq4hwloMfk+Bah68avmXZxmeXcUJ6PjF5YFisMpac4ORa/ohuVgghv4f
	NJqcPQZIbq4igfcdJiddkKSP3vPacfVc2vnW0qYQ5gnxUEys1e2E5m18aBWNjht4Zs0IEY03XRv
	pGJOM2UCbUkfXph6PZf988lH5RHO1681BtlrqGS9ZwltcRV7NSJgMBkmKb8y7QwOxjTt9D0Hfos
	KPFeJZ
X-Google-Smtp-Source: AGHT+IEblarfzojmnW5H0khhj7fcQLRiTfu2IrK6EsUrlrrVoe2bsVmRXDHPwcSd7mEc/1Ggu5xZRg==
X-Received: by 2002:a05:600c:460a:b0:471:700:f281 with SMTP id 5b1f17b1804b1-47904b1b2dfmr89703405e9.25.1764331155967;
        Fri, 28 Nov 2025 03:59:15 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:f3c6:aa54:79d2:8979])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479111565a1sm81343515e9.5.2025.11.28.03.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:59:15 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Mingcong Bai <jeffbai@aosc.io>,
	loongarch@lists.linux.dev,
	stable@vger.kernel.org,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: loongson: Switch 2K2000/3000 GPIO to BYTE_CTRL_MODE
Date: Fri, 28 Nov 2025 12:59:14 +0100
Message-ID: <176433115039.40295.3243947969244377474.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128075033.255821-1-xry111@xry111.site>
References: <20251128075033.255821-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 28 Nov 2025 15:50:32 +0800, Xi Ruoyao wrote:
> The manuals of 2K2000 says both BIT_CTRL_MODE and BYTE_CTRL_MODE are
> supported but the latter is recommended.  Also on 2K3000, per the ACPI
> DSDT the GPIO controller is compatible with 2K2000, but it fails to
> operate GPIOs 62 and 63 (and maybe others) using BIT_CTRL_MODE.
> Using BYTE_CTRL_MODE also makes those 2K3000 GPIOs work.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: loongson: Switch 2K2000/3000 GPIO to BYTE_CTRL_MODE
      https://git.kernel.org/brgl/linux/c/dae9750105cf93ac1e156ef91f4beeb53bd64777

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

