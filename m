Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8728596EAD
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2019 03:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfHUBJG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 21:09:06 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:42763 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726193AbfHUBJG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Aug 2019 21:09:06 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 1043A2213D;
        Tue, 20 Aug 2019 21:09:04 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Tue, 20 Aug 2019 21:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=dIS2gcVR3JvusjJ2K8kSMgiOsdS1Xwz
        yxbyGVu950vs=; b=aJkySjSEb0lOe2ugHiheTebVoqU2hNmHhryf9D75BKEZS/q
        SVNuq5N3xz05qaMu1BfekIqNRSHhnyFDc3kf0U6N+bENBvgiw1bspjD2Ah0AxwCI
        MZYkBu8XZxLKfYjEbtZJrdOewZ3lOvBt0JlXjPhHiEkYnpKqOh0kP3ZvN034iwP8
        XdWZwuQeH1tkMGRlh/zCTNLHEZ9ezvGRD5eGWpFYlaHekWgV8u449dCGwYlzVEVY
        QorPF0ZqfLpteoCX6lEkY+YfkT1rXO9pmtSDmqSGy/jJAEe9AhmVof2fvH5+smFU
        SRksQST35n1tw4RsZmXXuLNvNyZCm5jXbfurG6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dIS2gc
        VR3JvusjJ2K8kSMgiOsdS1XwzyxbyGVu950vs=; b=eEp+2erMCwNHcDzC3ekG9N
        Lk055dB2xkogj6CYVo93ihe5zSSVACf7n3+OJH8NIq/8Jy69hHJGBZq3PsWFuUQ1
        vaL7k1jJCyKLpPQxTS2OiwJzuolnRlQJwIFVzrvKReiZ6kTKboyYYjqutCuEwuwC
        0cfsnYuAeVP6CzVmhmgj4di+eBpAYGUPCQcNGyku3FEF9lh2rplWqBsV2a1F5Vna
        YopfQc1o5pVsZ9eo+gaFGE1+31SjS/3xaFbpCtLdtmeUgnJs/7w9zDsxw55wWrnM
        yTiG/gcrwixWEGh3/MiVDevpo3wMoffaVBaTcCjuNbYoJ9s8Uxvo4VLtxKEbzgOw
        ==
X-ME-Sender: <xms:sJlcXbjOpjVBXdK4waDve2oDHrLIkM5cnuJdW3b0bQrPTykzAo0cHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudegvddggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
    grihhnpehgohhoghhlvghsohhurhgtvgdrtghomhdpghhithhhuhgsuhhsvghrtghonhht
    vghnthdrtghomhenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrih
    gurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:sJlcXe-xQuyaxZEy2LreTx5U_H5BVWtVYu0QnOdUIVwfT9lsK5Pj5A>
    <xmx:sJlcXQLPhYDQ766BMssnDLNymi690D8cZ0dikpnEQNX1otRZfjCRFw>
    <xmx:sJlcXfYng6fgrUb_lZ01ILs-X6zfFrGqz99o8dOAtVPsDFD7vUuVXg>
    <xmx:sJlcXVV7pGLDOVHA1LPYaSnuMysdDtLHGxsA_5xRIEHEG6XYlt82Zw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id F2F01E00A3; Tue, 20 Aug 2019 21:09:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-878-g972612b-fmstable-20190820v1
Mime-Version: 1.0
Message-Id: <15f11bd1-cde0-4345-8daf-234d61ebc9c0@www.fastmail.com>
In-Reply-To: <201908210839.fFMuc6Yx%lkp@intel.com>
References: <201908210839.fFMuc6Yx%lkp@intel.com>
Date:   Wed, 21 Aug 2019 10:39:39 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "kbuild test robot" <lkp@intel.com>,
        "Nathan Chancellor" <natechancellor@gmail.com>
Cc:     kbuild-all@01.org, linux-gpio@vger.kernel.org,
        "Linus Walleij" <linus.walleij@linaro.org>
Subject: =?UTF-8?Q?Re:_[pinctrl:for-next_54/63]_drivers/pinctrl/aspeed/pinctrl-as?=
 =?UTF-8?Q?peed-g6.c:2325:9:_error:_initialization_from_incompatible_poi?=
 =?UTF-8?Q?nter_type?=
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Wed, 21 Aug 2019, at 10:19, kbuild test robot wrote:
> tree:   
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
> head:   2295f64645cbc4f9ca3002f12d1b36cff3d04ac5
> commit: 21b2920fb587e570b43973300a11b921c3a61d3e [54/63] pinctrl: 
> aspeed: g6: Remove const specifier from aspeed_g6_sig_expr_set's ctx 
> parameter
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 7.4.0
> reproduce:
>         wget 
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 21b2920fb587e570b43973300a11b921c3a61d3e
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=arm 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2325:9: error: 
> initialization from incompatible pointer type 
> [-Werror=incompatible-pointer-types]
>      .set = aspeed_g6_sig_expr_set,
>             ^~~~~~~~~~~~~~~~~~~~~~
>    drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2325:9: note: (near 
> initialization for 'aspeed_g5_ops.set')
>    cc1: some warnings being treated as errors
> 
> vim +2325 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> 
> 2eda1cdec49f8a Andrew Jeffery 2019-07-11  2323  
> 2eda1cdec49f8a Andrew Jeffery 2019-07-11  2324  static const struct 
> aspeed_pinmux_ops aspeed_g5_ops = {
> 2eda1cdec49f8a Andrew Jeffery 2019-07-11 @2325  	.set = 
> aspeed_g6_sig_expr_set,
> 2eda1cdec49f8a Andrew Jeffery 2019-07-11  2326  };
> 2eda1cdec49f8a Andrew Jeffery 2019-07-11  2327  
> 
> :::::: The code at line 2325 was first introduced by commit
> :::::: 2eda1cdec49f8ae7878e60d1b06bd8157a95424f pinctrl: aspeed: Add 
> AST2600 pinmux support
> 
> :::::: TO: Andrew Jeffery <andrew@aj.id.au>
> :::::: CC: Linus Walleij <linus.walleij@linaro.org>
> 

This is resolved by back-merging the pinctrl-v5.3-2 into pinctrl/devel
or pinctrl/for-next as mentioned in the thread on Nathan's patch.

Alternatively it will be fixed if pinctrl/devel is merged as is into 5.4 which
contains the change that changes the interface - patch 674fa8daa8c9
("pinctrl: aspeed-g5: Delay acquisition of regmaps").

Andrew
