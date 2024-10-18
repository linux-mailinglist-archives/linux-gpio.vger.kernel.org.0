Return-Path: <linux-gpio+bounces-11651-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFAF9A48D9
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 23:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10E401F22963
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 21:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C456204F7F;
	Fri, 18 Oct 2024 21:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5b7yQoF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F010718D629;
	Fri, 18 Oct 2024 21:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729286475; cv=none; b=R2Sg+ZljmzYK3F7TETDOtDYbqbcGitiaG9cMJ7lBzSoW5O8bsUw1sFPZoZYd/6TSylzVE/sMDe8ly9uWwzbxxpzJw2D6DehmfOBb/XTmrHjRy03mrCLI3KsSZP1IaS3aYZLWHZEXGk1OflunOHWa0N371ljVJfzH0gxI3zWwEJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729286475; c=relaxed/simple;
	bh=EES7i7+xI4t0nQiCYO6+i0Prk0sXhOXz7pQPDwImBlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzkmjU6uJvLvx6gSY/Fl8Qk00u4HnTKv3d6ANU20GpZCfNVB5qQr+IAyYcmQsrh85ljBRM2fJHQFAbE62gNUc7ASriGpLmDTD096itrtEyvU/qjfuLOVqzv87jBnNXCebJC8NmHXfCUWS4eUtD+Tb3JK3J8u6Jme3ZjjyrwLkSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5b7yQoF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF65C4CEC3;
	Fri, 18 Oct 2024 21:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729286474;
	bh=EES7i7+xI4t0nQiCYO6+i0Prk0sXhOXz7pQPDwImBlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O5b7yQoFiIFFK80qoyUF3kODPbXJe1adoXBu3Gp5SZlrPt4B/5JuaBn6rb8oFbJlF
	 BwlNB+/UE5KHx3ezYeDf0BxaB8LW+xEVAaP2PvRzADRZSEPs9cFjKqJ9BvXRZSS+SX
	 kHoy6GtMes1OtwcFUqp9GDAFBn66eXoSTJrWEwoE9RBZVt3xaq8e/UgUTYNqSKWeq2
	 RAT5wfvqOy9voQu1KgptnnDGFaY6ktrg/f6gFfySswCZ/0flEFXduA2VW+kA96IiE7
	 PrhI+zA46vcKA3otQyr4fukyEnWAi87wIAzJYwJV49wfXXAogUXH2e1M/cSFjl4kwG
	 qTyzyx9MZPTTQ==
Date: Fri, 18 Oct 2024 23:21:11 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rcu: Fix remaining rcu_momentary_dyntick_idle()
 references
Message-ID: <ZxLRRzprMPEWDMz1@pavilion.home>
References: <20240925054619.568209-1-srikar@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240925054619.568209-1-srikar@linux.ibm.com>

Le Wed, Sep 25, 2024 at 11:16:18AM +0530, Srikar Dronamraju a écrit :
> There is one last reference to rcu_momentary_dyntick_idle() after
> Commit 32a9f26e5e26 ("rcu: Rename rcu_momentary_dyntick_idle() into rcu_momentary_eqs()")
> 
> Rename the same so that we are uniform.
> 
> Fixes: 32a9f26e5e26 ("rcu: Rename rcu_momentary_dyntick_idle() into rcu_momentary_eqs()")
> Cc: Valentin Schneider <vschneid@redhat.com>
> CC: Frederic Weisbecker <frederic@kernel.org>
> Cc: Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
> Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>

Thanks!

I suspect this should be better routed through the GPIO UAPI maintainers?

In which case:

Acked-by: Frederic Weisbecker <frederic@kernel.org>


