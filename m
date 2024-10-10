Return-Path: <linux-gpio+bounces-11149-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58399998E2F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 19:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0814F1F258BC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 17:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6FA19C57B;
	Thu, 10 Oct 2024 17:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="TwiMtLdY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from msa.smtpout.orange.fr (smtp-70.smtpout.orange.fr [80.12.242.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998E819ABC2;
	Thu, 10 Oct 2024 17:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728580652; cv=none; b=e6nZiMZjghU6Ivjm2dtrP6aBiZKCY0+GT1injh62ZzFqVwMFwtourNxopkJFJxFi96Jpcz2dMAbOI8pdUzR+QX8zBYGDUmQW2RDc9JdRy4CjkcrZXt5MeljuE1UhvnrrzjRlYdP2cC2RrX1htf8aIFjvu6NgQF0w76CKuLxlw/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728580652; c=relaxed/simple;
	bh=ppW1GFtiN2nQpgHWFXJsKPPhgKIDkMmMWYGQiJQXcVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KisBiNXrDbCwFrnQidEcSXW4Hp00Ru5Lxrl/QtBGNSmEC3pFBQ6NBM51fCw2YgZJ/szbV1iBE1HotTpeRXVB76gdOW/hVxRLFOtu6cMPeu+bNTyPEg637ctWioEgpqAdQDrHrYblPk09VyWFmyfPhgo4LVrAwP6mmkK8cOhTX+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=TwiMtLdY; arc=none smtp.client-ip=80.12.242.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id ywmts79NqjJK0ywmusP47Q; Thu, 10 Oct 2024 19:17:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1728580641;
	bh=mCHkK1JJeeVwZX5C2Lk1lJdZRVPDG5DAsI59DVUCJl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=TwiMtLdYMb26pymQ7efv//qDELeAiOi+QrRFLVf+DP/ssaG4LFsowd5D0pjJ+sfyz
	 FxsxcT2TisKTnPutqDknHI3fxwAATteqg/uPt7zKg6rVEIK39ThwJaL8NVPB5hUeNa
	 DrSKvhFnuKaJ3RRhQ9uEJJST6donc/z+7YcdKueLr4WLxO3SDozhCUDdQjQk4ZzRFt
	 haZVrzD6zY8dbxbpDYx0YXtQVjoe0PFTUq1NnO4gu/8ZIy5FwtNf2HyL8RMLRXX7n/
	 VMHBVdwkPilYFJgBHnGmfqWTabxzFX94CNAff3p751pTX8es6Kw6Jp/GsmQczauca/
	 ZqO6hZeoQtagw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 10 Oct 2024 19:17:21 +0200
X-ME-IP: 90.11.132.44
Message-ID: <41acfc55-9741-4cef-9254-f9e4be4da956@wanadoo.fr>
Date: Thu, 10 Oct 2024 19:17:19 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: sophgo: fix double free in
 cv1800_pctrl_dt_node_to_map()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
References: <20241010111830.3474719-1-harshit.m.mogalapalli@oracle.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241010111830.3474719-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 10/10/2024 à 13:18, Harshit Mogalapalli a écrit :
> 'map' is allocated using devm_* which takes care of freeing the allocated
> data, but in error paths there is a call to pinctrl_utils_free_map()
> which also does kfree(map) which leads to a double free.
> 
> Use kcalloc() instead of devm_kcalloc() as freeing is manually handled.
> 
> Fixes: a29d8e93e710 ("pinctrl: sophgo: add support for CV1800B SoC")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is based on static analysis with smatch, only compile tested.
> ---
>   drivers/pinctrl/sophgo/pinctrl-cv18xx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
> index d18fc5aa84f7..57f2674e75d6 100644
> --- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
> +++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
> @@ -221,7 +221,7 @@ static int cv1800_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>   	if (!grpnames)
>   		return -ENOMEM;
>   
> -	map = devm_kcalloc(dev, ngroups * 2, sizeof(*map), GFP_KERNEL);
> +	map = kcalloc(ngroups * 2, sizeof(*map), GFP_KERNEL);
>   	if (!map)
>   		return -ENOMEM;
>   

Hi,

drivers/pinctrl/nuvoton/pinctrl-ma35.c seems to have the same issue.

CJ



