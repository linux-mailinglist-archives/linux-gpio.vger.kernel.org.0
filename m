Return-Path: <linux-gpio+bounces-7627-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B91913FA2
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 03:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61683B2096A
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 01:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9811C2E;
	Mon, 24 Jun 2024 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="RXWdII/z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334222107;
	Mon, 24 Jun 2024 01:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719191125; cv=none; b=CKLRDQZ4Wx2+OYNGhc3bnsxkvPe4tgiKrnR0Miwqowlww5Fg1lVCuoHUrlidzijvUlYfuWZxDlTYYKI5XCZ7pd6cKZZTazjMHpGlV4/3R7XxPSAWowYp7b4vCIBQo1aDp+zPIrziQSv+K6++h5jl5VNi1NbkV2+mPLKIUl8cd18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719191125; c=relaxed/simple;
	bh=9E8DTzg+OwcBRU6TbLdG+sxmbaLnRszqiEzQCtNxO7o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h/2Ibr4afYQJufJqMgGvKY37FjpeqdfAmw164aIJ4Wu2DbwkLA4hvRL5T65DBEEkGsE050RcewuXKV2vBh8qlq0vIHTG5uUocP13HKnHNDJNdmVJ/1PZA9H15iYoZdfaFAMW/fNTY64uNll/9eGBabebBAe9Qc85s1gQoz1PNf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=RXWdII/z; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E023A2009F;
	Mon, 24 Jun 2024 09:05:19 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719191121;
	bh=9E8DTzg+OwcBRU6TbLdG+sxmbaLnRszqiEzQCtNxO7o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RXWdII/zWOenRm89XgtvdUf1jC335eY6OUP7rn0qevUrlEJI18g94jfeW+Cmqpubg
	 mg7Hd5L4P49ld/EqsdLGeR1WJ5wkvC09TxlmLbIMeaOZK6uAlDp7PerOKY5Y0zxQnF
	 dmR29ZXoygVlSU4eYywjpIeeqDXVw9luvszpluhuK0fFYwlUf+w5wWrbu553Su6A6j
	 d94MDaPWExwcom0MZ+A1YDTHI7AZhAYsRQVBpXI3N7qMyJtqpw0LhougqElg/TMreT
	 CmW+yQ8oREbMYokELVu4Pr82/Yp6iHbQhPaSbQT7Cy3U0OF44tCLPxQsrtUW5T9nRt
	 UkXL+CTdMDvTQ==
Message-ID: <25f3b4cf773f2757ec134b0e82f59a483eed28c5.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: aspeed,ast2600-pinctrl:
 add NCSI group
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>,  linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org,  linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Patrick Williams <patrick@stwcx.xyz>, Cosmo
 Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 24 Jun 2024 10:35:19 +0930
In-Reply-To: <CAGfYmwWp2dayGvySdYvU+nmtxZ-x3PPW_j69ZoBD4mxzPMQAzg@mail.gmail.com>
References: <20240620084337.3525690-1-potin.lai.pt@gmail.com>
	 <20240620084337.3525690-2-potin.lai.pt@gmail.com>
	 <cb55efedaef63e4580c11415aa2e29606edcaf9f.camel@codeconstruct.com.au>
	 <CAGfYmwWp2dayGvySdYvU+nmtxZ-x3PPW_j69ZoBD4mxzPMQAzg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-06-21 at 16:53 +0800, Potin Lai wrote:
> On Fri, Jun 21, 2024 at 8:46=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
>=20
> > Can we also do this for RMII{1,2}RCLKO (and in the driver patch as
> > well)?
> >=20
> The power of RMII{1,2} is 1.8v, which does not meet NCSI requirements.

Ah, thanks for catching that.

Andrew

