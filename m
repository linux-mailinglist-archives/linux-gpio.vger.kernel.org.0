Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9FAC6026FC
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 10:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbiJRIdL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 04:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbiJRIdL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 04:33:11 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD52C15728
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 01:33:09 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9773484ADF;
        Tue, 18 Oct 2022 10:33:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1666081987;
        bh=3HSTPS6cxL6XD2bzyOJ5Q0O0TX26DJv4Y95cg1+0UII=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Vr56//e1ad6B4nVmF2XYADFfdU+crE4jHiDSmJr48yoqJ32Bd1Ou/K1m59VDWu/dj
         1ewge80gDXSS3NXnzFrBeuvwBWaCaaBWlBCf+HtKne9MaOgRjgrkq8JTuLDhwZojjE
         rncKWr4CS7stINkiRHtKtORDwXR/q5I+Euk4ppD0PFZ2ipZOAx+sKj09DFBGst87ze
         95Ix/PlRPu/EiC3V56v0iSaIuTQGt7IZzCoAFiibqkverGjKoMIAs1v7uBEcsf9tnr
         SAiYN0XZkA7vYyVzezlCTdp8hn2wt3VEM9WGCcp0uZl4Alm3AfsNq2YZoHqLFkpLvF
         v6J2UIlm/0AUQ==
Message-ID: <86fb901a-ca3a-cfdc-8984-1af9235d5323@denx.de>
Date:   Tue, 18 Oct 2022 10:33:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v6 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio
 spinlock
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
References: <20221013215946.216184-1-marex@denx.de>
 <CACRpkdZG4a2SsNiunxz0SHR6kuXLX34LZcYp0dGakDigwbGdHw@mail.gmail.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CACRpkdZG4a2SsNiunxz0SHR6kuXLX34LZcYp0dGakDigwbGdHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/17/22 12:23, Linus Walleij wrote:
> On Fri, Oct 14, 2022 at 12:00 AM Marek Vasut <marex@denx.de> wrote:
> 
>> The driver currently performs register read-modify-write without locking
>> in its irqchip part, this could lead to a race condition when configuring
>> interrupt mode setting. Add the missing bgpio spinlock lock/unlock around
>> the register read-modify-write.
>>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>> Reviewed-by: Marc Zyngier <maz@kernel.org>
>> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Unrelated, but Marek can you have a look at this MXC patch since
> you're obviously working on the platform:
> https://lore.kernel.org/linux-gpio/20221007152853.838136-1-shenwei.wang@nxp.com/

Errrr, that's i.MX8, which is completely different chip than the i.MX8M 
(except for the naming, which ... oh well). I work on the simpler i.MX8M.

But looking at the patch, don't we already have a DT property which lets 
one set GPIO as wake up source, without massive enumeration tables in 
each GPIO driver ? It seems to me that's what NXP is trying to 
implement, per GPIO wake up.
