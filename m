Return-Path: <linux-gpio+bounces-19157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BD6A979D0
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 23:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D3AD171360
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 21:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D6C2BE7AB;
	Tue, 22 Apr 2025 21:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NgoxUeve"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB9B194A67
	for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 21:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745359173; cv=none; b=rlJsydRHS283hotgKzAYhvvb9BQ4XPsVO1Ft4riNe7NqJKIau/gFJKSSkRBH2E6CnsIJx2Z+ybTppg9YxaXyc6BrzwkPsYvn44woYPpPGL4f+qDt/ciwDvmXLWDPZIjduspD9W+7Lkd+tcwkDb7TTfR1XGNUF1F5BF4kMo5asQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745359173; c=relaxed/simple;
	bh=U1eloKUpvLcA9GCui2jZFjG1h1YdHMXukBaqkpvCMNI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TgJUZLLjr2hVskdJ7cRPyts6jGZV59Sj0Z6HA7YfObH2tIpFC0VQEajJKIktT/bvuoKPxaMdEVUhl/amoWEpj0ESDR/UT2NQSG+atO32d+Y9nCT7jpZTPp5BSwSEw6hxjNtc6o7woZj5v3OdvdhZSsDf9mdC2UMg13RLnm0C5kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NgoxUeve; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso7157969a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 22 Apr 2025 14:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745359170; x=1745963970; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rI1uEmqcTu2b01C2qrmA1jZXWB8YFubhDWYzjuCRXWI=;
        b=NgoxUeve26203xy+7r2SamMrdnfmJSivdNf9IhnTrYEYrJOT6+Pszd7Ja6K4NWr72r
         MB23urai6EtyMtwHYwWsDBVGin0bir3y7lyHyRQl1eFgWV+kr2IJvmkUaKW8jDE7/ULW
         8+mKvHWxtRiIG5Rn0ZOd1X1m7C0jP8o2ZVIQIskV5CA8pyi1OdcEKKFth0IFUu7hyv4D
         dGli0Xq1J/J9Z0CjQQjCl7ILaKdh7PxFiPsbLeTv5ohc508sXVmQhknv3Qq5qgPtrSd/
         Evu7USbuxeC4vC9lQVV4xOwLvGlLFY5S1EIBVcW1DYN/aMCbIK5AVboZ135UQwLT9bzx
         Vibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359170; x=1745963970;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rI1uEmqcTu2b01C2qrmA1jZXWB8YFubhDWYzjuCRXWI=;
        b=gIHDjM+8+i5iS4EZLPVpTySZnRS6/Mnr5cTYKErujgf5tyXb1YLlPuT9WTl+Qr71Vc
         xDiya8UUjDIA9OtaYAGhN1vxnUqjy+/nNBJqWSuBeTbAash3SW5mHjoHa7KRD1O1Sv8b
         XQbclS69L1yFSehdEsdWATXJ8aYYmvBjEKAyHPNSAcuVl3Bg28oQ4/XnfkD/F+5uT7In
         z8oooczFwz5+/Extn/A2FfOSzpACD8wNOd6M+H8CHxuZ9TxB7m++mXij2onnIYCTR42k
         Es5KF/MAlDH+iUvudjLu6EFn5bftQfDi+SzqZkt+kfKpGYvnXxge37/S8X+bBadaIHuF
         F6fA==
X-Gm-Message-State: AOJu0Yyx3rHnYb9+pB8cYBoQ3OO3WiQIJJM1TELAJquT3KmtieM4He2f
	m4RyqstQafAYJPkmxPXUDsWodOLT5KoSH2/QfBvLTKvvtFIHZjEK+oICbK8b6mqSvXKevhyEy7r
	1AUg60mV//wEwuLG9CdlbVvlpW/CkeuhhxBU=
X-Gm-Gg: ASbGnctXEoob7Pcr5BCPR1b8PEW2mdsVT4ihVQ/AccU9WXvfXJXG7UcKqaBbn8O7Azn
	HAtb7dfrBSUEWWqx9QlYabu0q5YChaj7g7qefNWblD2zwoKl6EeBjV0mDRUNjnfVhGH4CPO/jGO
	Vcjfjne6GZSYYqlKHSwWSeRBM2g/O3ps4M
X-Google-Smtp-Source: AGHT+IFmX1wzxSlkp2vhuckSKX9Cv81BoJdRGTF2DtusHmIo2vVqkV/p1NoZHcNzcMWsQojKyEFnXZ5Dp844A4rN8Gs=
X-Received: by 2002:a17:907:7d90:b0:aca:c864:369a with SMTP id
 a640c23a62f3a-acb74b36c86mr1523721166b.18.1745359169901; Tue, 22 Apr 2025
 14:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 23 Apr 2025 00:58:53 +0300
X-Gm-Features: ATxdqUFsZNdPUqlUQ2S9j0R9Idu4Z_2g6RT-ZwTjXZoJBvyYu6OnhlrK3pKfSzs
Message-ID: <CAHp75Vcgk4QBrt3AskmbFviQmNQ8w2HQRZG0jz2U5DKui6v4VA@mail.gmail.com>
Subject: UV platforms to test
To: Justin Ernst <justin.ernst@hpe.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi!

I found your email in MAINTAINERS for one of the UV platform related
files. I'm wondering if you happened to have a Skylake (?) based
platform that uses the
https://elixir.bootlin.com/linux/v6.14.3/source/arch/x86/platform/uv/uv_nmi.c.

I would like to clean that file up, but I want to have somebody with a
real HW to be able to test.
For curiosity, this file pokes pin control registers without the
driver. I have several questions as well to make the better approach
on how to clean that up.

-- 
With Best Regards,
Andy Shevchenko

