Return-Path: <linux-gpio+bounces-30035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0836ACED85E
	for <lists+linux-gpio@lfdr.de>; Thu, 01 Jan 2026 23:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF46B3000918
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jan 2026 22:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6589E2765C4;
	Thu,  1 Jan 2026 22:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mz+aMuEp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239BB262FFF
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 22:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767308054; cv=none; b=BzQ2iyhRV7d/wXOnBZQWLIdSRxhSdp3VdUKmsoVu71xXu09BC8MsVDO2gOnJkGiMThtLNbqflqdAtLqR8RlFf8ebTKIpRjoDYzQPnZjYl2MWLsLBVEG2VwjObLSLPzdTaLa60RoCPEMOm9YzTt3hJ1s9b175yfpxJj5mf4TzooU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767308054; c=relaxed/simple;
	bh=SdIk42cDOk2dycISNtX5+PpGDaZCWGgsqUMPWf4qg9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROJcHmaaxYBhqFrmwwln2nDXCbFd4L0F3q2lfOFYGUVw+a5QJ/HhVzHtv6RYmMxGGRxDC0yQN1cxbDlFIon/IRzWY6fjq9hs9UQSicrV2n2eHX7GRS4pA0SovoG+ia8OToyXm6pOMeb68gZG101FJmXAO/T5znnqeZU/sJ3Rdjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mz+aMuEp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99085C2BC87
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 22:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767308053;
	bh=SdIk42cDOk2dycISNtX5+PpGDaZCWGgsqUMPWf4qg9A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Mz+aMuEpXt4rAzZOX259vYhz7HwxssjCDEDW9HtT7kX5sHUYA2MNiDSfabVnEj5SG
	 ArWadhLuZdw8xxc3j+Vb8mqipZAKg/vDsrEsAIfKbjVM+mFGTFLVbStDbKL86363c4
	 gFJRRzJrdeK2wbxNysUk7JGNLz05Q1/7lkt1QwyFPbkQOq7bKbnoYSnbfFOVJm3Y+h
	 depROBRYtDimJSLoU7vkpCGdwpOuwGWVAqT/kpHMc1zOVoueKVav/DQ2F6fEyPbbQt
	 SU6iY/pHS+VVI/J6DC0o1kKQ/DciyKUlLQx+4oC96ObAVvzMo2haKZOQATebYzCVYb
	 hAPpF5gN4X/Zw==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-63fc6d9fde5so10062968d50.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jan 2026 14:54:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFNnqgCDfwj4AJWrKLmiHht+9u95ZEP+8roLqRwZkiaB/ZdQIUbTv9Stoki1w3Ja5M2Y9Q461gLSIJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd2c+Pmqji7n1Sd8QiVUZ9kaUTqoLmatpDeZZTuQRmzOs8hNTS
	Y+gDTobJeHi3NJAp52DyNbI/Tb3rDhpb4JJCKg3/zFOsy0Wvpdow7FhMxqHTPNkCAIcY2zrMn91
	dZnSiNGgaFwHROtUzZpIDRyjitfhUz6Y=
X-Google-Smtp-Source: AGHT+IHOoFykERP0lAwZMoeMOFbxzQzpVVct6iBZoi4uZM7OehAI1cvgRKKw5UjMcQVmbNq+jXfwDnpUleitrWdX8JI=
X-Received: by 2002:a05:690e:130b:b0:646:903c:1b90 with SMTP id
 956f58d0204a3-646903c2353mr20637639d50.41.1767308052926; Thu, 01 Jan 2026
 14:54:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:54:02 +0100
X-Gmail-Original-Message-ID: <CAD++jL=frL+GiwCRPKfnVe0i6Q+6vwcmvvdGmVLotOk37N_t4Q@mail.gmail.com>
X-Gm-Features: AQt7F2oAuS27OFHvHrgL7QzWBM7k70aHQ15ssQkK2fmMB8ibqgtBtkyMJgUw5is
Message-ID: <CAD++jL=frL+GiwCRPKfnVe0i6Q+6vwcmvvdGmVLotOk37N_t4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: add syscon property
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Troy,

thanks for your patch!

On Tue, Dec 23, 2025 at 10:11=E2=80=AFAM Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:

> +  spacemit,apbc:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to syscon that access the protected reg=
ister
> +          - description: offset of access secure registers
(...)
> +            spacemit,apbc =3D <&syscon_apbc 0x50>;

Isn't the offset implicit from the compatible of the pin controller or
the syscon or any other compatible?

It's easy to check compatibles in the device tree and just say
this offset is 0x50 if compatible is so-or-so, and something else
for another compatible and just give an error if an unknown
compatible appears.

So: please try to avoid to put things the code can easily look
up into the device tree.

Yours,
Linus Walleij

