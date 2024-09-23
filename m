Return-Path: <linux-gpio+bounces-10387-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2210497EE84
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 17:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81F7FB2178D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 15:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF4B1993BB;
	Mon, 23 Sep 2024 15:50:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13262746A;
	Mon, 23 Sep 2024 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727106631; cv=none; b=UT8/2QdMI9TDJoGcaLLI2wyuY2lPQblV0WnAlzOfngN/vpv5RmDDkaqQWvI6aJh2N1n0bhaTJCwxiwxPjvZVOZDJiey42OJSDXpyPiPeceg4zCRSp1YlwkQXxtH9ZYBxTJNr+ARogGjjVg+YEltioUdbasfFeApjUgH6em3lV5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727106631; c=relaxed/simple;
	bh=YRCgOb2aa4nSASo563RcWrUr3rwed6+q3AjPu02cBCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rE2cIX+0t3CUGkNW0KexOlN5QICNf6WjI2YZDlHkcS3WJmUZDVtOC8x9pJM6CuHBYSX1IQG2ugfRwUcWkRUJTqJxdWKtqFBNiJfFnrHBzWKUNat5yWkosmjxNFZh7yEHobtxqRF7CdOTVy0Eztb1RjsdhDWEwoQKo0qwDqC+DOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu; spf=none smtp.mailfrom=freedom.csh.rit.edu; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=freedom.csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 2800D457363D;
	Mon, 23 Sep 2024 11:50:23 -0400 (EDT)
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1i5uYfQtRbia; Mon, 23 Sep 2024 11:50:22 -0400 (EDT)
Received: from freedom.csh.rit.edu (unknown [129.21.49.24])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 802FC45735E9;
	Mon, 23 Sep 2024 11:50:22 -0400 (EDT)
Date: Mon, 23 Sep 2024 11:50:21 -0400
From: Mary Strodl <mstrodl@freedom.csh.rit.edu>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: add support for FTDI's MPSSE as GPIO
Message-ID: <ZvGOPRhvn1GhdLy2@freedom.csh.rit.edu>
References: <20240919141014.4000958-1-mstrodl@csh.rit.edu>
 <CACRpkdYO4Y_1ZhCw40_2tz70D728hU8aGCThQCiewjkbwboTQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYO4Y_1ZhCw40_2tz70D728hU8aGCThQCiewjkbwboTQw@mail.gmail.com>

On Mon, Sep 23, 2024 at 12:44:15AM +0200, Linus Walleij wrote:
> Maybe you want to provide the gpio.names array for this
> device?
> 
> It makes it easier to use the lines from userspace if they
> have meaningful names, it looks like those may be printed
> on the board on the Sealevel device.

There are a bunch of devices using this chip in very different ways,
so I didn't want to tie it too closely to this specific device.
Also this device kinda doesn't have a good way to label the pins.
Part of the issue is that sealevel hasn't given us a schematic of how
the chip is connected, I've had to figure stuff out by trial and error... :S

> Yours,
> Linus Walleij

Thanks for reviewing! I'll have a new patch out soon with the feedback
from your previous email addressed :)

