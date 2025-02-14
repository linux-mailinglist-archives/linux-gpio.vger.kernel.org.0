Return-Path: <linux-gpio+bounces-16001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B459CA35BAD
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 11:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AF051893492
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA2524A053;
	Fri, 14 Feb 2025 10:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXivNl3Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2A0204F6E
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739529754; cv=none; b=I8Z5m9tTqQg0UNFeaRYAf8e238le3mO57GCtas6JrZ2N0Hadd3BAPGX2Xkeg71XHSdMKfDrK8FeG0iLoBd2hDoK6wxxH5FjeU34ne9nup5u3D+CPz+EqilEsmJpas7QlbojVo/tG35YLOa7hQDBt4tpIfMyBN+SQkT+ZfyvhKMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739529754; c=relaxed/simple;
	bh=tEjiLlitcfTlxaKKdC7p1guCdclzcB1m0BYgVz3Tv1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LNHYDk2/UO5soooahk0puLEvZLFNau/NQAm9P1Q/IYL8H38A/m+i6N27ZKxwUVySqoNAznBrq42tBHCxbEPNz3CtQcIJW3oXTFXgOcrVv1WLpcwYZ4ZWJAgA8fOPoc2ZlCa80bJmPzi2u0z6qpI02eZazOu8QD6YTYizTeHSv0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXivNl3Z; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30227c56b11so19482761fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 02:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739529751; x=1740134551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rsHdHlVKc4H1RNRkS2GcE7MFwwvlGF/5DbmNBJwMEw=;
        b=TXivNl3ZYSIYSIWUC+Zb5TsInt1RZYaqXBppHm+ePzLawqEaoJXyLJUmbuIyNwJLYq
         rBCCg1Vfoq92hMAFIo4eAivsCmQyJAz88Y9ncabNfJCtVRR0j7fIMmEyy+uXQ8e8F2G/
         Xx8mc6yeJQl3E3oaRS4+7iX6ga+bU+Jp/rctbHIbIO9GDO7SYeqqPhLPGPo9z+Tq/V6D
         njeix9aHfciCryJMf8xkjfQkHlg6ailj3smcegohOBUN6WzS5fhmUHrE5b/Z69E7AtG6
         mLGZQ2ehdI0+L4RULTsEr5GlUBC2FJQAqO3y5PZYmzGRa2l9g/GmDf/kkxlkVhYwWY7l
         8MlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739529751; x=1740134551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rsHdHlVKc4H1RNRkS2GcE7MFwwvlGF/5DbmNBJwMEw=;
        b=QPNgUAFebOJUatFbM4UrPVa7yrpozTkj2FNdrgU4nkzahoiNGJhYqdHXEv7Y+z5I6d
         nkumCAYwbPXclbgv65rKtpRLS2vdF7Fd+IUFdkVU1GSG7sd++B3GvSLgASKMX4YiQ3qQ
         +5DNg8dKX4NrJ9rgrVW1Bxrs2u8KDIWOw4W13CfqAJUgQ5cGdmXxn5jcqG50MsiGdRnU
         YA4ICPrE5WZqtHcBsRTXvm3qNLN/vCfjhOQRLvVK/UNueFyhcqEyQPFL/D0fKJHmXyIt
         vMxb5RdflK65uAG35J2LovXyH38i4TE7D25kaN8pW93aGHbyijXnURS+U6yXh7wnTgI7
         NHuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8R3pgLqE89xvnZUhQiChAurJlqoBfeQLbenpY3T0yrKn6+Rp64OweeZweFejopdbB+W1gwlXtDMzq@vger.kernel.org
X-Gm-Message-State: AOJu0YznWpkxoMdJ6TOBDtKzMHC4fZ1zoCUyH39IRlDFrsHYzwVs9WbC
	iIgo8sU3tQq1XGowj2LN6+Y9Gb5hOF4Tuf6pNge1060EFvv6ZMb+VhwXj3vtgCYZDevDy9rojlr
	qnS1274nTESctdbIA6j+I1iYyic6gmjVl0dmiNw==
X-Gm-Gg: ASbGncvEgSL4mjG6gDg9kQcxroCsNoUu+qN6L9MeCrKibcyjSPtJThpFF0guW+V5WYO
	vppAfX7MSvG8nU4erdyRkOAr1CkTDErRgAHdnEfxGOgnsw876ArqNGnVez6o6PW+yTb6T/g0B
X-Google-Smtp-Source: AGHT+IGxJXXFLFt+pkffLdd9X2ho/U3c0PDBC0XUCpGyhZttHatbdi3t7azKj/PfBfek14+COG31anjGO/aEPcuLRUE=
X-Received: by 2002:a05:651c:e03:b0:309:1b26:aecd with SMTP id
 38308e7fff4ca-3091b26b4b3mr6773451fa.10.1739529751231; Fri, 14 Feb 2025
 02:42:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213-for_upstream-v2-0-ec4eff3b3cd5@analog.com>
 <20250213-for_upstream-v2-1-ec4eff3b3cd5@analog.com> <0c43ce67-4d9b-40b9-a23f-380d51912e84@kernel.org>
In-Reply-To: <0c43ce67-4d9b-40b9-a23f-380d51912e84@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 11:42:19 +0100
X-Gm-Features: AWEUYZn0VSwBLgOQWkZsD0PWbeVe8GHIvf8R7_nC9H1K6_4iZD1uXX1m62q-tew
Message-ID: <CACRpkda6ENy1yCQQdsxBnp+RvqgvgG73xHNt07Pd32YfzRQ75Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add adg1414
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kim Seer Paller <kimseer.paller@analog.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 7:16=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On 13/02/2025 14:15, Kim Seer Paller wrote:
> > +maintainers:
> > +  - Kim Seer Paller <kimseer.paller@analog.com>
> > +
> > +description:
> > +  The ADG1414 is a 9.5 =CE=A9 RON =C2=B115 V/+12 V/=C2=B15 V iCMOS ser=
ially-controlled
> > +  octal SPST switches.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - adi,adg14140-gpio
>
>
> Is ADG1414 anything else than GPIO? Where are the rest of the bindings th=
en?

I read the spec and it is actually an SPI-controlled switch.

(As in "power switch", not "network switch".)

It's a bit interesting since we have no "switch" subsystem, but there
is "mux".

The question is whether this should be considered some kind of
"gpio" (due to the nature of switches being off/on) in order to not
complicate our world too much or if we need to create a whole
new device class for switches.

Yours,
Linus Walleij

