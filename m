Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0FD62C20C5
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 10:05:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730991AbgKXJDe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 04:03:34 -0500
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:9588 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730963AbgKXJD0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 04:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1606208606; x=1637744606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H0qxxYcDQov/j23eYl/lQskQ2ib5uTauAr4/A4GSZqg=;
  b=L8joNyzYpD4jDx1gZqt6j06bGYbZNoWkN4rBJNXbSO0HcJe6Iv4QYUam
   RJ0J7e3lNJ5ZawkoVjITVvP8X09txyNq7Rz8h132rKpUMUz5ltpAZm3d5
   ImuuWWE4mS8NtRfaLzhp43INbLMvBbMEkaTEa1yYj+xB6EIpuP7N6C9nu
   DcdGUg51/AQ5m0P/eLsyd/yTKaDP+Lo8EVj8r4ssknC432rFIHoW/Inlj
   lJ/dTZFpxPb7HjVNouNNjwI0k9a13cmgwnYH/HhTwyj2Lc5F8Q7A2bxsr
   e7+ik60KcHHmZYxmPXBOaiBTeAaDYh+LnAgTxUaArgwBQ0GgDWVKdYDLw
   Q==;
IronPort-SDR: pS66dmLCNTccBY0EyjSooQz5evvoqMyGNNI9vKU1pvu6huqSr2ZyBejWWFTosrllsPxSqCTaD6
 1c/JOPfurlq9eigw9E4GfNyhUz0KSfinfMpMQ9S8sJS/KvZGNfzafkUqQJ52570QOl8xACXL3U
 6Xgy2JX09cCjk296xbePiW6roTj9//thDlAT23xpP99Q4Ft34bsG8f795kzLxX0sgcOdanropB
 guEAnaNZBzq/wJtmfJ95JvhKw3z/M99+Of5UTT2A2nq/t8boF3A9KdT+pVhbOaqohwIXTpG1dP
 PLc=
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; 
   d="scan'208";a="94696778"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Nov 2020 02:03:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 24 Nov 2020 02:03:24 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Tue, 24 Nov 2020 02:03:23 -0700
Date:   Tue, 24 Nov 2020 10:03:22 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: at91-pio4: add support for fewer lines on last
 PIO bank
Message-ID: <20201124090322.cjugamri37yxcqy7@sekiro>
References: <20201113132429.420940-1-eugen.hristev@microchip.com>
 <CACRpkdYdPp_ihSEHkPaLa0_mcX+8ypnPZ4dn0d-PY9Mes1XntQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CACRpkdYdPp_ihSEHkPaLa0_mcX+8ypnPZ4dn0d-PY9Mes1XntQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 24, 2020 at 09:31:36AM +0100, Linus Walleij wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Fri, Nov 13, 2020 at 2:25 PM Eugen Hristev
> <eugen.hristev@microchip.com> wrote:
> 
> > Some products, like sama7g5, do not have a full last bank of PIO lines.
> > In this case for example, sama7g5 only has 8 lines for the PE bank.
> > PA0-31, PB0-31, PC0-31, PD0-31, PE0-7, in total 136 lines.
> > To cope with this situation, added a data attribute that is product dependent,
> > to specify the number of lines of the last bank.
> > In case this number is different from the macro ATMEL_PIO_NPINS_PER_BANK,
> > adjust the total number of lines accordingly.
> > This will avoid advertising 160 lines instead of the actual 136, as this
> > product supports, and to avoid reading/writing to invalid register addresses.
> >
> > Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Nico/Ludovic: can you please look at this patch?

I acked it one week ago but I get some nasty behaviors with my emails. Maybe you
didn't receive the answer.
https://lore.kernel.org/linux-gpio/20201116061549.ks6hfonyplwhknmq@sekiro/

Regards

Ludovic

> 
> Yours,
> Linus Walleij
