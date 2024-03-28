Return-Path: <linux-gpio+bounces-4743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C8988FA39
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 09:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FD89294AF5
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 08:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B955786B;
	Thu, 28 Mar 2024 08:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F9RIgOAC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581DB381BD
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711615491; cv=none; b=F08JOP9uq1eMww1KcRqc7rtc64dBWB0y3Z5GVZMiHlqqU86Pdi3ge6vWrVgcEA1eFCf5od68J76H7jVBu4yGgORDdoYz+4W82Jb8YqoinA1HG2gFuJMVs91Jj5FyElxR7s8z2/Jrz1lRiZyrKKcK+n5mNmq5IlQ2EoNYsNRFKTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711615491; c=relaxed/simple;
	bh=Pxg6IUYzsoTznUX7vcw9sN15lB0Uu/xj7gWnXvLPPT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbm05jQHWxbBEpnJxc7XmiTpLFtOkmmOJAZNsMgaQ8FmsFaJGd+tF1GWe2xYR/Jyqd2l/Ja0aacgQnTyP6cN74GQfFa7pnAjixhKQ361wlKe4bv7R8lz/cKMsankQA/8G1rQx6HKDhlQyf5mK3DnwDEuUfK7c510sPnwg5Fxw+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F9RIgOAC; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-609f1b77728so7355847b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 01:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711615488; x=1712220288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pxg6IUYzsoTznUX7vcw9sN15lB0Uu/xj7gWnXvLPPT8=;
        b=F9RIgOACtY7Ln9zFuT++EpEfI7ABqSy2aS7LN8+7xvHfdAr9VtxD9FdQJCed9PmnbA
         S2W8NB1ZTxzZ0D81aSDuNWLvqPJ1gcIH1ct8rRjuAhFFbfYTBIbvezwOeVJEltGmX3GJ
         6xWaCNAZDSa7UfuPSkbS753t+D/Xz27NeJc53RSEsIvbeY4+/lvOegEAvLLjatw5APy0
         5MUM8NpcoSXVl3eC64u4j/9uJcoqyOPdT4vp0lvDXxp/ExGOmskdpq2ZGtCTqmHqCpLp
         FxiOdStw5EJcFJhomUHjp6j3EGAwspuO21BKpKXo9DoFmQPQqV0vrnsPzmnsjJgEqG04
         pAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711615488; x=1712220288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pxg6IUYzsoTznUX7vcw9sN15lB0Uu/xj7gWnXvLPPT8=;
        b=Mo2OSpP/4/Ac5d7iVVnugv44b+MZHYYCoKZi/lKhXW44coa+hAwsFyWozyKIpYBLZy
         exoPiBXlrdqye4Eua9uREN0x30wfaG8X7cYq+ImgL+JBNAhYodnJmCv+iw9Aqf4fENv6
         rcwDApPKF3o2YQ4/ToO+dHYrOxP8XZM7D30FVzFotLdqbaAC8L7nDn9gE0Aodo6oRTRL
         pF9FgRd82L3jZCfWkyWRr3Ge8bzb19OYDOZy1BYxS32LY9BUWNj6XoJ1KhcHXV+KXLD2
         A+21c5Hm1ltmQH5aVypxeMbariEpol6Kkt1gnI0IB0Jvu/LihitOq1/LTYxmEofj9fNE
         LARg==
X-Forwarded-Encrypted: i=1; AJvYcCXSvkgouydIgY1bd5PWANldNSKwy6wXp4GCe5n/39UFu1JaPygQTj9MPHnbQgfZ/mCUAzRaXNWyYSgpQC9cQH50SaHqDmY0PMFXAw==
X-Gm-Message-State: AOJu0Yz/KLcO6qWrtBgBvRuFzJjXDWAY8jf8UfLJNhQnGanw3hRnEzJz
	CBW2mO+n80nhVooDH/put3zDGVupIFZqnnCniEun4UmGFY7WJvICwSUa26oP8qqubf84tpNrUL6
	lhKCGpxs/KfMfWOlM8Fm3PdxWf8HSjSJNiJh3JA==
X-Google-Smtp-Source: AGHT+IGcAn0RWps9oXY9GZljw77ZRlGO3gv6r4U3YqCqjwkkeOy4XucBWwQWIwNFeapvqv4z7ByXHzgjLqMMVEeXcLQ=
X-Received: by 2002:a25:6a03:0:b0:dc6:a8c6:c9e5 with SMTP id
 f3-20020a256a03000000b00dc6a8c6c9e5mr2140753ybc.26.1711615488453; Thu, 28 Mar
 2024 01:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240311142346.1261203-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240311142346.1261203-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 09:44:37 +0100
Message-ID: <CACRpkdZ-FrLBzu=nV-PjwMaS2BL3TDeKB3m9BhUfWJhmkoP7OA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: pxa2xx: Make use of struct pingroup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 3:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Since pin control provides a generic data type for the pin group,
> use it in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij

