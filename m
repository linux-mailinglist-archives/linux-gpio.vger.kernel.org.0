Return-Path: <linux-gpio+bounces-29867-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A241CDB354
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 04:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 775FF302C8EE
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Dec 2025 03:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE651207DE2;
	Wed, 24 Dec 2025 03:04:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5526B17BED0;
	Wed, 24 Dec 2025 03:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766545461; cv=none; b=N0PUG3MpGn49Ljc0a8KtqZR9pOjdYsbk64RHYoY6/n4Xz00zANX8GRiPNh/6P6jK0qpKRwGRPxc4AaZ6JDcxxzGgg3Fy3CHuOAHiowDvPkYGX69I6Hu+Gmixt1ZltIxDZD3W4uCy9P6In7WJBTbGDN51g6SDlG+uNCQZ3IKkyIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766545461; c=relaxed/simple;
	bh=TMJmS0PEiHLyEduHQX5DbdvQDwtzFhc0SCGHJxB0bZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdwrSiffYLHiaI/yd25m58snkxKY0jqusSTFqCqjt6BTBDQTFvO9wseTx72gGgju8EZoz7jwIGY3FvPRPH5qKpHfnKxe5SHjf/Qn3gULLp+MyOPQWS2Z+qaey8x5ZJvvdIcQkjybimioByuCwQgij8FYmjLxD0XB9tlIGVCt+W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4551B34173F;
	Wed, 24 Dec 2025 03:04:19 +0000 (UTC)
Date: Wed, 24 Dec 2025 11:04:14 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: pinctrl: spacemit: add K3 SoC
 support
Message-ID: <20251224030414-GYA1992051@gentoo.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
 <20251220-02-k3-pinctrl-v1-1-f6f4aea60abf@gentoo.org>
 <8840B91CE3D9278B+aUtWX6fizXnheGMl@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8840B91CE3D9278B+aUtWX6fizXnheGMl@kernel.org>

Hi Troy,

On 10:56 Wed 24 Dec     , Troy Mitchell wrote:
> Hi Yixun,
> 
> On Sat, Dec 20, 2025 at 06:14:53PM +0800, Yixun Lan wrote:
> > Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
> > almost same logic with previous K1 generation, but has different register
> > offset and pin configuration, for example the drive strength and
> > schmitter trigger settings has been changed.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> > index d80e88aa07b4..c5b0218ad625 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> > @@ -11,7 +11,9 @@ maintainers:
> >  
> >  properties:
> >    compatible:
> > -    const: spacemit,k1-pinctrl
> > +    enum:
> > +      - spacemit,k1-pinctrl
> > +      - spacemit,k3-pinctrl
> The drive-strength description should be updated. The driver uses a
> different current table between K1 and K3, but the binding description does not
> mention K3.
> 
yes, I realised already, will update in next version

-- 
Yixun Lan (dlan)

