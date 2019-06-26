Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C84556C86
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 16:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbfFZOqT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 10:46:19 -0400
Received: from ns.iliad.fr ([212.27.33.1]:54152 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727139AbfFZOqT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Jun 2019 10:46:19 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id E9ADF2097A;
        Wed, 26 Jun 2019 16:46:16 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id D4858205C8;
        Wed, 26 Jun 2019 16:46:16 +0200 (CEST)
Subject: Re: [PATCH v1] pinctrl: msm8998: Squash TSIF pins together
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        gpio <linux-gpio@vger.kernel.org>
References: <18ab4b1c-e74e-410a-a504-f524e46c42ac@free.fr>
 <20190611180516.GO4814@minitux>
 <be298c01-53b8-a954-5de0-3f302265f1cb@free.fr>
 <20190620184124.GB24205@tuxbook-pro>
 <57d0644d-164f-58e7-6c07-9608da4233a3@free.fr>
 <CAOCk7Nqi6j07TzH0tp8x8NzwqX1CAG8wj55Yvxw2tVC8cXhxmQ@mail.gmail.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <2b531817-b1eb-da8c-9edf-25a0b9b2acda@free.fr>
Date:   Wed, 26 Jun 2019 16:46:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOCk7Nqi6j07TzH0tp8x8NzwqX1CAG8wj55Yvxw2tVC8cXhxmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Jun 26 16:46:16 2019 +0200 (CEST)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 26/06/2019 16:42, Jeffrey Hugo wrote:

> On Wed, Jun 26, 2019 at 8:40 AM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
>> Preamble: Rename tsif1 to tsif0, tsif2 to tsif1.
>> Squash tsif0 pins into a single function. Same for tsif1.
>>
>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>> ---
>>  .../bindings/pinctrl/qcom,msm8998-pinctrl.txt | 19 ++---
>>  drivers/pinctrl/qcom/pinctrl-msm8998.c        | 76 +++++--------------
>>  2 files changed, 24 insertions(+), 71 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
>> index 00174f08ba1d..47b0f30a39e9 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
>> @@ -124,9 +124,8 @@ to specify in a pin configuration subnode:
>>                     qlink_request, qua_mi2s, sd_card, sd_write, sdc40, sdc41,
>>                     sdc42, sdc43, sdc4_clk, sdc4_cmd, sec_mi2s, sp_cmu,
>>                     spkr_i2s, ssbi1, ssc_irq, ter_mi2s, tgu_ch0, tgu_ch1,
>> -                   tsense_pwm1, tsense_pwm2, tsif1_clk, tsif1_data, tsif1_en,
>> -                   tsif1_error, tsif1_sync, tsif2_clk, tsif2_data, tsif2_en,
>> -                   tsif2_error, tsif2_sync, uim1_clk, uim1_data, uim1_present,
>> +                   tsense_pwm1, tsense_pwm2, tsif0, tsif1,
>> +                   uim1_clk, uim1_data, uim1_present,
>>                     uim1_reset, uim2_clk, uim2_data, uim2_present, uim2_reset,
>>                     uim_batt, usb_phy, vfr_1, vsense_clkout, vsense_data0,
>>                     vsense_data1, vsense_mode, wlan1_adc0, wlan1_adc1,
>> @@ -179,15 +178,9 @@ Example:
>>                 #interrupt-cells = <2>;
>>
>>                 uart_console_active: uart_console_active {
>> -                       mux {
>> -                               pins = "gpio4", "gpio5";
>> -                               function = "blsp_uart8_a";
>> -                       };
>> -
>> -                       config {
>> -                               pins = "gpio4", "gpio5";
>> -                               drive-strength = <2>;
>> -                               bias-disable;
>> -                       };
>> +                       pins = "gpio4", "gpio5";
>> +                       function = "blsp_uart8_a";
>> +                       drive-strength = <2>;
>> +                       bias-disable;
>>                 };
> 
> Whats with these "uart" changes?  Modernizing the example?  Doesn't
> seem related to the commit text...

Good point. I squashed one commit too many. I'll drop that hunk
in v2. (Yes, I meant to document the syntax recommended by Bjorn.)

Regards.
