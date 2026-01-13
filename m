Return-Path: <linux-gpio+bounces-30478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0FED18265
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4843730BDA57
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 10:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8435535B137;
	Tue, 13 Jan 2026 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdhawDZj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26930349B1D;
	Tue, 13 Jan 2026 10:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301019; cv=none; b=OFIzHRbdZd0J/LG5EilGaCvpoE/wgh26n9L0yK2JQtKYnzFQEqzjiLfRWCx9gmZyLRungfd7CeqsfLdHFsocL2XFX1krLVQkAJsxEtWep4//If2v2PrR0dB/01MG3vP7tnZ9zcknbCpQ34XowzGBVt8J+iVEFSI5tROqw0YbxOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301019; c=relaxed/simple;
	bh=SHNFdGpY2oCyaGukONSjA86wDhza+mBaw5fFmtE1lCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6C4yNzMoLqDsnH9fCUl8Hu4aYRgQq2ou2UlBQ0n6sNle5wwtOHZdD4bPgJSpnyffF1RdP97DWsB+w17drkDZXpP66TccHSXt+PBPiuElfEXt9LyAt8ps9ZYqLiQdLUA5IsBQQuHjRTfwHaH2IylgV2xA9t1H4B0+xzpZigcZ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdhawDZj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2960FC116C6;
	Tue, 13 Jan 2026 10:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768301016;
	bh=SHNFdGpY2oCyaGukONSjA86wDhza+mBaw5fFmtE1lCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdhawDZj2H3DlCWDgXGUaoysDMD/EGitgErllVC3eoM63ByBYSgU2nW/pFhYnjZTZ
	 EJn2pcmCaHYC7dus4e6y1OpxDPeqUPXoyYX7eDLazN7ilGFhrga2Mx28zO7bFRyZJR
	 08jgVA7oFwbFG53f+XuF72L4evZGEF0FZdFHuL7Igl4oJkO/XH2uxuA2bQPxeFrR9o
	 tdg2bsnySJJ93wjptqxNCYUc1eCAdVnBpoJqqRF5pMXl7rQjSSfZ54dgbHeRhJQlDc
	 oVR92WbfG/ZuYSiY/Bl3VfLKLmKtuVwk9LRueWe1/Q3WkMiACTQBCz0+D/iCB3eNz2
	 JVm1B0YGVSdWQ==
Date: Tue, 13 Jan 2026 10:43:31 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Robert Marko <robert.marko@sartura.hr>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robert Marko <robimarko@gmail.com>, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] gpio: remove the gpio-tn48m driver
Message-ID: <20260113104331.GB1902656@google.com>
References: <20260112064950.3837737-1-rdunlap@infradead.org>
 <CAD++jLnrcsEjKpBQWL=RHKVyyfq1UDk-sDZ7MP-16z0hBLC_dA@mail.gmail.com>
 <CA+HBbNFKyOFfhRu=XAE891dREPatFRD9VJ5=upz6xPBb8khGjQ@mail.gmail.com>
 <CAD++jLmPt9M5HEtN4psbk7Du8j4Y6_a0YzhxOM6wds53jT3kHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmPt9M5HEtN4psbk7Du8j4Y6_a0YzhxOM6wds53jT3kHg@mail.gmail.com>

On Mon, 12 Jan 2026, Linus Walleij wrote:

> On Mon, Jan 12, 2026 at 1:24 PM Robert Marko <robert.marko@sartura.hr> wrote:
> 
> > It would be awesome to see it in the tree again, as the drivers
> > themselves work just fine
> > and allow SFP-s to work on the TN48M and I have patches for TN4810M
> > (Which is a SFP only version).
> 
> I sent a rebased version of the old patch as v11 of that series
> so Lee can pick it up and we sort out this.

Applied.

-- 
Lee Jones [李琼斯]

