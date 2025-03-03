Return-Path: <linux-gpio+bounces-17068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0684A4E688
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 17:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD2517A15F8
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 16:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C7D296D4F;
	Tue,  4 Mar 2025 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0hpmpH8J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0DB296D48
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 16:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=160.75.25.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741105350; cv=fail; b=W0b7Vov2KeX8hejIAUCeeu8OM0QiMcRCtijfA5MFArTiGNNhSG/iozv0UrWyqOcKx4SzZXtpBiV1oCEpwuiprba55dajigrxVfgZ9onU5LsHOuZb93Q5845CjAMGAZf5pzFRObHj/cjbyRfhm3a/Qtdpdh8UAzAmdbaR3Jad2/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741105350; c=relaxed/simple;
	bh=OAmini2Z2cn8RKByVr2VpvTDlq0E4urJonlY1c6F9jY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TFAiYcOaqFdUMAaP9M673N86eL0RAormGoiN1jEkYJLqH/J7kETHbQTVj1SRnWMZ9AF48vVc1Pf1JJz5oHNEAX7VJFmm4GardN0tGm2Ahds4RdVwWQy3wGhv6jWRYNxQO4A2w7MSoROgp8QaC2huJywojcWSuoWFDOmVU09uS4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=fail (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0hpmpH8J reason="signature verification failed"; arc=none smtp.client-ip=209.85.128.53; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; arc=fail smtp.client-ip=160.75.25.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id 48C8840D974B
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 19:22:27 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Authentication-Results: lesvatest1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=0hpmpH8J
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6gsD5LYTzG2wF
	for <linux-gpio@vger.kernel.org>; Tue,  4 Mar 2025 19:20:48 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id C513D42730; Tue,  4 Mar 2025 19:20:43 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0hpmpH8J
X-Envelope-From: <linux-kernel+bounces-541166-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0hpmpH8J
Received: from fgw1.itu.edu.tr (fgw1.itu.edu.tr [160.75.25.103])
	by le2 (Postfix) with ESMTP id C9D8341E3C
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:35:38 +0300 (+03)
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by fgw1.itu.edu.tr (Postfix) with SMTP id 1E2DA3064C22
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 11:35:37 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A73747A6D26
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 08:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426DA1EE005;
	Mon,  3 Mar 2025 08:34:55 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE83B1B0406
	for <linux-kernel@vger.kernel.org>; Mon,  3 Mar 2025 08:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740990892; cv=none; b=Nl4fA7ZkCkcMMiB9Ih5Gv/ksgKlxJkaoSXz5NUqUAd6hGvbJr3uqSJZrWocB6QVdBb5fr3ruaUB2P/vt77WrQbXI4J+HSrNXrgiyqDpg0s1yuw0X5R2yszHxGwTih1g7mwQSF5wPr56y0gxF5e9B0ZCAPGODpUM+U7Thc7d4FMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740990892; c=relaxed/simple;
	bh=Xu+R9dxCaKB3LBzWEXohsvaFOO89yN7GursH9EJ00LI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OruOcOno+uTQQywe3urIrc02W1O3sylN+H9urxuQhjXA/0/YvIaVcfAPfAF3gyz3YQJyLYu8ItFTFIpsucYB2LZey1y27JuFpgcQ4Ab7djsbAZ7BX53ie5iDG/wpSn2GInw9uTLUtfqx6SbrBwGlU6clRkvAN4WO+g6RR0UOX1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0hpmpH8J; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so25596155e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Mar 2025 00:34:50 -0800 (PST)
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
        b=AzpYZf2/WgYIU26nOw0I1kE9D0+8f2QDyGQWHIRn5u0jso5KL6lKJ1KcpW8VjFv0QX
         fGxyQv8HHpiUXqP7BEGeqTPmv+8jiUPBgdUyVhbWB0n7K+3X87r3ksRgbrRToyLUtxqK
         dM/VsRtSegEyQYYPywombuOTt3aC0oteGWpb+wFDKr/oEh5fT9s9xhCtN/B68+QPIPBn
         IUy/b6ErpM+6rYk8NCUshzGgOpMiF1sEccjYKbn37jQd0xz4PCN6bd7p2VXy3OjQeuo+
         4DLbtl/Wewl60Kz4K9XIozIxlO8/TO+zlGInEF7qgroaFc1CEy2H0oyuspHWlZReUmjH
         uzFw==
X-Forwarded-Encrypted: i=1; AJvYcCVMtfIvrRyvUN666mFxPLI/rJ8awWR0Mal7eJb0QGFP2vJWwQsx6N7Ify5KAkia31IzV1d/KjcotvdIE9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxeeg0NQf5lBZTz97U/6e749B6Un7fAqGbH2a08eWxZlsl0+T4P
	KXM3kpMjoWMrtnSHJgQJ6HLdpXj6CTAzeOvIC6W6ZjvH8LiU2LZ7+y1B12FLGTk=
X-Gm-Gg: ASbGncvtP4vak2xduKGLpKkKoi2MsaLqOJgs4YZnV4Q51nYlVmyBlVprMx7BJ22bNMP
	bhRHvpNW3NqEmfDIBaB1MEN6+XIN+xhvAE/Q+TNLcPgbxMdvx82PVSG1MA9nInoCPS/VLvAfxRK
	93aF68ZxJF06or4PjeaNgu8tVhLVvBPLUT0+BQNMYPNbRnJRgcig3bvs1OZqMuuKXg3421pFFmE
	jEBJe4jjl1AATdnDILmPY2gDrvCGPWndepo4QeVCAuOgainDEnyXYH72u4S4KQNl3XJavw0C4o3
	Eid0C+ynVEUryVlYk5kTPMmu9ad9Efx9iYhpU06tM0nB
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
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6gsD5LYTzG2wF
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741710055.4484@dSsMSsUY5oVfkwYIUrDvLA
X-ITU-MailScanner-SpamCheck: not spam

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 27 Feb 2025 16:28:31 +0100, Bartosz Golaszewski wrote:
> GPIO drivers are not required to support set_multiple() - the core will
> fallback to calling set() for each line if it's missing. Remove the
> offending check from gpiochip_set_multiple().
>=20
>=20

Applied, thanks!

[1/1] gpiolib: remove unneeded WARN_ON() from gpiochip_set_multiple()
      commit: 8014097f1466f7e034844770c537b8dc7d98811f

Best regards,
--=20
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


