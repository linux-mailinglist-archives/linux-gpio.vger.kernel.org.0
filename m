Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C6021A2E2
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 16:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgGIO7a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 10:59:30 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:7111 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbgGIO7a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 10:59:30 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0730660000>; Thu, 09 Jul 2020 07:57:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 09 Jul 2020 07:59:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 09 Jul 2020 07:59:30 -0700
Received: from [10.19.64.157] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jul
 2020 14:59:25 +0000
Subject: Re: [PATCH v3 3/6] gpio: max77620: Don't set of_node
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
 <20200708202355.28507-4-digetx@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
From:   Laxman Dewangan <ldewangan@nvidia.com>
Message-ID: <19c30bda-e1bd-7f24-dcd0-337d76abd6fc@nvidia.com>
Date:   Thu, 9 Jul 2020 20:28:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200708202355.28507-4-digetx@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594306662; bh=hKixGSb3cb49P/FLh50x6vu2LbncCdYZA1numUuCA+M=;
        h=X-PGP-Universal:Subject:To:References:CC:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding;
        b=bZJLHdKcmPygPxKev8etJRbK/J3vdh3ZNNAJrdKtjsZws4HBNzW2SeQY/hhGVqp4O
         gDQfOUl8FEigOW3YM/skB+HaXoNxfsQdWllnIk3x44eppSHPUkV8rQnyHx7VRbyRqo
         tCn055RGrKj/S3+3taVyFTtNzU9GqCUF6mAksjHcjYpJkx7SdhglzV/87HKfir/dbg
         WT+I/kdOtHGlVM9t3RdXJwZ+pXKi24mv2Vq0askC4USzhNuu0YzrtgLCp1aglMRgnr
         T/GG8dL7BgudFCLSEhOAJFj5Iwqr0kNNRZoEDzY9mJdginK7zMm0J+mt0UWANYD5mC
         yPyX7yjngI4bg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thursday 09 July 2020 01:53 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> The gpiochip_add_data() takes care of setting the of_node to the parent's
> device of_node, hence there is no need to do it manually in the driver's
> code. This patch corrects the parent's device pointer and removes the
> unnecessary setting of the of_node.
>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>


Looks good to me.
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>

