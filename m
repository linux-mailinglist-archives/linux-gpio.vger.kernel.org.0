Return-Path: <linux-gpio+bounces-10885-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C28F991A04
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 21:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EFC1283C96
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 19:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C34015957D;
	Sat,  5 Oct 2024 19:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="SbdM5s44"
X-Original-To: linux-gpio@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-216.smtpout.orange.fr [193.252.23.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725C9487A5;
	Sat,  5 Oct 2024 19:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728157400; cv=none; b=h+lnQKH+QEP6f8259nj3hKsZuopHOXEC63kO8ThRZ8N3hi+rBIFbs8Na+7hX+HVuPT05H3I+UFaHCeCY17QXJBQ+JjSzvp24nyEZT3oR7XsyjNMIoppj0L1OzI5B4Jp7NTvGDvSHTJCRPbSTyPD36xZGGXq2Aaja6NAAHoTXMbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728157400; c=relaxed/simple;
	bh=8MAvA9ubbsg1fxcVpJU+uwV5MjQY1ejVRrtVaHdouwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jpF1foR8orb+0KWhNqGdopHwBfZkVkl+z3h3/7IQbapqqhEnS7+8PMjDs3UNzWIAsnzH0BQsNVAhZ938RDBHKiWQBWUPrbwnTiavlRcOufIECYDe3Esfj5iG67yDY12JsfeIcmvcMN3N97ouzh3yStD3vjskVGtfioccl1+J78c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=SbdM5s44; arc=none smtp.client-ip=193.252.23.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id xAgGsMYyMHPunxAgGsZaMT; Sat, 05 Oct 2024 21:43:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1728157390;
	bh=uVTxSZ1QCpD+AHyNGxez/F+Qz/tYFhVlU8T4Mvuja4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=SbdM5s44g1/SP9yUNyzsQAX/07lA+C513byvOzb46p4ls0i/2quldk7bF1wkMnqnB
	 rJFBhM8O+qEG7Txwp1MmetMiL1wXQBvDf5geLsOUQcHbwx7tRdugZk/pH9bOZbwk/C
	 mFkHioOqoc2IjaR/hd+Pb+nmXdmequ0QEGVSMVeSxDwOb6pROK5zRKZ/NVfitv5Czs
	 UVerpYtDVyjSjJ/3cdzfYx+giUSy6MRUCzklxdM+zpg/VxjvhPjUvNM81DWp6b8Zex
	 H3/UyVtgryFvzfJusVVxnZUVn1rLjhCJ7vSJNDPO2hodqSWob5mzEdjdu3eyOlka3b
	 oobPrkuSHNFug==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 05 Oct 2024 21:43:10 +0200
X-ME-IP: 90.11.132.44
Message-ID: <a42a738a-b52d-4ff9-ac21-cffd808bc055@wanadoo.fr>
Date: Sat, 5 Oct 2024 21:43:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded
 mutex
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com>
 <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 05/10/2024 à 21:35, Drew Fustini a écrit :
> Convert th1520_pinctrl_dt_node_to_map() to use guarded mutex for
> thp->mutex.
> 
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>   drivers/pinctrl/pinctrl-th1520.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 

Hi,

> diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> index 9331f4462480..d03a0a34220a 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -425,7 +425,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>   	int ret;
>   
>   	nmaps = 0;
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {

Using _scoped iterator is not described in the commit message.
Is it expected to be part of this patch?

If yes, the "of_node_put(child);" just a few lines below should be removed.

>   		int npins = of_property_count_strings(child, "pins");
>   
>   		if (npins <= 0) {
> @@ -444,8 +444,8 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>   		return -ENOMEM;
>   
>   	nmaps = 0;
> -	mutex_lock(&thp->mutex);
> -	for_each_available_child_of_node(np, child) {
> +	guard(mutex)(&thp->mutex);
> +	for_each_available_child_of_node_scoped(np, child) {

Same here...

>   		unsigned int rollback = nmaps;
>   		enum th1520_muxtype muxtype;
>   		struct property *prop;
> @@ -530,7 +530,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>   
>   	*maps = map;
>   	*num_maps = nmaps;
> -	mutex_unlock(&thp->mutex);
>   	return 0;
>   
>   free_configs:
> @@ -538,7 +537,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>   put_child:
>   	of_node_put(child);

... this should be removed, and maybe the label renamed.

CJ

>   	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
> -	mutex_unlock(&thp->mutex);
>   	return ret;
>   }
>   
> 


