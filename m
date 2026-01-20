Return-Path: <linux-gpio+bounces-30751-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 657CFD3BC67
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 01:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0020F302BF56
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 00:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B81815E5BB;
	Tue, 20 Jan 2026 00:31:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADFAE54B;
	Tue, 20 Jan 2026 00:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768869118; cv=none; b=hLdrT8STQorBIjatQIh7wBJjzYxse0RCSNCelcYI4XY7eOxCuFoJb8gecWRaIcbjYQJdLfkiipY9OcUUT7EQdCYrv/+WKuX/i7ynCm046fzXA2R+TVw97N4KV1vOdcVU9EbhaHc0GGNnXOtue0FZkG5QQ/xgBsrbq1XApFUIxEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768869118; c=relaxed/simple;
	bh=lPl6SOq9NXLoSBJb6nwjexvYAcO40lQytpLzAq9ZKsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHd7X6bgtXFy/l4/Z0vBQK4IKPQuvXnWes4c/gQVwbLJOGKZxyO6fQuqHrM6YECasmxDbCDN9P/s2LAStS6Eh2x5BTYw22iqMq5gek1tQ7NfiAO9vi/wWOhOHWBAibfL86iP7bhBJ1WLdzLDhSZdaL6AZvZQ1X0hZpxwTyprVpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2CD9C340D4D;
	Tue, 20 Jan 2026 00:31:54 +0000 (UTC)
Date: Tue, 20 Jan 2026 08:31:50 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/3] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <20260120003150-GYA56672@gentoo.org>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
 <CAD++jLnM=1iyb0-=Jzqq+jPKtSvR+dbb1w8BNNcr+evdQFg4Eg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnM=1iyb0-=Jzqq+jPKtSvR+dbb1w8BNNcr+evdQFg4Eg@mail.gmail.com>

Hi Linus,

On 00:52 Tue 20 Jan     , Linus Walleij wrote:
> On Thu, Jan 8, 2026 at 7:43 AM Troy Mitchell
> <troy.mitchell@linux.spacemit.com> wrote:
> 
> > This series adds support for configuring IO power domain voltage for
> > dual-voltage GPIO banks on the Spacemit K1 SoC.
> >
> > On K1, IO domain power control registers determine whether a GPIO bank
> > operates at 1.8V or 3.3V. These registers default to 3.3V operation,
> > which may lead to functional failures when GPIO banks are externally
> > supplied with 1.8V but internally remain configured for 3.3V.
> >
> > The IO power domain registers are implemented as secure registers and
> > require an explicit unlock sequence via the AIB Secure Access Register
> > (ASAR), located in the APBC register space.
> >
> > This series ensures that pin voltage configuration correctly reflects
> > hardware requirements.
> >
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> Excellent work in this patch series Troy!
> 
> > Troy Mitchell (3):
> >       dt-bindings: pinctrl: spacemit: add syscon property
> >       pinctrl: spacemit: support I/O power domain configuration
> 
> These two patches applied to the pin control tree.
> 
> >       riscv: dts: spacemit: modify pinctrl node in dtsi
> 
> Please funnel this one through the SoC tree.
> 
Thanks, I will take care of this

> Yours,
> Linus Walleij
> 

-- 
Yixun Lan (dlan)

