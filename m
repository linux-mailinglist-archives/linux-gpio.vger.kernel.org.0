Return-Path: <linux-gpio+bounces-27726-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C55C11985
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 934471896ABE
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 21:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF5432ABEC;
	Mon, 27 Oct 2025 21:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TVbFPix/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FB5312815
	for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 21:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761602341; cv=none; b=UsPK9EiqpVOyt94XUNFQIVr3uveMvSeeovh+gyS84CMXIRAxWZtZ4AHph3SahTpr9ULqwKeUB79S2qQHVSfiQMAsfWgRcOrPlOalOYAA9p1jB068Y/iRil1uZ69j2s/buKJiNVWdqh0AxmQoeEvKtG8eycGPnNR0VTKN9m8Sllw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761602341; c=relaxed/simple;
	bh=+mU5C7SFfUC6J4CkhOJClsnPEoZvWyJV/mtXvk0G7No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EU5DBP4KAdlcdREZucH0RpTeUiVJg1jSYmsKuOfdVh58vsX2MNcXxe7SI1qBa7wm85JXmI3zhPTcum+FGLAWZ3OpoSsdAM+QWF6YZsBaR+BgVkF87FjwZOcDP4RBSWDkjFFMvWACXY+EvP2CK87P0HSZEPrSdPPtEL77u+d92AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TVbFPix/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-592fa38fe60so6039577e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 27 Oct 2025 14:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761602334; x=1762207134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mU5C7SFfUC6J4CkhOJClsnPEoZvWyJV/mtXvk0G7No=;
        b=TVbFPix/MEpkDHpX0aZDlETK1VkYOmtlsAs1c1kR+oesvKyM3uq5XWm55MG1STEo/h
         mO77I/TOqg53ZsHi9lvEAOSumIzBnVQPQp5G6cFmvDUDVn5SaWl1m59AHpRtTHFEshfJ
         HrjKwY57adUt/mJ2r0jyDw4zMR+7zBuxaZ1z7qAdggaEB6CuCb5u2ocCwSAFOl+FZDeD
         UsmLz0jTR5SynSNJ/NPefnsWTnRgHmGUzt762P3+QvCWDNjulKbUO8U4JWQCoFLI6EuG
         UPYbZ5sYYASVDcuJB63EUcom1U2If0J+BTi0cDmQrgzw6LWOLD0Jadl9SXLoGZ12Wzng
         SHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761602334; x=1762207134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mU5C7SFfUC6J4CkhOJClsnPEoZvWyJV/mtXvk0G7No=;
        b=GlruGj3eR+ILv8zirctGT8iOvwOZKx5ZGLqIyWUCjuGMyA78VyHManZqQGUVx3G3ck
         AHuVZMt3yGBHnftS61f0KzC0lvQNUfernRoIj4P3ETNpvwwtqHl/Ekc8EZTB1Xh+/GMF
         vLvHiFYTAAj2BKc7gPN7Nj3yfFbjCjFl7sOhWMpvxLcbjkAmQYqmplTLpIBOAuPEcl/B
         ma61XrqDwPm2xHI0NMVbQyDTv2Tn3/m+Vv8YrjVECtuDFknlZ8qHb2kUzxDcbs0KQPKV
         38wsrQdk52c2uZcnCrIaU6OP7OxacGejQICBsiEW/5hv8y19l25mlQzqY7n2Ze7UOuRs
         JqXg==
X-Forwarded-Encrypted: i=1; AJvYcCXbjHCnlW62r6uWWGSSiHXqB7lRAp2X+QsS5A5f+cq5Frp6GfLy9D7/kOulxl80K8EZmZzRw8VsZCi6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv1jJbCBHWlQjNci0YkQM8rdXo1nLuRirimEA/jwVK+vJA7chI
	oAe1Pgrc5nFMFaehLygvAaegFoLzf2R29MCOAEqkl+mUymmVETt+PYG5EJD8iRMBmujJrM/NCRJ
	+m/0x6gWpmqHZT9zx6jl2iDcJ1xj2pNOfr1dqFuJtRg==
X-Gm-Gg: ASbGncuqcp27q2evpSyBE9X+mVL2bUJYR/Ye8Ualr/R1/UkofiRkyTOA1LY2kOKkZeb
	svPXUHnNYGXfJUzTKkHy+LJUdksLGpE7fk59vEaZKpDqmA9GBXWhwL4mCaebLR6Q0eN28tzgmC9
	VWSSoTh0SKS6lJeDGrrVS/6rcu203G1Tk3ZvINiKw8nuwBt+cHN/dpJ6TQtY5ABhg2Pn1s9+X6z
	gq2VpQ/nCqsRpwMxfYXvoT3uBc9HACmRmhhz0Qdy8DjvMBJAwa1Ps4rd0SW
X-Google-Smtp-Source: AGHT+IH74o4YwHFrblcCgtKny6KnIQvfpnqGtyi6DTdYt7rXfkYKCJxr/ADLzmPlUwLvMuIMarNyWU51gxQT7nyU5+s=
X-Received: by 2002:a05:6512:3f0e:b0:592:eeb7:93ed with SMTP id
 2adb3069b0e04-5930e9cc2admr556166e87.32.1761602334166; Mon, 27 Oct 2025
 14:58:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022165509.3917655-2-robh@kernel.org>
In-Reply-To: <20251022165509.3917655-2-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 22:58:43 +0100
X-Gm-Features: AWmQ_blAMBN4XZpjKBnIGmFZUkW4sspYUvqfxOKik98qDG_Txt9XayPb2-OwUdA
Message-ID: <CACRpkdYioyktQ5is6TJnkgX=MHk2-zf-XO-gx6sKcST2GABNiA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: Convert Marvell CP110 System
 Controller to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 6:56=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Convert the Marvell CP110 System Controller binding to DT schema
> format.
>
> There's not any specific compatible for the whole block which is a
> separate problem, so just the child nodes are documented. Only the
> pinctrl and clock child nodes need to be converted as the GPIO node
> already has a schema.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij

