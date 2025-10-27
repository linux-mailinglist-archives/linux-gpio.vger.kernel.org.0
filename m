Return-Path: <linux-gpio+bounces-27735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0D9C11A30
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 23:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DBB3E4F0AE8
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950FD32B998;
	Mon, 27 Oct 2025 22:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vCgMFQ4g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3E72F99BE
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 22:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761603245; cv=none; b=A6glbyFvnA4WpMf2FjTrbzmrr6eKpTWCq1elK4HWbUrjUlbis2POIAt3Hr62tQMnCEbTLlQbVKKk6pDPsQOyi5EMJM9jEAXtbhyhhGUgCi856XIGF2tlMQkMh/St0d6jdb2jUbb69cJzk1vWOqR9Nv2cisrVa4VdCJiL6mAJXgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761603245; c=relaxed/simple;
	bh=yDb4heLwVr8F9tF67JPmU+lJmZbzaUPek/3Lt5kxQUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qW7M71jmFd/ukuo/LMIAUizQNPFESaX4THCQfdjd4qquIBsBsB6vsWZG0oe7W+KHWNflbYnvqhJhRXEoc019YQe80mx4z9fs8busckOkOvvu5rRCKGi9JYFWdhmpBg2smgMLh2Urcq15xqMLeJI1NP683o9ygJFlAUVdLonWnjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vCgMFQ4g; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3737d0920e6so86234111fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 15:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603242; x=1762208042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDb4heLwVr8F9tF67JPmU+lJmZbzaUPek/3Lt5kxQUA=;
        b=vCgMFQ4ghNYXpjrB1VhA2CmXUTr9pr8OKuLwq+m3U+9vtKRgRyuSH+XHPgadYeiM1z
         eVkxCYluH/1ZnLYhqg73HDvtONnHRHASOCxrmMMAdyURD7FP7IYoRUxpUvJlFaNuXjHD
         L9Nf4NQ1naGmNp86JWhXyGFKZcYrjXptqE049B9y++gGfLVKJF8s4r6XLmauY7zSpOU/
         Qq/w6Y5S2ulOJskPT+I+qo7C9TQqlQcywTr4pS1DtEy+O6spgezH1Qy4UTujms+ZJIf3
         XRavRMvG5H+txX+aL/k2C0ZF2w0oXtXiAehin6JpA4XOO99uWTMOZ7shiWqC9JVsMHzp
         qI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603242; x=1762208042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDb4heLwVr8F9tF67JPmU+lJmZbzaUPek/3Lt5kxQUA=;
        b=uUW0zBQ9FtAyqI7ycePN7SXMR9TyzQ2pZLP+1NTFRzB5gm1cYrnMniHgp+G755LnSt
         JnCGXdDIfo+dxryPuMTiKeRE7ghVjppa+KcHaBsibfwo2Tbbr4Gs4n1b7jlgfmX05ZXf
         pE5ouFOUNBwJxJ4pDEPyJ28m76SC2072rd85LT5IJG//4L55rOfc11ESD3T+LRqPJO60
         XZbnP33Z8gykzlOipkcdiUbvtGo42d5tkY08h0H4St6/1ioq+voueyLMOAwC+05VRxG3
         zBhewn9OK/S7/HQMYopJ7c6i5VJe05QJxlDXL3QLgTGyAM3wwDghpHtH7HQA+Bqu2jzE
         Tk7g==
X-Forwarded-Encrypted: i=1; AJvYcCUzACHYQR5/Zw6VhmknOkedqQzFrobaQBpI1hBcT9GGZhRTy2GajBZo4YFzlex79sy3ivigFEZUWPSZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzpU+mSM9GfGhWAGvXXSYAmd1r7OOEKQ9oCafudtvKQVIZOR7Ho
	CEHNr0cICt+7x9lqqBoan3K8UT1l1m4ELdFjwAlH96a0/pIboyHikrabr1u6kmwFxCHOIMyJ08a
	WN9MF2k5ocA6vkmeC5WG47V4jqmW4urlpLjEj2uUcHQ==
X-Gm-Gg: ASbGncsw9ZzWD2OosKnDmeKg0qqfQZ7MCUtbA9wHRWLyPTsheANayJK+CUCvHeQZsIT
	IK6kVYgGNLOqQnccA5jsKBljiRU/D/3dsoS/KVqD2cv5Ob6wOaVckkKQapsCQ03MG3FU5xgb51U
	Ru1yJx4s15rIdiEEl2thuZ1mppu2C67NOGmEJ2mFLtuoFse5z9lW1WyTA7OY8wm25Dw8AP6XfsL
	mXp5N7VkRgwID7ACjD2pFiy7pa0N289Q+9vRSi7c1yzfcmIWsuSoDW5Z/QqwjGrIyh2j8w=
X-Google-Smtp-Source: AGHT+IGTHGniqnqswQZQSU1fhk8hxerxmT/RZLzkXLtCHwAUJ+0N8EhP8qUlWdXk3822xFbRTLDLonsWXqEkAXahWao=
X-Received: by 2002:a05:651c:1503:b0:36a:a87c:d139 with SMTP id
 38308e7fff4ca-3790776da7emr2956771fa.42.1761603241771; Mon, 27 Oct 2025
 15:14:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-9-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-9-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:13:50 +0100
X-Gm-Features: AWmQ_bkjaJPnQvsqyBKfvEn0_gjRiWDur5QLSrzsQpj3h_gRODNUm-q5XFQgAKQ
Message-ID: <CACRpkdZrNKgoxy0aHTVQmyeryiDbu3Dc8FQR_KhbubwuLxcc9A@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] pinctrl: stm32: Avoid keeping a bool value in a
 u32 variable
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 3:27=E2=80=AFPM Antonio Borneo
<antonio.borneo@foss.st.com> wrote:

> Change type of variable to avoid keeping the bool return value in
> a variable of u32 type.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

