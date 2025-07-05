Return-Path: <linux-gpio+bounces-22819-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E65A1AF9F48
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jul 2025 11:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FA6C3A7EA4
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jul 2025 09:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82489242D79;
	Sat,  5 Jul 2025 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FneV44Fo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF7B1922F4;
	Sat,  5 Jul 2025 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751706658; cv=none; b=AxPHFzTGwmMygma4L/FJNh/G4fABT8oZAYiEV1avENOo37rlZFIL+ElkoOUlOCzD+7ET4gAV2o9zi48NWRH8xrr9nBS0R3LZSNT9urY2F2JDa0TkNFRNhiC6hcuItr6HqQq91CG1WhyvcMa4Ayp2Jx23M3O4QXtagqrga9B4so4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751706658; c=relaxed/simple;
	bh=3zIe1MRXKDaRyGHpeNSdCTslEphJAJbk723T2bGc8Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Msvs9UXFweIAjbu6mTPnr7fS/+dxO9oq0J7Ob8wyG3LMIib+rnT8qMUy/6oHznzpBU7F6uHRCJAoCywhhf5THVL5t1WuEw9/ComdngJrwg+0hhJQXlv/ifM3cEMlxRX4vyTovwk6L0zj0RZmF1cxKBtn6lvxWtGWN9XjCYegsb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FneV44Fo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBD8C4CEE7;
	Sat,  5 Jul 2025 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751706657;
	bh=3zIe1MRXKDaRyGHpeNSdCTslEphJAJbk723T2bGc8Ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FneV44FoAw8PEV3D0t8I5vjzD0mhJPiR1qflHWbottxiM96sqx1Z+y6OwgCWb5af6
	 4R2m9UEgEfMuh2RsA3at4fwQ6Nh59bNxt7TJAkw7bU7RY3HgHlPkxPZXqzSNJDayu+
	 j/VShd4rZwbRxmtZOsnu1gYf2TsCz2b7TxP5YAydoYbTtlom3veAjixJ9JTNX+udXy
	 +e6Jtr7soEJ8FGAJ/bpgazDgep27z5zb47/R0IV3di3ERxLPXjfz7Oqvfg8WwffoTh
	 +ZYLfLTbztG7v9CJ8gt5p+IkMUSiq6NgruXSFx04LM7y6GdyR+xxbk0v9FRD/56vQP
	 ySDH0+5IX9czg==
Date: Sat, 5 Jul 2025 16:53:39 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] regulator: sy8827n: make enable gpio NONEXCLUSIVE
Message-ID: <aGjoE_t8-ToeZOGU@xhacker>
References: <20250629095716.841-1-jszhang@kernel.org>
 <440c4bcd-0fd7-4c12-85a6-5eb343fc3f91@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <440c4bcd-0fd7-4c12-85a6-5eb343fc3f91@sirena.org.uk>

On Mon, Jun 30, 2025 at 04:02:24PM +0100, Mark Brown wrote:
> On Sun, Jun 29, 2025 at 05:57:16PM +0800, Jisheng Zhang wrote:
> > On some platforms, the sy8827n enable gpio may also be used for other
> > purpose, so make it NONEXCLUSIVE to support this case.
> 
> When you say "other purpose" which other purposes do you mean - another
> regulator, or something else?

Yep, other regulators in my usage case.

