Return-Path: <linux-gpio+bounces-3914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 594A786C4BF
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 10:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6805284D6A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 09:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C2B5822D;
	Thu, 29 Feb 2024 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wIQcQEDn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1DD374C3
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709198243; cv=none; b=mf3/lAw+/GSGPiJDS7beXZB6nsmo+whrqYSbOy6MvMQwUkm/+gaPVoQ9MrxjQ5RgtnkNeZRTs5AUFY9lSwt5rV5U+RMAMBYL7ihLCsdaIT54Ef6buc7WssFhZ+RAy1uUhkGH7JNhmYkjre8BztaSHhfhfU53jU1rRmcom7Olbcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709198243; c=relaxed/simple;
	bh=pyMOm65mkTq4KPjGu5e8RURncimpVYdKFWYO5eLhNgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6E+8L+Iq/qs+rKleL5mMJqvKAQmlUipL3P9+VWx1DlvvVFR2PkLuPHPQD11XFWWS3trea45nwGdW0rNK8n+gEu+JucIB4Nk2UtwSgYKPRXq23rGJAkRuqLFS1T3Ke/dxgwllcSrLB2IwkmSTbobQBHZCWsN+RTcfAcjLSZaa0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wIQcQEDn; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6084e809788so14738077b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 01:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709198241; x=1709803041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyMOm65mkTq4KPjGu5e8RURncimpVYdKFWYO5eLhNgw=;
        b=wIQcQEDnaQmtXyOq/SWlcunU2bk2yuQru4KZawdmWXH96/3SUYIyU8+GDtzBZsP/1I
         hjkR9xuYNZc0kHSuCy14nVy7hMjL6nEXQ/qyGQHAYpt+YifkLhHeuQEjgG7Ksz3+FKKf
         /KXHC+8Z6dvfr3ZLt17ok5psG/ztG0PNr8YgvACDkQplVM4pw48tLLba+ckwDgsLHArU
         y1nqzMSCmbb6erIqzK0e9rbgCIwED7Ujz0uflRJdMsIVDHY3T6QAWVUkFPTlYuUXc04t
         2lgYZWKdj2cc2IP3HUF93l57RXATGtkKVXNo15UKmwVjps9EkMol9eRkxBd68PzUk8Tz
         pRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709198241; x=1709803041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyMOm65mkTq4KPjGu5e8RURncimpVYdKFWYO5eLhNgw=;
        b=Amji6vQIrw10wxMDErIiNeWKM+bc0EPtvVRKtitY1W2UMa4c0D6QNGMRx6LlSF/Xer
         DCWmjPTr1fr0V8cxwEq2IbXqcU2tyiRvQlg2NPoWNH00OzJ8oky0YKwoOITIEJJWvAkf
         WoquabXDj6uGAxlXPl4eHajf8iQf4GqdT1mXKKdRWeGPvclu8HuNQt495iql/uzt6Pam
         +4esuGg9nhvvWf7AqjVeFtUdKbQOy2ql/Qb2020PQy7MUrPEa1khzz+zjD4WTCa2lptj
         inAPl04r5RwTyNGsZHswCO+pVuZLNfNtugR5OrdcT8EITg11SjeXMkyMfoKjpd8HTpZ2
         OBOA==
X-Forwarded-Encrypted: i=1; AJvYcCV5khNixgHUqU90uhE1kbl+5z/z5tcVxDbsokh/MPQIATJwwtRHcS0JOjZhohnnZ1BnyhR5hUYrFq60kbsL/gBxu6ZZc8u5hYGXWA==
X-Gm-Message-State: AOJu0YzQtv7+91VipkYvww9/tRuIHoj2hZooX+dbZMfF6plM/5OSwJPw
	4ss9FDB32/GWAWyLq8C6TbDsEc/q5RhmYYGGHXOiv6xJAln7iJrhUvsUjQCNZQEabgGY0gP1Lmm
	itPIMVYW8mSf49Pd2nTRcVdD2oYvf5otINuH+nQ==
X-Google-Smtp-Source: AGHT+IEGuc1J77jqIh5A2j3VQGDX6nzcAs4cFbpidh2ExxatqFvQBOOAMN9rR631yhTD85gXsSS2YzVQ6uvvblXyxJM=
X-Received: by 2002:a25:b309:0:b0:dbe:d2ec:e31 with SMTP id
 l9-20020a25b309000000b00dbed2ec0e31mr917083ybj.27.1709198241022; Thu, 29 Feb
 2024 01:17:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-2-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-2-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:17:10 +0100
Message-ID: <CACRpkdb_U_vLypuZFVDwCqSp3EwK0DCR0cOi_MJ=TUwCCQOF8A@mail.gmail.com>
Subject: Re: [PATCH v2 02/30] dt-bindings: gpio: nomadik: add optional ngpios property
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> This GPIO controller can support a lesser number of GPIOs than 32.
> Express that in devicetree using an optional, generic property.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij

