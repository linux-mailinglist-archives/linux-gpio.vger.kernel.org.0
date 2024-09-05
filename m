Return-Path: <linux-gpio+bounces-9850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B77896DC5D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 16:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE54028B85C
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 14:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568DE6E614;
	Thu,  5 Sep 2024 14:50:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82C874413;
	Thu,  5 Sep 2024 14:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547845; cv=none; b=RrNwwfJP3xk3s4CpenYybsNvYM6KzkDkFCWykCslW83hMIV3EzadCkpflWuxMAwnLXMjiW2CjJ37mnMhc8BUqb5/JF04jIkzYtlmOdSKAEIykANgYbb9EcL39gyZ+C5vzAspK+SMdGb7b3scdWfKxpU0SKmAI3kopq+RSSrK6Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547845; c=relaxed/simple;
	bh=CK2E0vmywcwr2z4DMRWOl+JpYr3SUFEXFQJ+GlpelCs=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=fEEMhL0/3BgV3rV/rOz704TA/dTMBAYUMhxEaLtQPKT9rwLi/XSz0gTQOkO//N/kmW/0+QtCuGECyeD+6jKpfmtnmum0P8JvaPeQnx0XFj/a6X1o2Z8X7sUfKPe5RaJvMspRSkmZ+4tbZMpKU40eqQUkCYztYYd2GkooNMsEtIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [10.185.68.150] (90.154.15.122) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 5 Sep
 2024 17:50:28 +0300
Subject: Re: [PATCH] pinctrl: stm32: check devm_kasprintf() returned value
To: Ma Ke <make24@iscas.ac.cn>, <linus.walleij@linaro.org>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
	<bartosz.golaszewski@linaro.org>, <patrice.chotard@foss.st.com>,
	<antonio.borneo@foss.st.com>, <peng.fan@nxp.com>,
	<valentin.caron@foss.st.com>, <akpm@linux-foundation.org>
CC: <linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20240905020244.355474-1-make24@iscas.ac.cn>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <03cf48b6-58b4-eeaa-41bf-5dda61ea37ac@omp.ru>
Date: Thu, 5 Sep 2024 17:50:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240905020244.355474-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/05/2024 14:36:50
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 187573 [Sep 05 2024]
X-KSE-AntiSpam-Info: Version: 6.1.1.5
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 32 0.3.32
 766319f57b3d5e49f2c79a76e7d7087b621090df
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 90.154.15.122 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;90.154.15.122:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 90.154.15.122
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/05/2024 14:40:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/5/2024 12:11:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 9/5/24 5:02 AM, Ma Ke wrote:

> devm_kasprintf() can return a NULL pointer on failure but this returned
> value is not checked. Fix this lack and check the returned value.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 32c170ff15b0 ("pinctrl: stm32: set default gpio line names using pin names")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/pinctrl/stm32/pinctrl-stm32.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index a8673739871d..53306d939d14 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1374,8 +1374,13 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
>  
>  	for (i = 0; i < npins; i++) {
>  		stm32_pin = stm32_pctrl_get_desc_pin_from_gpio(pctl, bank, i);
> -		if (stm32_pin && stm32_pin->pin.name)
> +		if (stm32_pin && stm32_pin->pin.name) {
>  			names[i] = devm_kasprintf(dev, GFP_KERNEL, "%s", stm32_pin->pin.name);
> +			if (!name[i]) {
> +				err = -ENOMEM;
> +				goto err_clk;
> +			}
> +		}
>  		else
>  			names[i] = NULL;

   That doesn't comply with the kernel coding style -- it now needs to be:

 		} else {
 			names[i] = NULL;
		}
[...]

MBR, Sergey

