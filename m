Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1EB348516
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 00:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238957AbhCXXL5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 24 Mar 2021 19:11:57 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:20147 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231544AbhCXXLg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 24 Mar 2021 19:11:36 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-57-ByNutTSLPryHL587jqF9Ew-1; Wed, 24 Mar 2021 23:11:31 +0000
X-MC-Unique: ByNutTSLPryHL587jqF9Ew-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 24 Mar 2021 23:11:30 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Wed, 24 Mar 2021 23:11:30 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Arnd Bergmann' <arnd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        "Nick Desaulniers" <ndesaulniers@google.com>,
        Jeevan Shriram <jshriram@codeaurora.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "Vinod Koul" <vkoul@kernel.org>
CC:     Arnd Bergmann <arnd@arndb.de>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>
Subject: RE: [PATCH] pinctrl: qcom: fix unintentional string concatenation
Thread-Topic: [PATCH] pinctrl: qcom: fix unintentional string concatenation
Thread-Index: AQHXH+cnzD0REIZ51kmEV+qVFS5oLKqTxYmg
Date:   Wed, 24 Mar 2021 23:11:30 +0000
Message-ID: <787a3368942c4be98d29d5b00cad6b7d@AcuMS.aculab.com>
References: <20210323131728.2702789-1-arnd@kernel.org>
In-Reply-To: <20210323131728.2702789-1-arnd@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann
> Sent: 23 March 2021 13:17
> clang is clearly correct to point out a typo in a silly
> array of strings:
> 
> drivers/pinctrl/qcom/pinctrl-sdx55.c:426:61: error: suspicious concatenation of string literals in an
> array initialization; did you mean to separate the elements with a comma? [-Werror,-Wstring-
> concatenation]
>         "gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19" "gpio20", "gpio21", "gpio22",
>                                                                    ^
> Add the missing comma that must have accidentally been removed.
> 
> Fixes: ac43c44a7a37 ("pinctrl: qcom: Add SDX55 pincontrol driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/pinctrl/qcom/pinctrl-sdx55.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sdx55.c b/drivers/pinctrl/qcom/pinctrl-sdx55.c
> index 2b5b0e2b03ad..5aaf57b40407 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sdx55.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sdx55.c
> @@ -423,7 +423,7 @@ static const char * const gpio_groups[] = {
> 
>  static const char * const qdss_stm_groups[] = {
>  	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7", "gpio12", "gpio13",
> -	"gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19" "gpio20", "gpio21", "gpio22",
> +	"gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21", "gpio22",
>  	"gpio23", "gpio44", "gpio45", "gpio52", "gpio53", "gpio56", "gpio57", "gpio61", "gpio62",
>  	"gpio63", "gpio64", "gpio65", "gpio66",


That may be replaceable with:
static const char qdss_stm_groups[][8] = { .... };

For a code and data size reduction.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

