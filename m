Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3361C55B50B
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jun 2022 04:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbiF0CCS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jun 2022 22:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiF0CCR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jun 2022 22:02:17 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F54CEB5
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jun 2022 19:02:14 -0700 (PDT)
X-UUID: 800a4fada75f4ac0918ac783fc702d14-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:54815c18-28fc-4576-b53d-73d472f609e1,OB:-327
        68,LOB:0,IP:-32768,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-32768,FILE:0,RULE:R
        elease_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:1ad88eea-f7af-4e69-92ee-0fd74a0c286c,C
        OID:nil,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:nil,QS
        :nil,BEC:nil,COL:0
X-UUID: 800a4fada75f4ac0918ac783fc702d14-20220627
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
        (envelope-from <guodong.liu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 414658861; Mon, 27 Jun 2022 10:02:00 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 27 Jun 2022 10:01:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jun 2022 10:01:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 27 Jun 2022 10:01:58 +0800
Message-ID: <208aa8069584038593cbcb18f7f049f650782145.camel@mediatek.com>
Subject: Re: [linusw-pinctrl:devel 17/19]
 drivers/pinctrl/mediatek/pinctrl-mt8192.c:1362:56: warning: "/*" within
 comment
From:   Guodong Liu <guodong.liu@mediatek.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     kernel test robot <lkp@intel.com>, <kbuild-all@lists.01.org>,
        <linux-gpio@vger.kernel.org>,
        "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date:   Mon, 27 Jun 2022 10:01:58 +0800
In-Reply-To: <CACRpkdYxaZqw60Wui-8=mziPvfkvuS_nQE=03y3VCbzBdc61vQ@mail.gmail.com>
References: <202206260954.NjQGnygt-lkp@intel.com>
         <37cb3f3239c9be1dd18e576e4823f364679bb44a.camel@mediatek.com>
         <CACRpkdYxaZqw60Wui-8=mziPvfkvuS_nQE=03y3VCbzBdc61vQ@mail.gmail.com>
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
Date: Mon, 27 Jun 2022 02:03:24 +0200

On Sun, Jun 26, 2022 at 6:48 AM Guodong Liu <guodong.liu@mediatek.com>
wrote:

> Fixed in Next patch, thanks!

I don't know which patch you mean, I just wrote a patch to fix it
so my tree builds cleanly, thanks!
evolution 

Fixed in Bellow patch, thanks!

https://patchwork.kernel.org/project/linux-mediatek/patch/20220626043955.32756-4-guodong.liu@mediatek.com/

Yours,
Linus Walleij

