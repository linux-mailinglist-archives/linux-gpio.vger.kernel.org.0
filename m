Return-Path: <linux-gpio+bounces-16573-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A2A445F0
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 17:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57D353AC6DA
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 16:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FD618FC89;
	Tue, 25 Feb 2025 16:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k7MP4qPq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E3B18C930
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 16:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740500381; cv=none; b=EyQBQeTsz9waxUIW2CaZm3lCDxYYmEeDCqXgaisinVwcDGtot9kNgCtXumh/L8A9MYuXf0LvBY5FkBzkY/iagVWgRpTxwytdf+bKZ7ovR0WokU+CC+EcVSzX6JeBKpJHMWO/tnhzOTVBWFgAwlwM2ss1MocFrMortKGEsk/J9OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740500381; c=relaxed/simple;
	bh=Tyh+RhXcKnxQU4MXzN9oE4S19Yl573Q7D+3G4DQFujQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TD9PgEYSbZJX9j1TN4+Xmfy9B/g8JIq0bgEkirCNjnJA2+80sPcKdOi849B0cfwIZflL9auCUwWSA6DRIs2bM5t+yOnmlcM2uXQxnjV++XeuISR9JxIt0uEZ3TdvO9Zz347BjQoyhRsEJc2hDKR1ZOVJSUX1kffcxrQ9EAw2P5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k7MP4qPq; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5439a6179a7so6464730e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 08:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740500377; x=1741105177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tyh+RhXcKnxQU4MXzN9oE4S19Yl573Q7D+3G4DQFujQ=;
        b=k7MP4qPqpYeHRONUsUaB3AQiPzI+tT17PAiYqwe2IlNhl31Dvapsrxra/EJ0H9j72L
         B+dt+i9rDsNtc8ts/OlZ7DAQ7m4MHo3AccVCLDYM//BX6La1heOfZbhuvV92Xyzw2hjt
         gExQYfX7ghdb2zt3rw5D2GRSN66mG98ky/dnzNfUX+MEOtR5NdFXoRz+IP7o4CoxydCf
         uLOCBMeHeUE45a+B22Ag5IaWbTrotJLkx5IS5XNoLTZM3i6xcfLik7HBKw2QyNZVFsR5
         BzUhG0VxQPnHg00vjvHJKWvekPRTyGai9J07q0K/tsm7kqvgJUUqZhqa5kayoFh5FJre
         VM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740500377; x=1741105177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tyh+RhXcKnxQU4MXzN9oE4S19Yl573Q7D+3G4DQFujQ=;
        b=JzcEuIUUQlZ+yOmys67OICX9ArJ7kUOPLlQU5ekN/HaBZuBk2vMejI9ECIRbCAGX7I
         hcMM+BHwKa4xOR2qZEYx+6NxmY2g54rI/wMlmLli7rb+wlkv3fqUfd3wAufZFMuqgFg4
         hSNKx0wu98x6X60C4EMeEk9LIlg8BFawYpEQnRSPkdntOoJzbyGSxpN8YVu1Z/6m6lrX
         fvsVek4wxiMqjbGFqB6PlT+3JNxscL8FqhoyI93VKdDIgX6QCF7i8BNcJvUeY0ytdtfD
         fTjy1VId6FXdDCA+zMyN5SEy0QRGxxFzRI1h1Yr8mZ+Lg7TiAS5KTcGU4KhruTFJaRz9
         8v4w==
X-Forwarded-Encrypted: i=1; AJvYcCWtt432/fNxktwxao+Df7FXkI6SdPTYsz+lFhqmEyY3bE3VoSYte//8VVDFJmO4E/xGa9lN+2MiiZ9u@vger.kernel.org
X-Gm-Message-State: AOJu0YxeIfpccOs9j66K5BjvH4xx4qC0EcahzqnsgRwU9H8I41h7hMoE
	YsLQY68mf7q2st1MFQuI8Zc1j4YHnLQuTX5b2QIDYWzbqBFxyVqUJaQDxo15ykrYHfFplUS6OX0
	+bRwOWSo2aD2FZkQKS8HgTXYeAfY9g2ho582Crw==
X-Gm-Gg: ASbGncvTKjxUyMSj/zMDqdEygDmR4lz0qaCFndQYCg8tVrv8LB0KT0L282WqkIK63hz
	R8YuAWRjUOERSJB1sTXsnSw2wff133Bhy2br0qs7VTm3rbHqErwQA3IUKhd0sK+lVu4ZZmyVUFT
	VfksX40q4=
X-Google-Smtp-Source: AGHT+IFPKsmkV/8GrQlu1UecaEKHzDdnmY+GOqvsye/6W95YDRH8BC1ZvlN9fdjoiYBCyRDAZX7jrfC7MDoNbdARl/s=
X-Received: by 2002:a05:6512:2353:b0:545:240:55ba with SMTP id
 2adb3069b0e04-54838cd2edcmr5801739e87.26.1740500377437; Tue, 25 Feb 2025
 08:19:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org> <20250223-03-k1-gpio-v6-2-db2e4adeef1c@gentoo.org>
In-Reply-To: <20250223-03-k1-gpio-v6-2-db2e4adeef1c@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Feb 2025 17:19:26 +0100
X-Gm-Features: AWEUYZlYJub0FzdxL7Mpr1knr2_W3_lmRrr6Vhou8bb5JqpMdWieVnvejFVMY8M
Message-ID: <CACRpkda5=nSnYZ5XJsC_A5MhfdPHwcTndjNr4vGfSb4YJ4Bi6w@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Jisheng Zhang <jszhang@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 12:50=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> Implement GPIO functionality which capable of setting pin as
> input, output. Also, each pin can be used as interrupt which
> support rising, falling, or both edge type trigger.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

I really like how this turned out! :)
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

