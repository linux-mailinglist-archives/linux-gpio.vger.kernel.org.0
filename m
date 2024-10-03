Return-Path: <linux-gpio+bounces-10803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B442798F42E
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 18:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AD1C1F21EA2
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 16:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DB61A4E95;
	Thu,  3 Oct 2024 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="rCMVEUVk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86293433AD;
	Thu,  3 Oct 2024 16:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727972688; cv=none; b=rX6xi64YJuryozKZGbhZDNynRp7nI1sKd2G4XS2XAGfM0vzelLwTFuqZGIlnHLA5Y5qwvohyLbJCYD/RKy/LrpCs8iUaV2JZdMvYKuPHwMwkMn/DoFa3ojwpG+/ldV4h+YBFMNVfRhH+h3g7OacgmyMAeTEwi7QNsv+qFzn2akQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727972688; c=relaxed/simple;
	bh=ooKvUn0ZhSfVHHCa4TH7hrIcROX+r2JeOuuQe6j7EGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PupEuRHFZ7pzJ72y8q9TVCvs9aDIahybejJoLcmqtELeYKeduNHv5crl2qPpg5gVfd5Dspc2L7g8qFeLDIv7kSNnoUXQpV+ohPu0PT4ZasEVZxY04ynTvo40up2SP2xT+NQhNlyvNaBokNauZiODn0E2w0X+n7+66+2euxNJ0H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=rCMVEUVk; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 83F9A417943F;
	Thu,  3 Oct 2024 12:24:45 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1727972685; x=
	1729787086; bh=ooKvUn0ZhSfVHHCa4TH7hrIcROX+r2JeOuuQe6j7EGs=; b=r
	CMVEUVkjp+B6LCyxxVRoi0abHmyOCI3B0RSJa6EhATXI0Gz08uCmmY43ESJJUoJf
	2WUdyekEj4FUUZjEel2bkUwADwJqpdCKPmHvns5WU8J5JrUrtYAeAFXMMioIYz+U
	XUdO4ZuMNIXBNEpdJEZeHmlaMtlSGksOH5E5/GqYnQ=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id yfurWxpSA_LF; Thu,  3 Oct 2024 12:24:45 -0400 (EDT)
Received: from freedom.csh.rit.edu (unknown [129.21.49.24])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id DBDBC45735E9;
	Thu,  3 Oct 2024 12:24:44 -0400 (EDT)
Date: Thu, 3 Oct 2024 12:24:43 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: gregkh@linuxfoundation.org
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] gpio: add support for FTDI's MPSSE as GPIO
Message-ID: <Zv7FS5cfHAE4EzoO@freedom.csh.rit.edu>
References: <20241003155054.4159343-1-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003155054.4159343-1-mstrodl@csh.rit.edu>

Hi Greg,

On Tue, Oct 01, 2024 at 09:04:58PM +0200, Bartosz Golaszewski wrote:
> I don't know much about the USB subsystem in the kernel, maybe Cc Greg
> KH on this?

I forgot to copy you on this patch until after I sent it, but wanted to make
sure you had a copy.

(Apologies if this is a bad way to do this... I couldn't think of a better way
with my mail client)

Thanks!

