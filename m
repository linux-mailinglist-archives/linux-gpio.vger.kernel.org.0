Return-Path: <linux-gpio+bounces-27729-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CB6C119F7
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 23:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D5D3460A54
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE7232A3C3;
	Mon, 27 Oct 2025 22:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BY5MOK84"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2376932779D
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 22:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761603024; cv=none; b=YftMzdcwdF0Wbc9oU5hig8QBBEYuuhM/GlQ82mPN0t3XMIks2CT0Yq9qTnYyXM0D2Bcohmwfea7BFXCSSlogdpBoM5tkbhOxB/vN/d5rs6KYJ4/sobkzlTY7ZvMHfGI7QInWSJlRoKKJEa8OjUcmk7MliYuRQSmXfQufwZ5DTxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761603024; c=relaxed/simple;
	bh=P83isQ2gvRt7wdmXJ1hdjP2SDCiz+lwtL0Vt91PBpcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nqv/99RQ+SYsa04BYX66IZOxD2vLaxVaQG2SYa9yaCga24wK0mCyJ7cF2v+6unt0KnKpOXrLuRaVhAQASvdzt8QSjnj6F4pEjBuuEjqGUEWd8PqNO/nbo3JI68ersxhzJrPEjAHdheo/eO26ZzEg2TYNce4RopCsOv4t48s6y10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BY5MOK84; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-378e603f7e4so43240601fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 15:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761603021; x=1762207821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P83isQ2gvRt7wdmXJ1hdjP2SDCiz+lwtL0Vt91PBpcs=;
        b=BY5MOK84JV+tPp4DbFoSzBG5q5ivc9OWdzGlhRyFq6toPkMeFB7YP8cGA3rUJsMJaJ
         /3pypQxKD+nmoymHtdSSH5yi8foznYAlEP9mN9sWWpci5B/dUJudtlIt1bqXf66VXUxZ
         aHv/dLRRY4j4tPZrhM9WgYO2Bxu3j+LF8X1HRPYsy/1wlTGHq3c+HBTtKVQizXZS6QJi
         M7DNWExbXCfa8477wN2uLooqQ4dDZg3gfhGUCaFGIaqk7qwkOnfI/lzznH3PHavGYJjp
         EdhUflwhlY4+na9Robb22e8mW8Q5BUWyahRPZlvMknVqFGhndgjPI4ZVSLczaJzbYlOG
         HLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603021; x=1762207821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P83isQ2gvRt7wdmXJ1hdjP2SDCiz+lwtL0Vt91PBpcs=;
        b=lCv9QSp5T3qy0nb3GEA6h1UqInm6rQozpP62l/ace3l4eRf6kkfN5RJF1wmK3ax8vL
         SvtYOClKlZGDxcuJvdOs0VOtHkmjae7tofUUy+mT6GFwF+X6hZBvAntLdI8CSEhqIi8e
         tyGt3T3+TppgW8P+TsrhZVeESUeH4WbStJ11qY09fDoxtsgmjshX4Nfa74K3N7O1oMux
         QTNIRGpUXeUkD/XsIcmi1VNIV3LP3nDV6M5QhuIPWrs8qQ+j3vDBKFrUjwHwKFdBDkgr
         UlGphWldqPQKTwPn2ZmvsE5uuM1Yx7VRXgZTEQJjAGoyz0sobrEZL4WmVhZd40G4Y1d6
         05sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSsL2YOwpFvEyAtKQe9F7YD+9+G6Q/1bK+yOA7lwZ8xMCO3fx2PyaU8ztIYELJIlQh1MWkesEBHPgc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8E1lAql/lU2py5/NSJ9M2tyv5ZQzfD3JcvoGTESWnDT/890wQ
	YaCl7naOCQVRerd7eOuofgUaMaD5mLoguZmeqBRcw4m6BIyQkdmnbgW1awXuehaNh89wZfo2RBw
	j5vpR/gYK3HSTmqhJqPjqd8lvJg1DRaNhS5cuTmzP9rqvGBsKI5wlvUM=
X-Gm-Gg: ASbGnctfPeJFBn67dRmjvYRCUH5Is+t60V+Skwr9spU7IxV+d/cupiQ6YKODSgKhXsk
	5gIpxpYgiqRRK6Ip5EE11CuxZ5EaAPijjHT6raEs9wDHz5VavEiimPcKg85DuCMMn3v/Ux27ZEh
	4ix/lRC3JF8bD3NVc6qrzCffnZ0Ef0VkSMtOW66z6FMLf64xgpvlu2HDMkDBy50ZRWFpEMQsY+P
	f9m98cR2QFotCnXudrii7s88VM4U3gdVu66dtdPw99Kb15649XseczSwSd/a+D1YWLabS8=
X-Google-Smtp-Source: AGHT+IG9eaDbYlt05Z9zFZohfCDZwr4gqNsotaN2JZ8jVtyJSZnzH8ZzP5hqxntC1aSKIIT+xacG9uS/M37uyI9DBCI=
X-Received: by 2002:a05:651c:43c8:10b0:372:9992:1b0 with SMTP id
 38308e7fff4ca-3790774ba26mr3083561fa.31.1761603021254; Mon, 27 Oct 2025
 15:10:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com> <20251023132700.1199871-3-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-3-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:10:10 +0100
X-Gm-Features: AWmQ_bm5etBIx2qF76UfEPLiy1Nl6j4OjIJVT1wJCcuvidRKmWwIeYmy15zR_II
Message-ID: <CACRpkdbitTgbd+DcdTNYeuHMuSeMQMx5PQbZ=qsFxCPU1ZFugA@mail.gmail.com>
Subject: Re: [PATCH v4 02/12] pinctrl: pinconf-generic: Handle string values
 for generic properties
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

> Allow a generic pinconf property to specify its argument as one of
> the strings in a match list.
> Convert the matching string to an integer value using the index in
> the list, then keep using this value in the generic pinconf code.
>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Patch applied, I had a hard time to follow the patch fully and unsure
if we should add some docs as well? But let's toss it in there and see
if it works.

Yours,
Linus Walleij

