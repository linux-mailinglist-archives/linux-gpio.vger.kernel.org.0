Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6445921A2BA
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 16:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgGIOzw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 10:55:52 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17304 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728256AbgGIOzv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 10:55:51 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f072fe90000>; Thu, 09 Jul 2020 07:55:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 09 Jul 2020 07:55:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 09 Jul 2020 07:55:50 -0700
Received: from [10.19.64.157] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jul
 2020 14:55:46 +0000
Subject: Re: [PATCH v3 1/6] gpio: max77620: Replace 8 with MAX77620_GPIO_NR
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
 <20200708202355.28507-2-digetx@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Laxman Dewangan <ldewangan@nvidia.com>
Message-ID: <15bac6b3-3f24-6990-101f-9d58c50041bc@nvidia.com>
Date:   Thu, 9 Jul 2020 20:24:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200708202355.28507-2-digetx@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594306537; bh=P+oP8TVVw3ec+WzDZWciB4Eb9moLNMO/xISdTvi2eTs=;
        h=X-PGP-Universal:Subject:To:References:CC:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding;
        b=UK+TwBVBSNtc76NmKgxwgTdwNP+RLbiJ//6qHIoCKSEqyeC3Be8Ly/1+MW8BFv0NV
         sjH5vCg0CdbkJejfsjEFL/PS338wgX8qylhOYmU78dx1x10q4gpBJYmQMkR73vM23M
         UH2wQ9hcbQTnLEsN6O8krbOejyszCyEFkJQavqfFn3Rova9N7vq27eEleElFfXVF5u
         JgfOIjgz1HoO3RXee8UQdJ4l1cDLMA/9ZNe7pv9Azk4w9XlS+T4MAhslioua/aNa2v
         J5Wf4gm645T4z3RtQs3ryA94jlV275Bgpu8EIgQS0gDaZ6K7X6PNmQRqQK59SzVfIM
         3Pmzzx1gIHsFg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thursday 09 July 2020 01:53 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> The MAX77620_GPIO_NR enum value represents the total number of GPIOs,
> let's use it instead of a raw value in order to improve the code's
> readability a tad.
>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>

Looks good to me.
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
