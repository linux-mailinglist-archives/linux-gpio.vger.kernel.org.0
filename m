Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B89A7443B11
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 02:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhKCBlE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 21:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbhKCBlD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 21:41:03 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F79C061714;
        Tue,  2 Nov 2021 18:38:27 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id az8so895357qkb.2;
        Tue, 02 Nov 2021 18:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OBY5Q24oLCdJiOFQ4Wr4G9n2vhczi/whcGNmMalBbcU=;
        b=YIDvTcrGObzuJqxdvsrmYDalL+NMUy2YJ2A/rGqD7QWdc8XetgFNilP0M++GiV1ywn
         zju6V6GNC5N/0usDG51SNtkxpBBd9f/2lsBWAc5lGTkKuxPMkhq9s3WMWXKA0Uwh3JmB
         pP20qwVc0hU0nwbBcSe2TI5BVODnNh+12KqC4fk/li661vjfh8tdcfC2Pauot+y1dCKx
         ARcDtbNpwUcVi1gyb8Mt+IJVoRoauhfA37IcnJQLocIBfKbC96EJAHA5fe5J3I6hE6q4
         ouI6OLjWWqBaQY4lBvOpjUJ7k4BO6yMEfefAoWsUZW7Wjj5yUbYquXQf3wvNO87GZXHO
         V7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OBY5Q24oLCdJiOFQ4Wr4G9n2vhczi/whcGNmMalBbcU=;
        b=hu6ud3oSmV7bap8SiyUaCTFSfbbxUuK0cNGTGzv7Nbin8kVvpBysjjoujjU2UaKYEV
         WIehuY0ML5o/6oRmUh3u8KVrQWOvUXgYIYwD9EQxE5/UhkIfIGc1A4XpQelZ6Rf/HkIb
         xvPrVkYdc+qL7WAo8uubQqoJfvTs1IxwhYTke9bL5uBFpB43NZfAhwas0JWkD4leW36f
         ly5wyKqp7pyLW0VESgKzyXwHm3OvrXa+jo/qizrblynXQwSO7pWxbA3HoQ4N4G8Hmkzc
         FapBPT/S5xHSI4ilL8fE7o53WLj0c+Pky8gPvorklB3w/0DcAl87dlDAZCO/oy8UzhRU
         URNA==
X-Gm-Message-State: AOAM532SlewUi1REa683CXB4nCvsyLlprhNPVX+EO01HqTzxuRW1urw0
        goIDcEnlZ7fp5qRA0VIEdk8=
X-Google-Smtp-Source: ABdhPJw7RUY/tEZEerSqMNS7jwE9g8ZmJdoZ7rmhME/TSctr8N0uqrySZo031wybo7Vm+WaLIaLHDQ==
X-Received: by 2002:a37:660f:: with SMTP id a15mr4332943qkc.73.1635903506846;
        Tue, 02 Nov 2021 18:38:26 -0700 (PDT)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id c3sm577825qtx.53.2021.11.02.18.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 18:38:26 -0700 (PDT)
Message-ID: <c97c45ac-d9d6-a21b-9c43-69f58b07f265@gmail.com>
Date:   Tue, 2 Nov 2021 21:38:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 02/13] dt-bindings: pinctrl: add i.MXRT1050 pinctrl
 binding doc
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     mturquette@baylibre.com, aisheng.dong@nxp.com,
        linux@armlinux.org.uk, s.hauer@pengutronix.de,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        adrian.hunter@intel.com, linux-mmc@vger.kernel.org,
        kernel@pengutronix.de, shawnguo@kernel.org,
        linus.walleij@linaro.org, linux-serial@vger.kernel.org,
        jirislaby@kernel.org, robh+dt@kernel.org, abel.vesa@nxp.com,
        festevam@gmail.com, ulf.hansson@linaro.org,
        linux-kernel@vger.kernel.org, stefan@agner.ch, olof@lixom.net,
        sboyd@kernel.org, nobuhiro1.iwamatsu@toshiba.co.jp,
        linux-clk@vger.kernel.org, arnd@arndb.de,
        devicetree@vger.kernel.org, linux-imx@nxp.com, soc@kernel.org,
        gregkh@linuxfoundation.org, giulio.benetti@benettiengineering.com
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-3-Mr.Bossman075@gmail.com>
 <1635902437.626178.3880384.nullmailer@robh.at.kernel.org>
From:   Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <1635902437.626178.3880384.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/2/21 21:20, Rob Herring wrote:
> On Tue, 02 Nov 2021 18:56:50 -0400, Jesse Taube wrote:
>> From: Jesse Taube <mr.bossman075@gmail.com>
>>
>> Add i.MXRT1050 pinctrl binding doc
>>
>> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>> ---
>> V1->V2:
>> * Replace macros with values
>> * Add tab for last pinctrl value
>> ---
>>   .../bindings/pinctrl/fsl,imxrt1050.yaml       | 83 +++++++++++++++++++
>>   1 file changed, 83 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
Ah I thought it would stop make at error i see it now, is there a way to 
do one file.
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml: $id: relative path/filename doesn't match actual path or filename
> 	expected: http://devicetree.org/schemas/pinctrl/fsl,imxrt1050.yaml#
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dt.yaml: iomuxc@401f8000: 'fsl,mux_mask', 'imxrt1050-evk' do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/fsl,imxrt1050.example.dt.yaml: iomuxc@401f8000: 'pinctrl-0' is a dependency of 'pinctrl-names'
> 	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/pinctrl/pinctrl-consumer.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1549987
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
