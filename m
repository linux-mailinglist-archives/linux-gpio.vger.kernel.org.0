Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4EF24836E
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 12:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgHRK7b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 06:59:31 -0400
Received: from sonic309-13.consmr.mail.bf2.yahoo.com ([74.6.129.123]:44535
        "EHLO sonic309-13.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726473AbgHRK73 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Aug 2020 06:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1597748366; bh=NajTNMrfMLb6UXcjRhYpYerQX8PtVBLz0oFgaMINSWY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=HCBzfySwJXLbY/S8UoqWqvEjKd5MMwVL80pdq6HG/8sNKkuZ5S3/bQOQndAYkT63KcU/hn3h0wD+c4Iv4XdMS05Y650rG4dHJVTVUlbk4ZJpIJCCIR22v5ku+cRl1+TfS3RXvfy1paugyrqLpyE1976SFGDIABjwgijwoMF+8ld2rV9lBQE0EBPDggZHa5f0FpWSxp+AZIhqv5rdqnC2v5vcm70EXEx4DfCpf/kwr5KYte7ik5gcxaDzOwaRZnBPhHyKgYnGkkTsp50Z3jFJYqAWlieF+oREyZIxHfYzvzpdDOnyh5XIWedXikmNATLWVivzjvrORDIbXjq9WfcbVw==
X-YMail-OSG: 6Vr5whMVM1lQGLnNl.7Qm8obUi1Fark8WHN_n1KuKZYczmUkfRoQzQ17XTs18H1
 YLOnqnDRuNonSIcbaoVaQJfb.cGS7MvqFjDKoCWOaluBDBQky.ucuMBO4WAthHh00fCtPAQi9xWU
 NEhkQj15Cd4alqjA6ahSdJbpX0p.LUawrvjYetNn2MBGf4X6UofrkPcZ3JCb3ADGSV3R37XkKPCp
 BgSSlr.0CtEtcRdjt3c5oOIzOw7VuRp83yFTTIrZ.zuyLiTg41KSqfpMwXzdGZGbETMy7Z5ILall
 qbbczPmIrZu826Y2NToaPi4niv70P3NjLntp7xTDU2L9fE9SZoyfWpRahcmsJEycXlQyVc7KJpTk
 yDzlGKEF3g4JTk03mhSyJa5BJdRwXjTNg.SzXUdrEKV.q_oYULGskxm3p8htXQ9z2DP9Ec3AzgN4
 YC099Gavl4qU.rlPBr4C0N.l9f6TXLOTNcCi61uPYGH.__3d6sw2CTmcm5dzO31DDAgyo_8ATYPo
 CShoX5McyGsby704Mly3tNk_T9jidEtdSfVjr1LMyaFugMq21N.ucsBQCUp6Ddc3GjABVfsKcKBC
 jdlt5YnmdFjZmAYHBPUmbZwn0EDbtsFbBu9wjTlqudyLzJs05X3BwejAcRG2iuV6cHCpeBAKHjeF
 DKyNETNTSfc3LgulSieglwd0ogUuszYvzBYfq7WdvSQB0xJ4Nyv7xwJszMnqqjOx7lEJ9j_hCw.E
 38j6IAgoTcERy_oEin_xxc5.CE9kyQkCVlcPbWK07X6KqS7EhrJMj6ybC9ahrkYY1YoE16UbSdmo
 _cbG6eayp9OZLDUPjuZFfUMD7BYovTgkcwhvyPaQrmMiE0UbeUAZbqrXGvvmN4dpVU.Fopyki4Wb
 0aZc2S.UGRcGONkR6pDVEMFgmlsFafczJMdA1A4q74UDWMvLFTStKJTCCy64lL0riEzLJwXL0Hlg
 dc1z0D5.z4jCZoYMsm4WKX1LaEiM09zotgewNss0IyymyLY2o5BJDCi7nN29.8bpWn1VXf1b9G37
 FEeSfw1e.Sr6is4gcvybKMRrAszq4LV8jpg6bdvoB4XiuHpdhnIw4BIs406OpbpCZlE10DTFooaR
 j3DzH3c8o5lrRsEnf.TNpW560cV2ECr6CZjhfknh_plLlqY6h5y01xOHB2gVawliSuAB84Vgdsp_
 L0k0tGRHw3RrqK59Yl8oXKEgF1IAy4NO4endkoYj8jOvJW.t4s1eMikMdpK2Wk6zONziKl6yvCM3
 YfuQY19zg60aZ2ukjuO3HPXePd4kiCRLhM_p8zob15ITcZhSJimOM8GcqAP1LAM6hexEuJTAUo1j
 2aj4GQys.ZDycvK4bZPp4NhU3ZdOehPFAtenpfkYhU.sWXLS.VA--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.bf2.yahoo.com with HTTP; Tue, 18 Aug 2020 10:59:26 +0000
Date:   Tue, 18 Aug 2020 10:59:21 +0000 (UTC)
From:   Ms lisa Hugh <lisahugh531@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <2066635058.1267083.1597748361304@mail.yahoo.com>
Subject: BUSINESS FROM (Ms Lisa hugh).
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <2066635058.1267083.1597748361304.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16455 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:79.0) Gecko/20100101 Firefox/79.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



Dear Friend,

I am Ms Lisa hugh, work with the department of Audit and accounting manager here in the Bank(B.O.A).

Please i need your assistance for the transferring of thIs fund to your bank account for both of us benefit for life time investment, amount (US$4.5M DOLLARS).

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me for success.

Note/ 50% for you why 50% for me after success of the transfer to your bank account.

Below information is what i need from you so will can be reaching each other

1)Full name ...
2)Private telephone number...
3)Age...
4)Nationality...
5)Occupation ...


Thanks.

Ms Lisa hugh.
