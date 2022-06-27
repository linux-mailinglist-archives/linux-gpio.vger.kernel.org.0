Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65EE255DB0C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbiF0Jj4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jun 2022 05:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232187AbiF0Jjz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jun 2022 05:39:55 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CA96163
        for <linux-gpio@vger.kernel.org>; Mon, 27 Jun 2022 02:39:54 -0700 (PDT)
X-UUID: 3f1820849b784daa832806fd806025c1-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:ee6a384d-e45e-4ff7-894d-7407e450823c,OB:0,LO
        B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
        ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:c8399cea-f7af-4e69-92ee-0fd74a0c286c,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:ni
        l,QS:nil,BEC:nil,COL:0
X-UUID: 3f1820849b784daa832806fd806025c1-20220627
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
        (envelope-from <guodong.liu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1711036881; Mon, 27 Jun 2022 17:39:49 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 27 Jun 2022 17:39:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Jun 2022 17:39:48 +0800
Message-ID: <01de866e45dc3a93926dd1348c95f6dbe342ed3b.camel@mediatek.com>
Subject: Re: [linusw-pinctrl:devel 17/19]
 drivers/pinctrl/mediatek/pinctrl-mt8192.c:1362:56: warning: "/*" within
 comment
From:   Guodong Liu <guodong.liu@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     kernel test robot <lkp@intel.com>, <kbuild-all@lists.01.org>,
        <linux-gpio@vger.kernel.org>,
        "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date:   Mon, 27 Jun 2022 17:39:48 +0800
In-Reply-To: <CACRpkdauOS31Yof2p9XaGBc4amKYqjNyhGX1zF=Sgc5D7ozT3w@mail.gmail.com>
References: <202206260954.NjQGnygt-lkp@intel.com>
         <37cb3f3239c9be1dd18e576e4823f364679bb44a.camel@mediatek.com>
         <CACRpkdYxaZqw60Wui-8=mziPvfkvuS_nQE=03y3VCbzBdc61vQ@mail.gmail.com>
         <208aa8069584038593cbcb18f7f049f650782145.camel@mediatek.com>
         <CACRpkdauOS31Yof2p9XaGBc4amKYqjNyhGX1zF=Sgc5D7ozT3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

-----Original Message-----
From: Linus Walleij <linus.walleij@linaro.org>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org, 
linux-gpio@vger.kernel.org, Nícolas F. R. A. Prado <
nfraprado@collabora.com>
Subject: Re: [linusw-pinctrl:devel 17/19]
drivers/pinctrl/mediatek/pinctrl-mt8192.c:1362:56: warning: "/*" within
comment
Date: Mon, 27 Jun 2022 09:53:54 +0200

On Mon, Jun 27, 2022 at 4:02 AM Guodong Liu <guodong.liu@mediatek.com>
wrote:

> I don't know which patch you mean, I just wrote a patch to fix it
> so my tree builds cleanly, thanks!
> evolution
> 
> Fixed in Bellow patch, thanks!
> 
> 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220626043955.32756-4-guodong.liu@mediatek.com/

It's better to fix it in a separate patch so I used mine, please
rebase this series on the
devel branch. 

Thanks for you kindly help to fixed in commit "28d860dd08d5" ! 

Yours,
Linus Walleij

