Return-Path: <linux-gpio+bounces-10804-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B44798F4BE
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 19:02:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB1DDB2139E
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 17:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14DE2747B;
	Thu,  3 Oct 2024 17:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tzQ2152W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323F912C526;
	Thu,  3 Oct 2024 17:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727974934; cv=none; b=tYuoJOVQultjrtG/yRJKjsxrsmRetk62tn02YUIuD0rTXsKqWBXC94BwEUItWsJmHzikI6Q2mOUomC/Ds90uEVz5M1GvBU1rMIsABrXWCsDQijMU2LKa5FZj/TlgbczQRkQb8az23fAoWd+Rx/BTplBMlqUDspXFugrJ7IIbGEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727974934; c=relaxed/simple;
	bh=+DvTs8oQjGGNjxDETCHt4B+X1yXP2QEXnhIUUiz66Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYHfbAnNZ0TnsqR14EXVk0AgT6X4ql0jl2bC1Vf0IjSSyCXBFALBzLulpa3rDQDbSk3JoI5sHaS7WIu23QaTj3x/OJZgKxtKykOVqfiaY6h66rpgKQpYxG7tuWy1Wyb3fuZ3XMAIJxEPfv+KKTzf/gEUbTeAoBtwSiqtqUTjv0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tzQ2152W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F2EC4CEC5;
	Thu,  3 Oct 2024 17:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727974933;
	bh=+DvTs8oQjGGNjxDETCHt4B+X1yXP2QEXnhIUUiz66Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tzQ2152WX/kgeaaq1wiouHvA7KFRUYXd9n30/b01vfHFeWqKhsCcX51FPwPmh/z6b
	 vYg6GrVHVbbyZhVJ3SAYZzFYvzgE9dBgbMsqXqiB/KnbyIoLYBOgfRpKzZ8Cov7fJJ
	 tetoSh1qmpCfnK7nre9p7uCvjSyHI6rzx7BLuLaU=
Date: Thu, 3 Oct 2024 19:02:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] gpio: add support for FTDI's MPSSE as GPIO
Message-ID: <2024100303-oozy-handwash-20d5@gregkh>
References: <20241003155054.4159343-1-mstrodl@csh.rit.edu>
 <Zv7FS5cfHAE4EzoO@freedom.csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv7FS5cfHAE4EzoO@freedom.csh.rit.edu>

On Thu, Oct 03, 2024 at 12:24:43PM -0400, Mary Strodl wrote:
> Hi Greg,
> 
> On Tue, Oct 01, 2024 at 09:04:58PM +0200, Bartosz Golaszewski wrote:
> > I don't know much about the USB subsystem in the kernel, maybe Cc Greg
> > KH on this?
> 
> I forgot to copy you on this patch until after I sent it, but wanted to make
> sure you had a copy.
> 
> (Apologies if this is a bad way to do this... I couldn't think of a better way
> with my mail client)

I see no patch here :(

