Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB6DD3052C7
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 07:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234912AbhA0GDR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 01:03:17 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:21152 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236905AbhA0DoD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 22:44:03 -0500
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20210127021848epoutp02b993e9315554e6c886521e0f2e66c862~d9UdrEemb1419514195epoutp02T
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 02:18:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20210127021848epoutp02b993e9315554e6c886521e0f2e66c862~d9UdrEemb1419514195epoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1611713928;
        bh=WM7q4kf5G65rwCE/0Jl15sKtPpk5oSXqV+eNHf4TN20=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=Rz6K6WNU19HSuBpzOOdAT4Jbc8AQ/SvztIm0S35FNyLEqQ2+gArnIiAkoC1KMV8j2
         /xKTsj6KFFTqeEEVH6uWAAfP95TDUxR6Vb5IxDXdeN02tvHL3ea7RiVit0HF1Tun+6
         89eNZPkdjZ3JEjepklrXQIeQdfxN6tc+2aavbyxA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20210127021848epcas2p4da6494e12ac663a2a11eaf33573f3776~d9UdaJM7L2013720137epcas2p4F;
        Wed, 27 Jan 2021 02:18:48 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.186]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4DQS2b0J7Pz4x9QK; Wed, 27 Jan
        2021 02:18:47 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        94.4C.05262.38DC0106; Wed, 27 Jan 2021 11:18:43 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20210127021842epcas2p3b0c438b9780fa5340ee9ffe81d17b9e3~d9UYAgP221569115691epcas2p3s;
        Wed, 27 Jan 2021 02:18:42 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210127021842epsmtrp2cc772307910a842a53cf973fb75644fa~d9UX-wkaE1013310133epsmtrp2l;
        Wed, 27 Jan 2021 02:18:42 +0000 (GMT)
X-AuditID: b6c32a47-b81ff7000000148e-50-6010cd83420c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        26.1F.08745.28DC0106; Wed, 27 Jan 2021 11:18:42 +0900 (KST)
Received: from KORCO039056 (unknown [10.229.8.156]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210127021842epsmtip2201a40ae656475e840a4f52166b19ca1~d9UXyq9Y31702617026epsmtip2B;
        Wed, 27 Jan 2021 02:18:42 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Linus Walleij'" <linus.walleij@linaro.org>
Cc:     "'open list:GPIO SUBSYSTEM'" <linux-gpio@vger.kernel.org>,
        "'Krzysztof Kozlowski'" <krzk@kernel.org>
In-Reply-To: <CACRpkdbAfAsJEhvLosrZCHcdRRTUYgLSR0McykxCamqEE=d8mg@mail.gmail.com>
Subject: RE: [pinctrl:devel 32/33]
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c:296:25: error: passing argument 1
 of 'spin_unlock_irqrestore' from incompatible pointer type
Date:   Wed, 27 Jan 2021 11:18:42 +0900
Message-ID: <002801d6f452$bb86d640$329482c0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHfPgJ7vKMTCmjJO21WdD9GUhLuoAGwfof8ARRZf3YCbLP0GqoAnDsQ
Content-Language: ko
x-msg-type: PERSONAL
x-drm-type: PERSONAL
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOKsWRmVeSWpSXmKPExsWy7bCmmW7zWYEEgw+PuS3On9/AbjHlz3Im
        i83z/zA6MHtsWtXJ5nHn2h42j8+b5AKYo3JsMlITU1KLFFLzkvNTMvPSbZW8g+Od403NDAx1
        DS0tzJUU8hJzU22VXHwCdN0yc4AWKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0tslVILUnIK
        DA0L9IoTc4tL89L1kvNzrQwNDIxMgSoTcjLmPU4q+MJU8X7JWpYGxjlMXYwcHBICJhLz/qt3
        MXJxCAnsYJQ42vuUHcL5xCixYMtNNgjnM6PEz+0L2GE6pm3jg4jvYpTYemspE4TzglFi57Jz
        QB2cHGwC+hIvO7axgtgiAgYS989PYwexmQWyJLa2T2IGsTkFAiWW7JzLDNIsLLCWUeLM96+M
        IBtYBFQlFk/TA6nhFbCU2Db/NyOELShxcuYTFog58hLb384BmyMhoCDx8+kyqF1uEnfXPIDa
        JSIxu7MNqkZEonvLbaiXRSTu7EkBWSshMJVDYlLHcTaIGheJCzd/s0PYwhKvjm+BsqUkPr/b
        ywbR0M0o0froP1RiNaNEZ6MPhG0v8Wv6FlaQBcwCmhLrd+lD7FKWOHIL6mQ+iY7Df6FhyCvR
        0SY0gVFlFpLHZiF5bBaSB2YhzFzAyLKKUSy1oDg3PbXYqMAYOaY3MYJToJb7DsYZbz/oHWJk
        4mA8xCjBwawkwvteWSBBiDclsbIqtSg/vqg0J7X4EKMpMKQnMkuJJucDk3BeSbyhqZGZmYGl
        qYWpmZGFkjhvscGDeCGB9MSS1OzU1ILUIpg+Jg5OqQYm5vUpDr3PDRbuUd+erd0xKaLm70kP
        kXsS8VylpvMk5a7FL7Q9tkpRTPJSVs/2O/a93ZW7Ta8vF3c5Krj0zaOv/eXPBBi0A69u0L27
        1KijQOc8w8dSt1yuLU/8zs99Y7/iRkrX8yoPnbyC03FFxTpFNSut9EMT2S9FBbzm3JxQy8t/
        58oDtrnZr0+4fp7+J2/Veon90w8cm1Pr7j9f8NUqq+jntZO7Yzz/nt+h7r9raf3+29l9MnOT
        jhyIvG+0pb/oWsZfn026iepJokbb7Tx+HBC/8tLQ+NNRTj6udJPDS/+u9Hpx+pppxIMLX6pC
        hLbX7lf7NeudidT6U8J3mV6yL/UI2rCjf87RVbszvTZGKrEUZyQaajEXFScCAEI4ChgKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRmVeSWpSXmKPExsWy7bCSvG7TWYEEgydTFCzOn9/AbjHlz3Im
        i83z/zA6MHtsWtXJ5nHn2h42j8+b5AKYo7hsUlJzMstSi/TtErgy5j1OKvjCVPF+yVqWBsY5
        TF2MHBwSAiYS07bxdTFycQgJ7GCUuHD5HlCcEyguK/Hs3Q52CFtY4n7LEVaIomeMEse//QZL
        sAnoS7zs2MYKYosIGEjcPz+NHWQos0CWRMsUC4j6b4wSK3cvA6vhFAiUWLJzLjNIQlhgJaPE
        78nnWEAaWARUJRZP0wOp4RWwlNg2/zcjhC0ocXLmExYQm1lAW6L3YSsjhC0vsf3tHGaI4xQk
        fj6FmA9y6KvjW6CONpW48HUFE8RtbhJ31zxgh+gVkZjd2QbVKyLRveU2NCBEJO7sSZnAKD4L
        yeZZSDbPQrJ5FpJJCxhZVjFKphYU56bnFhsWGOWllusVJ+YWl+al6yXn525iBEebltYOxj2r
        PugdYmTiYDzEKMHBrCTC+15ZIEGINyWxsiq1KD++qDQntfgQozQHi5I474Wuk/FCAumJJanZ
        qakFqUUwWSYOTqkGpsilUW+tH3ro3Qg8cXGeXsuRLWVCZfNn/VcTPaeyMHb/kv9FeucKdptJ
        Tgi5cWzf5v1tHL43Vm/5L6LQa9u96aF36RGlGhV+5l9xlZcVFaxmb+Y2uHrNbJ6yl3LjpIsX
        Zrik5s7xWCgT4a49b4d9XbVvaaCS5HsehbL9jH9+F56YLfAwMv97lGH9pOC+s/MTT85VOm7A
        9WtOsu785O2/N5488D3n16pdgYl35S9t9e65bc0UWnvQX/Ddpvd1khOO7lunPs0iMUn15ByO
        Xb68ByRmJDwqviZjbbBkO8dtiR1ftyTdm/Em5878KVsWu18+qtyVfWVXgNImpo+eV/59UOVi
        ERZdyPd5jvGETbIXN85WYinOSDTUYi4qTgQAUsrOViUDAAA=
X-CMS-MailID: 20210127021842epcas2p3b0c438b9780fa5340ee9ffe81d17b9e3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210125232704epcas2p4f362849a8f5e85f46d406d20b7983429
References: <CGME20210125232704epcas2p4f362849a8f5e85f46d406d20b7983429@epcas2p4.samsung.com>
        <202101260734.haBuNSsB-lkp@intel.com>
        <000001d6f377$6c1b3af0$4451b0d0$@samsung.com>
        <CACRpkdbAfAsJEhvLosrZCHcdRRTUYgLSR0McykxCamqEE=d8mg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> > I was not aware PINCTRL_S3C64XX because it's not enabled in
> > s3c6410_defconfig.
> > Please pick the v2 patch. Sorry for the inconvenience.
> 
> I can't do that because I have merged other stuff on top and pulled in
> other branches.
> 
> Please send a fix-up patch.

I posted a patch on top of the previous patch.
Thanks.

Best Regards,
Chanho Park

