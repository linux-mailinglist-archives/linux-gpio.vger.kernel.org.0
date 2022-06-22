Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83CAC55495A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jun 2022 14:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354358AbiFVI7L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jun 2022 04:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355602AbiFVI6k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jun 2022 04:58:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33681FCFD
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2022 01:58:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5F3A261947
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2022 08:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3606C34114;
        Wed, 22 Jun 2022 08:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655888315;
        bh=Wr0E9HYR/lRdsNctiBQuhP55cBrX1u8h4v65qm1rnsY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=CfFNlfkeB0uVJEACrg+cJByiY37SBtzOj7lhrbswI9hQZn07/662K3hEqbuMxVJQe
         m2Gz0CpR38aRA4gVk94Q2xtsEL18uHQt6tdRTQF9knZaYeUQUxSXcpNBz4Ua4V2uFX
         aXXtT/yfRzXUi3h6cgcoGZZ4G8NzPyYb8cg7ucSi2x6Wz9GXviSnQp5oFnl/HvmMn8
         D1WHLDexphb8teM/mrv7BOW+Z+o52Ef1iqcRukPqfQec0Bs+7S8FA3YXNh66GRVs9s
         yUz9hCMXT1W/IvVJ0b0XBCUk1eSF/3iHDeTYw2h8D47Bq70AGVaDGlWVF5NmYC3bnr
         PWX+aUL9UVZ3w==
Message-ID: <fea4cfbe-7425-ca0b-fe71-2f9cbcf24abe@kernel.org>
Date:   Wed, 22 Jun 2022 10:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] pinctrl/rockchip: Fix refcount leak bug
Content-Language: en-US
To:     Liang He <windhl@126.com>, linus.walleij@linaro.org,
        heiko@sntech.de
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
References: <20220619073315.4067956-1-windhl@126.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220619073315.4067956-1-windhl@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19/06/2022 09:33, Liang He wrote:
> In rockchip_pinctrl_parse_groups(), we need a of_node_put() in each
> loop for the of_find_node_by_phandle() to keep the refcount balance.
> 
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 1 +
>  1 file changed, 1 insertion(+)

Before applying the patch please check it carefully. Previous evidence
[1][2] suggests that not it was not even compiled.



[1] https://lore.kernel.org/all/202206221602.odN70SHs-lkp@intel.com/

[2]
https://lore.kernel.org/all/16f9a971.44e5.1817068ee3c.Coremail.windhl@126.com/


Best regards,
Krzysztof
