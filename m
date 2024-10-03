Return-Path: <linux-gpio+bounces-10802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E1F98F3A1
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 18:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C87D6283049
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 16:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0C71A7050;
	Thu,  3 Oct 2024 16:08:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A871A7045;
	Thu,  3 Oct 2024 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971729; cv=none; b=g/Dzrf++L9xe49ByseIr46lo7qavwomVExXIlyvABUhoGp5GUDpG58UxlCIgOJQcEXU6Rh1gnqScGIgxzhiC26Aux6Rf5q7LMxGOoeyilZjr0cc+g/XuK4wCAkT93Pjxw6Ib27MqLHtR7d6om7Cpvlb7kkENoV0aYVtO5t0Z9CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971729; c=relaxed/simple;
	bh=DysFazV41E8SK2TIlNPdqS02/MJ+116FbhYf/4a8q90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DITJz8OWsWKEKzO8QS8arSxXPY1a9gu/leF4qR493JREjCE+79cd+v0HnNSksca7Y39bYOFemPETER0ssEPN7GVobnck2R6n9OOtfwvbKlzA4zge94iRTBy10IUupHxs44JOvm8dWME4R+7Dp0KTir2LEQwqPQxKO1vojEG038s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu; spf=none smtp.mailfrom=freedom.csh.rit.edu; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=freedom.csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=freedom.csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id F331F417943F;
	Thu,  3 Oct 2024 12:08:45 -0400 (EDT)
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id RXKh-9yV_bf0; Thu,  3 Oct 2024 12:08:45 -0400 (EDT)
Received: from freedom.csh.rit.edu (unknown [129.21.49.24])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTPS id 9220B45735E9;
	Thu,  3 Oct 2024 12:08:45 -0400 (EDT)
Date: Thu, 3 Oct 2024 12:08:44 -0400
From: Mary Strodl <mstrodl@freedom.csh.rit.edu>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org,
	linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] gpio: add support for FTDI's MPSSE as GPIO
Message-ID: <Zv7BjPfA3rV8fUBH@freedom.csh.rit.edu>
References: <20240926124424.2133464-1-mstrodl@csh.rit.edu>
 <CAMRc=Mc+49C+GftT02HptPKYnrL+QidSB9fH2GC4yPecHqW4dQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mc+49C+GftT02HptPKYnrL+QidSB9fH2GC4yPecHqW4dQ@mail.gmail.com>

On Tue, Oct 01, 2024 at 09:04:58PM +0200, Bartosz Golaszewski wrote:
> I don't know much about the USB subsystem in the kernel, maybe Cc Greg
> KH on this?
Ok, I mostly just copied what I saw from other drivers.
 
> You could drop this label, all the gotos and the corresponding free in
> remove if you scheduled a devm action with devm_add_action_or_reset()
> right after getting the new index.
Thanks, didn't know about `devm_add_action_or_reset`! I was disappointed
to not find a `devm_ida_simple_get` when I wrote this, it is much cleaner
your way :)

> Overall it looks clean and nice but I can't tell if the USB-specific
> bits are correct.
> 
> Bart

Thanks for the review! I sent out a v4 that should hopefully address your feedback.

- Mary

