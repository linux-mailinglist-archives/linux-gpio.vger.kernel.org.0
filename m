Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12BAFEE39A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbfKDPWG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:22:06 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35914 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbfKDPWG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:22:06 -0500
Received: from [IPv6:2a00:5f00:102:0:78ab:3ff:fe4c:9c33] (unknown [IPv6:2a00:5f00:102:0:78ab:3ff:fe4c:9c33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gtucker)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9F56028A9C6;
        Mon,  4 Nov 2019 15:22:02 +0000 (GMT)
Subject: Re: linusw/devel boot bisection: v5.4-rc1-31-g6a41b6c5fc20 on
 rk3399-puma-haikou
To:     Linus Walleij <linus.walleij@linaro.org>,
        Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "scott.branden@broadcom.com" <scott.branden@broadcom.com>,
        "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
        "tomeu.vizoso@collabora.com" <tomeu.vizoso@collabora.com>,
        "mgalka@collabora.com" <mgalka@collabora.com>,
        "matthew.hart@linaro.org" <matthew.hart@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bot@kernelci.org" <bot@kernelci.org>,
        "khilman@baylibre.com" <khilman@baylibre.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>
References: <5dbb2acf.1c69fb81.54ce2.2f48@mx.google.com>
 <9d1a6cba9687f94b2d36a82f42f5d4be2b16e7a6.camel@alliedtelesis.co.nz>
 <CACRpkdamE_Zyein+6x70noJ5Z6RJpV2qJEHOVwPxysONH+-Rag@mail.gmail.com>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <fa0ca588-a034-1f00-8492-a3f574a5b24b@collabora.com>
Date:   Mon, 4 Nov 2019 15:22:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdamE_Zyein+6x70noJ5Z6RJpV2qJEHOVwPxysONH+-Rag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04/11/2019 15:18, Linus Walleij wrote:
> On Thu, Oct 31, 2019 at 8:35 PM Chris Packham
> <Chris.Packham@alliedtelesis.co.nz> wrote:
>> On Thu, 2019-10-31 at 11:41 -0700, kernelci.org bot wrote:
> 
>>> Breaking commit found:
>>>
>>> -------------------------------------------------------------------------------
>>> commit 6a41b6c5fc20abced88fa0eed42ae5e5cb70b280
>>> Author: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> Date:   Fri Oct 25 09:27:03 2019 +1300
>>>
>>>     gpio: Add xgs-iproc driver
>>>
>>>     This driver supports the Chip Common A GPIO controller present on a
>>>     number of Broadcom switch ASICs with integrated SoCs. The controller is
>>>     similar to the pinctrl-nsp-gpio and pinctrl-iproc-gpio blocks but
>>>     different enough that a separate driver is required.
>>>
>>>     This has been ported from Broadcom's XLDK 5.0.3 retaining only the CCA
>>>     support (pinctrl-iproc-gpio covers CCB).
>>>
>>>     Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>>     Link: https://lore.kernel.org/r/20191024202703.8017-3-chris.packham@alliedtelesis.co.nz
>>>     Acked-by: Scott Branden <scott.branden@broadcom.com>
>>>     Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Hmm,
>>
>> I don't see how this commit would have caused the oops. The new driver
>> shouldn't (and doesn't appear to be) run on any platform as nothing
>> declares .compatible = "brcm,iproc-gpio-cca" (yet).
> 
> I think it looks really bogus as well.
> 
> Could it be that these systems are memory constrained such that
> the kernel image just exactly right now collides with the upper
> memory limit or corrupts its own ramdisk?
> 
> I suppose I can't ask the kernel robot to do any more detailed
> debugging.
> 
> I can't see any problem with this patch.

Yes it's possible that this patch increases the kernel image size
above a threshold that causes the board to fail to boot.  However
that board isn't in the Collabora lab so I don't have direct
access to it.  I'll see what we can do to debug this, will
disable bisections in lab-theobrama-systems for now to avoid more
noise.

Guillaume
