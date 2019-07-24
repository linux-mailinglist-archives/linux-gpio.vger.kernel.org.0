Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 266DC72C18
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jul 2019 12:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbfGXKJF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jul 2019 06:09:05 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:37780 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbfGXKJE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jul 2019 06:09:04 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20190724100901epoutp037fa9fffa708c64f82063f862e1fcc2fd~0UAJgY4T73038830388epoutp03i
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jul 2019 10:09:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20190724100901epoutp037fa9fffa708c64f82063f862e1fcc2fd~0UAJgY4T73038830388epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1563962941;
        bh=M76xakPDx2OTv/uYhsVSzoNlBCf/2Sk7P7BT1WxznQ0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Ao7/EbTdhhogTxPVyoaPgTDPTki+xUjmLoEEocZ1FSXtgL7ml+h9wpR4txVpRvm+W
         sCbktKAKAQR19+ZXGFOQIVNf3FjpVMPlWuoTI5apzkwMNg4jZQZdZu929Xrupz3/Yu
         zdWa+QZaSjKAgItsiC6pt03WirMtVo7bf97gIQuc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20190724100901epcas1p45d07e4fc95975aa4404b76b1c6792c17~0UAJMsrJg0488304883epcas1p4_;
        Wed, 24 Jul 2019 10:09:01 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.156]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 45trfM2nWGzMqYkV; Wed, 24 Jul
        2019 10:08:59 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        E0.BB.04160.B3E283D5; Wed, 24 Jul 2019 19:08:59 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20190724100858epcas1p3e612bfe234c495208efbf160fe61e05a~0UAG8IsOh1360913609epcas1p3b;
        Wed, 24 Jul 2019 10:08:58 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190724100858epsmtrp23a8d686322ef42d79e3dcc62ba5b13a5~0UAG7V4NS0817208172epsmtrp20;
        Wed, 24 Jul 2019 10:08:58 +0000 (GMT)
X-AuditID: b6c32a38-b4bff70000001040-17-5d382e3b6f66
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        89.42.03706.A3E283D5; Wed, 24 Jul 2019 19:08:58 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190724100858epsmtip15f6cb6fc9f00891c14a64916c9e8b837~0UAGwpD0D1096010960epsmtip1M;
        Wed, 24 Jul 2019 10:08:58 +0000 (GMT)
Subject: Re: [PATCH] extcon: fsa9480: Support the FSA880 variant
To:     Linus Walleij <linus.walleij@linaro.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Mike Lockwood <lockwood@google.com>,
        devicetree@vger.kernel.org,
        "cpgs (cpgs@samsung.com)" <cpgs@samsung.com>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <2e832c87-71ea-af32-211d-a301cf58cb04@samsung.com>
Date:   Wed, 24 Jul 2019 19:12:01 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723174301.31278-1-linus.walleij@linaro.org>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHJsWRmVeSWpSXmKPExsWy7bCmnq61nkWswb73QhYvD2lazD9yjtVi
        yp/lTBab5/9htLi8aw6bxetFa9gtbjeuYHNg91iwqdTjzrU9bB59W1YxenzeJBfAEpVtk5Ga
        mJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeYm2qr5OIToOuWmQO0X0mhLDGnFCgU
        kFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYFmgV5yYW1yal66XnJ9rZWhgYGQKVJiQnXFv4UKW
        gv98FXufdbI2MM7j6WLk4JAQMJHYN4exi5GLQ0hgB6NE7/aHrBDOJ0aJE1e2sUM43xglJnTf
        Z+li5ATr6G9ezAaR2MsoMWNjD1T/e0aJ+9umMoFUCQs4SJxf1MEIYosIhEvsO3aAGaSIWWA9
        o8TfOXPYQBJsAloS+1/cALP5BRQlrv54DNbAK2AnseTpYlYQm0VAVeLjknNgcVGBCIlPDw6z
        QtQISpyc+YQF5AlOoPqupWDXMQuIS9x6Mp8JwpaXaN46G2yvhMBzNomjt36wQ7zgInFh6mJG
        CFtY4tXxLVBxKYnP7/ayQdjVEitPHmGDaO5glNiy/wIrRMJYYv/SyUwgi5kFNCXW79KHCCtK
        7Pw9F2omr0TDxt/sEEfwSbz72sMKCWxeiY42IYgSZYnLD+4yTWBUnoXkm1lIXpiF5IVZCMsW
        MLKsYhRLLSjOTU8tNiwwQY7tTYzgtKllsYNxzzmfQ4wCHIxKPLwKDOaxQqyJZcWVuYcYJTiY
        lUR4AxvMYoV4UxIrq1KL8uOLSnNSiw8xmgIDeyKzlGhyPjCl55XEG5oaGRsbW5gYmpkaGiqJ
        8877oxkrJJCeWJKanZpakFoE08fEwSnVwFiloHuz5GcEc81ThzrjZ4b/NqU8M1ebs+vyqcM9
        5QuFCo90P+V9+bZ/ntTquZdtxdebuJ64m3/hbN/UtoZw5jmCc1cut0k6uTomc3fCm8dbmxh/
        uTw5fe7IwcNeGzpLug71HC/wKghkdqt2+sBT8jEnkiPa4mbXxrD1B08Ghld6Nwf7JMUdXqrE
        UpyRaKjFXFScCAD/nDuWsQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42LZdlhJTtdKzyLW4ECHucXLQ5oW84+cY7WY
        8mc5k8Xm+X8YLS7vmsNm8XrRGnaL240r2BzYPRZsKvW4c20Pm0ffllWMHp83yQWwRHHZpKTm
        ZJalFunbJXBl3Fu4kKXgP1/F3medrA2M83i6GDk5JARMJPqbF7N1MXJxCAnsZpT4eOwGI0RC
        UmLaxaPMXYwcQLawxOHDxRA1bxklvqzcxgZSIyzgIHF+UQdYvYhAuMTsBe+ZQYqYBdYzSqxv
        WsgOkhASmMgosWmjCojNJqAlsf/FDbBmfgFFias/HoM18wrYSSx5upgVxGYRUJX4uOQcWFxU
        IELi8I5ZUDWCEidnPmEBOYgTqL5rKQtImFlAXeLPvEvMELa4xK0n85kgbHmJ5q2zmScwCs9C
        0j0LScssJC2zkLQsYGRZxSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kRHD9amjsYLy+J
        P8QowMGoxMOrwGAeK8SaWFZcmXuIUYKDWUmEN7DBLFaINyWxsiq1KD++qDQntfgQozQHi5I4
        79O8Y5FCAumJJanZqakFqUUwWSYOTqkGRsEXBku2PGTq9Ps8w/XimeKsspD3e37+2n+4c+st
        wcrowh+u8u+O8EZfc1CXUVMXV7fZdOv+vCXmO8QXuV5+kiT5OK9x654fImZ2/9s3hNx4+trd
        aJm2zCQ2kT/zVe5Xu3/zyuLaLcz4j/OiiKmm0ZkJMu+ltLOFXB5dvOrALpXCVH4k8sAnGSWW
        4oxEQy3mouJEAHtipjGbAgAA
X-CMS-MailID: 20190724100858epcas1p3e612bfe234c495208efbf160fe61e05a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
X-CPGSPASS: Y
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190723174344epcas3p4dc935720d75f93a5ca0181662bc8036f
References: <CGME20190723174344epcas3p4dc935720d75f93a5ca0181662bc8036f@epcas3p4.samsung.com>
        <20190723174301.31278-1-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19. 7. 24. 오전 2:43, Linus Walleij wrote:
> The older compatible variant of this chip is called FSA880
> and works the same way, if we need some quirks in the future,
> it is good to let it have its own compatible string.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt | 4 +++-
>  drivers/extcon/extcon-fsa9480.c                             | 1 +
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt b/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
> index d592c21245f2..624bd76f468e 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
> +++ b/Documentation/devicetree/bindings/extcon/extcon-fsa9480.txt
> @@ -5,7 +5,9 @@ controlled using I2C and enables USB data, stereo and mono audio, video,
>  microphone, and UART data to use a common connector port.
>  
>  Required properties:
> - - compatible : Must be "fcs,fsa9480"
> + - compatible : Must be one of
> +   "fcs,fsa9480"
> +   "fcs,fsa880"
>   - reg : Specifies i2c slave address. Must be 0x25.
>   - interrupts : Should contain one entry specifying interrupt signal of
>     interrupt parent to which interrupt pin of the chip is connected.
> diff --git a/drivers/extcon/extcon-fsa9480.c b/drivers/extcon/extcon-fsa9480.c
> index 350fb34abfa0..8405512f5199 100644
> --- a/drivers/extcon/extcon-fsa9480.c
> +++ b/drivers/extcon/extcon-fsa9480.c
> @@ -363,6 +363,7 @@ MODULE_DEVICE_TABLE(i2c, fsa9480_id);
>  
>  static const struct of_device_id fsa9480_of_match[] = {
>  	{ .compatible = "fcs,fsa9480", },
> +	{ .compatible = "fcs,fsa880", },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, fsa9480_of_match);
> 

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
