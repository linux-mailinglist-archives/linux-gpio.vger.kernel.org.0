Return-Path: <linux-gpio+bounces-18807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E85A89527
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 09:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BBC3189C0B4
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 07:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2073E10F2;
	Tue, 15 Apr 2025 07:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mkqh3D/d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E682417C8
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 07:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702351; cv=none; b=YcUx3hXSavADN+98wC4zq0FCzTLlpEWSIBN3fnC4b8vgp2WapBeUV/pMqqAQXpXsldE5j2WCr33efKLVgw5zs+2AS3mo2r5jS1kbJpTnRlLSDgkvjQ3f5RHUmVzEEf6YAJNPQomJZLNEENSWVQJRL2J4ym4trMutNsML2wTpbQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702351; c=relaxed/simple;
	bh=uhQmXgGKa1sqrAMlJVJ+qW76qWOZbNqD9bGXFxISbmo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dLDOXdYKQ9f3SvkkK8D2p3Tm9Dtm0FOn0LojeDK0+sJyQ+ZznD+1b057jHxuciBnbxAOms1huwNRPcqrhcalZAXqrQIR0hqUEGETKZMKZLvNhKPYB4g30IyQS2OvPuXsstMLZdBp7is1ZRfOHan+3r65cmjAWCBIkDK7L6C9Jao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mkqh3D/d; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30de488cf81so50951741fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 00:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744702348; x=1745307148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhQmXgGKa1sqrAMlJVJ+qW76qWOZbNqD9bGXFxISbmo=;
        b=Mkqh3D/dmSu6RNgOfcdrjVSPdcVdZde8YYVrexI9bMo9KOUXSdIc7sqSI0Z/f7yqp1
         vim5v4Wf4HopX85KwCn3I3ChzRRlwj9cev7D0KjeLbehttsORUTHuLBKfU/37M+Gl/WQ
         S41N7QTl61y7PkzeisuuynabUCu06C4inUUCb3pHhT2eKixVKUqye0dyzPsyTn+TQRca
         S63S9DY1CVQGlPN3INEjHIZFGfFfDKaq+rJQ57wwzoFTykGwWD3MxP5ykxAQqs8BQ5Yl
         J2GVhn4ldYGxraCCjmB38UNOtbQHkBVrRcboJhhqwwEQcnToeoBEhGUzo9Xb2jvbvkOV
         TyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744702348; x=1745307148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhQmXgGKa1sqrAMlJVJ+qW76qWOZbNqD9bGXFxISbmo=;
        b=gILIk/78ZXgb2DV/IVff6NFUHIl4X0ftn0mfEBaKFkS+Kv7wsjwcc5kSkZRaHCagur
         UeK1yxhlYXvu76IdoFnAkrui7q7IioXrX/+APb9wj9jVZAKCN6owZMQCInLyVx3OFO4d
         O6DeEVnt6afW7XyBZouVEtym/MH6mRz+WZ3wONLVIuzWNKV/3p14TNKC7/Zz1CCg6LjS
         7nZM0iPf15JQFau084F0XJ1d8DoFGUZunIl2LUoX2YxcDk5CR3/lc5PVtzpLr4etx+an
         jloyUh9VaTvWCFLTjO0+URdZjK7QlE8Qn8PY1cHqnjCklfBH4YK7pZmMBODu1pO6rhrR
         HHRw==
X-Forwarded-Encrypted: i=1; AJvYcCWr4x5wiOw6tAfErc2FfNlVz329IhIbwtjKuUTL/z1tXkPxAXHgEkEQJKUiAwZOQjK/x1HpstKS2zmn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4xktU9zBez5gvrV0uqFGdraX3i0wgl0gxbaF7UcDbbyplxqUY
	lEqJu7UHzhTzcXdaDBF286Pk0SbRH7ot/hwcnZUSgb9YPNHPDdE3nksonveOsVNKA2kzgNqKKrW
	R/G316N8e0D5Fzt5nnhfTFz9Ena9b1oTvTOYN5hPsjnbR9J/v
X-Gm-Gg: ASbGncubbNvkC/nZSwMygbeA+3FG6of4gN5ULv1QXMumPfKRCC1PBdqvsCOVtFmiT1P
	QNSNtHUejCy+6uwsT9UiaqwybFBSsN4o2QAnQccibClLfIzU1p6KoDcBTxXGKJTuEUcvIeYVlcx
	dHPf32Ec0U6rw/UYmAj5VqKwf/dWCNJrWq
X-Google-Smtp-Source: AGHT+IG5h8f4JUB78zhRjxaIrh0H1nzCuXUYX+YRVBh0UXEwBIrUvsqlLX3M1mFXVx5pHR23X5R+19Gz8uYR3GSdZ8M=
X-Received: by 2002:a05:651c:1607:b0:30b:d022:2fd4 with SMTP id
 38308e7fff4ca-31049a7d074mr52085991fa.30.1744702348175; Tue, 15 Apr 2025
 00:32:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:32:16 +0200
X-Gm-Features: ATxdqUG7_L4ll5R2NvuDSJ1DXWDqWrMJi8NcaoVkYOT_klHadc44zetWzT1zRS0
Message-ID: <CACRpkdZW0Y8rBux0KcvbnDH92oP=6oco68L79VX2a=uc+2VhmQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] gpio: irq: support describing three-cell interrupts
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, Alex Elder <elder@riscstar.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

On Tue, Mar 25, 2025 at 11:07=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> In this patch [1], the GPIO controller add support for describing
> hardware with a three-cell scheme:

Sorry for replying so late, I was a bit busy.

I'm very happy with how this threecell IRQ support ended up,
and thanks a lot for driving the infrastructure for it!

Yours,
Linus Walleij

