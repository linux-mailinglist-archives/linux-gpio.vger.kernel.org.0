Return-Path: <linux-gpio+bounces-30373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0D3D0C7F7
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 23:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87BE03014737
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 22:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762B0345750;
	Fri,  9 Jan 2026 22:56:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195FF31ED71;
	Fri,  9 Jan 2026 22:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767999376; cv=none; b=Sxnic6uiqAGWgYEwWg2kaJ2DVC9MRt8dAvxJjkGjwFTZaGSEfYGQ7CQvIGhHV3TnXx7MsILnW/ZTRnJadIRtv7Ba6fWjx+y1Xx7ufFzx/swcwjvspFKmzZ58Q3J5xC6NQecUwiHWF/00WyZlPLh3Qija043/5J2+sN/dAnqEQcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767999376; c=relaxed/simple;
	bh=SrzAbHBO6S/imREJPrBj15KZzCBcbr/rnkOvNQ+roA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwZgXxRt37m0MI2um65Gpl+nOw8JUmccGDZg3CYiUieYVX0/AVbV/qWzbHM3yU6NAUFAJ9hn0g8OfTbCbPKOfxJt1G6bpav4bSCyOZz3T24a8CEV0/WpofKV20I1MPM2hBatq+iNe6l7HDe7tPIFZn7f8DYWgujKSfAuCG55sMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C4A453415D1;
	Fri, 09 Jan 2026 22:56:12 +0000 (UTC)
Date: Sat, 10 Jan 2026 06:56:08 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: pinctrl: spacemit: add K3 SoC support
Message-ID: <20260109225608-GYA8877@gentoo.org>
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org>
 <20260102-02-k3-pinctrl-v3-2-30aa104e2847@gentoo.org>
 <CAH1PCMaXW4469pFRGC+HcixO7PGLQpKKJ_Z5VEhHUMdd3DNWTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH1PCMaXW4469pFRGC+HcixO7PGLQpKKJ_Z5VEhHUMdd3DNWTg@mail.gmail.com>

Hi Guodong, 

On 20:20 Fri 09 Jan     , Guodong Xu wrote:
> Hi, Yixun
> 
> On Fri, Jan 2, 2026 at 3:04 PM Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
> > almost same logic with previous K1 generation, but has different register
> > offset and pin configuration, for example the drive strength and
> > schmitter trigger settings has been changed.
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml       | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> > index 609d7db97822..9a76cffcbaee 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> > @@ -81,6 +83,12 @@ patternProperties:
> >                - enum: [ 7, 10, 13, 16, 19, 23, 26, 29 ]
> >                  description: For K1 SoC, 3.3V voltage output
> >
> > +              - enum: [ 2, 4, 6, 7, 9, 11, 13, 14, 21, 23, 25, 26, 28, 30, 31, 33 ]
> > +                description: For K3 SoC, 1.8V voltage output
> > +
..
> > +              - enum: [ 3, 5, 7, 9, 11, 13, 15, 17, 25, 27, 29, 31, 33, 35, 37, 38 ]
> > +                description: For K3 SoC, 1.8V voltage output
> 
> Should one of these be 3.3V? Both descriptions currently specify 1.8V.
> 
right, the latter one should be changed to 3.3V, I will send a patch
to fix this.

-- 
Yixun Lan (dlan)

