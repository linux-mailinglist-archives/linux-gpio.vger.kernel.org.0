Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3805D5B076C
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Sep 2022 16:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiIGOr1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Sep 2022 10:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbiIGOrV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Sep 2022 10:47:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F88095E5E;
        Wed,  7 Sep 2022 07:47:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 36C0AB81D49;
        Wed,  7 Sep 2022 14:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC5EC433D6;
        Wed,  7 Sep 2022 14:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662562036;
        bh=A1icupglvvbyviBH2dgY8WkUbKh2uyGA/ljIqwGckm0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tYZftEDok/LtgdCcVrBFySECzcMsD+ckMFlf3GvPJeTjJmBqEvcDsE4lYswLRyBQC
         qSE00OA3atvcbH5nAua48VH5m2U5Te1wvW1IgDCEeXh4jMtnFsVsWAk0ru0+4qiUYi
         kEUW6Vj/z0JoJFPX9SSe/Y9vAgQLrA1FwA4ipGfU=
Date:   Wed, 7 Sep 2022 16:47:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kumaravel.Thiagarajan@microchip.com
Cc:     weiyongjun@huaweicloud.com, arnd@arndb.de, weiyongjun1@huawei.com,
        linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next 5/5] misc: microchip: pci1xxxx: use
 module_auxiliary_driver
Message-ID: <Yxiu8m+mJg32KdVS@kroah.com>
References: <20220907083435.1745393-1-weiyongjun@huaweicloud.com>
 <20220907083435.1745393-5-weiyongjun@huaweicloud.com>
 <BN8PR11MB3668C4354AB9D0D1D608F0C6E9419@BN8PR11MB3668.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN8PR11MB3668C4354AB9D0D1D608F0C6E9419@BN8PR11MB3668.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 07, 2022 at 02:35:14PM +0000, Kumaravel.Thiagarajan@microchip.com wrote:
> > -----Original Message-----
> > From: Wei Yongjun <weiyongjun@huaweicloud.com>
> > Sent: Wednesday, September 7, 2022 2:05 PM
> > To: Kumaravel Thiagarajan - I21417
> > <Kumaravel.Thiagarajan@microchip.com>; Arnd Bergmann
> > <arnd@arndb.de>; Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Wei Yongjun <weiyongjun1@huawei.com>; linux-gpio@vger.kernel.org;
> > kernel-janitors@vger.kernel.org
> > Subject: [PATCH -next 5/5] misc: microchip: pci1xxxx: use
> > module_auxiliary_driver
> > 
> > 
> > Use the module_auxiliary_driver() macro to make the code simpler by
> > eliminating module_init and module_exit calls.
> I needed this during the experimentation stage. But now these functions only
> do register and unregister. Hence, can be replaced with module_auxiliary_driver.
> Thanks for your patch.
> > 
> Add this tag -> Fixes: 7d3e4d807df2 ("misc: microchip: pci1xxxx: load gpio driver for the gpio controller auxiliary device enumerated by the auxiliary bus driver.")?

As you are the maintainer of this driver, you can add these markings to
the patches and sign off on them when you forward them on to me.  No
need to force the original developer to do this if you are already going
to do it as well.

thanks,

greg k-h
