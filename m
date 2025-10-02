Return-Path: <linux-gpio+bounces-26747-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAFABB2420
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 03:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56BEF7A4201
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 01:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E01878F4B;
	Thu,  2 Oct 2025 01:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOEqlg92"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ACE4C6E;
	Thu,  2 Oct 2025 01:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759367994; cv=none; b=VaDLBKlK0utpWZFQseIjKV/Qp4+gNBkYMw7O8UP3aoBtbhlVsnFQqkMvb2riYAhni/UOw+aFreFiKXWqxtsE3eRMQq4mIZaugS36FDMNdJqBf8k5Lcx9LppvZzMruB7SjIN5MPAuzVbAN1BoRcdzwdOtkJ9p21d7TCUyY/ZwjvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759367994; c=relaxed/simple;
	bh=S5v77+loamJYz2mc9F0sUnNrIjYA6jb36MoituK44Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gBoE/W2qJPNOTH+vHCFnPB0yWUpE2CBMkgcW7LWFxAsOB0U9QgmfJF+IZy9Y10xg3LotnhS0l9L4EcIHo5sIL8xH7NZ5P8JTXOJK003fNrYiPVa9TcHY5ix1pcUy9rLBzVVC9T3vbPoo3qo7LvP111bgcvuDX7mvalL0CcAv/NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOEqlg92; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC23C4CEF1;
	Thu,  2 Oct 2025 01:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759367993;
	bh=S5v77+loamJYz2mc9F0sUnNrIjYA6jb36MoituK44Hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOEqlg92ll97si18eSiQXlGl6HGZySnMaBwFwN1KOe+BKepCzCTp4XHmWDWNL0+Vs
	 fX4/VCdyCr9byQQ3Z0r+ux9QG0+uwC9kSinEfbXJ6SgzH2ky58ZlvYD29Ng4kVXttW
	 4aCVdg68OqZMZqKviZkvIKWMKvMEN26FpP5W7kfI/ifaq3rvPSCKzuuw0Ook3g9nlj
	 kWmsxSO9q9yP/YRsfawTF7cMXQ7FdBYQ4R5FgYT6/yoeVtpGNscbFilr07drwwnmUC
	 JLf8fXlNhhVRc4wXKM8AGxBVHRU8tTfSdSZtE5BBI1mFl1zaJ+DVgXDTMfW1JF8y3d
	 Eocl/yGYXHhZw==
Date: Wed, 1 Oct 2025 20:19:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-media@vger.kernel.org,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
	linux-gpio@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
	Simona Vetter <simona@ffwll.ch>,
	Aaron Kling <webgeek1234@gmail.com>,
	David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: Re: [PATCH v3 04/22] dt-bindings: display: tegra: document Tegra30
 VI and VIP
Message-ID: <175936798598.2836295.8899587600859365567.robh@kernel.org>
References: <20250925151648.79510-1-clamor95@gmail.com>
 <20250925151648.79510-5-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925151648.79510-5-clamor95@gmail.com>


On Thu, 25 Sep 2025 18:16:30 +0300, Svyatoslav Ryhel wrote:
> Existing Parallel VI interface schema for Tegra20 is fully compatible with
> Tegra30; hence, lets reuse it by setting fallback for Tegra30.
> 
> Adjust existing VI schema to reflect that Tegra20 VI is compatible with
> Tegra30 by setting a fallback for Tegra30. Additionally, switch to using
> an enum instead of list of const.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-vi.yaml      | 19 ++++++++++++-------
>  .../display/tegra/nvidia,tegra20-vip.yaml     |  9 +++++++--
>  2 files changed, 19 insertions(+), 9 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


