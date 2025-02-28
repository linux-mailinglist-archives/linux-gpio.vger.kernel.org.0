Return-Path: <linux-gpio+bounces-16823-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDDEA49B24
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 14:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 725481710F6
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 13:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218F326E160;
	Fri, 28 Feb 2025 13:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="grI+STAK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352C725F984
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751171; cv=none; b=lfWBGfa9bCZndccIUiDbE1rZKFw0xg0FWL4+3IpdoIyMFgmFLfYCo3KOnKcuWA8XQdmeiu0dszy82rvDZhX1KcZLa9skHCgOMusBsMki6Hl0cY5mZdfjYttDa6/AQGMBE6dWfHaOSlPe7BstJb+io72FBBXLMwTB5gqOjPBus9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751171; c=relaxed/simple;
	bh=px+x86aKSLPgbV52+S2WFBDfxcJqop/aXnFFgDBY9tU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kcWXqQ/A8m3Ux3W2H+Q9u3uFksl55k2HcJ/67tZYrcvgd9Cym09H+QF4I5UzS5yqJZkMYuUI+KSSMmJehTBRbVAb1NwaOubKQCTY2C64bWU0VKG5TlUMGIsQuDY4noNLDvusmtgSgHEzUmHM+wbdaTpMQK7Ae6HIoaPsmT5/CuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=grI+STAK; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-390dc0a7605so1174654f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 05:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751168; x=1741355968; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=px+x86aKSLPgbV52+S2WFBDfxcJqop/aXnFFgDBY9tU=;
        b=grI+STAKOAnH08bihdrVdSxnngP7J2jW3cKPR/2Y5MaVL0evvPR0W3GzgzXLLYwR02
         u5AvChKCZpyDKfHvyh6wqJNJ3iR3PeAdDruTVVJLAsMt3fk8zc8rQQ183v+hwwhk7HLz
         /Pmr+qtoqG8NlpXVL9dbiPdgqVu2iVcmT39SkEJd8TraGr5jgVoj0+3fXwT/jXVnCU+3
         ly9xKRuwG397WPW8o5uX63mYDvTpS/1gVgWd7Km2ciUy2hZi8pvmTKOlz11IHDhehorp
         gdfLMBHpQw1JttRu1/RG0yCHKsf52m5VoUPXXWa+OtM1GgDDu/ArHT2ioYrFvwyK/QJl
         iWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751168; x=1741355968;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=px+x86aKSLPgbV52+S2WFBDfxcJqop/aXnFFgDBY9tU=;
        b=l3A9Ck8bx80uGtlKRSk5Bn/l7kah8Ds/dRmNEl/Va+Aj4o1Lv+2ADohPOj1W4y06GW
         mX/zmyNk+lMMOFTPBiapqdkgGK06vIIfSZklh13yIXelloMpw1/HHdcCFPIgMpKOSVan
         NjSLHuUfl4JWttFl4j+fYWIb/tO6rijC/trOHCvip1xjMg6/Qkx9uBWxuSw9Alk54jE0
         UXWU+ud5IU76UmmROsNOKJN6TnlO3GCqMMVreBhasyIMFGSjKx2M+W6+u3p/XyzqdAT/
         VW9s1ENMqcn44rg1mOuIOSe4ubPEfAgy/I8M06eh0k13D5dZWu/QplPgZAyPFj780Qty
         eh0w==
X-Forwarded-Encrypted: i=1; AJvYcCXqIrezNpzSmyFlePGE5BiiDuTBhGXUmW7jAgJau38+nwHukEv6AupQoGzCUhJFwl3vQ/7pbydpBO24@vger.kernel.org
X-Gm-Message-State: AOJu0YyzlLCAgMI5wlFTv6JWba/nBEyKS4A+b0IzZf/Qixyu+NJH8mnU
	ELtQ0pf5UgrsS1x56tiGXitkbTUn4E0RiSrXqCSJmUH+XarAdfy7KyJcvhOWOKA=
X-Gm-Gg: ASbGncsffKPpRNKzjeaHuKKHg5tqyO1s3OU13NIArgkDr78f188g0XSUSwmbQJXNm69
	Da7NTq/Xb5u4pB4o2a846jvePS+HUftldJ8VguTQ2hFdf7IrTfCgOw5Ko6PjGLpWDHAOQT+XOq8
	aizdRHLkZPdApZLdvgGwssaZkQz2TE6wi+JwYG9RaKtEt6ZJjfqZzZA8Hk2lGalrZlJik7ofXzh
	j4hVjU4ZhjlUhLDnZWTXjYsws+LCLlVkJ4y9yjsQ8tQgekyhhyNck/tlpIRw7u/12unEFkDYnBQ
	lybli+YWAAb3mIWZegtnAhj3mAtwAw==
X-Google-Smtp-Source: AGHT+IECpo32ALWrFa1cNaiDX3uH6CqXkFCNWGuhJmwvZ0p1RSpM7dQPjKfV2CnvU0hTwmPQDg65lg==
X-Received: by 2002:a05:6000:2a4:b0:38f:2990:c074 with SMTP id ffacd0b85a97d-390ec7cfe62mr4082089f8f.16.1740751168393;
        Fri, 28 Feb 2025 05:59:28 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485df22sm5389786f8f.97.2025.02.28.05.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 05:59:28 -0800 (PST)
Message-ID: <e355ce38815760e69f40ec6d9d27fb6cab8f9894.camel@linaro.org>
Subject: Re: [PATCH v2 3/6] dt-bindings: mfd: add max77759 binding
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski	 <brgl@bgdev.pl>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, 	linux-hardening@vger.kernel.org
Date: Fri, 28 Feb 2025 13:59:26 +0000
In-Reply-To: <CAL_JsqK-_rPZqt_vRv75dSWDLUAyZ-LB=qz5J=Kse=7bO4q8sA@mail.gmail.com>
References: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
	 <20250226-max77759-mfd-v2-3-a65ebe2bc0a9@linaro.org>
	 <20250227130451.GA1783593-robh@kernel.org>
	 <503e105b71fa4271f40a2d3ca18ba13ed7d45a65.camel@linaro.org>
	 <CAL_JsqK-_rPZqt_vRv75dSWDLUAyZ-LB=qz5J=Kse=7bO4q8sA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-02-28 at 07:01 -0600, Rob Herring wrote:
> On Thu, Feb 27, 2025 at 7:14=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik=
@linaro.org> wrote:
> >=20
> > On Thu, 2025-02-27 at 07:04 -0600, Rob Herring wrote:
> > >
> > >=20
> > > Why do you have GPIO properties here and in the child node? Either wo=
uld
> > > be valid, but both probably not. Putting them here is actually
> > > preferred.
> >=20
> > That's an oversight, I meant to put them into the child only, not here,
> > since the child is the one providing the gpio functionality.
> >=20
> > What's the reason to have it preferred inside this parent node?
>=20
> It really depends whether the GPIO block is a separate sub-block which
> is going to get reused or has its own resources or not. It's the same
> thing in system controllers which are often just a collection of
> leftover control bits.
>=20
> We just don't want child nodes created just for the ease of
> instantiating drivers in Linux. While it's nice if drivers and nodes
> are 1 to 1, but that's specific to an OS.
>=20
> You already need other child nodes here, so I don't care too much in this=
 case.

Thanks Rob for taking the time and for the explanation! I'll keep
that in mind for the future.

Cheers,
Andre'



