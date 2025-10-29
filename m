Return-Path: <linux-gpio+bounces-27856-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF87C1D459
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 21:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 852EE3BB942
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 20:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C132D1F44;
	Wed, 29 Oct 2025 20:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SugRS20W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C77217C9E;
	Wed, 29 Oct 2025 20:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761770824; cv=none; b=sJUbG2pmqovciCfA8yt8LqCFQvkoDtB/UjyjzqIgGC4OqNBvLVaAhE/o02AKEKT/EReR3NqlElQHKzCaubpfgeys3PSZ62S65NGM+zDTm6t8VpbgK5KnTLWjSGZ+7zPwbNGIwwY22hNh/IoMR+Uy+fDrufH4pPis4MURL6/vl0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761770824; c=relaxed/simple;
	bh=VJGqQzTDo9Sp7KcgGW1VLDVh6Hi/PZ49l1ZtrEFkyAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/xw4c3D4TD5S1r0EZFd1HgpNiTdCx82ksSOAkj03i4EwdZFFXij+UgSYaJ3UqpKIMS07IjxGZ72pw7SY1e4h5gd008FsAnbRfG3HHaDstOQrI9thlYe0Du6jAMv8W31ANlPXWa6hm1Rp3oKmR64ExhxF78NkAh1of1RzDjcoEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SugRS20W; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=KbzEQPQ7kx91QGnRL/4388CWT4PPp+gawvJUD4Jm2kU=; b=SugRS20WChZfAtTZjpuRdylNg6
	6nZWoE8q22Uo5jqx5LnqPPJQ7kGguzrD/dKzB3NWXxVoWNqp5we0rOPC1SCr43Rlo48JmbDE/j9Lj
	88CUr7uKN47muJ1qF739WFvul9ejGPV3MeVXnj6wN+yGA2IBwqcol3gWRkudxTlATCZ4iSfgBKEQx
	r0b/nb6r3w9MrJWm4MljvyMh6CGZJcjXFU9vXEvqAAQRayMq+IDW71jq4Bl3tRuz0yXlVwfdLfx4q
	zAb5YIp5C3UdeGyM/QTPJmevfqEsTYcE35Ub+qShegEssviSqUPEPHTnm/kiWODHnGSQuFYP1HRUi
	pcMcWsMQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vED4M-00000002qZX-2oLP;
	Wed, 29 Oct 2025 20:46:58 +0000
Message-ID: <0b5feeb5-87b6-4f26-b9df-a23159b977e7@infradead.org>
Date: Wed, 29 Oct 2025 13:46:57 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] docs: admin-guide: gpio: rpmsg: gpio over rpmsg
 bus
To: Shenwei Wang <shenwei.wang@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-imx@nxp.com
References: <20251029195619.152869-1-shenwei.wang@nxp.com>
 <20251029195619.152869-4-shenwei.wang@nxp.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251029195619.152869-4-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi--

On 10/29/25 12:56 PM, Shenwei Wang wrote:
> Describes the gpio rpmsg transport protocol over the rpmsg bus between
> the cores.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  Documentation/admin-guide/gpio/gpio-rpmsg.rst | 202 ++++++++++++++++++
>  Documentation/admin-guide/gpio/index.rst      |   1 +
>  2 files changed, 203 insertions(+)
>  create mode 100644 Documentation/admin-guide/gpio/gpio-rpmsg.rst
> 

I don't think this should be in admin-guide/gpio/.
How about in driver-api/gpio/?
That may not be perfect either, but transport protocols are not
typically admin material AFAIK.

> diff --git a/Documentation/admin-guide/gpio/index.rst b/Documentation/admin-guide/gpio/index.rst
> index 712f379731cb..9c8f4441038a 100644
> --- a/Documentation/admin-guide/gpio/index.rst
> +++ b/Documentation/admin-guide/gpio/index.rst
> @@ -9,6 +9,7 @@ GPIO
>  
>      Character Device Userspace API <../../userspace-api/gpio/chardev>
>      gpio-aggregator
> +    gpio-rpmsg
>      gpio-sim
>      gpio-virtuser
>      Obsolete APIs <obsolete>
If someone thinks that it should be in admin-guide/,please explain why.

Thanks.
-- 
~Randy


