Return-Path: <linux-gpio+bounces-14787-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 135DBA1098E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 15:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0197167302
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 14:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F01B14C59C;
	Tue, 14 Jan 2025 14:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QnR1sKiU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BBA7E105
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 14:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736865443; cv=none; b=LsxPJhyhv2k0P/gfg/N3jYUJ40d+32v7U/cvKnWG9j9JI0qY079witvb+UsA7EjC1f8s6g4GNzViS1Y0jlIPKG9mcw6MqW0QtGmgx++Wcbm0gJEQPZE9BtaFBwIijlNdD6+Ymhjlbyd2N6j/mgDd3FdwH1mJx5PR+25/DJQofQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736865443; c=relaxed/simple;
	bh=AA0aBoqrZg/WACjAZN52vkKnO6JJJbTCFcrDiMPAINs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeQAS8YXW+bgXa5hWKgsHhMbF9DWB7Q8y/ywPV1WQSsQsiQNvUaJMruBRc2G+kShEHXaDXoY5Rqy/VZyRx3xmA5/CiAG/+ih5Uebhp+IuHisl/KbAxVythtFS8u9FVLNYfxqUZKatGIZyKZjZHG8XYdkPx+AOwXmwvPTY897Ixs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QnR1sKiU; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-304d9a1f198so46003081fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 06:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736865438; x=1737470238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AA0aBoqrZg/WACjAZN52vkKnO6JJJbTCFcrDiMPAINs=;
        b=QnR1sKiUBFLk/eNeUvGo3Jd+Q/7ZttzXcADxnOaixZZsT327gyGKKHOuCSy8VQeHV0
         Q/El5i4jGDXe53HscOCj0W3MzuU057TRYIPCMZIauN8/m+4DhAyXnqb0ieg5wipozPIf
         fjwo6AOppk8VS2inIiupbZ9ViTYUvqj4AzTI6JQc/MrvWMdidXc1ra0WmkpxTn97dEKA
         ORiBk/W1auk9pusa+Azit2SAD9sTuyNiRT/7y5460wo/NyK7xhGfUlDr8rhxUD8fksYo
         82k3/sVl8uiBShrFf+txfZpLQySrn9/OnRk5YAU30CLXPBHtBqgYeIZIeym2gF8zzkXF
         5O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736865438; x=1737470238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AA0aBoqrZg/WACjAZN52vkKnO6JJJbTCFcrDiMPAINs=;
        b=brTGKecHm6NUpjuzXBfqdM+HvVyPtcG21gmTBl5AF7W5sGh8LTq1W621dF7n3TEXFI
         vZP30D/FK7ROC80PfiFrgZZbc518U3i1HD16Y7/1XYqoOVMBUNFrORF9hrhGkyZHVt+M
         Y36uMTLqSJFgrJrcXJ6nZjq59ie6nbs9OoGQxCtMXXLXXEYPRIf39yiFlfVCF7Ai9JkN
         cWde7djO/d02jIlmLBu0dU2zB5wS6Ia1qeGwGmJNnjdcLcXi8zXipQ6f0ze8sfaYI630
         XnnTGN6Pp9TTOnpG0Tqoie1nU2+Pr6MsipiUvn5wKUBrjxuEe7vV+D3FeLkq5q7MIJNM
         ZmFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxQO2Tl9u/9meaPtcmg0ay1SVVgjejIlmdJzN6OEK4L1AvCnpgxtBaHjvaYYDJyhdjnD22F5gIXoMF@vger.kernel.org
X-Gm-Message-State: AOJu0YzzBhAQny3RxheuCpH84h0F3FRjdX9C+PjsEtNWZm4YWXD5zr5M
	LbsLOtomY1jEvB5F+UbONdOvMe4+quSPYSetL/g6wGAfIicCLxgHXmym4g4HvM82ODSy+pLwNcN
	AVbi1zwbQ49Zdso48Q5M2Nfq0M7L1kcL7LFbI2A==
X-Gm-Gg: ASbGncvsysK9UWzUwd3CS5B+soSyGjC9/S0n17Vk7Hoc9UnU+Zui6khOU6oRIbY+ZSc
	CK1EZGPKq/GdrFZxePOxyOtC6SKEW3538zPxe
X-Google-Smtp-Source: AGHT+IHXHhRBxekKjdM3gRgsDo8MxfQbmM2TrKqIHQrqSEmhLq5g1p0hvMa4d+Gj1XQaBUyrDoQ+cJNCESr9wOng/Qk=
X-Received: by 2002:a05:651c:544:b0:302:1d24:8d95 with SMTP id
 38308e7fff4ca-305f45f6484mr75556711fa.29.1736865438026; Tue, 14 Jan 2025
 06:37:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-2-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-2-0a28731a5cf6@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jan 2025 15:37:07 +0100
X-Gm-Features: AbW1kvbhH5ngJuoPoguwTmNwlT9OfxN6ZoGKMuwu-HJLXJn6jxhr1EDmY9GG7Us
Message-ID: <CACRpkdZtxVSn9D-ro9mjYU=yv0FjE=BO=vPmObT=8=x9coCy5A@mail.gmail.com>
Subject: Re: [PATCH 2/4] checkpatch: warn about use of legacy_static_base
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 11:19=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:

> gpio_chip::legacy_state_base was recently added as opt-out for
> existing drivers and shouldn't be used for new drivers. It's thus
> sensible to add a deprecation warning whenever it's used.
>
> This doesn't fit with the existing deprecated API check, because it
> requires a `(' to follow the symbol name, so a new member specific
> pattern is introduced instead.
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Thanks Ahmad, much appreciated!!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

