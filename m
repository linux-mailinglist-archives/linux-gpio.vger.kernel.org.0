Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2178D217383
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 18:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgGGQQg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 12:16:36 -0400
Received: from sed198n136.SEDSystems.ca ([198.169.180.136]:20506 "EHLO
        sed198n136.sedsystems.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbgGGQQg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 12:16:36 -0400
Received: from barney.sedsystems.ca (barney [198.169.180.121])
        by sed198n136.sedsystems.ca  with ESMTP id 067GGV6I031309
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 7 Jul 2020 10:16:32 -0600 (CST)
Received: from [192.168.234.75] (sed198n237.sedsystems.ca [198.169.180.237])
        by barney.sedsystems.ca (8.14.7/8.14.4) with ESMTP id 067GGVt8017146
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
        Tue, 7 Jul 2020 10:16:31 -0600
Subject: Re: [PATCH v2] gpio: xilinx: Add interrupt support
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
References: <20200611164953.37039-1-hancock@sedsystems.ca>
 <CACRpkda0MOXHgD6KNAzzDNTFSc2f1_Nng8-UFuOGo-dm+6VS0g@mail.gmail.com>
From:   Robert Hancock <hancock@sedsystems.ca>
Message-ID: <d7313b79-1fcd-d04d-fdae-cae1c8c5c233@sedsystems.ca>
Date:   Tue, 7 Jul 2020 10:16:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkda0MOXHgD6KNAzzDNTFSc2f1_Nng8-UFuOGo-dm+6VS0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.64 on 198.169.180.136
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-07-07 5:09 a.m., Linus Walleij wrote:
> On Thu, Jun 11, 2020 at 6:51 PM Robert Hancock <hancock@sedsystems.ca> wrote:
> 
>> Adds interrupt support to the Xilinx GPIO driver so that rising and
>> falling edge line events can be supported. Since interrupt support is
>> an optional feature in the Xilinx IP, the driver continues to support
>> devices which have no interrupt provided.
>>
>> These changes are based on a patch in the Xilinx Linux Git tree,
>> "gpio: xilinx: Add irq support to the driver" from Srinivas Neeli, but
>> include a number of fixes and improvements such as supporting both
>> rising and falling edge events.
>>
>> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
>> ---
>>
>> Changes from v1: Changed platform_get_irq to platform_get_irq_optional
> 
> Looks good to me, two questions:
> 
> - Can you make sure that this applies to the GPIO "devel" branch
>    that has the previous changes from Srinivas.

I confirmed it applies without conflicts and builds on that branch - it 
doesn't appear that it has any changes to this driver that were not in 
the version I submitted against.

> 
> - Can we get a Tested-by or at least ACK from Srinivas?
> 
> This driver currently lacks a maintainer. I would be very happy if
> Srinivas or Robert or both would send a patch to add you as
> maintainer(s) in the MAINTAINERS file, and would also like
> Michal to to ACK that so everyone is happy.

Probably Srinivas or someone from Xilinx should be the primary 
maintainer of this driver, but I could add myself in if they don't..

> 
> Yours,
> Linus Walleij
> 

-- 
Robert Hancock
Senior Hardware Designer
SED Systems, a division of Calian Ltd.
Email: hancock@sedsystems.ca
