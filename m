Return-Path: <linux-gpio+bounces-7629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E93913FAE
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 03:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0921B20B4B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2024 01:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C8F1FAA;
	Mon, 24 Jun 2024 01:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="B0wJkMJM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315021373;
	Mon, 24 Jun 2024 01:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719191472; cv=none; b=Ou02JPmYHXtcuyiYEq0vWPxp/mA0jDTYivK2k4+QPvS7kBPDMpxlVWacuf65/JvzTPCAAcyuNhUOcxgT3cbHaAI18Cvd2jcpHHIbuKqMOMsQfhDmqKnsLZ6GzpSfP7Xa1XgTsXNYbwh5/d2MqXM10bhqvr3YczVqjaqek44seVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719191472; c=relaxed/simple;
	bh=giM+F77N/fKXGQck/K8NUqp4U74padZuVBdVaeLCN/k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VgfgkY6GPW13JIjYzMrUvTxkHsC1BTva0T69DWQCEe7H8KNwVESP4EvE87SyHMb3+5zDM8idwLWR3smviS1RJTcJYQnLePDM8rRTOupYn5Jw6wvvNMeBHh223w3VPC9CG4611F1PAqkpNpA70lW4x7MnCeAnMh2iWOHmJE154qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=B0wJkMJM; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2B46F2009F;
	Mon, 24 Jun 2024 09:11:07 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719191467;
	bh=giM+F77N/fKXGQck/K8NUqp4U74padZuVBdVaeLCN/k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=B0wJkMJMMwDvuGBccHAsQSypDZTL9TbKy5y2qfw/27ULeFe6zzTNZITBUF1dLHocn
	 obsIrtSn0nDXcbv8N2wrqtn+uMZ1EuiveqpEjIHbuSreUhgbQagh0Tm7B2osE1mT0N
	 HLmlO61+blr9opB8eIx6KsrSwjfjLXalj0Dj+cEp4a/GI4HK0n6O6wzJPb9K+pI5kC
	 BctqaNcYXG3PZAXSOi6yH6Eu8fyrqykIuZQ0VnAmwc6su2P+xufeVAmcJgfWJk8FHD
	 QMipA4Mmm+Q/hSIiYFOY6USD6vdWw4Nmx/cA/qI9fdGyaV8mv+DC7eiZEmUtj8U/zr
	 dO7z/kXsNP6pQ==
Message-ID: <3083d7243b7ec79b78f47df962f9bd6189402727.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 2/2] pinctrl: aspeed-g6: Add NCSI pin group config
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Patrick
 Williams <patrick@stwcx.xyz>, Cosmo Chou <cosmo.chou@quantatw.com>, Potin
 Lai <potin.lai@quantatw.com>
Date: Mon, 24 Jun 2024 10:41:06 +0930
In-Reply-To: <20240621093142.698529-3-potin.lai.pt@gmail.com>
References: <20240621093142.698529-1-potin.lai.pt@gmail.com>
	 <20240621093142.698529-3-potin.lai.pt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-06-21 at 17:31 +0800, Potin Lai wrote:
> Based on the NCSI pin table (Table 181) in NCSI spec[1], the reference
> clock output pin (RMIIXRCLKO) is not needed on the management controller
> side.
>=20
> To optimize pin usage, add new NCSI pin group that excludes RMIIXRCLKO,
> reducing the number of required pins.
>=20
> LINK: [1] https://www.dmtf.org/sites/default/files/standards/documents/DS=
P0222_1.2.0a.pdf
>=20
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>


