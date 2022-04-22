Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E325E50C3D0
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Apr 2022 01:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbiDVW6v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 18:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233967AbiDVW6X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 18:58:23 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75CA41CE246
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 15:23:00 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 94B1083C24;
        Sat, 23 Apr 2022 00:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1650666178;
        bh=8pr5rZdmKbrWjXDtDGUIlrKfZlL1+FecLllF820ozws=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=OQLdZ6epDfvceGFjbwfiShY/gq4BPYQf2qo3r+Dar5cOzlmjO0Z4/vn/0qlrbS1Hd
         eU24ydMd5a5nXCvd1zyNtqWJDtb5UATlkoSPy7oLz5N5BgLphz2HP0dZbdOAK5G69I
         ieUnbp/WQLDJ1Nv1Cms0FqdLdUfk66PFjbMEgtdFpX5+BXSKpC1whrM372xdGJ/Vtn
         lTNBthuyOQ7CGFZ940A5OdnIBWgfvMSmcKeAxnL/QQB+TR9ZPUlx56XpqrQXeSCmX8
         qdCVlRAB0EooQ/TzVFEOKQYPnYbY9AsoX5JyKba7QzlDXqVllzw2BsaJUlqJ80r5P5
         7TO2XazDMQ+Aw==
Message-ID: <e91bcbbd-9ef5-7dcd-0d95-aed3fb45d667@denx.de>
Date:   Sat, 23 Apr 2022 00:22:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] pinctrl: stm32: Keep pinctrl block clock enabled when
 LEVEL IRQ requested
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Marc Zyngier <maz@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20220422161933.163347-1-marex@denx.de>
 <CACRpkdZNvNqx4DR_Dcwv4AU1x=MhLLUpSTewzUnsQwh8ibqzqQ@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CACRpkdZNvNqx4DR_Dcwv4AU1x=MhLLUpSTewzUnsQwh8ibqzqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 4/23/22 00:15, Linus Walleij wrote:
> On Fri, Apr 22, 2022 at 6:19 PM Marek Vasut <marex@denx.de> wrote:
> 
>> V2: - Use pinctrl: stm32: tags
>>      - Add RB from Fabien
> 
> Hm I applied v1 with those changes so it should be fine I think.

Yes, there is no change to the patch, just the commit message and RB.

Thanks
