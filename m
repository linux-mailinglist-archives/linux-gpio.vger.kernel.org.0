Return-Path: <linux-gpio+bounces-27184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6797CBDFB15
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 18:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C931A3A9016
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Oct 2025 16:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10C03376BE;
	Wed, 15 Oct 2025 16:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="3p/AB+nX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D27B2D9EE2;
	Wed, 15 Oct 2025 16:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760546266; cv=none; b=fHR8IwDoILo406ag7ymWl1QRGESHG6pS1h1ipEBtEYSpiwN4SSXf9GASpcjxH1XtL/FrWdHBW/LRThHd9+r9R4BxcBst4w/MEELHgULZJZBF377+ZJ4VAQD0WI+ts1HLD0GMRYfOOGnKe5yCFrTDnTSW9UJEUJAA8TdWKVoJIK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760546266; c=relaxed/simple;
	bh=W491iOp9uGj/rptkEeZN3ds/se5A4eyizGAeBjNEYD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zv+2xCqv/wOvX5yE8w5rL9kcwpdTTqcVVpc8t+gFMWV9Kmf6MkUKqWDawVAm+pkrDl8Sna0RnKbYszSxcNKXCGGIBZ08m20F4tL5ePAqIm8Mi5N+SMoRpYCqPMeaQ2WrwHrZaq7/6flvYrzfBx84TsJX2mQ7vgmyfhURXFaPF84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=3p/AB+nX; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EmNyMES08hLl/lZo50ZMyOt0uk2s5aoOzzYmrsTy+X0=; b=3p/AB+nXcfar0/n95hcIl0eb3B
	sdzT8OKBtQ98To+XFs5Bbtrk+fIwpTM08JgleTkl1NPK6b6w6fZnN6c79KulRIU3jX4kegbCAct57
	VfTnzyW73zdlmfO1jyJbP3T1oAejXdtoubxWxQpPgm9uFOmnvr7qRN9CgJHbKnhbzwAQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v94VJ-00B3LR-0W; Wed, 15 Oct 2025 18:37:33 +0200
Date: Wed, 15 Oct 2025 18:37:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: pincfg-node: Add properties
 'skew-delay-{in,out}put'
Message-ID: <c2a0f301-ec5e-42d7-9df9-09a852a199ad@lunn.ch>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com>
 <20251014-barbecue-crewman-717fe614daa6@spud>
 <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>

> I don't recall the reason for this way of defining things, but one reason
> could be that the skew-delay incurred by two inverters is very
> dependent on the production node of the silicon, and can be
> nanoseconds or picoseconds, these days mostly picoseconds.
> Example: Documentation/devicetree/bindings/net/adi,adin.yaml


I'm missing the big picture here, and i don't see an example of these
properties being used. However, since you reference an old networking
example, for RGMII delays....

adi,rx-internal-delay-ps should be deprecated, we now have the generic
rx-internal-delay-ps. The point about using -ps is however still
valid.

However, i would not like to see pinctl DT properties used in place of
rx-internal-delay-ps. How the Ethernet MAC driver implements
rx-internal-delay-ps is left open, so calling a pinctl API to set the
skew is fine by me. And if the real use case has nothing to do with
networking, then i don't care.

	    Andrew

