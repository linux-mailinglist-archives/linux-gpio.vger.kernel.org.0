Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A64ACE2604
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 23:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407696AbfJWV7Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 17:59:24 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34063 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405035AbfJWV7Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 17:59:24 -0400
Received: by mail-wm1-f66.google.com with SMTP id v3so608863wmh.1;
        Wed, 23 Oct 2019 14:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tRHYNEj6Qv0wyecWdVtjcYp2Pz0m73O5k6aoM2K0y24=;
        b=UmwbtQQH10MzE1m06vK83IYrIiBkcc8Ag2Pgs9nPz/wlbcvc350vX6c5KZ2UGKPKoT
         5JjHuO+OLygjfT1dtC0XkWrt8Z72QyXETDbsn3rrGj+LNNOG5tTWzXcLn8Wl1q+vjYhZ
         bcZxya4UEzPhTlX/dhdM119o+fULyDHiaT1/FcplvZor6jMU8gXAnpSPPqBIgDdnGF0A
         Zzr0LB/oWc7XjT6MiT+E8+TZEqVSDK8GaGTTv+qUh6IrCMEouvb7iZl5h22pbT2eJmEB
         +2E1HxijGbISYJP8GCs+C0zM82FRbz6GPxHCyYC356z7XKCzczQvnSQbgX6yswGa+Hyu
         VkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tRHYNEj6Qv0wyecWdVtjcYp2Pz0m73O5k6aoM2K0y24=;
        b=bB4S0RY6kIIjQeKX4geL5s+SipGmklPsEf62R98dOnhvrUvBRc6E9mhjoUP3QS5ihY
         8AexM+VhngHZwV3SBPIg1c+e9L17WV8cBTlSrqKXoixkGeA+ICN7WHPS2dm03A1EK6Tf
         oPLfsWmyMct7ni4OFbvb3rCYcs0qe+xutzvQrCyXl3kGw+ERigF3bQCse1hPcmfrDhUX
         RDo6ooBQ2T7y9rvoHIe6dc0qSeLsNR4J6Uk1yFDhrWpulvhKZW2R9hG5/8Ma1FrMZQ8K
         UWO3eWA/S4vEJRW6jGlwtrY2PgQ0fVXStRjlYKCoCtc1OCpcUvjHm+iZeo+TWg3dX0Lo
         0ROQ==
X-Gm-Message-State: APjAAAUZcGFWNfbXdTgpVTMbX6lryAMu6dqr6x/Cpk/wIoH3N3ygyB6K
        Ve8lvTZ+LAbmlIDTTaCpDPAK/FFL
X-Google-Smtp-Source: APXvYqy3onossQAQcpFqWVovAFG7gwAVJAKmIonrYlu0BNw9NDy6upbxsP0eEuwdgi2DAlTzqZHUpA==
X-Received: by 2002:a1c:6144:: with SMTP id v65mr1864515wmb.53.1571867957033;
        Wed, 23 Oct 2019 14:59:17 -0700 (PDT)
Received: from [192.168.1.19] (chh49.neoplus.adsl.tpnet.pl. [83.31.5.49])
        by smtp.gmail.com with ESMTPSA id p10sm25274396wrx.2.2019.10.23.14.59.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Oct 2019 14:59:16 -0700 (PDT)
Subject: Re: [RFC PATCH 11/13] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <af1fb3e010d5f34502d354369b88fa28639f587d.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
 <c1e41315-42ad-fb9b-c9db-8b07d4293166@ti.com>
 <fbd4960b219099b7a48ef24019ba829f866edb3b.camel@fi.rohmeurope.com>
 <4570db9c-7bc8-f131-269a-248b87e25e38@gmail.com>
 <201df0f7319b94eb581a040a2b1b07dbfed12e94.camel@fi.rohmeurope.com>
 <c5761d78-3334-adaa-b871-cb6da356483b@gmail.com>
 <8974a3974377d0623ed968563b035e701191440e.camel@fi.rohmeurope.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABtC1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAlgEEwEIAEICGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQkJZgNMFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAl05/9sC
 GQEACgkQvWpQHLeLfCarMQ/9FN/WqJdN2tf6xkP0RFyS4ft0sT04zkOCFfOMxs8mZ+KZoMU+
 X3a+fEppDL7xgRFpHyGaEel7lSi1eqtzsqZ5JiHbDS1Ht1G8TtATb8q8id68qeSeW2mfzaLQ
 98NPELGfUXFoUqUQkG5z2p92UrGF4Muj1vOIW93pwvE4uDpNsl+jriwHomLtjIUoZtIRjGfZ
 RCyUQI0vi5LYzXCebuzAjGD7Jh2YAp7fDGrv3qTq8sX+DUJ4H/+I8PiL+jXKkEeppqIhlBJJ
 l4WcgggMu3c2uljYDuqRYghte33BXyCPAocfO2/sN+yJRUTVuRFlOxUk4srz/W8SQDwOAwtK
 V7TzdyF1/jOGBxWwS13EjMb4u3XwPMzcPlEQNdIqz76NFmJ99xYEvgkAmFmRioxuBTRv8Fs1
 c1jQ00WWJ5vezqY6lccdDroPalXWeFzfPjIhKbV3LAYTlqv0It75GW9+0TBhPqdTM15DrCVX
 B7Ues7UnD5FBtWwewTnwr+cu8te449VDMzN2I+a9YKJ1s6uZmzh5HnuKn6tAfGyQh8MujSOM
 lZrNHrRsIsLXOjeGVa84Qk/watEcOoyQ7d+YaVosU0OCZl0GldvbGp1z2u8cd2N/HJ7dAgFh
 Q7dtGXmdXpt2WKQvTvQXhIrCWVQErNYbDZDD2V0TZtlPBaZP4fkUDkvH+Sy5Ag0EVaN9oQEQ
 AMPNymBNoCWc13U6qOztXrIKBVsLGZXq/yOaR2n7gFbFACD0TU7XuH2UcnwvNR+uQFwSrRqa
 EczX2V6iIy2CITXKg5Yvg12yn09gTmafuoIyKoU16XvC3aZQQ2Bn3LO2sRP0j/NuMD9GlO37
 pHCVRpI2DPxFE39TMm1PLbHnDG8+lZql+dpNwWw8dDaRgyXx2Le542CcTBT52VCeeWDtqd2M
 wOr4LioYlfGfAqmwcwucBdTEBUxklQaOR3VbJQx6ntI2oDOBlNGvjnVDzZe+iREd5l40l+Oj
 TaiWvBGXkv6OI+wx5TFPp+BM6ATU+6UzFRTUWbj+LqVA/JMqYHQp04Y4H5GtjbHCa8abRvBw
 IKEvpwTyWZlfXPtp8gRlNmxYn6gQlTyEZAWodXwE7CE+KxNnq7bPHeLvrSn8bLNK682PoTGr
 0Y00bguYLfyvEwuDYek1/h9YSXtHaCR3CEj4LU1B561G1j7FVaeYbX9bKBAoy/GxAW8J5O1n
 mmw7FnkSHuwO/QDe0COoO0QZ620Cf9IBWYHW4m2M2yh5981lUaiMcNM2kPgsJFYloFo2XGn6
 lWU9BrWjEoNDhHZtF+yaPEuwjZo6x/3E2Tu3E5Jj0VpVcE9U1Zq/fquDY79l2RJn5ENogOs5
 +Pi0GjVpEYQVWfm0PTCxNPOzOzGR4QB3BNFvABEBAAGJAiUEGAEIAA8FAlWjfaECGwwFCQlm
 AYAACgkQvWpQHLeLfCZqGxAAlWBWVvjU6xj70GwengiqYZwmW1i8gfS4TNibQT/KRq0zkBnE
 wgKwXRbVoW38pYVuGa5x/JDQMJDrLAJ0wrCOS3XxbSHCWOl/k2ZD9OaxUeXq6N+OmGTzfrYv
 PUvWS1Hy04q9AD1dIaMNruZQmvnRfkOk2UDncDIg0166/NTHiYI09H5mpWGpHn/2aT6dmpVw
 uoM9/rHlF5s5qAAo95tZ0QW2BtIceG9/rbYlL57waSMPF49awvwLQX5RhWoF8mPS5LsBrXXK
 hmizIsn40tLbi2RtWjzDWgZYitqmmqijeCnDvISN4qJ/nCLO4DjiSGs59w5HR+l0nwePDhOC
 A4RYZqS1e2Clx1VSkDXFpL3egabcIsqK7CZ6a21r8lXVpo4RnMlQsmXZTnRx4SajFvX7PrRg
 /02C811fLfh2r5O5if8sKQ6BKKlHpuuioqfj/w9z3B0aQ71e4n1zNJBO1kcdznikPLAbr7jG
 gkBUXT1yJiwpTfRQr5y2Uo12IJsKxohnNFVYtK8X/R6S0deKPjrZWvAkllgIPcHjMi2Va8yw
 KTj/JgcpUO5KN906Pf7ywZISe7Kbcc/qnE0YjPPSqFOvoeZvHe6EZCMW9+xZsaipvlqpByQV
 UHnVg09K9YFvjUBsBPdC8ef6YwgfR9o6AnPmxl0oMUIXkCCC5c99fzJY/k+JAq0EGAEIACAW
 IQS/HfwKVo8F95V1cJC9alAct4t8JgUCWwqKhgIbAgCBCRC9alAct4t8JnYgBBkWCAAdFiEE
 FMMcSshOZf56bfAEYhBsURv0pdsFAlsKioYACgkQYhBsURv0pdvELgD/U+y3/hsz0bIjMQJY
 0LLxM/rFY9Vz1L43+lQHXjL3MPsA/1lNm5sailsY7aFBVJxAzTa8ZAGWBdVaGo6KCvimDB8G
 7joP/jx+oGOmdRogs7mG//H+w9DTnBfPpnfkeiiokGYo/+huWO5V0Ac9tTqZeFc//t/YuYJn
 wWvS0Rx+KL0fT3eh9BQo47uF4yDiZIiWLNh4Agpup1MUSVsz4MjD0lW6ghtnLcGlIgoVHW0v
 tPW1m9jATYyJSOG/MC1iDrcYcp9uVYn5tKfkEeQNspuG6iSfS0q3tajPKnT1nJxMTxVOD2RW
 EIGfaV9Scrou92VD/eC+/8INRsiWS93j3hOKIAV5XRNINFqtzkagPYAP8r6wksjSjh01fSTB
 p5zxjfsIwWDDzDrqgzwv83CvrLXRV3OlG1DNUDYA52qJr47paH5QMWmHW5TNuoBX8qb6RW/H
 M3DzPgT+l+r1pPjMPfvL1t7civZUoPuNzoyFpQRj6TvWi2bGGMQKryeYksXG2zi2+avMFnLe
 lOxGdUZ7jn1SJ6Abba5WL3VrXCP+TUE6bZLgfw8kYa8QSXP3ysyeMI0topHFntBZ8a0KXBNs
 qqFCBWmTHXfwsfW0VgBmRtPO7eXVBybjJ1VXKR2RZxwSq/GoNXh/yrRXQxbcpZ+QP3/Tttsb
 FdKciZ4u3ts+5UwYra0BRuvb51RiZR2wRNnUeBnXWagJVTlG7RHBO/2jJOE6wrcdCMjs0Iiw
 PNWmiVoZA930TvHA5UeGENxdGqo2MvMdRJ54YaIR
Message-ID: <e9d1c529-90ef-34bf-d893-02a109ba19ba@gmail.com>
Date:   Wed, 23 Oct 2019 23:59:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8974a3974377d0623ed968563b035e701191440e.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Matti,

On 10/23/19 10:37 AM, Vaittinen, Matti wrote:
> Morning Jacek,
> 
> Thanks for the reply again. I did some cleaning to this mail as it was
> getting lengthy.
> 
> On Tue, 2019-10-22 at 19:40 +0200, Jacek Anaszewski wrote:
>> Matti,
>>
>> On 10/22/19 2:40 PM, Vaittinen, Matti wrote:
>>> Hello Jacek,
>>>
>>> Thanks for the clarifications. I think I now understand the LED
>>> subsystem a bit better :)
>>>
>>> On Mon, 2019-10-21 at 21:09 +0200, Jacek Anaszewski wrote:
>>>> Hi Matti,
>>>>
>>>> On 10/21/19 10:00 AM, Vaittinen, Matti wrote:
>>>>> Hello Dan,
>>>>>
>>>>> Thanks for taking the time to check my driver :) I truly
>>>>> appreciate
>>>>> all
>>>>> the help!
>>>>>
>>>>> A "fundamental question" regarding these review comments is
>>>>> whether
>>>>> I
>>>>> should add DT entries for these LEDs or not. I thought I
>>>>> shouldn't
>>>>> but
>>>>> I would like to get a comment from Rob regarding it.
>>>>
>>>> If the LED controller is a part of MFD device probed from DT then
>>>> there is no doubt it should have corresponding DT sub-node.
>>>
>>> Sorry but I still see no much benefit from adding this information
>>> in
>>> DT. Why should it have corresponding DT-node if the LED properties
>>> are
>>> fixed and if we only wish to allow user-space control and have no
>>> dependencies to other devices in DT? 
>>>
>>> In this specific case the information we can provide from DT is
>>> supposed to be fixed. No board based variation. Furthermore, there
>>> is
>>> not much generic driver/led core functionality which would be able
>>> to
>>> parse and utilize relevant information from DT. I think we can only
>>> give the name (function) and colour. And they are supposed to be
>>> fixed
>>> and thus could be just hard-coded in driver. Hard-coding these
>>> would be
>>> simpler and less error prone for users (no DT bindings to write)
>>> and
>>> simpler to create and probably also to maintain (no separate
>>> binding
>>> documents needed for LEDs).
>>
>> AFAICS it is possible to connect LED of arbitrary color to the iouts
>> of this device. If this is the case then it is justified to have DT
>> node only to allow for LED name customization.
> 
> In theory, yes. In practice (if I understand it correctly) the color in
> this case is only visible in sysfs path name. I am not at all sure that
> reflecting the (unlikely) color change in path name is worth the
> hassle. Besides - if this happens, then the driver and DT can be
> changed.

Driver should not be changed. We have DT for conveying board specific
parameters.

> It is easier to add DT entries than remove them. If you see
> the color change support as really crucial - then I could even consider
> defaulting the colours to amber and green if no colour property is
> present in DT.

You don't need to default to anything. The color section will be left
empty if the property is not provided.

> I see no point in _requiring_ the DT entry to be there.

I'm referring to this later in this message.

> If we like being prepared for the theoretical possibilities - what if
> x86 is used to control this PMIC? I guess we wouldn't have DT there
> then (And no - I don't see such use-case).

We have fwnode abstraction for that. You can also check:
Documentation/firmware-guide/acpi/dsd/leds.rst.

>>> But assuming this is Ok to DT-folks and if you insist - I will add
>>> LED
>>> information to DT for the next patches. Hopefully this extra
>>> complexity
>>> helps in some oddball use-case which I can't foresee =)
>>>
>>> Then what comes to the DT format.
>>>
>>> Do you think LED subsystem should try to follow the convention with
>>> other sub-systems and not introduce multiple compatibles for single
>>> device? MFD can handle instantiating the sub-devices just fine even
>>> when sub-devices have no own compatible property or of_match. Maybe
>>> we
>>> should also avoid unnecessary sub-nodes when they are not really
>>> required.
>>
>> This is beyond my scope of responsibility. It is MFD subsystem thing
>> to
>> choose the way of LED class driver instantiation. When it comes to
>> LED subsystem - it expects single compatible pertaining to a physical
>> device.
> 
> Sorry but I don't quite follow. What the LED subsystem does with the
> compatible property? How does it expect this?

In case of DT based MFD cell probing you must initialize of_compatible
property of struct mfd_cell element which will then be matched
with struct platform_driver -> driver -> of_match_table in the LED
class driver. Basing on that a relevant platform_device is passed
to the probe function. Its child struct device's of_node property comes
already initialized to the pointer to the corresponding child node
in MFD node.

>> Nonetheless, so far we used to have separate compatibles for drivers
>> of
>> MFD devices' LED cells. If we are going to change that I'd like to
>> see
>> explicit DT maintainer's statement confirming that.
> 
> I don't expect that existing DTs would be changed. 

I didn't suggest that.

> But as I said, the
> consensus amongst most of the subsystenm maintainers and DT maintainers
> seems to be that sub-devices should not have own compatibles. I hope
> Rob acks this here - but knowing he is a busy guy I add some old
> discussions from which I have gathered my understanding:
> 
> BD71837 - first patch where regulators had compatible - Mark (regulator
> maintainer instructed me to drop it):
> https://lore.kernel.org/linux-clk/20180524140118.GS4828@sirena.org.uk/
> 
> And here Stephen (the clk subsystem maintainer) told me to drop whole
> clocks sub-node (including the compatible):
> https://lore.kernel.org/linux-clk/152777867392.144038.18188452389972834689@swboyd.mtv.corp.google.com/

Still, there are MFD drivers using of_compatible for matching cell
drivers. I don't follow current trends on MFD subsystem side.
You've got to wait for review feedback from Lee Jones anyway
to find out how to proceed with MFD bindings.

>> And one benefit of having separate nodes per MFD cells is that we can
>> easily discern the support for which cells is to be turned on.
> 
> We don't want to do DT modifications to drop some sub-device support
> out. The DT is HW description and sub-blocks are still there. We drop
> the support by KConfig. 

How would you describe the purpose of 'status = "disabled"' DT
assignment then?

Anyway, I entirely disagree here - it is perfectly proper approach
to define platform capabilities by modifying dts file alone.
This way you can easily create multiple versions of platform
configurations. It may be often impractical to enable all available
platform features, at least from business point of view. And recompiling
dts is lightweight operation in comparison to kernel compilation.

Not saying that in some cases there are secret keys required for
encrypting kernel images, that may not always be at hand.

> Only 'configuration' we could bring from DT is
> the amount of connected LEDs (as you said). But on the other hand -
> whether preparing for such unlikely design is reasonable (or needed) is
> questionable.

LED naming related data is vital as well.

>>> 	pmic: pmic@4b {
>>> 		compatible = "rohm,bd71828";
>>> 		reg = <0x4b>;
>>> 		interrupt-parent = <&gpio1>;
>>> 		interrupts = <29 GPIO_ACTIVE_LOW>;
>>> 		clocks = <&osc 0>;
>>> 		#clock-cells = <0>;
>>> 		clock-output-names = "bd71828-32k-out";
>>> 		gpio-controller;
>>> 		#gpio-cells = <2>;
>>> 		ngpios = <4>;
>>> 		gpio-reserved-ranges = <0 1 2 1>;
>>> 		gpio-line-names = "EPDEN";
>>> 		rohm,dvs-vsel-gpios = <&gpio1 12 0>,
>>> 				      <&gpio1 13 0>;
>>> 		regulators {
>>> 			...
>>> 		};
>>> 		
>>> 		chg-led {
>>> 			function = LED_FUNCTION_CHARGING;
>>> 			color = LED_COLOR_ID_AMBER;
>>> 		};
>>>
>>> 		pwr-led {
>>> 			function = LED_FUNCTION_POWER;
>>> 			color = LED_COLOR_ID_GREEN;
>>> 		};
>>
>> This way you would probably need to probe LED class driver twice,
>> instead of letting it behave in a standard way and parse child LED
>> nodes.
> 
> No. Please note that probing the MFD sub-drivers is _not_ bound to
> device-tree nodes. MFD sub-devices can be probed just fine even if they
> have no DT entries. When we add MFD cell for LED driver, the
> corresponding LED driver is probed. No DT magic needed for this.
> 
> What the LED driver (as other sub-device drivers) is required to do is
> to obtain the pointer to parent device's DT node and find information
> which is relevant for it. Ideally, the subsystem framework can extract
> the properties which are common for whole subsystem (like color and
> function in case of LEDs) and driver only parses the DT if it has some
> custom properties. Again, ideally the driver has sane defaults - or
> some other 'platform data' mechanism if no DT information is found.
> There is architectures which do not support DT.

LED common bindings define that each LED should be described
using child node. And we've enforced sticking to this standard
for last two years strictly.

LED core mechanism for LED name composition also relies on this
DT design - it expects single 'color' and 'function' properties to
be present in the passed fwnode.

LED class registration function registers single LED and it has been
always LED class driver's responsibility to call it for every LED
connected to the LED controller iouts.

> In case of BD71828 LEDs my first idea was to go with only the 'sane
> defaults' option as I saw no much configurability. The DT snippet above
> contains LED information as per your suggestion.
> 
> What the LED sub driver for BD71828 would now do is calling 
> devm_led_classdev_register_ext with the DT information of BD71828
> device. Eg, it should use the MFD dt node (because this is the real
> device) and not just part of it. devm_led_classdev_register_ext should
> then extract the LED specific information. I have not checked the
> implementation of devm_led_classdev_register_ext in details - but it
> should ignore non led properties and just walk through the LED
> information and create the sysfs interfaces etc. for all LEDs it finds.

This function does not work like that, as explained above.
Please first get acquainted with the way how existing LED class drivers
approach LED registration. Because otherwise we're wasting each
others' time.

> (In my example this is the chg-led and pwr-led sub-nodes). Furthermore,
> if no LED information is found from DT I would expect
> devm_led_classdev_register_ext to fail with well-defined return value
> so that the driver could do what it now does - Eg, use "sane defaults"
> to register the default class-devices for green and amber LEDs. The
> default led class dev naming should of course be same format as it
> would be if DT was populated with green and amber led information. 

Please go through 5.4-rc1 patches related to LED naming improvements
You can also refer to Documentation/leds/leds-class.rst,
"LED Device Naming" section for starter.

>>> 	};
>>>
>>> How do you see this? Or do you really wish to have this one extra
>>> node:
>>>
>>> 	pmic: pmic@4b {
>>> 		compatible = "rohm,bd71828";
>>> 		
>>> reg = <0x4b>;
>>> 		interrupt-parent = <&gpio1>;
>>> 		interru
>>> pts = <29 GPIO_ACTIVE_LOW>;
>>> 		clocks = <&osc 0>;
>>> 		
>>> #clock-cells = <0>;
>>> 		clock-output-names = "bd71828-32k-out";
>>> 		gpio-controller;
>>> 		#gpio-cells = <2>;
>>> 	
>>> 	ngpios = <4>;
>>> 		gpio-reserved-ranges = <0 1 2 1>;
>>> 	
>>> 	gpio-line-names = "EPDEN";
>>> 		rohm,dvs-vsel-gpios =
>>> <&gpio1 12 0>,
>>> 				      <&gpio1 13 0>;
>>> 		
>>> regulators {
>>> 			...
>>> 		};
>>> 		
>>> 		leds-dummy {
>>
>> Why leds-dummy ?
> 
> Because there is no real led controller device in any "MFD bus". It is
> just one MFD device with controls for two LEDs. 
> 
>> The convention is to have led-controller@unit-address as the parent
>> LED
>> controller node.
> 
> What is the unit address here? 0x4b is the I2C slave address and it is
> the MFD node address. There is no addressing for LED controller as
> there is no separate LED controller device. There is only one device,
> the PMIC which is MFD device as it has multiple functions meld in. One
> of these functions is LED control and requires LED driver.

For MFD cell you can have just "led".

>>> 			chg-led {
>> s/chg-led/led0/
>>
>>> 				function = LED_FUNCTION_CHARGING;
>>> 				color = LED_COLOR_ID_AMBER;
>>> 			};
>>>
>>> 			pwr-led {
>>
>> s/pwr-led/led1/
>>
>> This is ePAPR requirement that DT node name should describe the
>> general class of device.
> 
> Thanks. I had some problems with these node names as I wanted to make
> them generic (led) but also to include some information what leds they
> are. A bit same idea as I see in node names like "chan1" and "chan345"
> that are used in ti-lmu bindings I checked for the example. But I am
> fine with renaming them in this example! I just don't think we should
> have this extra node as I mentioned.

I wonder what Rob and Lee will say here. I personally would
like to stick to LED common bindings and have this extra node.
We define standards for a reason after all.

>>> 				function = LED_FUNCTION_POWER;
>>> 				color = LED_COLOR_ID_GREEN;
>>> 			};
>>
>> Common LED bindings say this is the proper way to go. However you
>> would need compatible to probe LED class driver in DT based way.
> 
> No. I don't. MFD will probe the LED class driver as long as the name of
> the driver matches to MFD cell name. 

If you initialize only of_compatible in struct mfd_cell element then it
will use only that for matching. I bet I was checking that five years
ago while working on leds-max77693 driver.

> So we only need MFD driver to be
> probed based on the compatible. Rest of the sub-device drivers will be
> probed by MFD. What I am missing is MODULE_ALIAS in LED driver for
> loading the module when MFD is searching for it if it is not modprobed
> via scripts or built in-kernel. I have understood this is the standard
> way with MFD nowadays - I am positive Lee will kick me if I am wrong ;)
> (I think I have bullied him that much in the past :/ )

Last sentence confirms my observation that you're strongly inclined
to contest status quo :-)

>> If you plan to do it otherwise then it makes no sense to have
>> DT nodes for LEDs.
> 
> That was my point. This is why I did not have LEDs in DT in first
> place. But as I said above - as a result of this discussion I have
> started thinking that maybe I could check if I can easily add support
> for providing LED information also via DT and fall back to defaults if
> no LED information is found. (to allow color change or to omit one of
> the LEDs as you suggested)
> 
>>>>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>>>>> index b0fdeef10bd9..ec59f28bcb39 100644
>>>>>>> --- a/drivers/leds/Kconfig
>>>>>>> +++ b/drivers/leds/Kconfig
>>>>>>> @@ -529,6 +529,16 @@ config LEDS_BD2802
>>>>>>>   	  This option enables support for BD2802GU RGB LED
>>>>>>> driver chips
>>>>>>>   	  accessed via the I2C bus.
>>>>>>>   
>>>>>>> +config LEDS_BD71828
>>>>>>> +	tristate "LED driver for LED pins on ROHM BD71828 PMIC"
>>>>>>> +	depends on LEDS_CLASS
>>>>>> doesn't this have a dependency on MFD_ROHM_BD71828
>>>>>>> +	depends on I2C
>>>>>>> +	help
>>>>>>> +	  This option enables support for LED outputs located
>>>>>>> on ROHM
>>>>>>> +	   BD71828 power management IC. ROHM BD71828 has two
>>>>>>> led output
>>>>>>> pins
>>>>>>> +	   which can be left to indicate HW states or
>>>>>>> controlled by SW.
>>>>>>> Say
>>>>>>> +	   yes here if you want to enable SW control for these
>>>>>>> LEDs.
>>>>>>> +
>>>>>>
>>>>>> Add module statement
>>>>>
>>>>> What is the module statement? Do you mean the 'if you compile
>>>>> this
>>>>> as a
>>>>> module it will be called blahblah' or 'choose M to blahblah'?
>>>>>
>>>>> I've never understood why some entries have those statements.
>>>>> 'Choose
>>>>> M' stuff is help for config system - why should each module
>>>>> explain
>>>>> how
>>>>> to use configs? This information should be in more generic
>>>>> documentation. Furthermore, the 'tristate' there already says
>>>>> you
>>>>> can
>>>>> compile this as a module. Module name on the other hand really
>>>>> is
>>>>> module's property but it may well change if one changes the
>>>>> name of
>>>>> the
>>>>> file. That should not require change in KConfig. Furthermore,
>>>>> where
>>>>> do
>>>>> you need the module name? And if you really need the module
>>>>> name
>>>>> you
>>>>> should check the config name from Makefile to be sure -
>>>>> module/file
>>>>> names in comments or docs tend to get outdated.
>>>>>
>>>>> After all this being said - I can add any boilerplate text in
>>>>> KConfig
>>>>> if necessary - I just see zero benefit from this. And if you
>>>>> didn't
>>>>> mean this - can you then please tell me what is the module
>>>>> statement?
>>>>
>>>> Yes, like you noticed, this is boilerplate so please follow the
>>>> convention. If you'd like to discuss its relevance please submit
>>>> a message to kernel-janitors@vger.kernel.org.
>>>
>>> I did follow the convention. There is 67 tristated LED drivers
>>> which do
>>> NOT add this module building babbling in description. Then there is
>>> 14
>>> drivers which do. So common convention even in LED subsystem is to
>>> NOT
>>> include meaningless mumbojumbo there.
>>>
>>> So even regarding convention it is better to have short description
>>> to
>>> the point. That actually makes the requiring boilerplate even more
>>> useless. But as I said, I can put any meaningless letters there.
>>> (again, if I can't convince you to reconsider how you like the LED
>>> subsystem to appear like). Knowing how hard it is to help people
>>> reducing waste - it's may be easier for me than discussing this
>>> further
>>> :(
>>
>> I will not insist - it's up to you. Unless Dan who raised the
>> issue sees that differently.
> 
> Thanks :) Dan, I would like to hear your thoughts on this - do you
> still think this is a fatal issue for you?
> 
>>>>>>> +#define BD71828_LED_TO_DATA(l) ((l)->id == ID_GREEN_LED ?
>>>>>>> \
>>>>>>> +	container_of((l), struct bd71828_leds, green) : \
>>>>>>> +	container_of((l), struct bd71828_leds, amber))
>>>>>>
>>>>>> I don't think we should be defining the color as the
>>>>>> variable.
>>>>>> The 
>>>>>> outputs can drive any color LED.
>>>>>
>>>>> I used the colors mentioned in BD71828 data-sheet. It is true
>>>>> someone
>>>>> might use different LEDs on their board but at least this
>>>>> naming
>>>>> allows
>>>>> one to match the output to one in data-sheet. I can add comment
>>>>> explaining this if you thin it's worth mentioning.
>>>>
>>>> I see you've come up with below definitions in rohm-bd71828.h:
>>>>
>>>> #define BD71828_MASK_LED_AMBER		0x80
>>>> #define BD71828_MASK_LED_GREEN		0x40
>>>>
>>>> Is this how those bit fields are named in the data sheet?
>>>
>>> The leds are through the document referred as "GRNLED" and
>>> "AMBLED".
>>> These specific bits are named "AMBLED_FORCE_ON" and
>>> "GRNLED_FORCE_ON".
>>
>> OK, so then it's reasonable to use those names in the driver.
>> I would only add a comment next to the definitions, highlighting
>> that their names don't imply the scope of supported colors as this is
>> entirely irrelevant.
> 
> I'll add a note here. 
> 
>>
>>>>>>> +
>>>>>>> +	bd71828 = dev_get_drvdata(pdev->dev.parent);
>>>>>>> +	l = devm_kzalloc(&pdev->dev, sizeof(*l), GFP_KERNEL);
>>>>>>> +	if (!l)
>>>>>>> +		return -ENOMEM;
>>>>>>> +	l->bd71828 = bd71828;
>>>>>>> +	a = &l->amber;
>>>>>>> +	g = &l->green;
>>>>>>> +	a->id = ID_AMBER_LED;
>>>>>>> +	g->id = ID_GREEN_LED;
>>>>>>> +	a->force_mask = BD71828_MASK_LED_AMBER;
>>>>>>> +	g->force_mask = BD71828_MASK_LED_GREEN;
>>>>>>> +
>>>>>>> +	a->l.name = ANAME;
>>>>>>> +	g->l.name = GNAME;
>>>>>>> +	a->l.brightness_set_blocking =
>>>>>>> bd71828_led_brightness_set;
>>>>>>> +	g->l.brightness_set_blocking =
>>>>>>> bd71828_led_brightness_set;
>>>>>>> +
>>>>>>> +	ret = devm_led_classdev_register(&pdev->dev, &g->l);
>>>>>>> +	if (ret)
>>>>>>> +		return ret;
>>>>>>> +
>>>>>>> +	return devm_led_classdev_register(&pdev->dev, &a->l);
>>>>
>>>> This way you force users to always register two LED class devices
>>>> whereas they might need only one. Please compare how other LED
>>>> class
>>>> drivers handle DT parsing and LED class device registration.
>>>
>>> I am not sure if I understand correctly what you mean by using only
>>> one
>>> class device. As I (hopefully) somewhere said - users can't control
>>> only one of these LEDs. If they decide to enable one led by SW,
>>> then
>>> they inevitably control also the other. Thus it is better that user
>>> gets control to both of the LEDs if they take the control for one.
>>>
>>> Or do you mean I could achieve the control for both of these LEDs
>>> via
>>> only one class device?
>>
>> AFAIU the LEDs, when in SW mode, can be controlled independently,
>> right?
> 
> Yes and no. Both of the LEDs can be forced on/off individually - as
> long as one of them is forced ON. If both LEDs are tried to be forced
> OFF - then both LEDs are controlled by HW. If both are controlled by HW
> and then one is forced ON - the other is also no longer controlled by
> HW and is forced OFF.
> 
> Eg, bits 0x80 and 0x40 are conrols for these LEDs. 0x80 for one, 0x40
> for the other. Setting bit means LED is on, clearing means LED is off -
> with the HW control twist... If either of the bits is set - then both
> leds are controlled by these bits (SW control). If both bits are
> cleared, then LEDs are controlled by HW (likely to be off but not for
> sure).

Thank you for the explanation. So they can be represented by separate
LED class devices. Driver logic will just need to update the state of
the sibling LED if it will be affected.

>> Because if not then there is no point in having separate LED class
>> devices.
>>
>> But if I get it right, then allowing for registering only one LED
>> class
>> device is entirely justifiable - think of a situation when the iout
>> remains not connected on the board.
> 
> Yes. This might be unlikely - but this is the reason why I consider
> adding the DT support. I just am not sure if covering this scenario now
> is worth the hassle. I tend to think we should only add the DT support
> if someone actually produces a board where this LED is not connected.

Could you share what board you're working with?

>>> Yet another thing for me to learn =) I looked at the trigger
>>> properties
>>> in DT. That looked like a way to make the LED framework to "bind"
>>> the
>>> LED state to some trigger. (For example make the LED framework to
>>> toggle specific LED state when USB device is plugged?)
>>>
>>> If this is the case then it might not be relevant for BD71828. Here
>>> the
>>> LED is by-default controlled by HW. Eg, when charger starts
>>> charging
>>> the battery, the PMIC will lit the LED. It will do so also when
>>> power
>>> button is pressed or certain problems are detected. This reqires no
>>> SW
>>> interaction.
>>
>> The trigger can be always deactivated from sysfs as well as set up
>> again.
>>
>>> What this driver intends to do is to allow SW to take over this.
>>> Eg, if
>>> system is designed so that it is preferably to use these LEDs for
>>> some
>>> other purpose it can be done by loading this LED driver and
>>> allowing
>>> user-space to control these LEDs via sysfs.
>>
>> So the LED trigger interface would help to signalize in which state
>> the LED is. If the trigger is set then it means the LED is under hw
>> control.
> 
> This might be handy. I need to check the data-sheet because I think
> there was own control for using one of the LEDs for charge indicator.
> It might be that by-default the HW control of LEDs means that only the
> power button presses are signaled via these LEDs. This trigger thing
> could be handy for enabling/disabling also the charge indication as
> well as for checking if LEDs are in forced state - although this might
> be somewhat complicated because the 'turn led on' bit is connected to
> the 'trigger'. Eg, even if the trigger says that SW is controlling LED,
> turning off the LED may mean that trigger changes. But well, this is
> the HW design we are dealing with at this time :/ In any case, I'll
> leave this as further dev item for now.
> 
> Again, thanks for all the help!
> 
> Br,
> 	Matti Vaittinen
> 

-- 
Best regards,
Jacek Anaszewski
