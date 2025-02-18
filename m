Return-Path: <linux-gpio+bounces-16190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C9AA399C9
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 12:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94F08171BAD
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 10:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9404E23956D;
	Tue, 18 Feb 2025 10:59:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF8D23536B;
	Tue, 18 Feb 2025 10:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739876366; cv=none; b=DzjtTIgAqFjG5Juf9Iew85fvSnWLIQEbcp0T2Qgf9cvZTlIeKt/afk6NiRQadVaJOqrOwa17hnmjghkAlgqYxkt7un8uHp9XzTUYaf5y7NuR2pXQayrpFLzgS0MLFgi8NKOOgJ4yOSNMa4yzcdVKHZVRaLGfkWTBhZTMailb0qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739876366; c=relaxed/simple;
	bh=n1iqObZEzA0rDmHtOHu37IVyO1+M8xcx8X5qmxcmFTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCicmvdyfEelVGjSVA9nFhYA8DS3B3qk4CnzwLGP74uYEZwuH3Pi/kqsbs2AGX7MKkrfm73MAyn0VqV9oo1PYlGUMS6hrLwxOnVA0xsGwoIqPXIeHkIMH3GTLXL+XtPfPWPZyFpUrIhdzzhq/9nWmdjQ2MjkdPyWVUG6qCWnE5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C9223342FA4;
	Tue, 18 Feb 2025 10:59:23 +0000 (UTC)
Date: Tue, 18 Feb 2025 10:59:19 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Olof Johansson <olof@lixom.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <20250218105919-GYB29065@gentoo>
References: <20250127181726.GA538260-robh@kernel.org>
 <20250128031712-GYB47737@gentoo>
 <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
 <CACRpkdZa887vx4Lmxk1U_8w5n7AxMnyzGexeYzhsxNGT-DTYcQ@mail.gmail.com>
 <20250206133156-GYA5687@gentoo>
 <CACRpkdZYYZ5tUR4gJXuCrix0k56rPPB2TUGP3KpwqMgjs_Vd5w@mail.gmail.com>
 <20250214115410-GYA21743@gentoo>
 <CACRpkdaQZ5wJ0S=FfTzBkZOfCE7zvTPQ-wn53rHcZztbHLC8xQ@mail.gmail.com>
 <20250218095540-GYA29065@gentoo>
 <CACRpkdZiD7LRAk3hhvWdnf9DCuQCWGLoE1xd_z9ddRKZP=uvLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZiD7LRAk3hhvWdnf9DCuQCWGLoE1xd_z9ddRKZP=uvLw@mail.gmail.com>

Hi Linus:

On 11:17 Tue 18 Feb     , Linus Walleij wrote:
> On Tue, Feb 18, 2025 at 10:55 AM Yixun Lan <dlan@gentoo.org> wrote:
> 
> > > I will post it real soon.
> > >
> > can you check the v5 of the patch here [1]? which I just sent out yesterday
> > it does 1) implement xlate() 2) instroduce custom add_pin_page()
> > the gpio part works as I tested, the gpio irq probably need more testing
> 
> Ah nice! I have the same idea, but I just bring all the stuff you
> need to reimplement in your driver into the core instead.
> 
> Your driver and bindings will look the same, you will just do
> not need to reimplement the translation functions (if my code
> works as I intended...)
> 
great! I will test and let you know if it works, many thanks..

> Yours,
> Linus Walleij

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

