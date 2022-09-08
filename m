Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6585B1D43
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 14:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbiIHMip (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 08:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231882AbiIHMin (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 08:38:43 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4486898769
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 05:38:42 -0700 (PDT)
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MNdqD5b3Cz67n8d;
        Thu,  8 Sep 2022 20:34:32 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 14:38:39 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 8 Sep
 2022 13:38:39 +0100
Date:   Thu, 8 Sep 2022 13:38:38 +0100
From:   Jonathan Cameron <Jonathan.Cameron@huawei.com>
To:     Jay Fang <f.fangjian@huawei.com>
CC:     <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <linux-gpio@vger.kernel.org>, <jiaxingluo@autox.ai>,
        <prime.zeng@hisilicon.com>
Subject: Re: [PATCH] MAINTAINERS: Update HiSilicon GPIO Driver maintainer
Message-ID: <20220908133838.0000242a@huawei.com>
In-Reply-To: <20220908112151.13912-1-f.fangjian@huawei.com>
References: <20220908112151.13912-1-f.fangjian@huawei.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 8 Sep 2022 19:21:51 +0800
Jay Fang <f.fangjian@huawei.com> wrote:

> Add Jay Fang as the maintainer of the HiSilicon GPIO Driver, replacing
> Luo Jiaxing.
> 
> Cc: Luo Jiaxing <jiaxingluo@autox.ai>
> Signed-off-by: Jay Fang <f.fangjian@huawei.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Good luck to Luo in the new job!

Thanks,

Jonathan

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f1390b8270b2..907451fb013a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9122,7 +9122,7 @@ S:	Maintained
>  F:	drivers/dma/hisi_dma.c
>  
>  HISILICON GPIO DRIVER
> -M:	Luo Jiaxing <luojiaxing@huawei.com>
> +M:	Jay Fang <f.fangjian@huawei.com>
>  L:	linux-gpio@vger.kernel.org
>  S:	Maintained
>  F:	drivers/gpio/gpio-hisi.c

