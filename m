Return-Path: <linux-gpio+bounces-23670-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C69B0ED24
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 10:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12B283B4A70
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 08:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D982327A10C;
	Wed, 23 Jul 2025 08:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="btXF0PQU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0996E27780C
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 08:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753259178; cv=none; b=FnyhXOXh+GIy1XeR+z6igm/mkjLlvX86bvzDt9dikvzrWiUCFnefNa+0PJ1hIfsh2o0brcxoYZ1QPIwvMKZ+dQ2s6CibvA00rwHesfGCZsSH9Zt33bTLndU67BTp5xcRWyWCp6jTKI8l+LrBk61CH/q818X4pyTuvOg7uTQ2SAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753259178; c=relaxed/simple;
	bh=vLCNSJ4DxVZDJPQ7cVNRDySeLw0NidDKviv2DX8YsFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCloYtLoFCDiKSEau2dxTJ/M00O13aVkLW08ITUgivv7mrp/ug1drL+YnU/i+iiZF7SNfbZbVsAJaHZt8F3IdwcRlyyUjJ9Y+W3WsYWbYs8epAMdRw3ulCZfSU8Pbn0WS/WH3BXpZB+wzytNFXBzW54xnsvEWevsYMota1PyFuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=btXF0PQU; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32ce252c3acso29354161fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 01:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753259175; x=1753863975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLCNSJ4DxVZDJPQ7cVNRDySeLw0NidDKviv2DX8YsFo=;
        b=btXF0PQUQ8CBpakLU/b+/syt2ohH8XXatko/qeordcnK6q0sp+WLur1MUN1z4mbzn3
         5x0AQmp4ByjJRP3W/8K4Yq45qiC2sBjbrgasbPtO3DSUIeBdllLifcHvoe5Hd1Kp8lJ7
         1vY7W/zT1K6gkmX/iEHVwkA+wR82S0FPxLJm7kGQJooRaRTZOTpWtxgAAar++/sFO4tF
         DOkLoR9Ksu6pZGpL88L/9in2yYvtBtEfJM9Cf+Gx239xo4vnobEE/5oNeOq3vFjwmUmb
         5gxt1OfSA4kKhPwCv3mYxkMYOgf0+Z8/ZgYFjfyeyV2YVbNCMnm0VsI7mBksLEKo8QvA
         yAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753259175; x=1753863975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vLCNSJ4DxVZDJPQ7cVNRDySeLw0NidDKviv2DX8YsFo=;
        b=Pc8dOitIXt/ZfeAZMyi9oy255rSgF/TlhS/D2/4TOHKaQalpUUExLiE7A7Qj/jmjYI
         hEUNlEQys0Nvlf/lqjgsQHekdRkCvvuHif+bl9s1gVVc/xsnZcTF8z23azWOY8D1aoOF
         HCQtQ1cKD3CVYWvw99SjHkF0iFv/QE1w8bZBWQetF351VZ/AksGXt6WBF2PrO3dnzYrS
         i1dzO/Ff6JY6LY+sh1Gleq+GDuBxrqqMdFQBQcuIZski6Nr8xZ/6ggPWtLTOiXN6LJCq
         tAun8KZky9exyoLz99qiAS/VXB0FBk0n67iLVmL9glaC2bvp9iBlKT3PIVJmsDctZKWx
         jabA==
X-Forwarded-Encrypted: i=1; AJvYcCVd/LfSSrk7sKomWcnbhL1o3c7QNHve3nSzq7CDDUld34XXdqVIYcfb944Uficanuy53qFTo8q5J4P9@vger.kernel.org
X-Gm-Message-State: AOJu0YyG8VTyDpM6Bm2z4lBf+ro+ZmVn3DrDHXv7WKQHiutK4JjMreA8
	ulycStQIBNRu/yzwoHDI8zV8N64QiwXYZKLujEkEpcB9tKiR0yTShBJtvGriZNDbeGzuUaBzPpo
	gxFHa+qw1mUbxI6o/iqAsEOrC0G8RivbU3HUfL142Jg==
X-Gm-Gg: ASbGncuuh6KQa7rpuzKevwqS+8eCp3HU0TIZHgSJwrgG+9N7v2pUT+tKYePIcE/LMQ1
	aoCLB1ESian8rnjK4zi+ktmHqDgDqKQZTWQ8dxAawK3OMe5XGCSWGKPqI3d6yFobN2YXxa7cQ7i
	r+Rd/c3L9JKhPDKpmbznU+f8QRLrXvTz9Qmixned3zAGNuhNq0OCZ9DYfH4JNgEwrlSZOEpCcqd
	0KwtkvWUG7DcokKQOOvPoh9ve2YPsnuxwVTuQ==
X-Google-Smtp-Source: AGHT+IH0oYbKSpWkVuBf003dbzVvfTBOHHrX9RRO2dg/IC8uEicDJYJ1DtzJrb75NvYCBb14KVroc6/DdzqY00r5HKs=
X-Received: by 2002:a05:651c:40d1:b0:32b:82bf:cc55 with SMTP id
 38308e7fff4ca-330dfd3ffe2mr3251421fa.31.1753259174959; Wed, 23 Jul 2025
 01:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
In-Reply-To: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Jul 2025 10:25:43 +0200
X-Gm-Features: Ac12FXyMa773Yh6jS77vJV_hBM8tHIZDeqZfz8q32XqMPZtq2HvjPMqFGcKYSRQ
Message-ID: <CAMRc=MdFoAa2omJgL__4mRqX5CYyhZ3VU_Uy-Tf1oPSuZdV93g@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
To: Harshit Shah <hshah@axiado.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, soc@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Jan Kotas <jank@cadence.com>, linux-serial@vger.kernel.org, 
	linux-i3c@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 10:16=E2=80=AFPM Harshit Shah <hshah@axiado.com> wr=
ote:
>
> -------------------------------
> Hello SoC maintainers,
>
> This patch series adds initial support for the Axiado AX3000 SoC and its
> evaluation board.
>
> Change from v6
> - Ran "b4 trailer -u" and add reviewed by Krzysztof
>
> Add soc@lists.linux.dev in the to list and send this series again as per
> suggestion by Krzysztof and Arnd. Thank you.
>
> Checked locally and able to apply these patchset to soc git.
> (git/soc/soc.git, for-next, checked commit: 7dfbf3176d886ff9a0c7786942d3a=
89809d0641e)
>
> Sorry for late request, please consider this series for the 6.17.
>

I can't speak for the rest but do you want me to take the GPIO
dt-bindings patches through the GPIO tree for v6.17 separately?

Bartosz

