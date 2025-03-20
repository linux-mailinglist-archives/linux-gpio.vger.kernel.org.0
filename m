Return-Path: <linux-gpio+bounces-17814-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BCAA6A0FC
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 09:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 068488A3F1B
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Mar 2025 08:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A2D20C000;
	Thu, 20 Mar 2025 08:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kev/cw27"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D640879C0
	for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742458528; cv=none; b=OCQVyMbZXvYaSubR7Yso40TaAMbF/afa9qx/kCx2+KUPkBXKOJ+2s5/d64/e/C9rJ6b+0+c38euL/59KUVCLRnFm897vhp9buBemmrS1RBAIodYzLa/wnRfxSJVRnQVWSGxLHlNMx+eKkt1ZOvClTCngDoOLy/IHwQLHUReMpgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742458528; c=relaxed/simple;
	bh=5ApO/4Mq6/c/yyrAg2ZeBEOh7YyHDdK7eqqrHOKWL5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SG9AdRtTx+jW3fLoWV/p/1rWm9deHHg8Lh2FgOtlpegzppvyTPEjyF+byU3wLBCrW7kCYGo0eMxjKbM3IP8DQF6Goe/gRdHEZw2RWztmEpVE/N4tXVlxrpqy+fLCJN+BDgcFJtPyZDwDhBmlTA4UQ7jJ3zLkMwhWoJCwNMia8yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kev/cw27; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54963160818so744250e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Mar 2025 01:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742458525; x=1743063325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ApO/4Mq6/c/yyrAg2ZeBEOh7YyHDdK7eqqrHOKWL5U=;
        b=Kev/cw27AYXer69vbXq6N0+uRvtggh6UmLSuZGy+6EROHfMDGACgV2g7KF6Yf7YFly
         5nE26pzOvH0gdB7hrKqHTjBZYNC6r+HQ/inLXRyw+d71R8KZqZzHcgmzlSxAz9moLflM
         0pheaWFVy7IDyjbDQmAc1cFfN5JRUovDRwjlTLOYTA9XHZgLh7QYH162HaW7oO3JD7nm
         pLop8X9PevpF6cVlZMkiXMsgnv9PTxTm6M8ph5b0qLsnP7pudypwPidaF/QRXirJV+OZ
         Ob24i700guTuJ+waTHCQQ/Bj4IzYnxe9qqZsWtXhGeXm2ZnLhuDlVjsKJ56tL2fdKcp1
         pgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742458525; x=1743063325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ApO/4Mq6/c/yyrAg2ZeBEOh7YyHDdK7eqqrHOKWL5U=;
        b=NWJE2i/I+Ut9IhzZ1IS0N0+jJzEF5qzwhTUYvRdexIz4iy43aNCPA9bfKgfn0xHok0
         A6gwT29xX2gsCZaXMky/Hm7AeCv7Eqzsfyi7mewEkLr2RkuAe85ZHN7FNU2Qm1W2jmNj
         4X0x7Cq6yt4adxGHsTK4Pc2F+/JjYHa1KhWJMbjoIKKLhPcXdijwGKmzIwHIsaKpemPV
         lIpGHJ6xIkJhqL3IKzH3NfyRmV7BD6Ajn685RheF5/Ulk2ZwZzG/Oqstm90hcb25vVBz
         M/tFyQtPPQd4tlb45CI5e1QsnMhlripTOTMWOeZxlJKuYkog72qRx8zY7A3r6wyc5pKf
         xhRg==
X-Forwarded-Encrypted: i=1; AJvYcCW9AjrdkxuK/aOh9l9z4G9YtV1ld16fuVDfB9HCCEEIHC2XV2fXStEiY2L7UGmuZNmO7NyVmd8xEFjo@vger.kernel.org
X-Gm-Message-State: AOJu0YyJxhn5GJB+1Lc+RS0Seym1ezuX3OIzfu9hSBZCSXKLMfGcxlvh
	hTcrC2zDqMKqxiarIzxeQHIqJ5qos3F1hMRSOI3wVPfMbgfZHLYL1bNi2hYrC0rSwcB+2buhP43
	q/WskbMspZN1OxuUmSygKjjJNKg7u1guRsXGtWA==
X-Gm-Gg: ASbGncvBSds5WQ8pEGVj1QWo3K6aFrMpzNX9CZWKB5d+N1rOG04stU7OM5jXkrvwbD8
	nvOQmC795CUU0GVKV+tpiCICERC7qgpo6B0sD3aNjUBbWyJhUifwN8n5yDuHwsa+LzFnUdbCEoV
	t7lecyIsKk4Qdvx/2jDKp45FSjiD2h5Fxmiw==
X-Google-Smtp-Source: AGHT+IFt36qrZTs3jVigV6s3o6UseGY3Us8oFZFiBf9nDZO8WAVJKTGbrIYvbTde8JRkHb4C+HxFUH8jfnNdOZIUwPY=
X-Received: by 2002:a05:6512:39c7:b0:549:b13a:5d7f with SMTP id
 2adb3069b0e04-54ad067f248mr760711e87.41.1742458524964; Thu, 20 Mar 2025
 01:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250318105932.2090926-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Mar 2025 09:15:34 +0100
X-Gm-Features: AQ5f1Jq4MkD-TA_HtM3sgjv-P_RV51WIW1wiOeKXspOTGRepAHST2Ro8gvkc5rQ
Message-ID: <CACRpkdbTKytFgdqyDajpcfENagSXPZhG5hbpQiGF23VHqLd9_A@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] pinctrl: nuvoton: A few cleanups and a fix
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Shan-Chun Hung <schung@nuvoton.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 11:59=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Convert Nuvoton drivers to use pin control provided data types
> and more of device property APIs.
>
> While doing that, fix one non-critical issue that sparse complains about.
>
> Compile tested only.

Patches LGTM and we are close to the merge window so I have
just applied them.

If there are any issues we can surely fix it up in -next.

Thanks Andy!

Yours,
Linus Walleij

