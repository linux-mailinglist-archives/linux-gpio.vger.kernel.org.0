Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0EDA630BE0
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Nov 2022 05:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiKSESW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 23:18:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbiKSESV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 23:18:21 -0500
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE4B51310;
        Fri, 18 Nov 2022 20:18:19 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AJ4HxZR064246;
        Fri, 18 Nov 2022 22:17:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1668831479;
        bh=CmsBgCL6COvYpB6SBfxLepxjOMj2dpd1PZMJ9LYP8wA=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=l7NGur1YCb7HJ+iXVO9fTzPMenrScNCESvjkl88LieBvMCsTsIh+JApA7tRQBXksW
         hYO+L0xxkTHa5w2fHbaSeBRC6dPZPQuFslEBggXK2ksWW0yV+86BEC8VAmOuXokPkh
         LBIdJob+/UHOwrAlApHtMmm1NmIqRD2noJkYUQRc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AJ4HxHB005914
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Nov 2022 22:17:59 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 18
 Nov 2022 22:17:59 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 18 Nov 2022 22:17:59 -0600
Received: from ubuntu (ileaxei01-snat.itg.ti.com [10.180.69.5])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id 2AJ4Hno1091255;
        Fri, 18 Nov 2022 22:17:51 -0600
Date:   Fri, 18 Nov 2022 20:17:48 -0800
From:   Matt Ranostay <mranostay@ti.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     <vigneshr@ti.com>, <robh@kernel.org>, <a.zummo@towertech.it>,
        <linus.walleij@linaro.org>, <lee@kernel.org>, <brgl@bgdev.pl>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, Keerthy <j-keerthy@ti.com>
Subject: Re: [PATCH v4 2/4] MFD: TPS6594x: Add new PMIC device driver for
 TPS6594x chips
Message-ID: <Y3hY7N6D9C/APl15@ubuntu>
References: <20221118092218.480147-1-mranostay@ti.com>
 <20221118092218.480147-3-mranostay@ti.com>
 <966aa391-8a49-c64b-9985-3d50a8c35891@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <966aa391-8a49-c64b-9985-3d50a8c35891@linaro.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 18, 2022 at 11:23:05AM +0100, Krzysztof Kozlowski wrote:
> On 18/11/2022 10:22, Matt Ranostay wrote:
> > From: Keerthy <j-keerthy@ti.com>
> > 
> > The TPS6594x chip is a PMIC, and contains the following components:
> 
> No improvements in the subject. The subject prefixes are lowercase.
> 
> In the binding you said device is "TPS6594", not TPS6594x.
>

Sorry missed that :-/ will fix in future revisions

- Matt

> Best regards,
> Krzysztof
> 
