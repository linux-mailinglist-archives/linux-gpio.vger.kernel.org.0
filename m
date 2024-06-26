Return-Path: <linux-gpio+bounces-7724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B294C918045
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 13:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E0CF1F2825C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 11:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EE41802D9;
	Wed, 26 Jun 2024 11:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z7MzysBI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95205149E06
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 11:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719402839; cv=none; b=WRniK19MrcdtmxpU4btNSqX32TMtMmxRtseBpHMrtdqkM3tjgypvp1aQ6+5jZg2ZaEYFnEBoe/vEhP+K/xNGeYxDwNsynqk5uxqojU7chuZquGOC9dgfZOScvXDOIfD4WzdsdjtxWEUxuPk6L6NSgHlNFBE8y0o+cbViJ8I4/oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719402839; c=relaxed/simple;
	bh=t4QnQiAAvKS4rt9+w5OINOMssi64SFHO6cDlDm4yBRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvsT7Y3lJhGVjJ7VPf2/6kjx+BltDZJvBqmhWCK4fQDFCDqwcqHA22lGQoent1SdB9uN2jUbEjtMv2GveYrM+05ZQaaDX4gnJj3uMJKOB06yLv4ykxyUH893RrX0NwvUjCOa8e95De891Rbf+3OCDO8CO15HNvnP59f6BoXFUhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z7MzysBI; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so75898491fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 04:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719402836; x=1720007636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4QnQiAAvKS4rt9+w5OINOMssi64SFHO6cDlDm4yBRM=;
        b=Z7MzysBIO35fPlQ3y4WF8omYoXMvdMqCx9APq80vkLyeug6M3jRguoa4/o0pya2FsQ
         jIheL0Ywr8RSR3+ziLyOy3gH3/sypkPG2oFw86/ZcFEQzcZCt5mLUJVYQnrYblXGJoUH
         RotHINvv1inuaeT0gxg/+xzV2IrQaEXmQTW7Kqs1M9KSUMv99IGQkmKdZy4hbLNecqms
         TD+tZN1YrSwoPmzr6/T8xaw8ghKkROi45mBFDhXVVS0qQAMkTB63Mr/meamWxyDg9RR0
         1B52+mqwK8W/NTxVSPpxYtR4x2XRKJGTWjub4k//CX3onckOld+qaPLrJe0Lvd1uBJvv
         hxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719402836; x=1720007636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4QnQiAAvKS4rt9+w5OINOMssi64SFHO6cDlDm4yBRM=;
        b=KtYaMG9lVh/n8jx7iNK0oPAHFDZtEBicT07Zs1qTWqwvc9iroaRxPyXlamfje2c0KE
         22/TsZRvUTPaJA6t0dW42sRhAmScW9z89dbsmMljwq8P18Wnt6sbsgnDQaIwjsIzxAuL
         4IqACQJWSLF4MwNi+Y6ZnyRTaLlKUz3E2lu8nNPKDy6kxZVG7PsBc2orOXm5vHVslPNX
         OBcjO05abRj1iHYXA293ztDIfalTLsQK+EwmSHKWGwsRpv3mszieT++g/iykF+9OjI2/
         OZioVSvRNBJpVuuxVpy5qIYW94FCssWwuiM+uDPmVjKNF/axxA/uSqaEe/v9jPHrJuPh
         Q7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVuYMeOYO/o2n2EbBnHioYWs/WmHIqG+FvKomXa8AKYZi3G7WR27f8aswhlOVnssYH/IluN0NQ4Kqt2UnTqOqB4prMBTuHAM9jNSQ==
X-Gm-Message-State: AOJu0YwoVhnKWdNI1wNobp7AIXAfNv96X3eJplE8xLZMgGVVd48D9Jw0
	SAk3kOwaKvTMbFicsZLE1uZ8CV7BH92TjwzuQa0DK9nQl8OiirMd4M3cTkd/XTva4AbR9zxCeDY
	K4tLBb9q0wPgTiR9HPeYCZWHz5rnAtCbFJ88Xzw==
X-Google-Smtp-Source: AGHT+IHfgQa2jdl41DM6WUs5TR/l+YzB0+Zt+uOHmxpLnkmqfkC8JZfrxv9WacloodOw0FsYNj3nJp5iaAX+hw9hdnM=
X-Received: by 2002:a05:6512:3a8b:b0:52c:e402:4dc1 with SMTP id
 2adb3069b0e04-52ce4024e00mr7078665e87.55.1719402835840; Wed, 26 Jun 2024
 04:53:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com> <20240620-mbly-olb-v3-3-5f29f8ca289c@bootlin.com>
In-Reply-To: <20240620-mbly-olb-v3-3-5f29f8ca289c@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 13:53:43 +0200
Message-ID: <CACRpkdYLz3vMbft8dh_=dqd-yB+YUsbP2jbHBXGnUPZq49Mrug@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] Revert "dt-bindings: pinctrl: mobileye,eyeq5-pinctrl:
 add bindings"
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 7:31=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> Switch from one sub-node per functionality in the system-controller to a
> single node representing the entire OLB instance. This is the
> recommended approach for controllers handling many different
> functionalities; it is a single controller and should be represented by
> a single devicetree node.
>
> The pinctrl bindings is removed and all properties will be described by:
> soc/mobileye/mobileye,eyeq5-olb.yaml
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

