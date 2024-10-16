Return-Path: <linux-gpio+bounces-11466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4C79A127B
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 21:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 944251C2147C
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 19:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77A62144BA;
	Wed, 16 Oct 2024 19:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HLjSYwo+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A682139CF
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 19:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729106788; cv=none; b=B7DJMgDuLKbUnxfS0aYmKhIYySH195jiQ4OkznbqHRxyoylKk57XL1nPBJYQB2w1Mcc956S4npwP/3WXMOVhvAhqdyBB72g0NJE454a3btADrlZYIdIPWEr0nNd0eMCzL1/0JyGB8bpTagnXOdJ1IqT3iqlOmNZ1VNVqnQ1oDZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729106788; c=relaxed/simple;
	bh=qF1CPFXdtiKKNkyFgCJvjZ3vw2L49qf3y345BCTNAVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KwzS6AP6RkW6s8JcCV+dNCAt++skmqItAq53ubHnSZSl+0Q7i4Oust5p8ANjLFO381bbcQHkS2JigImI0XierFDf7jGcruGc3GO+mTvWPZ4Tb/ZXTj5TFgsUNro2M7eB8LZ2O8wK8IH28SjZOt1RY25qK3QwuaC0oEAi+/UtFYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HLjSYwo+; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e38fc62b9fso2815817b3.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 12:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729106786; x=1729711586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qF1CPFXdtiKKNkyFgCJvjZ3vw2L49qf3y345BCTNAVk=;
        b=HLjSYwo+KXMu3Afe/qM4ienEgXihlD3/WZC85WTYTQnZRkaSG5levdchl9XBTtByFW
         f91CB7QA2SgTby2FgetJYYSvj7buA9UwCm5xxTf3KWSCfPRr7ijjiDJblU4W2qboDPKR
         SI+IQ8pIcIUDaOvnsFYqb2TgPOtsJH/DtiGLskwPLJ4osDssrPoRk91Jk7YIsi7C22fM
         gzrBH/qKCKxTT8GzHbS9dY8n3b583kopotrQVvMySjbLyv6cQP/G+Ff9b1pl5R5qX03J
         yp4ok0ehQ6JpMlpWQ7PxOcBlyQIuzhTk0OQ3zPIXb9sx213hPa5sCzXNbJdrSKSmQ3UG
         BMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729106786; x=1729711586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qF1CPFXdtiKKNkyFgCJvjZ3vw2L49qf3y345BCTNAVk=;
        b=JUiKfVh2M4ExQvprrsgzW5Y4wKF5RnvFMtwn2wfrx4E5SsJl9lIpWR9I0wILdIuOSv
         OZJYbwfl3kwABD1ugvXnTGIGV8MoZ14SGuvpimQ0AoM9WdDkBGp77d7EbL4DHyRLF1Jp
         yeFtq6UFIhc3nywcpfEGwHkmvkaSgtcXtfnfCicTiLIbjXEg6HYJiDgU81Wu5PrPGHp+
         hkvX3sGh6sa0Cf2t4/2cYSXcXjHFPImQOiRj8vVtb7WDGc9aDbZqkxl2Rn6C443eozyO
         cE2shwB6NXQ57n9U9Q7pmuHhWUG9Yd4k3NAs5nkkLSbeVKAuC58DX/6m0E2sI0JuHFdL
         Dicw==
X-Forwarded-Encrypted: i=1; AJvYcCUkzzi5M7RJeRDWQlUa6kH9mEB/CNJnnwYsC8NhcnLtgZY2fDdjnE8uptFs0/1D2fJgsV+g7Q5UTrvh@vger.kernel.org
X-Gm-Message-State: AOJu0YxPYUc2AGC/2CMWFFGkbj3SxNUCQFl1MrNYbUIc7kJvXIPA3eZk
	t9OP/a2T8z2uiZ8cxMHOXuAs0AIgpeiPfD7UT6Ri7PC8WcsMF2duU8E3qiXD7+VXqMZLx+sQ3YD
	dVR+rwM+wQcpOFDjpED2l0cu6m5I2TEv4UlVWJg==
X-Google-Smtp-Source: AGHT+IFXeFHfDvqW73HouL+c1fbM3uLW6xJKhKWcpriChOsEoYU7WskDnaN9ETOimjw0exomO1RbBjqJENYx33j6yHo=
X-Received: by 2002:a05:690c:ec4:b0:6e2:c5d:4edf with SMTP id
 00721157ae682-6e364100665mr136112037b3.9.1729106786143; Wed, 16 Oct 2024
 12:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240723-supervise-drown-d5d3b303e7fd@wendy> <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
 <20241016-shallot-nerd-51eeba039ba0@spud> <20241016-dandelion-hypnosis-9d989bb2fdd1@spud>
In-Reply-To: <20241016-dandelion-hypnosis-9d989bb2fdd1@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:26:13 +0200
Message-ID: <CACRpkdbJKWcjBG5ejwsNEgnnGWj69TAtKbgaHP3NiPM5GbiGQw@mail.gmail.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 12:29=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:

> What does bring a nice simplification though, IMO, is regmap. I am
> pretty sure that using it was one of the suggestions made last time
> Lewis submitted this - so I think I'm going to do that instead.

If you have the time. Using GPIO_REGMAP for MMIO is not that
common and I think the driver is pretty neat as it stands.

Yours,
Linus Walleij

