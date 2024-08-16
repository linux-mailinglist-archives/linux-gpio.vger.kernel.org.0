Return-Path: <linux-gpio+bounces-8771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B879548AB
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 14:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42F25284E81
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Aug 2024 12:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89711A01CF;
	Fri, 16 Aug 2024 12:23:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA74612AAC6;
	Fri, 16 Aug 2024 12:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811007; cv=none; b=bZ5Bx78rqZoRGtJ0i8cW2grRMGafCtP1zQSHCdPOVazOonNaxsOEKWkGx5Hmr6taiWqNCkdxi8u+LNDy4LNzgEskAzO8/v/I2Gv+M1PFEPZNaHQX23/OcXxdqaKmBm+LAovQjQKgJGm5jpe+x7gpwWvQq6DBQwpl3xx99MUUad8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811007; c=relaxed/simple;
	bh=UfPDRFd0sZcw8VTEACv6koAZLJVRdOyVFvePyMLlt3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oB66i0NtlEo4q3yebJSDpSKhzMBQwZKDkHm1zD1/vwJCwcM5Ov7ZN5q9v/o67X7K2zSZhRIxBHbS/qKMRBH67Uc+Kk+qvhclSMx23EWjaS4j5xKiXeNVmMQcjxb65oBxOlipwO56TFB4UHKYdD1z18DGf2h72ACv2aZOK8Dq21Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu; spf=none smtp.mailfrom=freedom.csh.rit.edu; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=freedom.csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 16585414DD61;
	Fri, 16 Aug 2024 08:23:18 -0400 (EDT)
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Q4MOhtoyrouT; Fri, 16 Aug 2024 08:23:17 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 34DF745735E9;
	Fri, 16 Aug 2024 08:23:17 -0400 (EDT)
Date: Fri, 16 Aug 2024 08:23:16 -0400
From: Mary Strodl <mstrodl@freedom.csh.rit.edu>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	linus.walleij@linaro.org, brgl@bgdev.pl, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: add support for FTDI's MPSSE as GPIO
Message-ID: <Zr9EtK6qnj5apiie@freedom.csh.rit.edu>
References: <20240814191509.1577661-1-mstrodl@csh.rit.edu>
 <5d26a74d-af5c-490a-8a00-ca0791bb23f6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d26a74d-af5c-490a-8a00-ca0791bb23f6@kernel.org>

Hello!

On Fri, Aug 16, 2024 at 07:52:43AM +0200, Krzysztof Kozlowski wrote:
> You should not need MODULE_ALIAS() in normal cases. If you need it,
> usually it means your device ID table is wrong (e.g. misses either
> entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
> for incomplete ID table.

Gotcha. I will remove that next time this gets sent out. I'll probably
give it a few days so other folks can chime in, unless you'd like to
see this changed before reviewing in more depth?

I assumed it was there to make `gpio-mpsse` work in addition to
`gpio_mpsse`.

> The module with autoload based on USB ids, right?
Yep.

> Best regards,
> Krzysztof

Thanks for taking the time to review my patch!
Mary

