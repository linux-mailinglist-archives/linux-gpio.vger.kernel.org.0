Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB80C66326
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jul 2019 02:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728529AbfGLA4Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Jul 2019 20:56:25 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:47649 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728102AbfGLA4Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Jul 2019 20:56:24 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id E4909450;
        Thu, 11 Jul 2019 20:56:20 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Thu, 11 Jul 2019 20:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=n5XgGSR9S3ycrfXAbbJwSWuvFtXox+Z
        XDAlvGeNuQ/E=; b=D+QCDTRFT6VhyD9yXJX+mJoIcIOBkqobcOFP75bo0G7biFH
        sr+C7fQM0mbSSguhjV47U7g2HCEErQxTriZGuvwM88keKehbJdsBLceKu48J2sfY
        Q0XMikgRdtzMuo5qL+xAE/myWyRC4nxWrqM6KGc6HWS7PtHHLK2iPR7pn+Ywkxlm
        9jPqcBjC7bOT95J54SM90ki4sl542N1QMfcCURrkX54xe6dWtBd2DPLBExw0UoJf
        Q3IQxt8qTLWfz4xcvnfk8+CieO+MbrHKM0Vyk5GHDFLJEVjB7bIfj+sPNvpjQoYV
        UuRUHACCSSL4wrT7Ty2m/ITxlHSxFyExmxTTEgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=n5XgGS
        R9S3ycrfXAbbJwSWuvFtXox+ZXDAlvGeNuQ/E=; b=0VkkckC23DIWDoIbCWksLd
        PAdXXctdxiNsnIlfNnItkIWnqdfK41EPp2IWEa6mVdQdedfIP4S3aTuH/OY8QmkI
        CHhF2GCYIUaIlymNZfM+StYINhYfh92Rm31F4j3df8OINp0rXuq1o12MYJM7LdJM
        FkE6jMM5rXQgbkmqmjUDKOZdtPttx+63nqVEpQWQSO3kr6Kle4ndy8CmvODnMz6f
        IkXkLS8K6FUoNlnL09j6IabuZBJBL2EoD+ogbBkpgbcFD7XIFngUvSlqjOH3zy2q
        76OFjAVlwb/GCooEyV21l2OQNwnX3C9fJ4Kt/6m3CXfuy6h+ZIpGBD8nkmqCY69A
        ==
X-ME-Sender: <xms:s9onXXqNoGvQnLC9z5kvUYwQZzLZS1pj2UFMBpZpwXCGdxDFQzMNmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgeelgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:s9onXYNdBaN1A61qtAwiMjBIcmvWTUl5K2psGOZn2NaCntsnricA6Q>
    <xmx:s9onXRoMLbG3o8vJUKM-1LkluxpSQzEjXBd0AllxsNQRdGy0fIEE5Q>
    <xmx:s9onXbFmKdAWEdI9JXBuTZHpHH57je1z5nSoHnRSegHwO0M4jNX8iQ>
    <xmx:tNonXcK5xcTSQja0JucwCL81a3aFNCfqo3nNUCj4_gZCjZFr5ZkXLg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 61999E0128; Thu, 11 Jul 2019 20:56:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <8ed970e9-7062-4905-9d8e-d5f28a0a4919@www.fastmail.com>
In-Reply-To: <20190711142457.37028-1-yuehaibing@huawei.com>
References: <20190711142457.37028-1-yuehaibing@huawei.com>
Date:   Fri, 12 Jul 2019 10:26:26 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     YueHaibing <yuehaibing@huawei.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Joel Stanley" <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] pinctrl: aspeed: Make aspeed_pinmux_ips static
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thu, 11 Jul 2019, at 23:55, YueHaibing wrote:
> Fix sparse warning:
> 
> drivers/pinctrl/aspeed/pinmux-aspeed.c:8:12: warning:
>  symbol 'aspeed_pinmux_ips' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  drivers/pinctrl/aspeed/pinmux-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.c 
> b/drivers/pinctrl/aspeed/pinmux-aspeed.c
> index 5b0fe17..839c01b 100644
> --- a/drivers/pinctrl/aspeed/pinmux-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinmux-aspeed.c
> @@ -5,7 +5,7 @@
>  
>  #include "pinmux-aspeed.h"
>  
> -const char *const aspeed_pinmux_ips[] = {
> +static const char *const aspeed_pinmux_ips[] = {
>  	[ASPEED_IP_SCU] = "SCU",
>  	[ASPEED_IP_GFX] = "GFX",
>  	[ASPEED_IP_LPC] = "LPC",
> -- 
> 2.7.4
> 
> 
>
