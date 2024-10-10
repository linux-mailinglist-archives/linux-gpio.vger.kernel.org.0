Return-Path: <linux-gpio+bounces-11162-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A515E9993B7
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 22:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41AECB23942
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 20:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09EA1D0483;
	Thu, 10 Oct 2024 20:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="jptT0D+f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9951A1CCEDF;
	Thu, 10 Oct 2024 20:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728592355; cv=none; b=kEYWucQsGSk5ZaGPvJSF+cvr0BUhs0paW1GcZv8/WqyDNnqVcYtvU8uNkCBRjz6R1iU9pMRdnC2FkEBXU2soirYHaY9sIfMJCMDHwQ3RoCmm1H4HYx8VcT2ZrzRzJ2fyL0FVExYdyiDfmOY01RVyn9ciaOXNgDpCfgdIBxH3bh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728592355; c=relaxed/simple;
	bh=3CGxP2qN6YVYFEjezTAaN5IgNYLK7qN98hoW+HQJYGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjvIrp2DYr1rueS1uFI5GTX8uMXz3Tfa91TgXxFpO8A+WlUpFziCNDChXyFvGMn/o2EKqj5qQ5jFPEJheTRgmATDSFVRtgTPNBGSDQN12keOsu2T5kuMCz16rMonM0Z/fzEQdz9PJlC2q6qhPKS4ejof42QH9ufy7fGEwfR/olY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=jptT0D+f; arc=none smtp.client-ip=80.12.242.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id yzpfsmaeQKZwWyzpfsd0g9; Thu, 10 Oct 2024 22:32:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1728592344;
	bh=toazOp+FeqwFOgTVRmgDHxm9wBZ5QCQUUtICBR3zZlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=jptT0D+fIZM4qTdCVDJDm1s3zfNrGTSbRT64abfZ2FmKdZyhqwdDMF+B4IvOejfX2
	 xFADYq85rwV2NSUoc7/zF4EZX7VTpVUWPaSJFW2wzV4UQbkSLlygfparQpLmnf8nnr
	 kzk3jfU+y1750ELoiMlI3d7n5Fmiq9KJKcNHOwpgCzahzXv7upL2xXp8lOQZ9RN4hF
	 YWtryh96Mz2hNeM1x1/jVYezL1KM8SGV4HiF8KivnwCJI+i4IbdQf0aPNj7v/5OhmM
	 GcE1umDXbjWTgsOyWQ1BJoQEwR9GVG9ZdAxG2Zq2Ew1v0B/Mpm0VnLyRf8GrMsH7GX
	 NPEloBniuOgoA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 10 Oct 2024 22:32:24 +0200
X-ME-IP: 90.11.132.44
Message-ID: <de04ad2d-7203-4308-9bd2-74051546bb37@wanadoo.fr>
Date: Thu, 10 Oct 2024 22:32:23 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: sophgo: fix double free in
 cv1800_pctrl_dt_node_to_map()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, error27@gmail.com
References: <20241010111830.3474719-1-harshit.m.mogalapalli@oracle.com>
 <41acfc55-9741-4cef-9254-f9e4be4da956@wanadoo.fr>
 <aac19faa-fd95-4c6a-9a41-e4f03f8e1733@stanley.mountain>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <aac19faa-fd95-4c6a-9a41-e4f03f8e1733@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 10/10/2024 à 20:33, Dan Carpenter a écrit :
> On Thu, Oct 10, 2024 at 07:17:19PM +0200, Christophe JAILLET wrote:
>> Le 10/10/2024 à 13:18, Harshit Mogalapalli a écrit :
>>> 'map' is allocated using devm_* which takes care of freeing the allocated
>>> data, but in error paths there is a call to pinctrl_utils_free_map()
>>> which also does kfree(map) which leads to a double free.
>>>
>>> Use kcalloc() instead of devm_kcalloc() as freeing is manually handled.
>>>
>>> Fixes: a29d8e93e710 ("pinctrl: sophgo: add support for CV1800B SoC")
>>> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
>>> ---
>>> This is based on static analysis with smatch, only compile tested.
>>> ---
>>>    drivers/pinctrl/sophgo/pinctrl-cv18xx.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
>>> index d18fc5aa84f7..57f2674e75d6 100644
>>> --- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
>>> +++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
>>> @@ -221,7 +221,7 @@ static int cv1800_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>>>    	if (!grpnames)
>>>    		return -ENOMEM;
>>> -	map = devm_kcalloc(dev, ngroups * 2, sizeof(*map), GFP_KERNEL);
>>> +	map = kcalloc(ngroups * 2, sizeof(*map), GFP_KERNEL);
>>>    	if (!map)
>>>    		return -ENOMEM;
>>
>> Hi,
>>
>> drivers/pinctrl/nuvoton/pinctrl-ma35.c seems to have the same issue.
>>
> 
> Yep.  That one is too complicated for Smatch to find.  In this case, the kfree()
> happened in the cleanup so it was in the same function.
> 
> regards,
> dan carpenter
> 
> 


For the records, I spotted the other case with coccinelle:

@ok1@
identifier X, fct;
@@

struct pinctrl_ops X = {
	.dt_node_to_map = fct,
	.dt_free_map = pinconf_generic_dt_free_map,
};

@test1 depends on ok1@
identifier fct = ok1.fct;
identifier fct2 =~ "devm";
expression x =~ "map";
@@

int fct(...)
{
	...
*	x = fct2(...);
	...
}




@ok2@
identifier X, fct;
@@

struct pinctrl_ops X = {
	.dt_node_to_map = fct,
	.dt_free_map = pinctrl_utils_free_map,
};

@test2 depends on ok2@
identifier fct = ok2.fct;
identifier fct2 =~ "devm";
expression x =~ "map";
@@

int fct(...)
{
	...
*	x = fct2(...);
	...
}

CJ

