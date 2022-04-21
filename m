Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CEBF50A208
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Apr 2022 16:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384304AbiDUOVO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Apr 2022 10:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231440AbiDUOVN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Apr 2022 10:21:13 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3490127FFC
        for <linux-gpio@vger.kernel.org>; Thu, 21 Apr 2022 07:18:24 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3078383DC8;
        Thu, 21 Apr 2022 16:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1650550702;
        bh=IvZk+E5qcIJ81RWEfDeREOKT03sif/v0IElp3pJxnv0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=MvUKPM5vsjAvNsnvONvy2oQVG78SOasFvOQLeSPNhcJXX9b85N3lHW/S+iHTDNxdW
         4/u7eCbmmJDL0u0UB/XZcy51uLHMARYWelOpiwkLAHZ/jiK0qh31uaJoMJe8wunN8M
         QQXIxB//plUsk75whqHHb3osh6QWq492cSeeHoJev3yZSHyCqBJcsyijOI/Pdmu53C
         iDkxgV/wLxOgN9BLc4inigqupr1ymWp9vji9iWhtB8G0GORWtNuM4nAuCUJ7H2Rk2U
         Uc3M/IkE8L0MEq6UsPNZ2Y7lfz2cX5VKES33CS5oxF/HLg43rmUCrFeXU1WIf2Fu6D
         03uzmgptVNZ2g==
Message-ID: <a0973f7c-63f9-6d08-546a-b204a6607070@denx.de>
Date:   Thu, 21 Apr 2022 16:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC][PATCH] irqchip/stm32: Retrigger hierarchy for LEVEL
 triggered IRQs in tasklet
Content-Language: en-US
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20220415215550.498381-1-marex@denx.de>
 <87pmlhidmn.wl-maz@kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <87pmlhidmn.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 4/16/22 11:25, Marc Zyngier wrote:

[...]

This patch is superseded by:

[PATCH] irqchip/stm32: Keep pinctrl block clock enabled when LEVEL IRQ 
requested
