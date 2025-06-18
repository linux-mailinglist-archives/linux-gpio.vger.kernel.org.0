Return-Path: <linux-gpio+bounces-21724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEC8ADE6EF
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 11:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF847189DC68
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 09:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4686D2857D8;
	Wed, 18 Jun 2025 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vqkAXk1W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EF6284663
	for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238906; cv=none; b=d30mIR1A5su0L1ADdFdedZRlaq0xP4Zu0dJub4RPwu+ngSAd9zgJiZcb8oHI25vn95o5bXgFtufGqM0/NUELxEOIl9MQiQY15LngUjJpn0OrBcbfD7GYMGkvfb1BH4PGOnuJwY5zqAW+2yYPTVemE7ITB9rKCe25X7+oeHQexBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238906; c=relaxed/simple;
	bh=BdTd86rD8wGBkEGobCd3dIkyDDHb4Ycg01Tusl+Lv0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=luH5twBh4vYAZzQ/qGb/EShzFKbbH4O3ADDuOTcrIPStEDxGi1jORpaL0sIlo8eoLg/Nuc8UkDA5YCSvalIVzfsmPOIUclcmIRW09YCbyBP1jvwjE/2LZ9n5EehxcrHbgYLl4ESUYpK2tLCxGW3Yk73GaCVdMHEZxhcTmUlSaX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vqkAXk1W; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso3890800e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Jun 2025 02:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750238902; x=1750843702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdTd86rD8wGBkEGobCd3dIkyDDHb4Ycg01Tusl+Lv0Q=;
        b=vqkAXk1WN4j8C7WfZ2pxXm/Ee8GQntNeRJ/0UOFpmjihDoEUU7TQY8QBVmPRFtFS6x
         D6tdUVKuxDSmyrffgKiZ/zJiHUICj3kooLzbXXijH6bPZnS/CUQ4WJbW2oAsic2malkv
         7TGstFzXDWREZjnkIylBm4IKd6IqfZ2AIcVAY3rnTUAHC+y+qoMvaEHbtDP4CY5tT+DC
         j0YiOdJGUfMSRYo7lI7KcPWwj3bloTk09hc0/7dgezdthMN96xkBmuxjo7OxUj4Vzdt1
         skTWhFRlNS7+C77bODAOtskqOHrnddKJ3fK9qMw93y2g8arjeflNO70/IPSTuFKeOJUf
         L0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238902; x=1750843702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdTd86rD8wGBkEGobCd3dIkyDDHb4Ycg01Tusl+Lv0Q=;
        b=FsoyCoEKYmMzdmw39JVE/pYqUbc7JxXdZaFT97avqHs+dIz9xJZM55Y5/is7jqjsXx
         9aktvjG03QV5/KaEAxnnMkJeji/ww36ag+rhKL6Asif78jySe2Ol9oQAObNbWmC2O2pb
         9h5+ySji9fydUhg6jLBBXMoGu/UpBczUKc4ajFwvoyv5VjJT1qPW0t6QqMYkwQsIycw/
         Wzu43K/l2xo51sqQLn4G+M5ZlDEEXOalLrPzwijEOiJoFcqZnIPWhzrGSV1X9As5q5T+
         hqCpIeGH2JDJZ5xdTs5WQQDY3krbOF4h6kPixWBoXBCKPZTDsXUNz8hhOrXpA2+z+n72
         7v8A==
X-Forwarded-Encrypted: i=1; AJvYcCXmtbnmrV/TUBLrLIDheBzoyOkX4cS34dDFNHDsCNQ5Tj2iZ0KGH0otcExPw+KJbeEvhGmR5T7Rm4hV@vger.kernel.org
X-Gm-Message-State: AOJu0YzB2w61MzKs5+c6rTg2B+sUeioWAM62xBiNjLC+l/2I+f1kxKIB
	8N/o5dc98brabJ2/CCQrRi9I+25VwCiSOMFY5HM1fkXZNe54MJyHPQH5u7LVq2kOzm7hj2goNVF
	LDXne1CCcE98aTb2Fz7DEqNCJFY3lS+SmKqovKXXPyw==
X-Gm-Gg: ASbGnctF+n836ChTwRg6Ba1/ssWaj+EFYw5hoIFxM7o0alx245x9UwsQIqYedSAL8xP
	x3l2DXHtnFIzw1S3DwGJeFaTfY2PJeUoML9cSDzgrtTmmO+iTwI0ilcKYAnIt0SQTbSPEunK/zE
	Ff5IpcGA/WqnrvxwfPQKxXTHDUmvFRijjgoQ4vJU2OhhQ=
X-Google-Smtp-Source: AGHT+IEqIwMIpDCAfC/mp2g5or4udP4zqxj0H5Z8NfKN9pZpGaYnyn1sPYmydRm3962RKwUckswXX8mjoIzWXQbsVfs=
X-Received: by 2002:a05:6512:3ba5:b0:553:25f4:695c with SMTP id
 2adb3069b0e04-553b6f4470cmr4666950e87.50.1750238901764; Wed, 18 Jun 2025
 02:28:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609220900.3035642-1-robh@kernel.org>
In-Reply-To: <20250609220900.3035642-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 11:28:10 +0200
X-Gm-Features: AX0GCFtHdJldExb7osATG0sE9yc28prRhU8fIk70sNT-r9whXSNHnrPKGLd_oDo
Message-ID: <CACRpkdYea5F5pvQY1Sv=u3Oe9Bv5bp31Jwvo1uftQYbwF0U1rQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: arm,pl011: Drop interrupt properties
 as required
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 12:09=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> It is possible that the PL011 doesn't have any interrupt connected and
> can't be an interrupt provider, so drop the interrupt properties as
> required.
>
> The LG LG131x SoCs are one example of this.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

After changing all PL011 to PL061:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

