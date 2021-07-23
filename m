Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCC23D3410
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 07:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233713AbhGWErp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 00:47:45 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:16652 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbhGWEro (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 00:47:44 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20210723052817epoutp0283c455b59253b4a33e9c233ac30e766a~UVFbYjpJ12828028280epoutp02W
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 05:28:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20210723052817epoutp0283c455b59253b4a33e9c233ac30e766a~UVFbYjpJ12828028280epoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1627018097;
        bh=CxCH/jPaDOWx+nTg9UWRrcPhdD4SDD1WTqwmoBkQExQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Hu77risrXpuhj4zcXY93prlEEIa/Lqm410bMfMHH0jM6jBPnF7SQCeGLlkOPVQgo7
         AS0w+koPXMJH4YWYNOEWlu9gwyGJbb5QJ4uUfBEsx1CmoLRpniAgOa9EeLK65/6FKg
         PddDL7rF67UlnK8l0NodmIDnDZDBFkmSQLCYmJYQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20210723052816epcas1p4e99c2fcdce2ee90189c1a9cb65b43cb4~UVFaVBOQn1549015490epcas1p4P;
        Fri, 23 Jul 2021 05:28:16 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.157]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4GWHsV1Jt0z4x9QZ; Fri, 23 Jul
        2021 05:28:14 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        C9.CF.13454.8635AF06; Fri, 23 Jul 2021 14:28:08 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20210723052808epcas1p49a6b786c261e245362d38e651c808ac0~UVFTM2q811716617166epcas1p4T;
        Fri, 23 Jul 2021 05:28:08 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210723052808epsmtrp1894c6f82ecbba8d5097d0aa87775a6e6~UVFTMPALo1496714967epsmtrp1d;
        Fri, 23 Jul 2021 05:28:08 +0000 (GMT)
X-AuditID: b6c32a39-16fff7000002348e-89-60fa53688d8b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        57.88.08394.8635AF06; Fri, 23 Jul 2021 14:28:08 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210723052808epsmtip1dfc44a1fae401779b5d8b520e70aa1a9~UVFS-l8bI0421704217epsmtip1f;
        Fri, 23 Jul 2021 05:28:08 +0000 (GMT)
Subject: Re: [PATCH] extcon: max3355: Drop unused include
To:     Linus Walleij <linus.walleij@linaro.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <e88775a5-d606-a6ca-4566-52835feb24a3@samsung.com>
Date:   Fri, 23 Jul 2021 14:47:57 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20210715152657.396185-1-linus.walleij@linaro.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplk+LIzCtJLcpLzFFi42LZdljTQDcj+FeCwcNWc4spf5YzWWye/4fR
        4vKuOWwWtxtXsFmcWXWL3YHV48HU/0wed67tYfPo27KK0ePzJrkAlqhsm4zUxJTUIoXUvOT8
        lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygvUoKZYk5pUChgMTiYiV9O5ui
        /NKSVIWM/OISW6XUgpScAssCveLE3OLSvHS95PxcK0MDAyNToMKE7Iz/Wy6zF5xmq1h90aGB
        cTdrFyMnh4SAicScx6vZuhi5OIQEdjBKnLm5lh3C+cQocfTYVUYI5xujxN/r14EcDrCWuf+1
        IeJ7GSUOL5sLNkpI4D2jxMdNZSC2sIClxLYJ55lBbBGBcIl9xw6A2cwCJRJtbZ/ZQGw2AS2J
        /S9ugNn8AooSV388ZgSxeQXsJO6/P8wOsotFQFXi/HZFkLCoQJjEyW0tUCWCEidnPmEBsTkF
        7CV+/TnBDjFeXOLWk/lMELa8xPa3c5ghvmzlkJhy2RTCdpHoaJrCCGELS7w6voUdwpaSeNnf
        BmVXS6w8eQQcKhICHYwSW/ZfgAaXscT+pZOZQG5jFtCUWL9LHyKsKLHz91xGiL18Eu++9rBC
        gopXoqNNCKJEWeLyg7tMELakxOL2TrYJjEqzkHwzC8kHs5B8MAth2QJGllWMYqkFxbnpqcWG
        BabIMb2JEZwetSx3ME5/+0HvECMTB+MhRgkOZiUR3iOBvxKEeFMSK6tSi/Lji0pzUosPMZoC
        g3cis5Rocj4wQeeVxBuaGhkbG1uYGJqZGhoqifN+i/2aICSQnliSmp2aWpBaBNPHxMEp1cCU
        uM+R9eWbspLw5txY21NnLtc1ZjFZLmwN6G1Ir54829T6MouSf3XaJjmnI3bcnCn1fZrTxW/P
        +WXUsGjJ4me392/Pc2TPsn9+1SzTVbF/h6XWQ4O/sx57fHGIP/t5+17VzTaXvBZduSO+Srpt
        d7Nhiu4pxguREazMyY0iF/Ze4jT6O1kh0FCxsGL/ro0nmBLrmy6U/DK4qHyI+e2Xq1bFF0Q/
        ZkWyq6/R+rV6+Znnhz+pbzPJW1+SzXF/o6bMTcmdMw503Vzw5Z2O0dNPm7d9fx6/JeaScVN8
        wPoV72NkJ/luKU+b2nX6tN2sl6/n33ay456d7q3X+tTwV+oV96klK2b94HqrGsXPrftJfLaO
        EktxRqKhFnNRcSIAkeoVIhgEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRmVeSWpSXmKPExsWy7bCSnG5G8K8Eg7Z2OYspf5YzWWye/4fR
        4vKuOWwWtxtXsFmcWXWL3YHV48HU/0wed67tYfPo27KK0ePzJrkAligum5TUnMyy1CJ9uwSu
        jP9bLrMXnGarWH3RoYFxN2sXIweHhICJxNz/2l2MXBxCArsZJTpudLB3MXICxSUlpl08ygxR
        Iyxx+HAxRM1bRomXd0+xgdQIC1hKbJtwnhnEFhEIl5i94D2YzSxQIrF893kmiIZJjBL7dsxn
        BUmwCWhJ7H9xA6yZX0BR4uqPx4wgNq+AncT994fZQZaxCKhKnN+uCBIWFQiT2LnkMRNEiaDE
        yZlPWEBsTgF7iV9/TrBD7FKX+DPvEtRecYlbT+YzQdjyEtvfzmGewCg8C0n7LCQts5C0zELS
        soCRZRWjZGpBcW56brFhgWFearlecWJucWleul5yfu4mRnCsaGnuYNy+6oPeIUYmDsZDjBIc
        zEoivEcCfyUI8aYkVlalFuXHF5XmpBYfYpTmYFES573QdTJeSCA9sSQ1OzW1ILUIJsvEwSnV
        wLR92TWPU3EWXxqXRf8T/HTSkuHFOZV1ZpsKdr68lK4wK+hXhO/jGUeYa/5Y3Hp1lG+RWZif
        mnvewyS/lUVm50rYvkueXlIUI9s6dbs9+2cx8asqB84dST/6SOfgn8d665ZP639ZVLXRqJPt
        ZOVN98WdFqf5Q09/1nR/ZC/1xlnua/P7o161MdWZz2+lyqVs+WvamBW9UdGXUWeLmvkhZ+Zt
        de9buU+srpE4Mc3/Wtz3R/veCAdPVF2WWP9IUVlf6p26LwfzwUul8Yt+uAndjvd9wV+ty15/
        fWGS54ra5V9K6xZsEDaZE6si0T+z0HvV20mTvH7GyJy9H+rQMPFf0vrzKj/v3mVsbrigf72b
        450SS3FGoqEWc1FxIgBGLLWNBAMAAA==
X-CMS-MailID: 20210723052808epcas1p49a6b786c261e245362d38e651c808ac0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210715152907epcas1p1326e92c0358eb514361cf4f6ca2da4e5
References: <CGME20210715152907epcas1p1326e92c0358eb514361cf4f6ca2da4e5@epcas1p1.samsung.com>
        <20210715152657.396185-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 7/16/21 12:26 AM, Linus Walleij wrote:
> This driver includes the legacy <linux/gpio.h> header but
> does not use it. Drop this include.
> 
> Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/extcon/extcon-max3355.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/extcon/extcon-max3355.c b/drivers/extcon/extcon-max3355.c
> index fa01926c09f1..d7795607f693 100644
> --- a/drivers/extcon/extcon-max3355.c
> +++ b/drivers/extcon/extcon-max3355.c
> @@ -7,7 +7,6 @@
>   */
>  
>  #include <linux/extcon-provider.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> 

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
