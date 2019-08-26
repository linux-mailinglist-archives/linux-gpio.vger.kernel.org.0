Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA7689CD42
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2019 12:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730046AbfHZK16 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Aug 2019 06:27:58 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52910 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727000AbfHZK15 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Aug 2019 06:27:57 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7QARm4n054647;
        Mon, 26 Aug 2019 05:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566815268;
        bh=YWHVURUrhUE33nyl7WY/1NgZ8W0drZvMa/4E7A6cFy0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vuPzmI8TOy8nbFaSQzDbimDMLEFReNK+9kX1zJAp8z8l4fqMTm2bZsu22dCKx0+55
         Qb1dzxG8f5LzUF4b1miskTnHqLx9INKxu8ppqmPFMjazcQGM9pfGx6NL/ej5QHNKxt
         g4r13f3DjHOA9JuyziSvDJp2Up8JLfzvNu7XXyr0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7QARmSj008635
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 26 Aug 2019 05:27:48 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 26
 Aug 2019 05:27:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 26 Aug 2019 05:27:48 -0500
Received: from [172.24.190.117] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7QARjSu013692;
        Mon, 26 Aug 2019 05:27:46 -0500
Subject: Re: [PATCH 5/6] dt-bindings: pinctrl: k3: Introduce pinmux
 definitions for J721E
To:     Rob Herring <robh@kernel.org>
CC:     Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        <linus.walleij@linaro.org>, Keerthy <j-keerthy@ti.com>,
        <linux-gpio@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
 <20190809082947.30590-6-lokeshvutla@ti.com> <20190821210232.GA22578@bogus>
From:   Lokesh Vutla <lokeshvutla@ti.com>
Message-ID: <da0286cb-8e4c-e12c-240c-b6de72bdd0ee@ti.com>
Date:   Mon, 26 Aug 2019 15:56:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190821210232.GA22578@bogus>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On 22/08/19 2:32 AM, Rob Herring wrote:
> On Fri, Aug 09, 2019 at 01:59:46PM +0530, Lokesh Vutla wrote:
>> Add pinctrl macros for J721E SoC. These macro definitions are
>> similar to that of AM6, but adding new definitions to avoid
>> any naming confusions in the soc dts files.
>>
>> Acked-by: Nishanth Menon <nm@ti.com>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>>  include/dt-bindings/pinctrl/k3.h | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/include/dt-bindings/pinctrl/k3.h b/include/dt-bindings/pinctrl/k3.h
>> index 45e11b6170ca..499de6216581 100644
>> --- a/include/dt-bindings/pinctrl/k3.h
>> +++ b/include/dt-bindings/pinctrl/k3.h
>> @@ -32,4 +32,7 @@
>>  #define AM65X_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
>>  #define AM65X_WKUP_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
>>  
>> +#define J721E_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
>> +#define J721E_WKUP_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
> 
> checkpatch reports a parentheses error:         (((pa) & 0x1fff) ((val) | (muxmode)))

This was left intentionally as this macro is giving out two entries in DT like
below:

	pinctrl-single,pins = <
		J721E_IOPAD(0x0, PIN_INPUT, 7)
	>;

comes out as

	pinctrl-single,pins = <
		0x0 (PIN_INPUT | 7)
	>;

If parenthesis are added for the whole macro, the following build error occurs:
  DTC     arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb
Error: arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts:41.24-25 syntax error
FATAL ERROR: Unable to parse input tree


Thanks and regards,
Lokesh
