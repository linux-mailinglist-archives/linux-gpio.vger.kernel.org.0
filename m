Return-Path: <linux-gpio+bounces-21069-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E3ACF875
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 21:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4AE9189E039
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Jun 2025 19:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6441127C14E;
	Thu,  5 Jun 2025 19:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVXFmX60"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1857827D773;
	Thu,  5 Jun 2025 19:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749153360; cv=none; b=GVhg99QxlxCq8RqHmFpSzmvcent3Zpao9WppyZEx7CG6L7SL2cdMUW0geIiET9zBgB+YXOqPuoaew6Ug+5KYuvMwclAbNWpTNqmC8ef8uvaZVeDCIwF8Uzg2x+TXvug8KwepdYgClv4EP7Ydt9E8tOFgguMG3ymVKpeuuAkyw74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749153360; c=relaxed/simple;
	bh=wYtujNZwrORBCml224vf1c045Haw3Rm1isqHefy1T1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlMhGzBCqE8zMTIDyrPiS95Tz848GUzVesO/DdGcuyv7u/iSQf6jr5MlQsvCLYQpKMwlrpF4ajEHsXwa8wpxv9Dm7XbreL8boipDrhq4t660GufXhcSUqag/pV+ze6s4FY/bIrdT4P2VYt3mqY0khwEUo0tiWXAJzW4wuo8JcSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVXFmX60; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47A9C4CEE7;
	Thu,  5 Jun 2025 19:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749153359;
	bh=wYtujNZwrORBCml224vf1c045Haw3Rm1isqHefy1T1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVXFmX60Jk5VMgy/abCJ8UhgesIewd9czM3aEeMdI13hTpT/Z6fM8m5QMkugX/Z0Q
	 0mMEntK83i2kUMlFY0l/ajqLq5mmhSIZ4BWnB1qKDkT3iTxMMygeRFYxgDyyzgFWe1
	 Q3QQMB1j71mwunm6ktI3JZ7dxns3b+1AoyJ7Lpcm6C3a6R11HDxDWmXxXivNOvLV8I
	 UhZZrc1gtulmwZn2UOZku17pxNh70+wi+9jWCakID0I5i/uyZczBtnaGj/GAJ4HxA0
	 gh0eFyv1DJ7T7+QzfF7rDTsoQXuRJyvDbDX9Mu3YIDByv9xq1t/qAgM+7qPUXTyY3y
	 OXRUN/H43733w==
Date: Thu, 5 Jun 2025 14:55:57 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/6] dt-bindings: pinctrl: airoha: Document AN7583 Pin
 Controller
Message-ID: <20250605195557.GA3133706-robh@kernel.org>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
 <20250527222040.32000-6-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527222040.32000-6-ansuelsmth@gmail.com>

On Wed, May 28, 2025 at 12:20:37AM +0200, Christian Marangi wrote:
> Document Airoha AN7583 Pin Controller based on Airoha EN7581 with some
> minor difference on some function group.
> 
> Make the PHY LEDs, pcie_reset and PCM SPI function dependent of the
> compatible and define the different group for AN7583.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../pinctrl/airoha,en7581-pinctrl.yaml        | 297 ++++++++++++------
>  1 file changed, 207 insertions(+), 90 deletions(-)

I think this should be a separate file because the condition parts are 
so big.

Rob

