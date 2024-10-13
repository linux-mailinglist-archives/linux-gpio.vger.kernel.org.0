Return-Path: <linux-gpio+bounces-11247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 053DB99B9CD
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Oct 2024 16:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE68F1F2186A
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Oct 2024 14:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE3E14658D;
	Sun, 13 Oct 2024 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rR8tzdWj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D298A1DFFC;
	Sun, 13 Oct 2024 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728831153; cv=none; b=ijSCMKetdDLgsPY5VjqkfvIvI52EjOb9lpEvXZccYJkR35HmHmpK3oVv2c88Xmr9lCPHUoa5x7RB2JI7V+CPBql/TlT828KYQ18aozIEHF0WnhSnvlWLS1gL28nmvF5BekyWMmBCNX428OdKiK09A1BHBowNW4Pi747aDC18vzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728831153; c=relaxed/simple;
	bh=Vv22ND+4yRoaCLfzGOgDrs+5UvZfPQ9Zbq75RAoYprk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saP+/aMMoQOB9q3P0y2DZV0jpTPU+pdn404RR/qVe+ADT2UAPs0+1ejiWqlQV+PG7wrMJXPGPLexolx7GFjsAndvpcHqUeAvo67Z/CUueH/c4/Xa1M8VrF5W/89BWuNy9tFYLm4HfqK1SViSclWWwuK6AhUpTs3RSkeKihnwzC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rR8tzdWj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9E2C4CEC5;
	Sun, 13 Oct 2024 14:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728831152;
	bh=Vv22ND+4yRoaCLfzGOgDrs+5UvZfPQ9Zbq75RAoYprk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rR8tzdWjwk2ObQt9pO9oTN9AbRph+fmInHi++ev8Cnv8oU4FlcLYuiva0kW+g2/4E
	 K9b9uEKCXAl/exAH5a4CTM8uajvnkOIRWg8d4WVuCfY06i8Nakj9TP/vhNHpYbHlea
	 RXTprgSdSo7qRZhjXtmyZtNDckn1ub4NERxH+GOo=
Date: Sun, 13 Oct 2024 16:52:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linux-kernel@vger.kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5] gpio: add support for FTDI's MPSSE as GPIO
Message-ID: <2024101314-rephrase-lark-c93a@gregkh>
References: <20241009131131.1618329-1-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009131131.1618329-1-mstrodl@csh.rit.edu>

On Wed, Oct 09, 2024 at 09:11:31AM -0400, Mary Strodl wrote:
> FTDI FT2232H is a USB to GPIO chip. Sealevel produces some devices
> with this chip. FT2232H presents itself as a composite device with two
> interfaces (each is an "MPSSE"). Each MPSSE has two banks (high and low)
> of 8 GPIO each. I believe some MPSSE's have only one bank, but I don't
> know how to identify them (I don't have any for testing) and as a result
> are unsupported for the time being.
> 
> Additionally, this driver provides software polling-based interrupts for
> edge detection. For the Sealevel device I have to test with, this works
> well because there is hardware debouncing. From talking to Sealevel's
> people, this is their preferred way to do edge detection.
> 
> Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> 
> (Resent because I forgot to cc gregkh last time)

USB stuff looks sane, no objection from me there.

