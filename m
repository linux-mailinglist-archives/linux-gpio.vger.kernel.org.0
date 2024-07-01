Return-Path: <linux-gpio+bounces-7855-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7243B91DFF6
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 14:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D6A1284E94
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 12:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9766F15A849;
	Mon,  1 Jul 2024 12:54:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00910145B09;
	Mon,  1 Jul 2024 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719838486; cv=none; b=GZxGPJfpZ4D56DvGiux1o/uEtNm4RtHcFfa+SA75qWB/ERJ05Kj1e2naMpdTwGHmrvAn+ZrcLxrHTa/RFyG6Jh8B0Yn7JynMpRsBWBm9LMqoiThqhSP21EDhITKobeoLc/JFUF+MkzGLWBBYMZFhOA3zkpjMAitETZrFgekJUSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719838486; c=relaxed/simple;
	bh=fpklSivkHqBgwZ+MA54wZ0oce/H9M9AHo8SsHJoYIEc=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zyi9yismZyNjJvM4bLDLSIZ4k+c1rySarQDI4HL2gwrVImT7aSNPkeran4Sk310KgGYrbRx1jJ4N4g+AlOnEJhP7gG4GOAY4hQvqTa7LFTiyF8NAjGN8Tuhfa5Ig1RnZOXUHFpqeohIx/vo5B56BKr7jAxLg2CTJTwKjbBI+T7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WCQtq2TVNz6K9Wd;
	Mon,  1 Jul 2024 20:52:51 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 1D953140B3C;
	Mon,  1 Jul 2024 20:54:41 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 1 Jul
 2024 13:54:40 +0100
Date: Mon, 1 Jul 2024 13:54:40 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: <linus.walleij@linaro.org>, <dan.carpenter@linaro.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <aisheng.dong@nxp.com>, <festevam@gmail.com>,
	<shawnguo@kernel.org>, <kernel@pengutronix.de>,
	<u.kleine-koenig@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 1/3] pinctrl: ti: iodelay: Use scope based
 of_node_put() cleanups
Message-ID: <20240701135440.00004d67@Huawei.com>
In-Reply-To: <20240627131721.678727-2-peng.fan@oss.nxp.com>
References: <20240627131721.678727-1-peng.fan@oss.nxp.com>
	<20240627131721.678727-2-peng.fan@oss.nxp.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Thu, 27 Jun 2024 21:17:19 +0800
"Peng Fan (OSS)" <peng.fan@oss.nxp.com> wrote:

> From: Peng Fan <peng.fan@nxp.com>
> 
> Use scope based of_node_put() cleanup to simplify code.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
A couple of comments on additional cleanups - primarily
using return dev_err_probe() - enabled by using scope based
cleanup to avoid the goto dance.

Either way LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 43 +++++++++----------------
>  1 file changed, 15 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> index ef9758638501..f5e5a23d2226 100644
> --- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> +++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
> @@ -822,53 +822,48 @@ MODULE_DEVICE_TABLE(of, ti_iodelay_of_match);
>  static int ti_iodelay_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *np = of_node_get(dev->of_node);
> +	struct device_node *np __free(device_node) = of_node_get(dev->of_node);
>  	struct resource *res;
>  	struct ti_iodelay_device *iod;
> -	int ret = 0;
> +	int ret;
>  
>  	if (!np) {
> -		ret = -EINVAL;
>  		dev_err(dev, "No OF node\n");
> -		goto exit_out;
> +		return -EINVAL;
Whilst you are here can use more compact
		return dev_err_probe(dev, -EINVAL, "No OF node\n");
for all error prints in a probe() function.
They do various nice things on deferred probe but are
useful more generally.

>  	}
>  
>  	iod = devm_kzalloc(dev, sizeof(*iod), GFP_KERNEL);
> -	if (!iod) {
> -		ret = -ENOMEM;
> -		goto exit_out;
> -	}
> +	if (!iod)
> +		return -ENOMEM;
> +
>  	iod->dev = dev;
>  	iod->reg_data = device_get_match_data(dev);
>  	if (!iod->reg_data) {
> -		ret = -EINVAL;
>  		dev_err(dev, "No DATA match\n");
> -		goto exit_out;
> +		return -EINVAL;

return dev_err_probe() works here as well and in 
other cases below. It's an added bonus __free() magic often enables.

No idea why DATA is in capitals and to be honest it's not
a particularly useful error message.  What data? :)

>  	}


>  }
>  
>  /**


