Return-Path: <linux-gpio+bounces-24562-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A43EBB2C4D8
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 15:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB02517D4A8
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 13:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D8B33A033;
	Tue, 19 Aug 2025 13:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHc2sXXz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC232AE66
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755608705; cv=none; b=rXdtZd61leDIqUcgohQxPTyrnBUSOfzsH8FubmWZH0zxeB3syX9kBqx/W40M4qDOg05c4GtlnRFPhKJqnnx6b8NYincCtU3EvZ9eRgVA/yB+mRHtoFMStOQQGiWftUs50iTXbDDSoSqAP6W+KGRAk66S7NcuoZ5+7aaDCCDpH50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755608705; c=relaxed/simple;
	bh=qjShZoo+NiNipfT3WS5f7U40KalFqQBXt1e9Tunigdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nxv0S3kUtLcEsKRSStrpEAVeXnnMrG90YAbo8I1t41I+HIeeuxz00tUE8kiYPZgb5i47b1nULcrs0Bsxts1+KqVZksk4rN6ExukXjCURSH+VlXGILoBs47cMrzyfS5xsDpNPNHMfVjuEWQzdccYhh5xx+qmNKXPmOcpzbG1Becg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHc2sXXz; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-333f90376a3so36768971fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 06:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755608702; x=1756213502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjShZoo+NiNipfT3WS5f7U40KalFqQBXt1e9Tunigdg=;
        b=cHc2sXXzMMqTdTc6mFW30Hcx66dkX2Hohv4K5106+l3ZbRjSogJ4Ny+rEiYr6XNebf
         wWOE0+twixzfjOTqK2Acf1N7Yav9u9s/z5jZFaYorFEA895kn0LLCtIBAyKegrSiAlGc
         1b6IIsWN6hDqnWCYiptM4aMV6+gs9O6+OXufHYjQFYc551BdnWG9wNZB9gg/UVCcL95g
         2uSk6l0h+hWTp6RTDH9bZmr86OW7m99CoNsoFoLgZKpXocX3+oWN310t6HEph92Pl0ba
         IVmGHDB0US/Qf5RkcYE2xCB4W4NXFOa3Ks++0891VhLaRcjFAl/QxpGCAPauMvMquhFl
         IrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755608702; x=1756213502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjShZoo+NiNipfT3WS5f7U40KalFqQBXt1e9Tunigdg=;
        b=Boc+SidZx4ZK7ZAKrnmZ8bE/swTJeFC9Q+iP4v3Q1zgOWRqBHV96jSKnNwWD+8mZOZ
         Euk6UvazFKVK9kXOohXNlkZLQZt8JyOqYCd1eZCCwYI+t46Vs2YXkomXd0ft4kiOmja2
         hlg7obB2x3db3dpvcxLEnbaOAfrm4WbOTJ6hhpF3f/H6AGhJVxRX1V8T85OURRpq3ysR
         ActjFAgrQJ4c7+a8G1u8+frXeToYZOMkI4YsqdwXoKgj6cy/CIU0H728ItWrzghv8bVj
         WnxOYqwMXCG/uQEo/OBb/Y1fW0MyhlhkV7QvWrcK+Bk5SRqeWIgPLTmZirD3Ysb61A3P
         QcDA==
X-Forwarded-Encrypted: i=1; AJvYcCWtjvYbdnNUU1HgklyrKBXKIt11+ODLleI2FayWhogTNpawKL7DGzxUOsHzufB2/gBHwsJXYkUcxNfM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4l2dm7+IHWXgrEVo5/7dBexwY+b3Yd/Uzy6oksZGk3wVtSafS
	/nwn3WunRn2E2DdWF3wtNxyrQVL3XO++yU2DpuauM+XPRn3JOX48RVqt710jVoNrZD+DC7wi5Us
	eM0nO7/PptnaXvesIB378K0X3bpxkR/mKhrgrky/GEw==
X-Gm-Gg: ASbGncuQcRSNrOTRdeJfm4LhLgZ1CsgLKFeLhU3rVwyEROWOEAkFw4hPyBh7a8qGeAG
	fVGRUiWdE0LkzP0fqfMRK3PLPOYslB4mnQigl6W4dPBdTcvKrhUPGtzxmLSpWfbyvNcrKE3cwTR
	ogrbIriEj/EF+6swIPWIzrH0Q6WTP0Rpol03L8eBuyBHtOGH3qZG5Cec9Xe+C7jtkIaf2RsHFHp
	ihunomfdpes
X-Google-Smtp-Source: AGHT+IHKSCc3BRRWgi/b6UYlklkIt3JL2+XoqGQiac4wdYUlvtkEDiwhts0vXrUKD+OM1NJ41pIR4yVIK8ii7tqOrrE=
X-Received: by 2002:a05:651c:553:b0:332:440d:43bf with SMTP id
 38308e7fff4ca-3353072126emr7293841fa.30.1755608701684; Tue, 19 Aug 2025
 06:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <29d89aa43536714b193d9710301341f838fcb5b7.1755519343.git.christophe.leroy@csgroup.eu>
In-Reply-To: <29d89aa43536714b193d9710301341f838fcb5b7.1755519343.git.christophe.leroy@csgroup.eu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 15:04:50 +0200
X-Gm-Features: Ac12FXzPE0z4aQDnczniJjhXVKo7ubVWbJ4EdzLUQpWqZoam6Goakc9VHrWgbMg
Message-ID: <CACRpkdZcoT-hotYikqC1thmiOB_tc20tvXVrrOwu_ymgW=g3Dw@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc/44x: Change GPIO driver to a proper platform driver
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 2:17=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:

> In order to drop legacy-of-mm-gpiochip dependency, first change the
> 44x GPIO driver to a proper platform driver.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

