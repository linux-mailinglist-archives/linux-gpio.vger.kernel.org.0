Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 483BF4744A1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Dec 2021 15:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234846AbhLNOSH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Dec 2021 09:18:07 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:49900 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230231AbhLNOSH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Dec 2021 09:18:07 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BEA0Jnx018714;
        Tue, 14 Dec 2021 15:17:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=kdPpc0ul196B8HKuXSFwfNC/mQWJmETws3qeQsCNm8g=;
 b=qdGs8FGYVCyJm+cMmVqP9JbWkmcf/IPFlMjC/tf1A84hu84suF/UCX7kYrq5Aagkj7G+
 Tc8zykVFb8PJ+dFpgbbVZPo2AgAQYPpNzD8J5MYNK2k61hdQHMyLCKZeHDp8pWApo2cm
 KtZln8JmlNciK+EP8N5kkL3VLQYmQYMwJIWKfUCGps7w/N6w9eDYqCLWTJU9kvalTZaG
 oSk7AD0u+sr0b/SE72F+EUgklj0Ii0/bMMLN7lnG9Zvl7Hp55e69WjTNmT5HrS9fRXuR
 oImE0jwXSn/h2K93qUt/I6lka2ukWVTlNnOcfjbgBUSeQePLO+6Mi0Rl29xys71+EWJj xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cxk4hm7p1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 14 Dec 2021 15:17:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 13DA510002A;
        Tue, 14 Dec 2021 15:17:49 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C0BA230F4D;
        Tue, 14 Dec 2021 15:17:49 +0100 (CET)
Received: from lmecxl1091.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 14 Dec
 2021 15:17:48 +0100
Subject: Re: [PATCH] Revert "pinctrl: stm32: fix the reported number of GPIO
 lines per bank"
To:     <chf.fritz@googlemail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <a5b8e3ea13de0b2976bb9622dd410dd110f3f66c.camel@googlemail.com>
From:   Fabien DESSENNE <fabien.dessenne@foss.st.com>
Message-ID: <46f07510-b6aa-4619-9c54-048464bfbaf3@foss.st.com>
Date:   Tue, 14 Dec 2021 15:17:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a5b8e3ea13de0b2976bb9622dd410dd110f3f66c.camel@googlemail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_06,2021-12-14_01,2021-12-02_01
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Christoph

I have been able to reproduce the issue you reported.
Instead of reverting the guilty patch, I am working to fix it.
I am currently testing a candidate patch, and will share it in the 
coming days.
BR
Fabien


On 11/12/2021 19:53, Christoph Fritz wrote:
> This reverts commit 67e2996f72c71ebe4ac2fcbcf77e54479bb7aa11 because it
> breaks pin usage for gpio-nodes with an offset in gpio-ranges (like
> &gpiof from stm32mp15xxab-pinctrl.dtsi).
> 
> For example the following reset gpio of a wifi module on a stm32mp153c
> board works again after applying this revert patch:
> 
> 	wifi_pwrseq: wifi-pwrseq {
> 		compatible = "mmc-pwrseq-simple";
> 		reset-gpios = <&gpiof 9 GPIO_ACTIVE_LOW>;
> 	};
> 
> Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 24764ebcc936..73f49c596cef 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -1225,7 +1225,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
>   	struct device *dev = pctl->dev;
>   	struct resource res;
>   	int npins = STM32_GPIO_PINS_PER_BANK;
> -	int bank_nr, err, i = 0;
> +	int bank_nr, err;
>   
>   	if (!IS_ERR(bank->rstc))
>   		reset_control_deassert(bank->rstc);
> @@ -1247,14 +1247,9 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
>   
>   	of_property_read_string(np, "st,bank-name", &bank->gpio_chip.label);
>   
> -	if (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, i, &args)) {
> +	if (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &args)) {
>   		bank_nr = args.args[1] / STM32_GPIO_PINS_PER_BANK;
>   		bank->gpio_chip.base = args.args[1];
> -
> -		npins = args.args[2];
> -		while (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
> -							 ++i, &args))
> -			npins += args.args[2];
>   	} else {
>   		bank_nr = pctl->nbanks;
>   		bank->gpio_chip.base = bank_nr * STM32_GPIO_PINS_PER_BANK;
> 
