Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5A93D3411
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 07:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233725AbhGWErq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 00:47:46 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:43873 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233712AbhGWErp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 00:47:45 -0400
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20210723052817epoutp0475fd1adb728802e82e2877c54d393b4e~UVFbtdakU1735317353epoutp04M
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 05:28:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20210723052817epoutp0475fd1adb728802e82e2877c54d393b4e~UVFbtdakU1735317353epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1627018097;
        bh=Giz6luXkypdx/JNqZxPg+aCL0iHWVejqZQpWb26TyJI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=dsSMQS56FPGyFxDi4IWRTUjt9V6vTbE7aYhXTzE7TKhIMNkWmrhhRjzWmK3TCzeC5
         cZ2clCKwBRHcMNdq7FNSU25wFkUC9+xwBec5h9Iv/jWnyjOjCs86Qgq2pe/8ov9sm3
         EveKks5SacdfMXV5ogBd9cZnqttxjSyoeRw2jSPI=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210723052817epcas1p2330085db87d9a7b4aaca77d583c39988~UVFbTFIxX1409714097epcas1p2r;
        Fri, 23 Jul 2021 05:28:17 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.154]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4GWHsV5rG6z4x9QN; Fri, 23 Jul
        2021 05:28:14 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        E2.47.09551.3635AF06; Fri, 23 Jul 2021 14:28:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20210723052803epcas1p3831510d18aeacca8774f8585e1a19fae~UVFOL79RY0494804948epcas1p3l;
        Fri, 23 Jul 2021 05:28:03 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210723052803epsmtrp1e671d7a25dc8f1e7e45367a4c80d010b~UVFOLT80I1496714967epsmtrp1Q;
        Fri, 23 Jul 2021 05:28:03 +0000 (GMT)
X-AuditID: b6c32a36-2c9ff7000000254f-f9-60fa5363bccc
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        F4.88.08394.3635AF06; Fri, 23 Jul 2021 14:28:03 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210723052803epsmtip1132ae8aeadcbd8a214ee7c15fad5705b~UVFOBTIOi0421704217epsmtip1Y;
        Fri, 23 Jul 2021 05:28:02 +0000 (GMT)
Subject: Re: [PATCH] extcon: usb-gpio: Use the right includes
To:     Linus Walleij <linus.walleij@linaro.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <393ac5f7-bd50-d36b-6b33-8ed74be11eea@samsung.com>
Date:   Fri, 23 Jul 2021 14:47:52 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20210715190606.429251-1-linus.walleij@linaro.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmgW5y8K8EgylTtS2m/FnOZLF5/h9G
        i8u75rBZ3G5cwebA4nHn2h42j74tqxg9Pm+SC2COyrbJSE1MSS1SSM1Lzk/JzEu3VfIOjneO
        NzUzMNQ1tLQwV1LIS8xNtVVy8QnQdcvMAdqmpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFV
        Si1IySmwLNArTswtLs1L10vOz7UyNDAwMgUqTMjO+NW6kqmghatiwvYl7A2Myzi6GDk5JARM
        JB6d/83YxcjFISSwg1Hi+MpHzBDOJ0aJza8fsEA43xglvj66xQTT0rF2PztEYi+jxLWTp6D6
        3zNKLJm3gxGkSljAVmL+RZBZnBwiAuES+44dALOZBWwkXm7vZAOx2QS0JPa/uAFm8wsoSlz9
        8Risl1fATuL/lF1g21gEVCU6DrSA2aICYRInt7VA1QhKnJz5hAXE5hSwl9h05yMbxHxxiVtP
        5jNB2PIS29/OYYa4+iu7xMv1yhC2i8SDzoOMELawxKvjW9ghbCmJl/1tUHa1xMqTR9hAHpMQ
        6GCU2LL/AitEwlhi/9LJQAs4gBZoSqzfpQ8RVpTY+XsuI8RePol3X3tYQUokBHglOtqEIEqU
        JS4/uAsNREmJxe2dbBMYlWYh+WYWkg9mIflgFsKyBYwsqxjFUguKc9NTiw0LjJBjexMjOCVq
        me1gnPT2g94hRiYOxkOMEhzMSiK8RwJ/JQjxpiRWVqUW5ccXleakFh9iNAWG70RmKdHkfGBS
        ziuJNzQ1MjY2tjAxNDM1NFQS5/0W+zVBSCA9sSQ1OzW1ILUIpo+Jg1OqgYmpUPfR8QnmLqvm
        7DB3q6x9XhFvya/xJijuewDHE8XJHAf0jusubipT+7g4obG4pe91x4wDXoUf1wR83Bw0VyOw
        hfFGqe6bPSJZjuGGs3bF3dYwEfi5vs5j6pqUgmxRc7nNFuUSPT8EbkzdfrsmdPEkZ2epmH/q
        kiaxvT8fn3khd/2ldbFN+PXnrOUzBL8p/vt1ZOqPJUsqV/MzV6++OvcCB8e3XMY59eeu5327
        7brsm/XBFzvsmrOnFKsGSe/m13vOV/6uSPy/elau/eP5n+bK1H8R4mVYzGnof+xuzc7/W9VX
        s0zZ43alVUCid/0TDrmtVxOe7d6zL+rce9dvescv/t3S+6O7fNUF0wkT3xQqsRRnJBpqMRcV
        JwIAUMJvDxIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSnG5y8K8Eg2kn2S2m/FnOZLF5/h9G
        i8u75rBZ3G5cwebA4nHn2h42j74tqxg9Pm+SC2CO4rJJSc3JLEst0rdL4Mr41bqSqaCFq2LC
        9iXsDYzLOLoYOTkkBEwkOtbuZ+9i5OIQEtjNKDHhwD52iISkxLSLR5m7GDmAbGGJw4eLIWre
        Mkpcvt7GBFIjLGArMf/iI2YQW0QgXGL2gvdgNrOAjcTL7Z1sEA2TGCU+PDzACJJgE9CS2P/i
        BhuIzS+gKHH1x2OwOK+AncT/KbvAhrIIqEp0HGgBs0UFwiR2LnnMBFEjKHFy5hMWEJtTwF5i
        052PbBDL1CX+zLsEtVhc4taT+UwQtrzE9rdzmCcwCs9C0j4LScssJC2zkLQsYGRZxSiZWlCc
        m55bbFhgmJdarlecmFtcmpeul5yfu4kRHB1amjsYt6/6oHeIkYmD8RCjBAezkgjvkcBfCUK8
        KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUwyXOzrDXq2h+Q
        rqfTEV0YurFCsvJy3KnNRzvMZa8Wfb61srKixWbdG+O7X9cs3/qAu+Zbkphi6v4dqTYbbivv
        ePTMqniuLcuOXiOfvXy5Nkd/PPzzmrHphZH86iNCN+QOzv9RYZw5X253qpsW++edhRLMyiU3
        ldun2/s4Pev+HTn1RyXjn5Dw1ikh3/Lla7Y7HelfZzvTf/8Tx0INRe9nqSfcflZs7/WcLODl
        s/GwsU++XFXBMb7IZYlFUd93PHf7bjjhzdWf3ta3vj3L4/x3I+639iRp2z08SueZ1vzzdpgc
        J3CqKv3agkn6fxQdzadwTPv0aL4p9/Pg3EchZjpPf893nf9vv5r5psNhN9leKbEUZyQaajEX
        FScCAOc0zUP9AgAA
X-CMS-MailID: 20210723052803epcas1p3831510d18aeacca8774f8585e1a19fae
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210715195441epcas1p2902263d7e7aeec6213a7ba554eff2695
References: <CGME20210715195441epcas1p2902263d7e7aeec6213a7ba554eff2695@epcas1p2.samsung.com>
        <20210715190606.429251-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 7/16/21 4:06 AM, Linus Walleij wrote:
> The USB GPIO extcon driver does not use any of the legacy
> includes <linux/gpio.h> or <linux/of_gpio.h> but
> exploits the fact that this brings in <linux/mod_device_table.h>.
> Fix this up by using the right includes.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/extcon/extcon-usb-gpio.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
> index f06be6d4e2a9..0cb440bdd5cb 100644
> --- a/drivers/extcon/extcon-usb-gpio.c
> +++ b/drivers/extcon/extcon-usb-gpio.c
> @@ -7,18 +7,17 @@
>   */
>  
>  #include <linux/extcon-provider.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_gpio.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/mod_devicetable.h>
>  
>  #define USB_GPIO_DEBOUNCE_MS	20	/* ms */
>  
> 

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
