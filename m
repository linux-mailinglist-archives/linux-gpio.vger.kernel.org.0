Return-Path: <linux-gpio+bounces-26825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C99FBBE0E9
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 14:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 497F94E41D8
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 12:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7448327FD7D;
	Mon,  6 Oct 2025 12:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="NdJ7rVVi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988A01F4CB3;
	Mon,  6 Oct 2025 12:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759754397; cv=none; b=kqasJy0Uvlpt9ljlSn0rj3kMWJksLELKUAvrklfgW1uGPFCs28ADIkZARqwz/UIYqpb5wyDB6MMmEK8mz1MT2+e0DpOJGo5JNBxjFaGUFEROyes4lluiLSzExD4D1Y44T9fg3rfk7Om/4jXTMm9/i32tzdsJfkt0nIxFI8zDcyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759754397; c=relaxed/simple;
	bh=g187WBQgP/pezGUzIfSvKg2hYG86BrBURz5UnYid+bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWxRJcQHoKq0VddRBHRP/X/u3cKhX5mU/IMSL6no+qMAbBugWrfBf0ejFAnuocv6c5ptDCczHYZAO6L1kxvkSuCPK7gDEm9342FGbywB3P1P7TRHAW0lsXjIP58/dAOQuqUUJWusLrmpNA2RogFs3r5CFbbWGJ6JWLwUr+yFlEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=NdJ7rVVi; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id A5A16457363D;
	Mon,  6 Oct 2025 08:39:54 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received:received; s=mail; t=1759754390; x=
	1761568791; bh=g187WBQgP/pezGUzIfSvKg2hYG86BrBURz5UnYid+bk=; b=N
	dJ7rVViCjqf2vp+YYHD7pkNdcOm1dnWK3bXJkdT7RcMjpF5RCb6M9PXi4hgrBF3T
	BXu9llf0aRAHxAZcBqxwp0pLTJzaE1fc+Oaxmp2jXpztnoC6fGgoJ9yEr8ur+Uhj
	a86Nbokmwiu/AgL9ZLN/A82X+5s5H+6i/kB0q4YOSY=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id O28dyEOaFzvr; Mon,  6 Oct 2025 08:39:50 -0400 (EDT)
Received: from ada.csh.rit.edu (ada.csh.rit.edu [129.21.49.156])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 0A010457328D;
	Mon,  6 Oct 2025 08:39:50 -0400 (EDT)
Date: Mon, 6 Oct 2025 08:39:49 -0400
From: Mary Strodl <mstrodl@csh.rit.edu>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-kernel@vger.kernel.org, tzungbi@kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 3/4] gpio: mpsse: add quirk support
Message-ID: <aOO4lSDUcLJuaNK3@ada.csh.rit.edu>
References: <20251003195036.3935245-1-mstrodl@csh.rit.edu>
 <20251003195036.3935245-4-mstrodl@csh.rit.edu>
 <aOAyKI7hv36oLJkD@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOAyKI7hv36oLJkD@stanley.mountain>

On Fri, Oct 03, 2025 at 11:29:28PM +0300, Dan Carpenter wrote:
> Thanks!
> 
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> regards,
> dan carpenter

Thank you!

