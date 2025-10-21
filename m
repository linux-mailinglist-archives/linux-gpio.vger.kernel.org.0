Return-Path: <linux-gpio+bounces-27335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBC7BF45F7
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 04:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59EA718C5D9A
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 02:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE713277C81;
	Tue, 21 Oct 2025 02:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wp640UuC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78139274B5A;
	Tue, 21 Oct 2025 02:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761013243; cv=none; b=HE9Ljo0i1QW7qKDdNeRc1PZ4bi8/Xb0S/xXQ+20eQJjaJZjCSJfFZ8hl450WuRqNr2bMztV7gITOsYyYgjxa8SOmZm59+oQUlL1t0EPwDoyTwITax60CPbhhmSdP94zsI2E0954DsWQnFnPBVpSfzAHpciID9fGGCEFhIywQWMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761013243; c=relaxed/simple;
	bh=x0ieJfyYvJXAZ7rk++9oKlSo4Fi5eCEJJwes5tOAPWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgZ+SaPY/HXbcF+pwDLqmtOu4VilqcoUO+VKqNirp3HV8Wb1IoEGYRS0mpU66+Sn3ZH0jrs4Isz831NQYf62z9a5zbsPsOw44UpmGcES8Y8VSs1uHj0wNpjpWycPhE+/IPddYroSFiQRvY3xIxiIHKiuFy8LujQv1OLrEEAx0tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wp640UuC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66558C116B1;
	Tue, 21 Oct 2025 02:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761013243;
	bh=x0ieJfyYvJXAZ7rk++9oKlSo4Fi5eCEJJwes5tOAPWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wp640UuCShqyd928hwlUFfIzb0CoGBeBc+5IS44JSgu2qRZrrvxp70aYlKHogfrEz
	 cZdhmIhrTdwRmOvJBJFsDjCYZRInfHFtT5BblWOXERDXYcwmj27gz35k9oiO6I3N3B
	 hvn9eKLnGxUUKUrtXNFEYZmGGl4Lx8eTFqtfMbwDaEJj3Or17OFx0k133UjCvHxaVf
	 iaA7pqVLj34AvbrI8xmzu4rSv9tJy6qZ/qqBCG7BcfhbJeHCCQD60+apXBMntUU2tK
	 HNjQgy1BUfGXakq0oqmBukvaxpj1UUW2TaZQx6ii6XJPY+QnfqBEfe7g0gWb1X3UEJ
	 BWowvGdtwxZVw==
Date: Tue, 21 Oct 2025 07:50:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert bitmain,bm1880-pinctrl to
 DT schema
Message-ID: <gztk52lhda7mck6m3umpxaprydhux33d6kbr34qmj7nipopbcw@yvkhntk4nhqa>
References: <20251013191235.4139259-1-robh@kernel.org>
 <CACRpkdbduyWoJ7ob55btTwkCSQWDB9_ZObL3osLVYgiuB5Lk4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbduyWoJ7ob55btTwkCSQWDB9_ZObL3osLVYgiuB5Lk4Q@mail.gmail.com>

On Mon, Oct 20, 2025 at 10:58:30PM +0200, Linus Walleij wrote:
> On Mon, Oct 13, 2025 at 9:12 PM Rob Herring (Arm) <robh@kernel.org> wrote:
> 
> > Convert the bitmain,bm1880-pinctrl binding to DT schema format. It's a
> > straight-forward conversion.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> No comments for a week so patch applied.
> 

FWIW,

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

