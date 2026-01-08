Return-Path: <linux-gpio+bounces-30240-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A83D012FB
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 07:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A618301635D
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 06:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6EC2D4B40;
	Thu,  8 Jan 2026 06:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="S8rAwVNc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A02427CB35;
	Thu,  8 Jan 2026 06:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767852286; cv=none; b=VU2Glao78NTPreOBO30srRrk78BUc4sVky+8GCUwVKc4/6Etzojyy0Fc9AJEEcH8bic3RShzTu+r+znyycxOd9vIXcnChfUNa3FRTn2CqVsM68cL5okTPUsvYvV6BUPVvk+UJR0yfWrZrJlB/H5P5B/HxoAAAPTOgarj/xRJUzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767852286; c=relaxed/simple;
	bh=iJSpxbHJ0jJWh26kWKulbUdRr4HeWAeQU2e+ABhl3Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArRQUCvH55cpWS2F5cL4gpQeIYli9Qmw4IK1FAkRujuneFgjgTCSOoJzjzDgmRQtcUTdPc4WWkNw6ZzJXsqlmW/n0tcaemlear5PM2WoeZjkeDc8bdASj2aNylCrQQpnKVGVtpewu7Q1aXcbAkYTAjB4bqVZe+cgPz59BDUV/8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=S8rAwVNc; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767852266;
	bh=gav39FpEO5VhoeNj+txZWA56UCcKyhzVpE/iKgOWVJY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=S8rAwVNcvK4a2DPBz98YMHofgFzXIGQAWKnVpKgvz6eBHIwp9WyfhJMhiHqHYeUEl
	 T9je6UVoXIIZRM6dUTxfK87ZhR5d1ypqnPnn/8xPjFFdg+DGdosdIGiMHiSnZhYyJc
	 HkXfqFvGDl3nnTuNI5hEUnzRostFZGPrnYC8W/b8=
X-QQ-mid: esmtpgz10t1767852260tdc8c5949
X-QQ-Originating-IP: QJieDE39AnE314JUPQ9dkuFuRWnObXeuCXtaTy2H3o0=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 14:04:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14099507488698372074
EX-QQ-RecipientCnt: 15
Date: Thu, 8 Jan 2026 14:04:18 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Linus Walleij <linusw@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: add syscon property
Message-ID: <F002D2DE9196BF8A+aV9I4lkCHzU9QB5H@kernel.org>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
 <CAD++jL=frL+GiwCRPKfnVe0i6Q+6vwcmvvdGmVLotOk37N_t4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=frL+GiwCRPKfnVe0i6Q+6vwcmvvdGmVLotOk37N_t4Q@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NiJgP/70eYXdm6tgvOwzdfQXkTPvgixX2igENVRa923Tyc0kLXP2IFLF
	GDaqUZY6nXuQmZYylpo2iRTuCJ1fxc8S0OQeGHg2U3NiZkptFkMRqOYO8+jM8njB+uTrmVW
	MMZeyqlnV2L1UdI/Jnbe0OMnjOOMiVGPl+MNoQ99eHRP2b/ciqih9pYj8TlmvWPHEnpriYU
	aFIL2UsfihKSC6lPhHhkqJ2u4pKkTiTvaCJ8QMVSHR4I2P6lkGdUmD3B+5UrOqtq+jN/KN3
	08w0Sh4stpXoa/ApX40fWeH1M8NFzdccZK8IiuVTQ7heG8VHFYxPk/iXEXwlqOacfQ1ymD1
	+jAGSDj7Pm5gXTG3Ll7GeiP6H/SOyWfoP8nlP3cFQWzHdRna/GMFJQ84WiHNUs9zbJAs+2R
	a+N5qGekCgWerZrlpqgdOBtQuIbwS6iGgEwcTCDRM6Dfeb1+Mz56/53P4jGiS21oDW+yil0
	N87AHByIXrouEzhg11xSyA60dbsrItoEA8qyTaK4PwV7ChY/EKQHnEdEIFl3GxvQFVbxEN9
	jbYCuudXJEL0fogHSEDWsmCJ0QDCKHpIxrY1WQLILKq2mHoBYEsLlzPdXXTqyWdAQC2/+ZG
	TE1bAn2w73wVqMBVaXg+yOd/E9gt/syIu5W4SND8PV7dWY6dyfl4o//Ur/O4dlRuUNvJUHs
	23kz5OCY8ZgL3p6BwdbCmhAkbaO00mxRaQSwfEKGK0VWbZsXn3WcZ8+T9StESvGFSVs4uJS
	81c0F51Ve3GgsY5sgbNL2FTIn7JgDdQhMD15PC9XWrqJfjc8R2JnTxKHkfmIrzPg9W2F5Ai
	LdAJKTK9sut8AUJ/5EwwXA72h1lY2fgC+t5y4oAjllZ1RWqLzPtL7v/slAmML20zx9Q6h2d
	JqEZXz2wQ1b9ZJPCl55IRLb+KV0OLvV1Rb9R9FwaVJ/sKWySEf9OlfZU5p3LjLDZIOwnTdi
	WwjIsoQIUMNFvoxiJQN4FNcADirPg/UFJOCyWjXbH1UJRIlrvSCWi83KCQGZWzpLCNhSLkf
	A591mMNEjGJmX5MpbZD4TFlnMzLE5EQzFbxeClOA==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

On Thu, Jan 01, 2026 at 11:54:02PM +0100, Linus Walleij wrote:
> Hi Troy,
> 
> thanks for your patch!
> 
> On Tue, Dec 23, 2025 at 10:11 AM Troy Mitchell
> <troy.mitchell@linux.spacemit.com> wrote:
> 
> > +  spacemit,apbc:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle to syscon that access the protected register
> > +          - description: offset of access secure registers
> (...)
> > +            spacemit,apbc = <&syscon_apbc 0x50>;
> 
> Isn't the offset implicit from the compatible of the pin controller or
> the syscon or any other compatible?
> 
> It's easy to check compatibles in the device tree and just say
> this offset is 0x50 if compatible is so-or-so, and something else
> for another compatible and just give an error if an unknown
> compatible appears.
> 
> So: please try to avoid to put things the code can easily look
> up into the device tree.
Thanks for you pointing it out. I'll remove it.

                          - Troy
> 
> Yours,
> Linus Walleij
> 

