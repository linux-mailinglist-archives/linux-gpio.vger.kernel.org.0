Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43605779F6B
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Aug 2023 13:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbjHLLAB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Aug 2023 07:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237025AbjHLLAA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Aug 2023 07:00:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4271C102
        for <linux-gpio@vger.kernel.org>; Sat, 12 Aug 2023 04:00:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C07C3639FE
        for <linux-gpio@vger.kernel.org>; Sat, 12 Aug 2023 11:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D165EC433C7;
        Sat, 12 Aug 2023 11:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691838002;
        bh=mH7HblThkhVOf34v2r0Cil8+LD+eegTNaJpz351C+7U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UwXtyFEuY9Lhnu/je/io1yQUx1+uYnakJ7y19O8o+mHiziTex4N4olyHjAGzoVaF7
         zhlkJXKvBHJmpVD7VyZ0v19nH9yHQuR0cNlCbF/xr3Dszria+1iMUUbNyUhNH1lcCH
         9CFfsAWesc5LRGDUjLoDuoxXvOrkC4DaIa1Q4Wec=
Date:   Sat, 12 Aug 2023 12:59:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-gpio@vger.kernel.org, vaibhaavram.tl@microchip.com,
        kumaravel.thiagarajan@microchip.com, arnd@arndb.de,
        tharunkumar.pasumarthi@microchip.com
Subject: Re: [PATCH -next v2] misc: microchip: pci1xxxx: fix return value in
 pci1xxxx_otp_eeprom_probe()
Message-ID: <2023081243-brush-swear-e40c@gregkh>
References: <20230808122453.556632-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808122453.556632-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 08, 2023 at 08:24:53PM +0800, Yang Yingliang wrote:
> devm_nvmem_register() never returns NULL pointer, it will return
> ERR_PTR() when it fails, so replace the check with IS_ERR() and
> use PTR_ERR() as return code.
> 
> Fixes: 9ab5465349c0 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX EEPROM via NVMEM sysfs")
> Fixes: 0969001569e4 ("misc: microchip: pci1xxxx: Add support to read and write into PCI1XXXX OTP via NVMEM sysfs")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
> v1 -> v2:
>   Use PTR_ERR_OR_ZERO().

Dan sent the same thing right before you did, sorry:
	https://lore.kernel.org/r/043df330-222b-4c2c-ae19-ed2f731bfe0b@moroto.mountain

