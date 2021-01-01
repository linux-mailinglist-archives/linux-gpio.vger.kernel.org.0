Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A192E83E5
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jan 2021 14:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbhAANw1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jan 2021 08:52:27 -0500
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:36725 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726747AbhAANw1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jan 2021 08:52:27 -0500
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1kvKqH-001d1n-CR; Fri, 01 Jan 2021 14:51:45 +0100
Received: from p5b13a2ad.dip0.t-ipconnect.de ([91.19.162.173] helo=[192.168.178.139])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1kvKqG-003BkT-KQ; Fri, 01 Jan 2021 14:51:44 +0100
Subject: Re: [PATCH v1] sh: Drop ARCH_NR_GPIOS definition
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Landley <rob@landley.net>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
References: <20201012154050.68039-1-andriy.shevchenko@linux.intel.com>
 <20201109121333.GC4077@smile.fi.intel.com>
 <10b4dc8e-db87-3f78-3ab7-e08469b9fe55@landley.net>
 <20201228213615.GF4077@smile.fi.intel.com>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <3a20bc0f-cbdf-6498-5527-e7fd53c3b84d@physik.fu-berlin.de>
Date:   Fri, 1 Jan 2021 14:51:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201228213615.GF4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.162.173
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy!

On 12/28/20 10:36 PM, Andy Shevchenko wrote:
> On Wed, Nov 11, 2020 at 10:45:38AM -0600, Rob Landley wrote:
>> On 11/9/20 6:13 AM, Andy Shevchenko wrote:
>>> On Mon, Oct 12, 2020 at 06:40:50PM +0300, Andy Shevchenko wrote:
>>>> The default by generic header is the same, hence drop unnecessary definition.
>>>
>>> Any comment on this?
>>
>> Acked-by: Rob Landley <rob@landley.net>
> 
> Thanks!
> 
>> It's in the stack I forwarded to Rich to look at this weekend.
> 
> Unfortunately I still do not see this in the latest Linux Next.

Rich already mentioned that he planned to pick up any patches the next
weeks/days.

I'm currently testing all the patches recently posted for any regressions.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

