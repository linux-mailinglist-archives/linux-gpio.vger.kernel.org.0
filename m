Return-Path: <linux-gpio+bounces-12900-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BC54A9C682D
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 05:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 640F0B27289
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 04:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C19216F0EB;
	Wed, 13 Nov 2024 04:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyCNq/94"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183793214;
	Wed, 13 Nov 2024 04:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731472900; cv=none; b=bVTYoyWaE+bBh5z40MDCvDk2ryj2jLHmboXpVMxPVQuWOkXolBk189LUwxNsDSV3f+5fnHa9XYP5oaMIfHLL0PhZwu/oU8n6FSrzz/9l9gtYOsgPlxLE/kbh6qC4KtShoUyoEn0rHlp+t3W5u3DtyXDK3fUdd7/+4J6l5ER7VPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731472900; c=relaxed/simple;
	bh=sc/GOepQc1YjbT4dga3mn7jmrORm8t0iU6gu9oRBFQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UGOxdRuHYco3rFvs6lqHcOj/uzZRuyhvrnEuoHb85k0idbRZzSE43bhc2cuvtFxeiRqzo+sJ416WOVXf0sQSheSJmrdcXYKRvIXHzv6FV/g/BwDia1351iIaoz4d/g+FQ1OyHpX0DYhG1ahd63F0m/znkV9BUdy9Sq/JtBJhRwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyCNq/94; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00BEC4CECF;
	Wed, 13 Nov 2024 04:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731472899;
	bh=sc/GOepQc1YjbT4dga3mn7jmrORm8t0iU6gu9oRBFQg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VyCNq/94Rn6vu01B7YQZJPtzgLdkBZBqeAROr//Nq4UZlWq3Yl+8ytw5S9Y0hse1J
	 DN1LZJnerkefOoCkFPUi65bdXi8Xxi1rfH0jS0/4blDZMZwX1xtzx7QmPeD57vJ358
	 JjE3Ydu322h796N4buNEGkkpyQ89xbsy8EebYr4PPkYRXjeyibaNiEGdE03Q06vfIt
	 GqtlJZuQ9gY6PlEAMlQzTxI3VWt6GmI0hd4yXos9cbTg3+OfQsw7RDu5OuI3CLqmj6
	 WQU1/UWT3gN1Cl1JC6jwYxt8tPWzcoQC1wGmLD84rctpHGAtwVWm+MOejuicf4C65Y
	 xjjHSeJxe5gFQ==
Message-ID: <deafaca0-63e0-4c5a-8d34-21567f78a5cb@kernel.org>
Date: Wed, 13 Nov 2024 13:41:36 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: k210: Modify the wrong "#undef"
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241113012029.3204-1-zhangjiao2@cmss.chinamobile.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20241113012029.3204-1-zhangjiao2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/24 10:20, zhangjiao2 wrote:
> From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> 
> Here shuld be undef "K210_PC_DEFAULT", not "DEFAULT".

Here ? Please be specific.
Also:

s/shuld/must

So something like:

The definition of the array k210_pinconf_mode_id_to_mode is done using the
temporary macro K210_PC_DEFAULT. When this macro is not needed anymore and its
definition removed, make sure to use its name in the #undef statement instead of
the incorrect "DEFAULT" name.

> 
> Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>

This needs a Fixes tag as well.

> ---
>  drivers/pinctrl/pinctrl-k210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index caf20215aaba..eddb01796a83 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -181,7 +181,7 @@ static const u32 k210_pinconf_mode_id_to_mode[] = {
>  	[K210_PC_DEFAULT_INT13] = K210_PC_MODE_IN | K210_PC_PU,
>  };
>  
> -#undef DEFAULT
> +#undef K210_PC_DEFAULT
>  
>  /*
>   * Pin functions configuration information.


-- 
Damien Le Moal
Western Digital Research

