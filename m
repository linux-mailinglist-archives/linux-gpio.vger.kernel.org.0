Return-Path: <linux-gpio+bounces-3115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E594B84E292
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 14:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28D921C267B0
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Feb 2024 13:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C653878B40;
	Thu,  8 Feb 2024 13:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UGggg9Fo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DDF78B42
	for <linux-gpio@vger.kernel.org>; Thu,  8 Feb 2024 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707400460; cv=none; b=NQBtVB861if+4Y/scgIMgJzBEFj7eqOHpzzJwGpcxPJ8j8aKoE2UxYTKf7fmmhts/+2QpGKe51hnDYjVtQVGiWz2mnhikhE6iJd5jSrhODFm00BL+KnAY5bKght/4JrTDrQKEt5Z1l9nmwtWScQwUHgrd9Q0Qv2/t6D/N5fpvoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707400460; c=relaxed/simple;
	bh=sAPBOJTqt0Eux7mZyQPffvBf26VAhOH69akvvfeddOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UfN8iVLmK8SSB/8xfsnST3CeTX9u+BlsLEyL0YnmxSMEJ/W5xfuEZYxBiSh+7IhYkpDcc0FeLotjSfuMR6QHuAhcfOmkAq/UAu+fxBbWJZGxRjaGAvmsbS4no19JBF9cCXuAV8LN0wq4JU2/v6d4tOaar9SmLX+oRE/DB1ZwKXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UGggg9Fo; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6002317a427so17241937b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Feb 2024 05:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707400458; x=1708005258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAPBOJTqt0Eux7mZyQPffvBf26VAhOH69akvvfeddOw=;
        b=UGggg9FoknxkVTBo3XyTIcoMSgPxsGAIkGqo7suhPJZI8qWpn/cpgKkoobrS23XoDi
         sDvwR3/ywrrQmp+KT7GlNBOOEbKOyoPaQm1/nCMXi8ojVtQEfMqKDwH6VfVrQSUH3ZBK
         TZReHWyQ7dEroLQwQ1P0rfkz/dmlkpqkOVDtLdcHNllSRvq9t5RzB//MP/pADzCw+ZxF
         hZxc1s9a3Q2RQcRrPrXzgWnpDUSP4M2M4RLQQGWKOFq//2BJflrENrhEHWToGstD0Nh4
         EOxe3XUUHn2S0gJ/5S0SPmmxXiHvO1//Fa6L0XfJxssZodEN396zJQxXylp8oaOXvqBr
         K1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707400458; x=1708005258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAPBOJTqt0Eux7mZyQPffvBf26VAhOH69akvvfeddOw=;
        b=ASn6fjBPcss87JTsroXMMzzMlF1NTAHD+cOxamymdTcuZ1CgVZSs9fWcJEnaV8pgPt
         RWd8GrPPxW0IJDBiUBC4S6uUubY9icnhGjvv5lXfwAahjeiH/3RCX5ZmeaTbo5da2dXu
         /koWMrv/oMc9IcOXhINXMBsZ+ta72OqsYp/PNXWZctGmsb2RCKQPDEUODA6SjZ/mobwn
         oW6/FaFKlHWwtkYZkshW3YQ78Th+PG08FKlJDVshdYtXsmUMzzzvdZVxqjzxIkR4LVmC
         YQYvMeu4jeAuTo8P2PemkORbEDpN7vsmtdNzSu0nXWKowK+AKvo+ttEMaxzVRdLF/z3o
         X7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXWmAka++Ywc57q3WhuKkt/6nG76VDFFyGV1qvQ7vQXdZ/7aH/a2x4paiPixQ4AWWu66trhShrIHNRMsTAfLlc5nuNpauiFgqyFuw==
X-Gm-Message-State: AOJu0Yy71ASpWjKjuycJRwMWVhS0GQS6dz5KW3WDxOgrYRItmNV3bJPi
	D2Q90+NbASDYYJCCA/s13BjWMV9hHl1sSFmuOd7e/ekMta5uDoJsSpMRQX0r6gMIUGdiB2tbbg8
	rSeX6qES5YImmk49g5tRjBqG2fWaaxoCXJneIkA==
X-Google-Smtp-Source: AGHT+IGDiOneyfJfxmHJsx95/Io/iJWK5Htw1Hg2MZmkBm+216Ld2xxxMuBHMFUPV7I9NJDT+pGjYE+Cddkb3IyflOI=
X-Received: by 2002:a05:690c:f8a:b0:603:ebf7:947b with SMTP id
 df10-20020a05690c0f8a00b00603ebf7947bmr9533612ywb.48.1707400458134; Thu, 08
 Feb 2024 05:54:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240207104604.174843-1-antonio.borneo@foss.st.com>
In-Reply-To: <20240207104604.174843-1-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 8 Feb 2024 14:54:07 +0100
Message-ID: <CACRpkdZ=Lf+Db7-QwM-X1RqqRJUNH20Yc6tJYjz9DK4RDxP6-w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: fix PM support for stm32mp257
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 11:46=E2=80=AFAM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> The driver for stm32mp257 is missing the suspend callback in
> struct dev_pm_ops.
>
> Add the callback, using the common stm32_pinctrl_suspend()
> function.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> Fixes: 619f8ca4a73d ("pinctrl: stm32: add stm32mp257 pinctrl support")

Patch applied!

Yours,
Linus Walleij

