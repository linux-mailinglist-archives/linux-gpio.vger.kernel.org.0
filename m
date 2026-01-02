Return-Path: <linux-gpio+bounces-30037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 748F4CED9E9
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 04:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 387D7300D15E
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 03:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539EE27F005;
	Fri,  2 Jan 2026 03:21:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B3E274FCB;
	Fri,  2 Jan 2026 03:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767324064; cv=none; b=nkxZskBuvWyH16ew1udN6z1FKbf7lRZ3xZqcT3D0f+HQZyN2BYtTOCdmM5Qxsv6ZPQaBj7ycBRMa5vFNTnzkYzg014E5Hfk4LpGB3CCQkmiF9IiHackvZBwN+FSfVuRNzvJ4ajKmA+/M1Vt5Z989QR6Pu2oAxw06jJ82ooGHVNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767324064; c=relaxed/simple;
	bh=Gz8XmoS6pxomylJSYAzcfWQufpfdmjp276fRn1E1ZOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fx41f5xcVJZTXPhI1LffUw/mIBDXnFKItAFKZWQ6bL9UvKDfLSzvJks7NUvAbOubAexzNf4Ht8nvCKbSBI9iMuhJZF/vzh0CkbLBnEDLRrSN5SbEgIEfJhI75I29HL84KWlpNAZO27T4AAKZG1GNeFstjmvIznYM2ilKFgxDTx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7FBAB341EDE;
	Fri, 02 Jan 2026 03:20:56 +0000 (UTC)
Date: Fri, 2 Jan 2026 11:20:52 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] pinctrl: spacemit: add support for K3 SoC
Message-ID: <20260102032052-GYA2053787@gentoo.org>
References: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
 <CAD++jL=AeGETR9gT4dO4=MVokCubS4VbbsUdcwShYD8Kjybehg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=AeGETR9gT4dO4=MVokCubS4VbbsUdcwShYD8Kjybehg@mail.gmail.com>

Hi Linus, Krzysztof, 

On 23:49 Thu 01 Jan     , Linus Walleij wrote:
> Hi Yixun,
> 
> thanks for your patches!
> 
> On Fri, Dec 26, 2025 at 1:58 PM Yixun Lan <dlan@gentoo.org> wrote:
> 
> > This series attempt to add pinctrl support for SpacemiT K3 SoC,
> >
> > I've removed the RFC tag as the driver is tested on K3 SoC.
> >
> > The K3 pinctrl IP shares almost same logic with previous K1 SoC generation,
> > but has different register offset and pin configuration, I've introduced
> > a pin_to_offset() function to handle the difference of register offset.
> > for the drive strength and schmitter trigger settings, they are also changed.
> >
> > The patch #1 try to add pin support which should handle pin mux, while patch #2
> > adjust drive strength and schmitter trigger settings accordingly for new SoC.
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> As Krzysztof mentioned, try to use an explicit device tree schema to
> enforce the legal drive strength values as e.g. enums.
> 
Ok, I will address this in v3

> Other than this the code looks fine so once the bindings are
> ACK:ed I'm ready to merge this.
> 
Thanks

-- 
Yixun Lan (dlan)

