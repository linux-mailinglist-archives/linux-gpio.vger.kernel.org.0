Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3DF633FA
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 12:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfGIKLF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jul 2019 06:11:05 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:3761 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfGIKLF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jul 2019 06:11:05 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d24683d0000>; Tue, 09 Jul 2019 03:11:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 09 Jul 2019 03:11:04 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 09 Jul 2019 03:11:04 -0700
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 9 Jul
 2019 10:11:00 +0000
Subject: Re: [PATCH] gpio: tegra: Clean-up debugfs initialisation
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>
References: <20190626134258.26991-1-jonathanh@nvidia.com>
 <CACRpkdaFOs24DJbXg4eKVOAzdGOx__X9rbHPcPUzpTJpZ-jbVw@mail.gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <f5e711a6-4472-8dcb-56b2-b789733231c2@nvidia.com>
Date:   Tue, 9 Jul 2019 11:10:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdaFOs24DJbXg4eKVOAzdGOx__X9rbHPcPUzpTJpZ-jbVw@mail.gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562667069; bh=6fNmm7kUJzUHvZ1fbCr1sr5Retr+BtaSN8qhB6Q733g=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=cXygdqz7rZ5U8EZJm+G65m4sc+y3onxftSwo9n5GBkt47M8fgrGze25+6UBtqcMJU
         RrIG9R+jJirJl8qp1N48C6w7Ntt9rsrMMlRt6a0j4UvUJAnVIn93JVgF7opKG+PnLE
         Q5SVBbTuFPCRWUQ5Qch8oOMYfHlevQjnd7e4N8Hfe5BWQ/aUNpiOhOoPHW2EOTwwj9
         JE+M57kCfI50qO2BVYtTWAxQyPfpN3q5sm7hsqZiyQQRVc8GA+6trNWOwX0Ipo6wI3
         hHF5SEy7yKK4s+F63qZGjKR8N3NJw5Rx6dh053f5NCYDPQ68oQcSHC7ItSpQjaoMrU
         54N5tRKg004mQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 08/07/2019 08:04, Linus Walleij wrote:
> On Wed, Jun 26, 2019 at 3:43 PM Jon Hunter <jonathanh@nvidia.com> wrote:
> 
>> The function tegra_gpio_debuginit() just calls debugfs_create_file()
>> and given that there is already a stub function implemented for
>> debugfs_create_file() when CONFIG_DEBUG_FS is not enabled, there is
>> no need for the function tegra_gpio_debuginit() and so remove it.
>>
>> Finally, use a space and not a tab between the #ifdef and
>> CONFIG_DEBUG_FS.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> 
> Sadly I've had to revert this commit because of build errors, but
> let's see if we can figure it out after the merge window.

Sorry about that. I will be more thorough in future.

Jon

-- 
nvpublic
