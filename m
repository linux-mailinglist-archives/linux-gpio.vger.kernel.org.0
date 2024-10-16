Return-Path: <linux-gpio+bounces-11416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9C99A051E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 11:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D335282D09
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C43205125;
	Wed, 16 Oct 2024 09:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xhAfRblC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8A1204F6F;
	Wed, 16 Oct 2024 09:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729069952; cv=none; b=aX6jH7m4oAzJ7tph3gzfoc4MKoE3k9ZJa2rnTx6alvgb8Stp1ACXgaA0y1ikLxA7xp5cMAJMYVB47O5EIODdd59PJNzEcg53feuinXsWCVkTaQYikYrMZNCC9kB0DGxraWc8JRx5+uhoD+KGXqfxnbneYf0hmfNIqfNql7wgsQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729069952; c=relaxed/simple;
	bh=oi2Lh0s454PF8oWrfDSJ407h9LJfLGMzMxzMGkF1rD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Emtlt31/teK2FmZo79yhavdv8OEq5TjF+nh+p4qH6BqQEmsZ34o8j3O2feJQscDiWf5L08AglVNqMNjuEzV78E63UCEizz7zKp0NYxaGU2wwhMedv3rnNpQxMzfRUkNVqvb/JJC7K7LXaKG87uYCViPSfQsw2EsRiBsg7xwTS4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xhAfRblC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8486FC4CEC5;
	Wed, 16 Oct 2024 09:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729069952;
	bh=oi2Lh0s454PF8oWrfDSJ407h9LJfLGMzMxzMGkF1rD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xhAfRblCV4+PvsZvw6GJ/22D24rrKYygA3nFHVdX5b0UfXydI+BTwilvwdHrNYREk
	 4SnKEoWP4i5Hwk9vUnkeQrfwbjxtffd/zNWXFHaPwbGlR6LwS/A9WMjZJ7bTyQITzV
	 SUeZZs842Bej0ASNNS+ojm/9Qk/a/OlAZ1nJTmnE=
Date: Wed, 16 Oct 2024 11:12:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kent Gibson <warthog618@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/2] gpio: create the /sys/class/gpio mount point with
 GPIO_SYSFS disabled
Message-ID: <2024101603-crested-crowd-da88@gregkh>
References: <20241015-gpio-class-mountpoint-v2-0-7709301876ef@linaro.org>
 <2024101531-lazy-recollect-6cbe@gregkh>
 <CAMRc=Mea=W-1UoHMew3Si=baW3ayERrHjxjG0NPdmkCfp9dUHw@mail.gmail.com>
 <2024101535-wrangle-reoccupy-5ece@gregkh>
 <CAMRc=MdsXggB9TUK-Rxt1GLZ9OA+3FskD1q3BM8TGbOhqmhXjg@mail.gmail.com>
 <2024101611-extruding-overstock-4626@gregkh>
 <CAMRc=MeLkwRhgdtmmjxiJFvHZNCS55FR=hY3Qc0Gsb_nA725SQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeLkwRhgdtmmjxiJFvHZNCS55FR=hY3Qc0Gsb_nA725SQ@mail.gmail.com>

On Wed, Oct 16, 2024 at 10:49:57AM +0200, Bartosz Golaszewski wrote:
> > Again, the issue is "do not remove apis that userspace relies on".
> > That's all.  I'm going to add another one called "do not mount any
> > filesystem at /sys/devices/class/ as that is insane" as well :)
> >
> 
> I know you're not being 100% serious but I think it's worth mentioning
> that the mounting is not done from the kernel. You can't really impose
> the second one on user-space.

Understood, but I can reject a patch that does "create a mount point for
userspace to use in /sys/class/", which is what I meant here.

thanks,

greg k-h

