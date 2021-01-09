Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71DA2F044A
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Jan 2021 00:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbhAIXNW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jan 2021 18:13:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbhAIXNW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jan 2021 18:13:22 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B087DC0617A4
        for <linux-gpio@vger.kernel.org>; Sat,  9 Jan 2021 15:12:41 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 064093F32A;
        Sun, 10 Jan 2021 00:12:40 +0100 (CET)
Subject: Re: [PATCH 1/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO
 Expander
To:     Linus Walleij <linus.walleij@linaro.org>,
        kernel test robot <lkp@intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kbuild-all@lists.01.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20210109140204.151340-2-angelogioacchino.delregno@somainline.org>
 <202101100151.3ojnIrPg-lkp@intel.com>
 <CACRpkdbT6tv5ArKRLPh3hE-3fuYHotqG5tNwkF4vftSQ1T=wNA@mail.gmail.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <7fff4833-7bb1-a721-7017-4cfef9cd4d61@somainline.org>
Date:   Sun, 10 Jan 2021 00:12:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbT6tv5ArKRLPh3hE-3fuYHotqG5tNwkF4vftSQ1T=wNA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Il 09/01/21 23:12, Linus Walleij ha scritto:
> On Sat, Jan 9, 2021 at 6:24 PM kernel test robot <lkp@intel.com> wrote:
> 
>>   > 880          gpioirq->parent_domain = NULL;
> 
> The autobuilder is complaining because your irq chip is not
> hierarchical and this is only used for hierarchical irqchips.
> I think you can just delete this line.
> 
That's a development leftover. Big oops! Removed in V2 :)

> Yours,
> Linus Walleij
> 

