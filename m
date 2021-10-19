Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B446F432EF1
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 09:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234357AbhJSHHw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 03:07:52 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:11251 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234304AbhJSHHv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Oct 2021 03:07:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1634627140; x=1666163140;
  h=message-id:subject:from:to:date:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=E2JqTr0sfmprfmXR10/j2F7yLEYic33j/+AfHhLsyuE=;
  b=B8bX74/r9dszTsuvnpLN48OpwaDNnEingRSLlpReCMP6PYlDeGoIcn88
   qok6TC5foFwRKfPtDdA4qQNstg7EBhG8/EQfDMOJqtNbiyEfBRUQJ4oWa
   Jh2qzvIxnVOOsZ7e5B0wKSu+D+WOnc3oV+u8BKUacPjjIPA3R1/Jc/egH
   hFmGX/ZVoL1FTj56iin94FvfrhTglswQ8mFdVnfJF41FEmTL/bn9V8Tu2
   hk2sRkhmC+AZRwb0SWhnbRYnGJEpPIG24b0yZsDC6B5UMsKzl47qu9XY7
   uAajkRPjYWQm1DyfVfHNKIF3DDJ+/zgN6wz6i/N60dnPS9ikRFHjTtWHv
   g==;
IronPort-SDR: 7v21Wd4/rlBRGNh7rD58ibn7fWw4MTPSgSOGKVteCfxXYSsVmdrDzXvBPPMe3ImzKRqckS6Z17
 amBlp9rb/jUdH4+mIEgJaKF1Wp3ggGucjkfZ1VPEOE+lx4PctanDwj/1LLVQ0FWXKBwtgbMlwz
 mW26h3H805khUIRAfEhEGwQ0rM5UcruAqDemwCcvj2DaWKBVc1NcJOQLJv/vfQj5zLzZzlwPzv
 UQ8C+W6T5nmqJk44MyHNg4eDVgpfbCWcysopbS0Tr36QtnRdV1bKiQn/a7og/1dyJA21pZa1xM
 sXHde+fSuhfoeFme+5BQZYPG
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; 
   d="scan'208";a="140250818"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Oct 2021 00:05:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 19 Oct 2021 00:05:38 -0700
Received: from [10.205.21.35] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 19 Oct 2021 00:05:36 -0700
Message-ID: <93cd70be182298ea0a782ceee83526997fd8734b.camel@microchip.com>
Subject: Re: [PATCH v6 2/2] pinctrl: microchip sgpio: use reset driver
From:   Steen Hegelund <steen.hegelund@microchip.com>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>,
        <linus.walleij@linaro.org>, <robh+dt@kernel.org>,
        <UNGLinuxDriver@microchip.com>, <p.zabel@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Date:   Tue, 19 Oct 2021 09:05:35 +0200
In-Reply-To: <20211018085754.1066056-3-horatiu.vultur@microchip.com>
References: <20211018085754.1066056-1-horatiu.vultur@microchip.com>
         <20211018085754.1066056-3-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2021-10-18 at 10:57 +0200, Horatiu Vultur wrote:
> On lan966x platform when the switch gets reseted then also the sgpio
> gets reseted. The fix for this is to extend also the sgpio driver to
> call the reset driver which will be reseted only once by the first
> driver that is probed.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>

Reviewed-by: Steen Hegelund <steen.hegelund@microchip.com> 

-- 
BR
Steen

-=-=-=-=-=-=-=-=-=-=-=-=-=-=
steen.hegelund@microchip.com


