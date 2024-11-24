Return-Path: <linux-gpio+bounces-13244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1C99D7755
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 19:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8A25B23661
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Nov 2024 16:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9306518B460;
	Sun, 24 Nov 2024 16:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uoZNqMVt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5135C189F45;
	Sun, 24 Nov 2024 16:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732467300; cv=none; b=HOWKw81wJUcTrJONcmrdpY10JApkSb3VUSEKgzZ8U6RD5E+9YqZNRdzlXhUQt25rdPiyEG7MxWE0jQCNsOLqSxiMAvntyqGifc8rkovn8CQ6fBfqsTQtyEkg+3jAoiUfG7jBW7T346XCoUyc/cele5m5mJMrB7Mh4KBuCMJnW70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732467300; c=relaxed/simple;
	bh=xjHzIgrs0evP7qQh1vDP8iL2YuIbWNeUnTID39DnOfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1P+mCL121f4j9MhvDoT94T+Hyt2EgSr9YmF9+Yh6YcKhYnD5uKr/il8GrGr2pqyc/qDwFE2VpTD5Ng2lHMmU3bkDdD1rIIRJ2VvYtJm4GYuuKvMHsNJoYuQZq5ANLReQsGzezC/zv6l5CXkCkBRdoyRKZ74pPVocHLcF6P7hQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uoZNqMVt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FFCBC4CECC;
	Sun, 24 Nov 2024 16:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732467299;
	bh=xjHzIgrs0evP7qQh1vDP8iL2YuIbWNeUnTID39DnOfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uoZNqMVtF8aUG2rkbpgEkw4uObOeEM5TcWw+QgZ/wekchZlpLwoWzHBF1olPVSqnz
	 SM2KcYljWokCjLyaIuHaNF8peWIG/NET1R6TKxYBq7K9pgP+Vu3v0g1nF9p/T4mEjS
	 Mh/ijXQoBQrd9+xZQ+MuWt+2AGhmjr6/+f8t/2ljHz4EAUh15LkObVHBXZa3KHIONX
	 V4fO5oeY2c8aGxzl0AwIt1Gt8UAVHfsZ5t4jOPxtf6Hqht2AIT8dvT3ZPC6a+4Gkfk
	 6nrKCkP2PuclaQP/iiAponvcrF5NxtzZqJmoaSBANtBtJoViFQsLz6BM6HXGzk1jfo
	 e+pomu2pAHf1w==
Date: Sun, 24 Nov 2024 11:54:58 -0500
From: Sasha Levin <sashal@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] pin control changes for v6.13
Message-ID: <Z0NaYhtZy89ObgmR@sashalap>
References: <CACRpkdZWqTOTzYYgD-wAps2Ygsh-D+nxaW76hrWSdTDZZKBA_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACRpkdZWqTOTzYYgD-wAps2Ygsh-D+nxaW76hrWSdTDZZKBA_w@mail.gmail.com>

Hi Linus,

I've just hit the issue you've described in this PR:

On Sat, Nov 23, 2024 at 05:23:26PM +0100, Linus Walleij wrote:
>- The second issue is more sneaky: a recent fixup patch to one
>   of the rc:s (I think -rc4) fixed some error path bugs in
>   the AW9523 driver, then a patch to the regular devel is
>   improving the use of devres so the fixed errorpath fixes
>   things broken.
>
>I have been applying the following fixup patch for -next to work:

And realized that that proposed fixup:

>diff --git a/drivers/pinctrl/pinctrl-aw9523.c b/drivers/pinctrl/pinctrl-aw9523.c
>index ebd590a3cec6..90059b0d20e5 100644
>--- a/drivers/pinctrl/pinctrl-aw9523.c
>+++ b/drivers/pinctrl/pinctrl-aw9523.c
>@@ -983,11 +983,8 @@ static int aw9523_probe(struct i2c_client *client)
>        lockdep_set_subclass(&awi->i2c_lock,
>i2c_adapter_depth(client->adapter));
>
>        pdesc = devm_kzalloc(dev, sizeof(*pdesc), GFP_KERNEL);
>-       if (!pdesc) {
>-               ret = -ENOMEM;
>-               goto err_disable_vregs;
>-       }
>-
>+       if (!pdesc)
>+               return -ENOMEM;
>        ret = aw9523_hw_init(awi);
>        if (ret)
>                return ret;
>
>This can be folded in as an "evil merge" or applied separately on
>top, your pick.

Is effectively a revert of one of the commits that are part of this PR:

>      pinctrl: aw9523: add missing mutex_destroy

Would it make more sense to just re-do this PR without the offending
commit? I understand that this is a fairly small fixup, but I'm
concerned that this will just create confusion later on...

-- 
Thanks,
Sasha

