Return-Path: <linux-gpio+bounces-25669-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD55EB454DC
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 12:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 769065634BF
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 10:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88C72D5A01;
	Fri,  5 Sep 2025 10:38:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E810A25C81B;
	Fri,  5 Sep 2025 10:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068730; cv=none; b=rX2xXrSvke4ccVvhhD3YkkMx+5dLVQ85LtGXfo1JtI+pQ0Ct+XOMfiWBxExGdqXrJra5n6OA061WxzT2yFApxfQMPJnfypYUD6hGUFVZNM0wRi7E1C9FKO0/Zt7COM/+9iAme8SfNlYQoEX+tB3Hyu1PgJ57KyNww9v7QIqh4as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068730; c=relaxed/simple;
	bh=6yIU/7cp3myn1fSjVcHGY+tPQlr81hBPRq6y5FiMRoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFEWiwVJ+WJ29u+0NCIFIG8urcjw+WE81a4bLEJddm680o4x85X4x/TopLByhXcd/6NG92MDlnR8GQ6YaRm5q1V7O7rvzc9uNbyRBH9uwGppt8d9yCQEPe9qo777qKjgvFtLuTahKifjIinF7+nssejIU+O4XBNKToAOPnhDonY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AD64153B;
	Fri,  5 Sep 2025 03:38:33 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DE673F63F;
	Fri,  5 Sep 2025 03:38:40 -0700 (PDT)
Date: Fri, 5 Sep 2025 11:38:37 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] pinctrl: generic: rename PIN_CONFIG_OUTPUT to LEVEL
Message-ID: <20250905-pristine-bronze-avocet-2d9e0e@sudeepholla>
References: <20250905-output-value-just-value-v1-1-c9dd1a172d62@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-output-value-just-value-v1-1-c9dd1a172d62@linaro.org>

On Fri, Sep 05, 2025 at 11:21:50AM +0200, Linus Walleij wrote:
> This generic pin config property is confusingly named so let's
> rename it to make things clearer.
> 
> There are already drivers in the tree that use PIN_CONFIG_OUTPUT
> to *read* the value of an output driven pin, which is a big
> semantic confusion for the head: are we then reading the
> setting of the output or the actual value/level that is put
> out on the pin?
> 
> We already have PIN_CONFIG_OUTPUT_ENABLE that turns on driver
> buffers for output, so this can by logical conclusion only
> drive the voltage level if it should be any different.
> 
> But if we read the pin, are we then reading the *setting* of
> the output value or the *actual* value we can see on the
> line?
> 
> If the pin has not first been set into output mode with
> PIN_CONFIG_OUTPUT_ENABLE, but is instead in some input mode
> or tristate, what will reading this property actually
> return?
> 
> Reading the current users reading this property it is clear
> that what we read is the logical level of the pin as 0 or 1
> depending on if it is low or high.
> 
> Rename it to PIN_CONFIG_LEVEL so it is crystal clear that
> we set or read the voltage level of the pin and nothing else.
>

For the SCMI part specifically and in general for the renaming as it
improved readability:

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

