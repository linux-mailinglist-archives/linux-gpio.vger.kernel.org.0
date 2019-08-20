Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7F295F28
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 14:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbfHTMuR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 08:50:17 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43252 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728657AbfHTMuR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 08:50:17 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7KCoDYo090597;
        Tue, 20 Aug 2019 07:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566305413;
        bh=TTUbTTO8Oz2gmPpNVFF7lRenTwYKzmiJumlpetD3DdA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Fy9I3tMThgHqk/HibtGCr+QgW0XF5pVHyST++0k5sCn4rXKBm4Ou/gKHzkEbRz/lk
         aB2t4+ef8+aBx7pTJC/ZdneCMggApA86BHuI5rtFX0/07X3SuI9/eu6Nyqv/GbDYq3
         JYKY5vS5W6jKmOP8bjWgbcpKEuAuy0303SY0kB6M=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7KCoDhY103456
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Aug 2019 07:50:13 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 20
 Aug 2019 07:50:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 20 Aug 2019 07:50:13 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7KCo9Mn111307;
        Tue, 20 Aug 2019 07:50:10 -0500
Subject: Re: [PATCH 0/6] arm64: dts: ti: k3-j721e: Add gpio nodes
To:     Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        <linus.walleij@linaro.org>
CC:     Keerthy <j-keerthy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        <linux-gpio@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <65efe3c5-8551-546f-5de6-0d9038cea757@ti.com>
Date:   Tue, 20 Aug 2019 18:19:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190809082947.30590-1-lokeshvutla@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tero,

On 09/08/19 1:59 PM, Lokesh Vutla wrote:
> This series adds gpio nodes for J721E SoC and enable gpio keys
> in J72E common process board.
> 
> Tested Boot log: https://pastebin.ubuntu.com/p/P6QqmZYtSC/
> 
> This series depends on Power-domain cells update series:
> https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=15210
Can you merge the patches 2-6?

Thanks and regards,
Lokesh
