Return-Path: <linux-gpio+bounces-11190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA5699A5CE
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 16:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 458D51F240B8
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 14:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91AB6219495;
	Fri, 11 Oct 2024 14:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="mnFiDp/M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616EAD517;
	Fri, 11 Oct 2024 14:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655792; cv=none; b=M9r5dM7T/vd7ezIhovmrvnUVWIVLBZaKaDMMyVYqpfZYEX+xGX4rntxeLzWBucJQgkiI4hEbvllKSvOZu9DXD+tYchL1Ys0Hk6IWUp/D5cKxIZ/mXjBDAtoI/WlubXmTxbSCKOT4GZPX1y9W1ngkcp/BnmsL/aFHPvslxQu9eJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655792; c=relaxed/simple;
	bh=+C40k2tYMNAHr+nf4FSEaoInND2BpYvERMHqLyxjR0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFaTXMBqvxSXk284zUQbefWZzJ/41EpB3qrnnMKrQDBiFAl+byzxmdAR/GFPeQPL0jeiqcMJy127IIH4Q52PxEYxoYNjqNlVTopNJZ/tF42HbjAjb92punRaBU/BrfPdB6tNiFrFeJee7zcv6p2qhvmIndOneV+RjtxcvuVPXoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=mnFiDp/M; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id A4850457383A;
	Fri, 11 Oct 2024 10:09:43 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1728655783; x=
	1730470184; bh=+C40k2tYMNAHr+nf4FSEaoInND2BpYvERMHqLyxjR0g=; b=m
	nFiDp/MLcmwWiWcoCfiwdWeF4pBkgAn5Z5dxvHMDFs6XrdQn4+DePo2PD+X/bnyv
	csUOEfySLMfVHQOOU7ZUrN0vN7QZo29DSD0Y3VjtXiTgA0UTX3odpAOIQBfZHmTd
	Oz//kr/gBWHeeWJtW6XZyLgqnpfLFELSVpx6TmsWfA=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BgQjdneAv4nD; Fri, 11 Oct 2024 10:09:43 -0400 (EDT)
Received: from freedom.csh.rit.edu (unknown [129.21.49.24])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 2BC2145735E9;
	Fri, 11 Oct 2024 10:09:43 -0400 (EDT)
Date: Fri, 11 Oct 2024 10:09:42 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: add support for FTDI's MPSSE as GPIO
Message-ID: <Zwkxpi_keK7No1jr@freedom.csh.rit.edu>
References: <20240814191509.1577661-1-mstrodl@csh.rit.edu>
 <CACRpkdYyo9MD6zfiPde+3vSdpH96r+ZO12bdmMAfjw5PCNJ1BQ@mail.gmail.com>
 <ZtCBgWrdFI6h3zbo@freedom.csh.rit.edu>
 <ZtnLtgLRq68usPgf@freedom.csh.rit.edu>
 <CACRpkdac2=wXA5OWpHku2ZoqiqPPo-pscGxTit-Jm-PicPwAMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdac2=wXA5OWpHku2ZoqiqPPo-pscGxTit-Jm-PicPwAMA@mail.gmail.com>

On Fri, Oct 11, 2024 at 01:59:31PM +0200, Linus Walleij wrote:
> Actually the mail was caught in the spam folder, I don't know why.
>
> I'll whitelist your mail address so it doesn't happen again.

The system I send mail from was slightly misconfigured, so my emails
were getting sent from freedom.csh.rit.edu rather than csh.rit.edu

Should hopefully be fixed as of the last couple of days :)

Thanks!

