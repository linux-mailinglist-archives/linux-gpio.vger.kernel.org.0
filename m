Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3DD92C0E64
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Nov 2020 16:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731109AbgKWPDx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Nov 2020 10:03:53 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:33888 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729244AbgKWPDw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 10:03:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1606143832; x=1637679832;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=/qmxyOtIe7horPzTCQwNVyF3JoEv2WeaHlm/AqMmYtk=;
  b=2GVy7oG3TkGc/1ICT5j+/+sP7GKWpcAMjWul4ffFGnClzMOnJgWglEpA
   htd/K59BbEUt+RU/7IWlIfVqU4LrqGX/i+SirRZlZb25DWJtywO1tSHHc
   FlNPcYCnAtXpWTennuxcCevSQuvqf0XCdvza+QMvOmt0nBRzJsBD8Xut9
   sLChNheR/iqX+2Pn7rAIMjCSolCR9Bfr6RC/B3A59O4Bh7OYlewFDF1Uo
   W1bmtTlNhn9uJt8JInvxj/8GJNmaMHFRpIgsW2tm3ZMufQEfKBbCKE9AW
   L1Thx9pvxSVhm50b1T0Sc0U/rNfF02blLsZZ6ARxOKqeclrcU0WrLdlk5
   w==;
IronPort-SDR: mBBlxo1O2RmDMvGsTK1573NN3Xrk+HfBzhDpcJ13b/dGRCtFTvb0bIJUiTpNcrERK0qqig8p4S
 A3LCoI9LogZgI7K3HlabJbNocpWQS1XLxHJ9TKk0YxWmyRIbZ7lcenpP+rl90jofVFElzcWG1N
 QB13zFrOQH7+hInM6jGcYoQ4jBkewFVIsrNbnOsu+GcwRLRGdrq1+jKpC+KBLlMQOGjiqoYY1o
 0r0MVniKbSld4hci9caTgJX98vGcpIpP05jd8yPJYJYfK16UWwG4lT6ZLNTA0boEpCkVlEGJan
 kB4=
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="99503650"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Nov 2020 08:03:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 23 Nov 2020 08:03:51 -0700
Received: from soft-dev10.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 23 Nov 2020 08:03:49 -0700
References: <20201113145151.68900-1-lars.povlsen@microchip.com> <20201113145151.68900-4-lars.povlsen@microchip.com> <CACRpkdaYHTTXC2gEgtCvDk9N8AqWeUyFSXyWp2aiEd97hk55fA@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.3
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v10 3/3] arm64: dts: sparx5: Add SGPIO devices
In-Reply-To: <CACRpkdaYHTTXC2gEgtCvDk9N8AqWeUyFSXyWp2aiEd97hk55fA@mail.gmail.com>
Date:   Mon, 23 Nov 2020 16:03:43 +0100
Message-ID: <87r1ok3yk0.fsf@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Linus Walleij writes:

> On Fri, Nov 13, 2020 at 3:52 PM Lars Povlsen <lars.povlsen@microchip.com> wrote:
>
>> This adds SGPIO devices for the Sparx5 SoC and configures it for the
>> applicable reference boards.
>>
>> Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Please funnel this patch through the SoC tree for this machine.

ACK!

Thanks,

---Lars

>
> Yours,
> Linus Walleij


-- 
Lars Povlsen,
Microchip
