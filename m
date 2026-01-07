Return-Path: <linux-gpio+bounces-30226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9838CFE414
	for <lists+linux-gpio@lfdr.de>; Wed, 07 Jan 2026 15:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA168300EE6A
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jan 2026 14:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7E534105C;
	Wed,  7 Jan 2026 14:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MH3gKstO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196B434104B
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 14:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795442; cv=none; b=FZZzi09shIkmyskZWdWCxSUwQu00V70FT+Ymr2bAyLUNASInEI1RHRfhiluzKWGTzmpyzENuGmVZ4dvVGkQO97iiMLy1oGCjHj2ylx7eFzXrf9e3gWzy0SwZVvc9J7Av6FSVtIPjxypSc9S3Pvh1lhaXOAcGrsIKoYQYsGyWjAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795442; c=relaxed/simple;
	bh=YA+mxCm0xEj7DarLlUtNQJH0h/2IACD4TmnFXSGRqJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5nYm6k7u4xjN/KSBEIbmOs6T0ECQ+xNR46+QfUagV6h2X/yqZKqbeF/a1gEUTkZkBlVNX9p8WYRJBt5mjy4+CLsuou/+WnRIp9XIJUKtj7UMxUQN3pp4btHflAjZ2nWq4jUP+vRqHak5UCuwNkG5I8SlCdiVhJ9tpc9CHRYGHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MH3gKstO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBAF5C19424
	for <linux-gpio@vger.kernel.org>; Wed,  7 Jan 2026 14:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795442;
	bh=YA+mxCm0xEj7DarLlUtNQJH0h/2IACD4TmnFXSGRqJY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MH3gKstOmBHlP7FwRBEuPp5n/l/pcNf/0SB4TfyfeYmIK3p+pnDAauBLp+mo25vcQ
	 C0cVDpoWD2NStcDnWXL6a+GdgHDBoazmHA4VhaTGnULGHXHcxVmdnah3bjQiAON3A1
	 803+m52mctidSfj3bLGKeDDksym2Mv+8V8w3+y7rUraT2Vs6cdJT7FCL+S95BtaQ5B
	 BZhg9tql9ZIoKCZGWlWTyNX0i3O/RC8N+3OZJQ5KDRo/Ibl0mYlUI5V2uYNKi5O1m3
	 naEDw0o3MOsyIA1Ec50IFYKQaWVAmzVMkc+CPPLttp18Qwd9I+3WsK76dzUCyXz1C0
	 qDU4BHx7sUs3g==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78fc0f33998so22302407b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jan 2026 06:17:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVntpeH8fLoEKLhNFoS1l9L835NP6+j1M9yt+A+O8foPeexf0c5taWtq30acCBGEJPimWlabeYG9fB7@vger.kernel.org
X-Gm-Message-State: AOJu0YwC4fsFCmL93KGUbAVSgsOxGJPCAXRb6081mqh9gUuOgxqyiW89
	SHEBw/cdqhG0fpEsidhFhsaRadj8qr+kxPQMY9gbWvFiijgObUG5qWcy4BojhRAuHjZCnDS4dHl
	OvQIeoawZXYrrGrOhu3Bu1vLycbuZgac=
X-Google-Smtp-Source: AGHT+IFWz8BRlceis+tRl/aW/9vd79KfmxBq1oamU+LQ9mQvDSyStZFHgNip5biPn+LgYnAn/tyKFWHR9JxLOnciWJg=
X-Received: by 2002:a05:690c:2902:b0:78c:655d:f7ba with SMTP id
 00721157ae682-790b5800890mr55036157b3.38.1767795441238; Wed, 07 Jan 2026
 06:17:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217080843.70621-1-shorne@gmail.com> <20251217080843.70621-2-shorne@gmail.com>
In-Reply-To: <20251217080843.70621-2-shorne@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Jan 2026 15:17:09 +0100
X-Gmail-Original-Message-ID: <CAD++jLn6FrJ4ZsMMQxiKkYZ5k-ekEXw8B8+1FXUYycqN4Cm-Hg@mail.gmail.com>
X-Gm-Features: AQt7F2r3cLS6QJSNoZCGwNenwmrF23J-ho2AOyeoy5pSDo7ehWmWTffX64bsUso
Message-ID: <CAD++jLn6FrJ4ZsMMQxiKkYZ5k-ekEXw8B8+1FXUYycqN4Cm-Hg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: Add compatible string opencores,gpio
 to gpio-mmio
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux OpenRISC <linux-openrisc@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 9:09=E2=80=AFAM Stafford Horne <shorne@gmail.com> w=
rote:

> In FPGA Development boards with GPIOs we use the opencores gpio verilog
> rtl.  This is compatible with the gpio-mmio.  Add the compatible string
> to allow as below.
>
> Example:
>
>         gpio0: gpio@91000000 {
>                 compatible =3D "opencores,gpio", "brcm,bcm6345-gpio";
>                 reg =3D <0x91000000 0x1>, <0x91000001 0x1>;
>                 reg-names =3D "dat", "dirout";
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 status =3D "okay";
>         };
>
> Link: https://opencores.org/projects/gpio
> Signed-off-by: Stafford Horne <shorne@gmail.com>

Looks reasonable,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

