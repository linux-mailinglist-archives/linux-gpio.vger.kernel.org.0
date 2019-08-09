Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA4A8877FB
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 12:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406428AbfHIKzS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 06:55:18 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46462 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406093AbfHIKzS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 06:55:18 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x79At644119000;
        Fri, 9 Aug 2019 05:55:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565348106;
        bh=EuFRbPO24ydwIrvN4X9jukmq4Ulhmnp4FtEkRmDum1c=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=lv0eUFWtcdzYUOYpKZ9h6xZmtzW1Wg8fBnZ/xS0RypnEJok9ZZ6x6+jJLcLLksRqh
         HF5q9XuSnJXac9PXQ3H6xXt8BJ/EJPhhmoahDgtGInKNjCYT+h6MRhhr5u5sH57spL
         ENc3OQBWtOzrJsS+8swz3rHfG6U2FrUdUm5hzDNc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x79At6uu000734
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 9 Aug 2019 05:55:06 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 9 Aug
 2019 05:55:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 9 Aug 2019 05:55:04 -0500
Received: from [172.24.191.45] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x79At1cW079749;
        Fri, 9 Aug 2019 05:55:02 -0500
Subject: Re: [PATCH 1/6] dt-bindings: gpio: davinci: Add new compatible for
 J721E SoCs
To:     Lokesh Vutla <lokeshvutla@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Nishanth Menon <nm@ti.com>, <linus.walleij@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
 <20190809082947.30590-2-lokeshvutla@ti.com>
From:   Keerthy <j-keerthy@ti.com>
Message-ID: <3d001f23-6389-d5c2-4037-9a36e057db41@ti.com>
Date:   Fri, 9 Aug 2019 16:25:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809082947.30590-2-lokeshvutla@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 09/08/19 1:59 PM, Lokesh Vutla wrote:
> J721e SoCs have same gpio IP as K2G davinci gpio. Add a new compatible to
> handle J721E SoCs.

Reviewed-by: Keerthy <j-keerthy@ti.com>

> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>   Documentation/devicetree/bindings/gpio/gpio-davinci.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> index bc6b4b62df83..cd91d61eac31 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
> @@ -6,6 +6,7 @@ Required Properties:
>   						66AK2E SoCs
>   			"ti,k2g-gpio", "ti,keystone-gpio": for 66AK2G
>   			"ti,am654-gpio", "ti,keystone-gpio": for TI K3 AM654
> +			"ti,j721e-gpio", "ti,keystone-gpio": for J721E SoCs
>   
>   - reg: Physical base address of the controller and the size of memory mapped
>          registers.
> 
