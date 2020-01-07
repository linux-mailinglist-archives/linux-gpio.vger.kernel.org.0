Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2861132112
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 09:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgAGINM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 03:13:12 -0500
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:48266 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725987AbgAGINL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 03:13:11 -0500
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1iojzB-0007tD-DX; Tue, 07 Jan 2020 08:13:09 +0000
Subject: Re: [PATCH] pinctrl: tegra: fix missing __iomem in suspend/resume
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org
References: <20191218110456.2533088-1-ben.dooks@codethink.co.uk>
 <CACRpkdaULw+=1Sz2pY3sRhooxu2xVJnpCB7wJcYqBfMXnyTFgA@mail.gmail.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <87f8580f-87d5-6322-436d-c3921ffe2e29@codethink.co.uk>
Date:   Tue, 7 Jan 2020 08:13:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdaULw+=1Sz2pY3sRhooxu2xVJnpCB7wJcYqBfMXnyTFgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/01/2020 23:00, Linus Walleij wrote:
> On Wed, Dec 18, 2019 at 12:04 PM Ben Dooks (Codethink)
> <ben.dooks@codethink.co.uk> wrote:
> 
>> The functions should have __iomem on the register pointer
>> so add that to silence the following sparse warnings:
>>

> Patch applied with the ACKs.
> 
> Yours,
> Linus Walleij

Thank you.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
