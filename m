Return-Path: <linux-gpio+bounces-11470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA1A9A12FA
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 21:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B04451F25BC9
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 19:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2DD2144D7;
	Wed, 16 Oct 2024 19:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="n3gRld9y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2263C20605A;
	Wed, 16 Oct 2024 19:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729108570; cv=none; b=fzDdbZtEXTujNfz9lKD93KNBlEdwgttYOWV7O2JHTZqawgooxKXh60N2NmS+yJTTzuzjR0fqNgSDrkv8PmkE+jiwyM/JiSVkv2H7z4Y/6Go8J9Fpxv9bBNd884BSODwaQFk6JLviDCSZPpNaP72kx+2A60e+l8+i/zvgo9ah1mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729108570; c=relaxed/simple;
	bh=Zdrk/r8+WlDkCB62s1EuRzuDF8xWThDyLPnimb+N0AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRiXfDfhEed+5BJwAf5ObrrsXMvzBPESzZvYf65N6j/HhCOxyROy3KSZLAiTQkhrZUKoMgYc6Vbh3QBYGSNlxdzP5isHRF+Lan9Ve+FIV2/zANeX8jnTeGI4dIFazqykYhjqz+mWi/TgILu+nnl1sfWqaOiLIU2vEpwOx1iauMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=n3gRld9y; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 2E973457383A;
	Wed, 16 Oct 2024 15:56:01 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1729108560; x=
	1730922961; bh=Zdrk/r8+WlDkCB62s1EuRzuDF8xWThDyLPnimb+N0AQ=; b=n
	3gRld9yjTQWzCUsZ6tpNZT4iIo1f78Ab8MLjDBPMkZt5FAXiLDAQpOSrwbOGbynK
	nK6WVLbFWju3/FDs4dr/SeE3a48Ri7tQPjSpHhKecvHNUzuO0PcPPTuGFhjgxVCu
	wqMqL9Smr5SATK0LZKTRkTAhPd3Qj7QUPZOE/UVuQ0=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id FG2oBYjaJ1wl; Wed, 16 Oct 2024 15:56:00 -0400 (EDT)
Received: from freedom.csh.rit.edu (unknown [129.21.49.24])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id A133945735E9;
	Wed, 16 Oct 2024 15:56:00 -0400 (EDT)
Date: Wed, 16 Oct 2024 15:55:59 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH v5] gpio: add support for FTDI's MPSSE as GPIO
Message-ID: <ZxAaT-HqOsGn1jpc@freedom.csh.rit.edu>
References: <20241009131131.1618329-1-mstrodl@csh.rit.edu>
 <172888967999.6626.5327506199486226336.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172888967999.6626.5327506199486226336.b4-ty@linaro.org>

On Mon, Oct 14, 2024 at 09:08:01AM +0200, Bartosz Golaszewski wrote:
> Applied, thanks!
> 
> [1/1] gpio: add support for FTDI's MPSSE as GPIO
>       commit: c46a74ff05c0ac76ba11ef21c930c3b447abf31a

Thank you very much! Please let me know if you need
anything else on my end!

