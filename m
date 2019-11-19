Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3B5102785
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 16:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbfKSPAH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 10:00:07 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45020 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727066AbfKSPAH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Nov 2019 10:00:07 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJExtD8092646;
        Tue, 19 Nov 2019 08:59:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574175595;
        bh=QQxfNsCfdtef9Juk9TtmCWz6xjk1bc34hAKbo2XxMQM=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=UBaj3wm0xiGZp0+Rm94vckGfV4XmYU0useVvtp99AH1I0iOmLu+KTkwqHprZZfEHV
         j++vlZ+OLW0BN/b7qZUEsxlZpXQxZIeO1KKjoa4cjH7d947ci0j2YPKA6PoYALGPc1
         RGh8k/GMfoIL3bgzJVfaBHRIm6LMOkSV/mbyxRZ8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJExtIo119214
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 Nov 2019 08:59:55 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 19
 Nov 2019 08:59:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 19 Nov 2019 08:59:55 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJExpU4069329;
        Tue, 19 Nov 2019 08:59:52 -0600
Subject: Re: [RFC 0/2] gpio: Support for shared GPIO lines on boards
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Rajendra Nayak <rnayak@codeaurora.org>,
        Grant Likely <glikely@secretlab.ca>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20191030114530.872-1-peter.ujfalusi@ti.com>
 <CACRpkdbw9MVrQMSgVMenSqAOiti1pAy4d2LvWY-ssx9dhzWEcw@mail.gmail.com>
 <8bd0f286-dc54-72a6-0aaf-2dc7b9972883@ti.com>
 <CACRpkdZ-qf3OKAxsoj+36V_N6Y_gFte1LHM+66OqekXBAWxsVA@mail.gmail.com>
 <56916577-8d39-f98f-9fd6-2fdc6e1e0023@ti.com>
Message-ID: <df10bfc0-0ad5-36f5-ea68-9fee82cd2c5a@ti.com>
Date:   Tue, 19 Nov 2019 17:01:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <56916577-8d39-f98f-9fd6-2fdc6e1e0023@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 19/11/2019 10.34, Peter Ujfalusi wrote:
>> So begin with creating a way to pull the shared handling of
>> regulators into gpiolib with these clearly cut semantics
>> delete the NONEXCLUSIVE thing and then when you are
>> done with that exploit the same
>> infrastructure for GPIO reset.
> 
> The logic is relatively simple, 229 lines in gpio-shared, but moving
> that into core will explode things a bit and going to add more
> complexity to all gpio lines.
> For one, we must maintain a list of clients requesting the line to be
> able to do proper refcounting and this needs to be done for all pins as
> we don't know beforehand that the given line is going to be shared.
> 
> Or add gpio-shared block similar to gpio-hog to prepare a given line for
> sharing? I think this might be a better thing to do and some of the code
> from gpio-shared.c can be reused.

I had some time today and now have a working support for shared GPIOs in
the gpio core.

Works fine with regulators and with my board which have two ocm3168a
codec with shared reset GPIO.

There are couple of things initially not going to work, like supporting
clients with different GPIO_ACTIVE_HIGH/LOW as we have only one
gpio_desc which got it's GPIO_ACTIVE_* form the gpio-shared child.

The means that all clients has to have the same GPIO_ACTIVE_* as how the
gpio-shared child is configured:

gpio1 {
	p00 {
		gpio-shared;
		/* raw level high is refcounted */
		gpios = <0 GPIO_ACTIVE_HIGH>;
		/* Initially set the gpio line to raw level high */
		output-high;
		line-name = "CODEC RESET";
	};
};

now clients can:
...
enable-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
...
enable-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
...

I'm reusing some of the gpio-hog code for this from gpiolib-of.c

For supporting different GPIO_ACTIVE_* on the client side might be
tricky as we might need to create dummy gpio_desc for each client and
put them on a list for the shared gpio_desc.

In any case I try to clean up the patch and add some documentation and
send it for review as RFC in couple of days.



- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
