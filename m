Return-Path: <linux-gpio+bounces-27738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DD47AC11A5D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 23:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 88E0B35251D
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A562F12BE;
	Mon, 27 Oct 2025 22:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YBO75K8y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBE52D46B1
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 22:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761603392; cv=none; b=KS+/4ncWDS1nJEWQvhN9E72AVVz7Sk6gt8jDEE3pEqN5mnSVfUCcdKRVvCt7N5ssFWe8lX1vlC01K+WnSNYMJrehCoA3qBobv93Vxq0vDA+qi+I3/RcSnk3LXvO1a/jAkI9XrTWNI9shf5/M/SQIT9gRV0DXBde8UBxTplSh7Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761603392; c=relaxed/simple;
	bh=Zc9UIv9/MZ8vS/A9E/+9Rzg7ZN5v4cfKPUZNZPqRWGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/7hT6pxq6SwGYqqV8yz63lQme/6Xp/LaM914zalE4NT9NetzsABmWw3rZlgGrpFZvQ2/cvpl5SK27/Y4SCGK80A8j5DMADX2dPoEDG/OtSxxTQPQz4PdrSFXVsUXJVG3M+rxAI4renBPnGj0wYq6cc5/a6xZ9HEELnYNwYhXzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YBO75K8y; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-378d50162e0so60555431fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 15:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603389; x=1762208189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zc9UIv9/MZ8vS/A9E/+9Rzg7ZN5v4cfKPUZNZPqRWGI=;
        b=YBO75K8yUsF13/walveGNT2ZweT0wNllcspwcgJL8h3LaMCQo1lGsp9NybEP1Newyu
         +pMdrVZ6d6mbN6IigHGd2ZCFZOI0RgPjxAad0/sPa1whmuJ39p7JffuPvt3mz4TINDat
         wNR4heIFcbGrePW7FXzewvCdTlRTTrn/8tBmBmNYmtGxsm2gCTQrO32RHF/TGghyu96c
         ViljOYE+LKXhvW7e3b8Lcc93r1K28SubHSdC2f5HBIdOVC3OQ+e5r362fGjAFnGYyQ4X
         2nSjUbcmgAkyOn4xW4OCGYt23IAvRN74SN3MYNbJRHy1GN9nHe8f1l2g4EZtztx+nPaA
         AMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603389; x=1762208189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zc9UIv9/MZ8vS/A9E/+9Rzg7ZN5v4cfKPUZNZPqRWGI=;
        b=pbkDnAG4drP1kx8RX1jWw8x20gDgLwNb5vSqpROyQA1X7+EIoc5QzKrqDl/H+m38t4
         TA5C0kzdKtQwXlqmwaX/WzeH9n2hzChEHwjPUfuu2khO7yOQHPN1Qmx0J3e20jP5sf9G
         ctC9Cv6TtxTadzqx0MBdF3Eyr7+6qC+4mVCIGOquSZLho7pM2vsDE3yerqdPsszBKz9S
         SimSjSzR0m1uYuVY1VLVbvmPdxDiO4AqhH0X0/mM6Ro6BmVCwVBbLW+p6iWkakZ3Sr99
         w+zUzWTIfETCl0Nb+ZqSOigQcKbOup99Op3faWlbM6CKuag/9jOXznhVe/7l/Zw6aVaL
         1VrA==
X-Forwarded-Encrypted: i=1; AJvYcCXqq7Fi6dey4eBPgRAabQ0IRwjHobeg62vfhekuNrtgIQmhQVFizcE6lkUKaKKptCib9jkTDQugp5Ve@vger.kernel.org
X-Gm-Message-State: AOJu0YyNdrr20182Ks9qQHe8TVVZa/RfkjDalLiNme5NaTT3QM/tHQYt
	0fT3zM1dkvjn/e4MOQ4XulWHnQS3w9STSt8mcSyoGJKQ2lhykrTuFRyGzTEYIotv+yhqReKBM22
	DOykgwN+FpM7LfGeU3363xqH7iEqIzZ4sq+pAkapRMw==
X-Gm-Gg: ASbGncunMH52lrirH7jdj2LDV3QgYY4Es5FgON3EaCw6PYfR/1TIsCoF2eGVrZ4icf7
	ywI06wQnFimEEwRXz6U3IaLDdWYM5mlG02vVkkwNQkknbkviFc5Y1o1m/GawL437Ozg20upxccJ
	uE++nbK8F0GS1Ngx2rQLBrlbW8jVjjKizNe9Eozy4dNzwafaw6FIOfbLSvBkeyOK6EeiRu9yojG
	QJVxib0yJhhfnhxZwk8gj3yvf5wgEhn5v4GftbdLA0OlaUtF0hDos5vAx27
X-Google-Smtp-Source: AGHT+IFA8HV2G/sHhNwZvEShaiZsTM+MMwIFC3kj57n0Kcgm/A/zFAgZaU2xFGY5jATvp1YPW4KS9FCoawvfscRyh9U=
X-Received: by 2002:a05:651c:25d7:20b0:378:d690:5d96 with SMTP id
 38308e7fff4ca-379076a9b61mr3296741fa.8.1761603388859; Mon, 27 Oct 2025
 15:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-12-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-12-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:16:17 +0100
X-Gm-Features: AWmQ_bmBzMCqn0FgOeFfQ7QhGc6mfzGjYtXO83EFE5z1zNwN1wCq6PGHLCzury8
Message-ID: <CACRpkdY-e=KT+nOaVNaEB3nFkXTrZeJ7e47LLzD46xsfzm63sA@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] dt-bindings: pinctrl: stm32: Support I/O
 synchronization parameters
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

> Document the support of the I/O synchronization parameters:
> - skew-delay-input-ps;
> - skew-delay-output-ps;
> - st,io-sync.
>
> Forbid 'skew-delay-input-ps' and 'skew-delay-output-ps' to be both
> present on the same pin.
> Allow the new properties only with compatibles that support them.
> Add an example that uses the new properties.
>
> Co-developed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied!

Yours,
Linus Walleij

