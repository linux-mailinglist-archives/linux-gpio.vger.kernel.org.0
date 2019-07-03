Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9EE25E135
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 11:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfGCJoV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 05:44:21 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:41161 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfGCJoU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 05:44:20 -0400
Received: from [192.168.1.110] ([95.114.150.241]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MsYzF-1iY5pm2ERP-00tzyN; Wed, 03 Jul 2019 11:44:05 +0200
Subject: Re: [PATCH v1 1/2] pinctrl: baytrail: Use defined macro instead of
 magic in byt_get_gpio_mux()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
References: <20190703003018.75186-1-andriy.shevchenko@linux.intel.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <2357806f-5ff5-965e-6853-da3bbad24f38@metux.net>
Date:   Wed, 3 Jul 2019 11:44:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190703003018.75186-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:1nQ4ipN1AIatCG54zGzO1Mc/z+yBxvCgTXO1UEKRQRxdr4GrJFf
 dopC6PG2zE1+pvNMmbiPtfS/dQHoPFS0+118GNxRt6WasIagJrVC8XdX1r2yeQ5WtBOCLIj
 PUqYzHCtrOQpPK5NC7s/7IuBzfFi/l2taH85N8hupzIUxrkEJUnnp4j1RVEd9nJxorTDqsF
 t8W2o4vp0AHz4KjQh+lpw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M8wlMSyVbXE=:PsmGlw/wsUyJES5XC/7H/N
 W9YO0o0my63r1phjrXtKV9cmbKBEJpyhYvBWSY1ffSTFPXYvyCba9+QGiVT0X1EKWjVTuwHOS
 WP1S9iK3PVDer1hWFkYjlCmpXR/Sdat+jMXX59I1AEWUYcZzl1sIbgKWPEMob30isGQfOFl42
 n4GpLiyeabTNPXfiuHVDA02QK7m4ZUcagIF1KOfpTyqSBZeJMChHEzVtqnfI6OHADJuPtDWPV
 59Xzh27oZ0bkv9eFzsKa2gQEqbywroXaobMPuZfBmjh+5sxfwDwDmjk3zAemK2klqTwP6yxcr
 UI1V2s7ngRkl/E9PDWMWZLtxf+pG8dPLbn+M+IA69A/WihggfeXzpJZCPRinfFeJhBN1JCfcY
 6de1VZQuU2+stagf5xXoxyooOE6Oai4A7Krk7Q6/aBtUSHV7b72uFWO6/n2kF5EvB0KF2sgQI
 rV+K9IR3VsJuTnrFusnJcRW8wvrXGCQdKu1w39jYlP0WqA/MCBOWTbrSXav2VQvLz8pkh5HYX
 /5mOgHpIPAWhSBJ3VxdeLdnqdHiJtDLSaSYY5l5YTceSS6YIN78D1IkvX9RupIrDrPrOaCFrg
 4EkABJUD7X9wuv2uVkApI4rOOW5dj2LgXXwrlmHgkXNO8sYQBo1ZGhNCAt02IBzblGjPDbesn
 mfLgYuWdW9W9jBpZEsTutgTGuuQ0rxBjpNS0WWllIZoFrBV2vOG0UXQBtENOcqV5LjGtfLBQL
 i+m/FT1zdrI4wxW8kTMseeOLWnHiTJxQc4+hfOkavQM0nA00Rvp3tBTlQ50=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03.07.19 02:30, Andy Shevchenko wrote:
> By the fact byt_get_gpio_mux() returns a value of mux settings as
> it is represented in hardware. Use defined macro instead of magic numbers
> to clarify this.

Reviewed-By: Enrico Weigelt <info@metux.net>

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
