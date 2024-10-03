Return-Path: <linux-gpio+bounces-10775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C9298EB4F
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 10:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3D011F215F0
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 08:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF042137923;
	Thu,  3 Oct 2024 08:17:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87FF84FAD;
	Thu,  3 Oct 2024 08:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727943447; cv=none; b=C6zwuGrc19f+w+FQaYxD5t1cnPk1dKc71ZhgtlOyunYei4xMhMUoAu3NhGPy7e4cAkeKOxPRhIAiqUFV0ucfK33lOzl4JrG1s2vPH9wP9pTE7/0OKVmmbaymPmIsBfpRHN1JPrZxOk2xxmL/2/50yk+mexzrudskGEbRAZSryvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727943447; c=relaxed/simple;
	bh=H2uHyRM3u35CX1uFaNrH7R631IftLmGGoGMSkXenf8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DkXFC2tH+YewN5ebzt5uyOJ1E/Ez8sH3ETpXhaUi5e4KeYGe4qz8OmIdRgCP4BfeIHI6Qa4LWafdQ+ljE6Ed/4owWDmDdajWJbH2diICjp7pBXoQH7DEo+PEiMK+y6OxkjpWCxhOeVbUpz5iHzE+ToHaWbukXEsbDbF4ULXPj1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.100] (213.87.128.175) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 3 Oct
 2024 11:16:57 +0300
Message-ID: <4cd2b4e0-72ee-42a8-a6d6-18412a06b7b8@omp.ru>
Date: Thu, 3 Oct 2024 11:16:55 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Fix missing return statement
To: Biju Das <biju.das.jz@bp.renesas.com>, Linus Walleij
	<linus.walleij@linaro.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>,
	<linux-renesas-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
	<biju.das.au@gmail.com>, "nobuhiro1 . iwamatsu @ toshiba . co . jp"
	<nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20241003075342.17244-1-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20241003075342.17244-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 10/03/2024 08:05:18
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 188174 [Oct 03 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 37 0.3.37
 76d1f08bc1e1f80c2a3a76a1cc8929a49fe2f262
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.128.175 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 213.87.128.175 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	lore.kernel.org:7.1.1;omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.128.175
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/03/2024 08:08:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/3/2024 7:11:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 10/3/24 10:53, Biju Das wrote:

> Fix the missing return statement on the error path for
> rzg2l_pinctrl_register().
> 
> Fixes: f73f63b24491 ("pinctrl: renesas: rzg2l: Use dev_err_probe()")
> Reported-by: nobuhiro1.iwamatsu@toshiba.co.jp <nobuhiro1.iwamatsu@toshiba.co.jp>

   Hm, strange email?

> Closes: https://lore.kernel.org/all/OS0PR01MB638837327E5487B71D88A70392712@OS0PR01MB6388.jpnprd01.prod.outlook.com/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 5a403915fed2..f913e8385ead 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -2710,7 +2710,7 @@ static int rzg2l_pinctrl_register(struct rzg2l_pinctrl *pctrl)
>  
>  	ret = pinctrl_enable(pctrl->pctl);
>  	if (ret)
> -		dev_err_probe(pctrl->dev, ret, "pinctrl enable failed\n");
> +		return	dev_err_probe(pctrl->dev, ret, "pinctrl enable failed\n");

   Why tab after *return*?

[...]

MBR, Sergey


