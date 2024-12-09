Return-Path: <linux-gpio+bounces-13631-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F039E8EB0
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 10:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 362B71886552
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 09:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A329D216385;
	Mon,  9 Dec 2024 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HZ2vIv+1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533FD18DF6B
	for <linux-gpio@vger.kernel.org>; Mon,  9 Dec 2024 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733736400; cv=none; b=oplkrIIoUDJydSxQsnaFsdjvw3Oe4jEsJPjqld8q6VJ5R8ZFPruarUnwo5xccNeCYwZyRG/xRXhRjHt5wSHlFbeX9l2v4dTAK+o98PmiXgJIleMD5qIQ/4eXmDT2QlsHlfVFfUVThYz9LyFAOrCLh4Rt/ZtmwN7iTbAcxwQ1Pg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733736400; c=relaxed/simple;
	bh=S3jXuFMMiKh2Yb7r5nwQWoJG4IrpikONNjCY37QwD7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMLo5hz2hkRjP7LjorycHYuywJWWhu7JPD+wT+buiQjuRUbnqmKcCIzI17E0TduozvYtLQPpGIygVcoCld/UM5px8m/zAHU00IMV7EJhRCGXzo6jU4+I9HIwy+o72fEZJepgNusitJYY6ldO0zJhQI4rzeZuQzh+9yeqJG6jQgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HZ2vIv+1; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30229d5b22fso2819221fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Dec 2024 01:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733736396; x=1734341196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JA7WfMBaWYSOWyPZjVUGr+yIsyS/SHIMPboP5ogrJ9o=;
        b=HZ2vIv+1t91imJFoBW4Qbju7c27QRctMhaAesttafd0sZFtA1TH1fJgm/7THaxEW4J
         eu/enEw8UjmYXSnPFkJgejvrAElzoQxTcGwoOF9lan6iZ4YEeO2I82s/IdTdC+7Ry5eM
         x3lWJ5w7zXtnMF6/E+R+28Jl7a3IJo8gfSTwv4z2TyByIhS/MLVoCZmRO8zmNZobD8hE
         8TijWZkYwc4I7OC1qcQXUYHphvKixkDvDV9A9+UCVIggHOfFVCIRX2nvm7PkIlqSWO3e
         /S58oMps6n3Qb3CORLbToocASJtdEMN2vySk7f+0FypNC5K0xzGKb3wXyoVZBQ+hdIaH
         a1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733736396; x=1734341196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JA7WfMBaWYSOWyPZjVUGr+yIsyS/SHIMPboP5ogrJ9o=;
        b=rl7iCjnDrMc1/t1VnCRUrn8sSa49R7MwcJsYGAGOcK/JnykoUvu1U7kACN5fKkk0U1
         5X/5/hKbc1fLWzpWWpFAsHUcw5WQ7MGuQU/sYUBjeON7XY7ZkYy6b9PWaevhMGiIel9Z
         FTfvSDAs986uzKWuKsi2Va8vL1d1u6lALdA3hx7VMD3OAqQ03LKZen2kTscyz3qXzplY
         qZPZsTx3t4AuPEhWzQUYZ2J+0frFUDOPveV9ollYIHot+klK/DgICsuS6qSXhJc2hZAA
         erlHYfErp1gOF+5RcALMlxAF9s2I0+zA3zQk7WNvLO2An/uJbSVo7+xf65Uz79Kwe+eF
         ta4Q==
X-Gm-Message-State: AOJu0Yz+p2JpHIjplY4FaD9jfJNuFV0fDGZhqz/PyT/mggQfNsxzN4Cg
	GbNP1P8cCqvq3yKDyyQBKg0DG6laizpEetA1Gifkr8doqzhqDXuqcp3sGJ2CWIWJe2RMcmHlO86
	XyzAaNXE/IR9p/2D1i7z2q0A9IltrX4sCd8ikT1KxKCIaVQVq
X-Gm-Gg: ASbGncsPMrynYWGTSGZi8NXfjae6saZda4LAJK31NVeLE2cYqsyDnd5AYnjggGBDNiy
	u5ZBPa1EUwKXNDy7ho4Q67cwFLm0WHtGRELCxFhooV6yNaIzG2CfXYuAo+3kHBgw=
X-Google-Smtp-Source: AGHT+IHVsOZgryC4h4VjxC7j6HciKNWsP7C2j4MqzsjCzQl2X0gPVPPuNInO4s/JC631gEidDwqq//1/DbQ48OftW4M=
X-Received: by 2002:a2e:b8c9:0:b0:302:251a:bd0a with SMTP id
 38308e7fff4ca-302251abe45mr7651591fa.9.1733736396034; Mon, 09 Dec 2024
 01:26:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204070415.1034449-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20241204070415.1034449-1-mika.westerberg@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Dec 2024 10:26:25 +0100
Message-ID: <CAMRc=MdadVG6B5cXeRubNqBXFAJYd4zFOg93DPpTFJetYH8XYw@mail.gmail.com>
Subject: Re: [PATCH 0/7] gpio: Fixes for Granite Rapids vGPIO driver
To: Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	Shankar Bandal <shankar.bandal@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 8:04=E2=80=AFAM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> This series includes several fixes for the Granite Rapids vGPIO driver
> found during validation.
>
> Alan Borzeszkowski (5):
>   gpio: graniterapids: Fix vGPIO driver crash
>   gpio: graniterapids: Fix incorrect BAR assignment
>   gpio: graniterapids: Determine if GPIO pad can be used by driver
>   gpio: graniterapids: Check if GPIO line can be used for IRQs
>   gpio: graniterapids: Fix GPIO Ack functionality
>
> Shankar Bandal (2):
>   gpio: graniterapids: Fix invalid GPI_IS register offset
>   gpio: graniterapids: Fix invalid RXEVCFG register bitmask
>
>  drivers/gpio/gpio-graniterapids.c | 52 ++++++++++++++++++++++++-------
>  1 file changed, 41 insertions(+), 11 deletions(-)
>
> --
> 2.45.2
>

Andy: any comments on these? I'm willing to take it for the next rc this we=
ek.

Bart

