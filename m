Return-Path: <linux-gpio+bounces-28327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ECCC497C0
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 23:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8ADFD4EE40C
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 22:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6ED72FF663;
	Mon, 10 Nov 2025 22:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cSkdu3Yi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B690C2F291B
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 22:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762812411; cv=none; b=gp8sO38hGVw6h50C6+zC+Fyur677XJDfulMfBrA5F52z4kVqB71UZEFpbB/d12Js6gpyslCP2TVRaBEtDiQUqUGdCUv6LAiLZpgLxMCKahPn1JQ+bK1WMoffalgPxkQ/kBcEENAG581C32l906J4+g9Vj01X2bVHx4fuGM8WMTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762812411; c=relaxed/simple;
	bh=xXZgjWaGsjtjyK4nxpOwSLGYS0vLSwxvzlJb+Yn/9Is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bEE8yydvU/ujbxWJDnGNriivkQdKkLGBfk9rVa9rxYhRkZvbIMWdiU70wJtUOo2jodlzPUDMnQji4FRMvg/YcRYlqx4ghsfSme0haMoh/XmMXS34LOZQu+dPyqrw4ik6EuUPle7+nTXh2pLqnGrzGqC977w/AmeZBnx0Tn0vsjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cSkdu3Yi; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5943f39bf9dso209570e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 14:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762812407; x=1763417207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXZgjWaGsjtjyK4nxpOwSLGYS0vLSwxvzlJb+Yn/9Is=;
        b=cSkdu3Yidyt3Bya8LYM4UhdQ9D7AqbdWE3ZHcjGwgFSVXtSxvgv6NirnX4yQBuvCdb
         AiM4Ije4UK+FAFa27OmE9dZu/z468uIIxLPqPAg4oY8RgYs5FQVs98p3b92wz5j+URV/
         WiYMUHm51BA80/5Ym23Fmi3exQty+Yd2vK9X3ebIXtNcZE/ISwFglbVm7b/2lgebP7qJ
         LHPEWHwT4uhBIGyyxD30ZDtgMXsP3SVyV4OpmN5K3ui24I/1FLsiLAsKyu0Gi4pfB0QF
         Y4TB1pXGEjlKjE8VdneymUGGPOdPB1BDi27EBhQPSTlbgRfczrlvL4RgkX7X++08hOVZ
         fdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762812407; x=1763417207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xXZgjWaGsjtjyK4nxpOwSLGYS0vLSwxvzlJb+Yn/9Is=;
        b=AKnXWuD0R4in19T6f08DOJki4JSo51l/HzS7+imG8eKY/R+ICTl7LPOkv3/uUS4hQj
         X0uy11PKBG2ORaIqSVkdEiBO+EJAp2GqnB8NIg52e35iKXnTPjbD/tSGjs8hoYJIivCs
         rtJXiG5bYoRaRA+5SqdmRZgst5qaBxPQc4t+tULc3P/HLLW4A+tZpfjfzBUXAfKr6cvp
         5WorvgnxwJM3b2+ozid3XO6ncpZbyOweOS9Jy6WVI0/tjrjd2C+tN78vFv0diH3tStav
         /FEoS/A2nM3F9kPiiYLElS4tXWdvsg1aNJTRUro/FTVDmCD3CHyqCN6G5hYIOjJOEukG
         oIEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8GdJNIB0h1WPJHy1WR+VWYfUHY2zjyIvOUu3RAs/hMBKbAegObUN7gRB02LbBBHogMnvcNCPkRhEt@vger.kernel.org
X-Gm-Message-State: AOJu0YzpgWL4BK8rzGFlka04qjE0ILC4vFTTAcC3t59yoB4a5xI7448g
	76OwEKDyuNTxyE1eak3k7kIJLXKmlp8ENw/gQ7GdR1h2r/YS6hWhtei37/iOUXEHDHQ3btDxxcJ
	BwQZurEoFVyPyC39/B5TP+Cw8UwO/IaS+zoCUNx9GbA==
X-Gm-Gg: ASbGncvRJGZEU9tE/zzvfgqB4fZafBi0FThLMp4dLfAfQpikbZlanonJtWoyFT3Mxmr
	NwvF/xKP2HhDaSwl1PNmWBJrLVKw5Rz7eLyiv+wZXIwde7yHMm2ssVjUDQnjG7TZY4fkbzs4LYa
	ZRfXTTy3d/Yn6CkMilChhKyy+cvx5FWGgqrEB5EqrmMvvVSoAq1ZSy9+qfdJ4cLP35DAQblzkE5
	pxGCkEdNd05P1W5xeviI+OXxWDPxZrv4AB/59vcp//u2h1G8R5kQG4dqHuI
X-Google-Smtp-Source: AGHT+IErlNrjMWVBENtt7rWg4eiMuSxQDgpiu7GDut/PIvzWMuyY6ova8I6wPaeqSNbt9KEyx1863SSytMSkdAudT7o=
X-Received: by 2002:a05:6512:250a:b0:593:ef1:f62a with SMTP id
 2adb3069b0e04-59474591f8bmr255563e87.3.1762812406721; Mon, 10 Nov 2025
 14:06:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101074131.353640-1-dmantipov@yandex.ru>
In-Reply-To: <20251101074131.353640-1-dmantipov@yandex.ru>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 23:06:35 +0100
X-Gm-Features: AWmQ_blRdur7zem7jprzkkbr0LXEoW5tF__f-Q_RUfSZDUEpoiJBTfwJQQ7M76Y
Message-ID: <CACRpkdZnTwBB6k+dTJHsWWY4Z83H6NCWnELVFkv6Jr_V3vQ5Bg@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpiolib: replace deprecated strcpy() with strscpy()
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 8:41=E2=80=AFAM Dmitry Antipov <dmantipov@yandex.ru>=
 wrote:

> Prefer 'strscpy()' over deprecated 'strcpy()' in 'desc_set_label()'.
>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Looks correct and makes sense:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

