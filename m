Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B475287386
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 13:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgJHLnx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 07:43:53 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:11340 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgJHLnx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 07:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602157432; x=1633693432;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=xxGz3Rp09AvXdk/PW1qyQ+e7HIOC7dLKFFv6KdZ9KTI=;
  b=ToQe6RPRT1PMOAQ+MYzcX3QMrljWItSdabPk9j7meq/IEtP69BQJV8pj
   rp4j1yLULK7hxp33EQ66CVkmrEmaGx4gPDGNbCWWiUpseYldUikKmZ7L8
   mVJ51iGM2fCB0UKE+Uz9FKt3gn4FRkG7Z9mzerVmjSr9lU9DV5xq/UmKI
   TE4bb4gZcB5SAV7hPmHSPwKvpJC7xv5JKscaFJ0H7fmgQYySwIY6+Z/1E
   YnKty2wqWB6f8s/yyGNXl+VuP+iua26Lo11O7ymsjXNQIGZh3CZM1lgTw
   Qyyj0UxmajuWW07+7/VXzTCd57yAfpNdoiQvJUB7qjNIEJbWjLQPWpfbB
   Q==;
IronPort-SDR: 0Z9uZnzg3TOLv8yuUtQ33msyBJBj/9R28t1lHSilAqBe6Td4mWniU5ClWLVr4E08uzhRULTdyU
 iEePbQ37LnwcBhBy7jTubiBJ2XV6DGIGbmXFMSeuSENAAmnEIBbUpkihBQ1m+FTp1UYFsdtkIl
 y0hn6TNRK2+sXxxn5rxkw/aNNCaplpn6iztY4MC/Xwr+jqTr5SIVUSr4hmkh2N1Mf++Zd6KRmh
 KQY2Et0rRZBYpJGsCctDyO8TtN4C+JayEirTba/TnHH+zab8MfCeuFjF+YctW1OpyaGzwzSFmD
 oLw=
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; 
   d="scan'208";a="89540451"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Oct 2020 04:43:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 8 Oct 2020 04:43:51 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 8 Oct 2020 04:43:49 -0700
References: <20201007111145.2306213-1-lars.povlsen@microchip.com> <20201007111145.2306213-2-lars.povlsen@microchip.com> <CACRpkda0RAK2gp-ZB6LDxAnQP3=VGrsfqkfV0=3FiSFfNhOmjA@mail.gmail.com>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: Add bindings for pinctrl-mchp-sgpio driver
In-Reply-To: <CACRpkda0RAK2gp-ZB6LDxAnQP3=VGrsfqkfV0=3FiSFfNhOmjA@mail.gmail.com>
Date:   Thu, 8 Oct 2020 13:43:48 +0200
Message-ID: <87eem9x7rf.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Linus Walleij writes:

> Hi Lars,
>
> a new version of the patch set arrives while I'm reviewing, haha :D

Well, luckily not too much changed per Rob's input.

>
> On Wed, Oct 7, 2020 at 1:12 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
>> This adds DT bindings for the Microsemi/Microchip SGPIO controller,
>> bindings microchip,sparx5-sgpio, mscc,ocelot-sgpio and
>> mscc,luton-sgpio.
>>
>> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
>
> (...)
>> +      reg:
>> +        description: |
>> +          The GPIO bank number. "0" is designates the input pin bank,
>> +          "1" the output bank.
>> +        maxItems: 1
>
> Excellent.
>
>> +      '#gpio-cells':
>> +        const: 3
>
> So I thought you needed three cells exactly because the
> middle cell would get you the bank. That you now have in
> reg. So what about using the standard twocell?

I think I answered that in the 'v3 2/3' reply.

Basically the pins are addressed with two indices, and there are good
reasons to expose these to the GPIO cells, f.ex. hardware documentation
cross reference.

---Lars

>
> Yours,
> Linus Walleij

-- 
Lars Povlsen,
Microchip
