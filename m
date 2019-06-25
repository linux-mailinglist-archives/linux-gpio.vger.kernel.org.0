Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D897052541
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 09:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfFYHv2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 03:51:28 -0400
Received: from mout.web.de ([212.227.15.4]:45563 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbfFYHv1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 Jun 2019 03:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561449071;
        bh=zu3hRAdjnw3ODToqm1kzxjDlmqiZXYiID2ai8KyGLV0=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=pCAFUeEmLDSADy/3NOPexuqLqaL3S712RBbhj8DJp40ORyUg8cr3CyCatWjvRc914
         ZM7lu5XscJmHwJ406lYWs+hOuGJOVCBhxNBktIg/bXiNzCZhu5mkQK/5S1EopkkeW5
         lEEpKkmzZ/fVonfwRpZTiIqU8sCY5/Xh2+bNijcQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.103.88]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MF3iV-1hmZyn3Ueh-00GHvK; Tue, 25
 Jun 2019 09:51:10 +0200
Subject: Re: drivers: Adjust scope for CONFIG_HAS_IOMEM before
 devm_platform_ioremap_resource()
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        kernel-janitors@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enrico Weigelt <lkml@metux.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Keerthy <j-keerthy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20190221162627.3476-1-brgl@bgdev.pl>
 <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
 <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
 <39ae399a-c606-c6de-f84d-35e39d0410c0@metux.net>
 <CAMRc=McepqowJNi6ay6x9KKoHOC8aCxP_ob12SgbsnJU_sKQng@mail.gmail.com>
 <1dd52704-0e41-db31-33f4-c9f446a47344@metux.net>
 <CAMRc=Mfp85diy849r_8UHKS9eao26djrsMF0_iwE--d62mQ5jg@mail.gmail.com>
 <20190625073016.GA18381@kroah.com>
 <CAMRc=McPjPtDFL2m=n5fWm-fHvVbDzMopb9r=RkzS+TshMJBAQ@mail.gmail.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <9b1a9bd6-d44a-0e08-5f4f-df1252d6efad@web.de>
Date:   Tue, 25 Jun 2019 09:51:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAMRc=McPjPtDFL2m=n5fWm-fHvVbDzMopb9r=RkzS+TshMJBAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:rExePbp2DYjK66vOvSf8kDmWhkwaOOGVX+Pl2PALS9+i4qyMbk7
 KIIy1HUBZKbyQbvLNDddUM4IXCrMphVyJmDY+P0g5y4z95bTS5cM9nqZawmBDjjRC1UZpBS
 mYh13GGF8oCTRUWnxMNIQVTrVhUGvJLKG8GAWJPq5V+j63qZjUZk/iH2zfF/rMdlcgx+PLP
 CFEz98e6NUM9NrQpBItfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fSp+oz5rzFo=:ClygUlOIGO8cIID7Q3cbm+
 O3W7yKR0Ub2cHAzgmiI+IrYlOtne6izim+ENz8WSasqqucALEa9EmArvtEBcfs1pl7Luv8IRG
 V8y02gJeiycKD+jx2ClT49TRz3eGhcbDlZiShUT163QSu3ghAZml8GYomOp2yepkE3fobMUBU
 naRj3DRdPeabhOqLYHsaeWHJ2a7fIsZ/ZssmYRndoa4qpnnFcYO1Udta3kM+3YpgM7QzQEu0I
 Luc08fHw9t/qDE8mav2DqvD9xclcYGVRuZzAJVErjg3DI5bOjZwYNFQBFVrKjn2PwYyabSgFS
 GK6pZwRig6FcVkDekNvbNU3GpGQS7hoR2iSp+vcUSHCsqPyiGr3v53KJXgjHp+o6xI3LvQRQS
 35Zbliyrm+3tfVAJnbiivnS376mvyfQdVmO6litB2n7ooLoE2gmsW0DlfRBzwQ2lNSG/al14G
 3eGdBjYnM4E2hrWGxfA5P7Xv2fMjCZkFNL+SOyBUFfgxEmIMZ54lYD8Zi//JbS4yJIfDrsWBi
 j4WygXci2R3mNH/yZac2CUIZr0A3x0Cj/FZmKHde414/+zQudkviSsJg5ROeWEpejoh5e09ia
 IMTFPru+Tz5xDnpZuTAQneHnUJ/IITHJxN9IK5iT4WD4hF+VtpD8npDRE+OwUf3Meh4eiU2JZ
 VhD3H32kLsXBWhBfQkpeJru7M5BSfubnX6dJUJtoYAkAIFDGb6YTaZHSWr3fSDUbB5RXU1Vwe
 poi+Elq8ug2zmugEUqiOON2tjFju2/bIraYrw/fqjUZbe6ua2X9TyrG+kfmcQNGbagUkZFcIC
 fwmyDt467Hu16v2hACL3idjUrSLC4jtQ3BDkUo5zamOlQoLpGW1O2Z7tOUwkxp951LgF2P7tq
 7uLuY+tbIK2pJctvufEVbp7ydsK48eojJPfPrU3FWLZnvsvjEmU1k28pvdC5qtVXJgKD6dItC
 WUlscGtTOdDOmx+rSvjG1zzIgeHh14XYxDo8FNxqmWxgmqRNvv7KF
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Oh so it's another troll then?

I am just a contributor.


> Good to know, ignoring from now on.

The opinions can vary for my contributions as usual.

I hope that the software development attention can evolve in more
positive ways again.

Regards,
Markus
