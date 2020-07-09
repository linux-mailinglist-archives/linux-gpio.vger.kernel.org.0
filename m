Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAF6F21A2DE
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 16:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728050AbgGIO5k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 10:57:40 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16147 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727092AbgGIO5k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 10:57:40 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f07302d0000>; Thu, 09 Jul 2020 07:56:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 09 Jul 2020 07:57:39 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 09 Jul 2020 07:57:39 -0700
Received: from [10.19.64.157] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jul
 2020 14:57:36 +0000
Subject: Re: [PATCH v3 2/6] gpio: max77620: Fix missing release of interrupt
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
 <20200708202355.28507-3-digetx@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Laxman Dewangan <ldewangan@nvidia.com>
Message-ID: <80f4d1ff-8096-9060-3cf0-a59448866c40@nvidia.com>
Date:   Thu, 9 Jul 2020 20:27:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200708202355.28507-3-digetx@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594306605; bh=fpFkTV2lUtk91L2bYAU77/7Lg3zTXgUb3k+Hg51MCfQ=;
        h=X-PGP-Universal:Subject:To:References:CC:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding;
        b=qQqVLN9wngC//dx2qrXZv//b39BIvaw9zxCJ7yy6+tzGbz/dROUqIQwqz4hjO4JcJ
         5dBOvT9bW3xx7MbdMprwQfCBQZDEQOcbtq/376FU7W1LP3plg910I5lVBZlKp7FQB1
         QxQgPxgNvLmbOeOi6nmdxhcr6HtCZn5QjAzPbDqhwd+PHTTewWJJBx0RvAG635GizN
         xdKZdl5681cPtjx+HEWyygzxWkFOQlaw9y1Fxi24Sq/NNRt9CPesIHzsXepcbRGTfh
         bMj8fkrXTu0fX81F1K9ac5/dOjzJByHcd7M8+s2KxA1WoyVadTKeNh3SlXRjL721ZQ
         IME8S/dTBnpBg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thursday 09 July 2020 01:53 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> The requested interrupt is never released by the driver. Fix this by
> using the resource-managed variant of request_threaded_irq().
>
> Fixes: ab3dd9cc24d4 ("gpio: max77620: Fix interrupt handling")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>


Looks good to me.
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>


