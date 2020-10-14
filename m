Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 169B828E203
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Oct 2020 16:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731458AbgJNOPw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Oct 2020 10:15:52 -0400
Received: from sonic308-17.consmr.mail.ir2.yahoo.com ([77.238.178.145]:38114
        "EHLO sonic308-17.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731383AbgJNOPv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Oct 2020 10:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602684948; bh=NajTNMrfMLb6UXcjRhYpYerQX8PtVBLz0oFgaMINSWY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=AYGEWP8ZEshCoh9Lnm56Q1CQgTNBbWcYGf5KoTUw+JjeUDlSAYMfEBjrW/8VfmT4gLH1xIzlNmZKCATFE2mmgm5N4RvCHuHegbFsjR3/B5N0JhksquoCt8pN6LjUfzv/yTrWx8wJKFJfLIfdBN6KGw3/vYRjtqkgzvAxZPzdwr6kdB3vgafkeBQ9WHNPznahj9VtgsLIMgqMmyBZpWzy4TmPon1XK1yCAevWxoo97oAYJnQVbGq5xvNM962gOJ8psNh3Q5EHzbK2FP+v5sW4yrTGgo/BO07OKvR0W7vCiS1L8QvRZxO0RpVqBPH2/zpvYWerutci0F53vNKuNch83g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602684948; bh=6QVxLyro6iX6MaLpGmLh41/nUXM83lTOX9+TiqqDl7W=; h=Date:From:Subject; b=jda9Np1RwHKjSzaIEpJkLqTJY/xgSaqaoaJ3XYNi8NjWvyrxY10nNzFx00IxbWY4aUnv/NCVRHCCM4qdi4Ukxr6PpHMBkNuSg97dI2fcCiw1z5xkqpZ5HR/fqPFnvUPBXYRBRI0h9D58qt16oGe5CDoO9fQvbbmcMfuy3lkRryDNCw3pf2Q3xvYC0bRhXquBwa9caG6Forn48386EU+zOnUpUw0e1S74l3zXpvOgt1A9TPPOkZGhVqUKLkLJouNSeeXvk9zXhdjNn7sNXygD4wzniq1DLmtYovdXsvk3DzsDI/28LvZP2dAGLD8Gmckl2/68C/JE5qV1twiaimzyig==
X-YMail-OSG: byaRk6IVM1lqWOvDrdr35ld1s59NEPzR5qldKV0KjIHo_pEP89BsXSNSyWvouJd
 bk2MBO1DTkFIgCGpraG0hsoxk9mXO3.Gm5NQEZhmRGckQyS6g4zcqwIXS8Va_JqI.LryFFtlNvJ2
 LVc0BLCoIdqiOomOdECttHDj_JR3LBgRZ7bwgf95QKDQ902c2oLvJ4aABQuUWMGMXgOnkQ1SGK6l
 y0fx6SrHzMbeDUdqRBRrIuqjJzOf6L.8okCEPbs9kXHobo_pkvzFSTv5lJ2wxND5OYWn_q6JelPh
 NB4rWADh9KCqQPN_vWg.W3E54UDTXJ9t9Gd9RLi2zEAaH.Yi9uqVnt6qM2ZmyeQmD.jDCmMeBqZc
 a3mxdgnoDhjLEkhMG_dDxp38kOzrTY3boir_HnK5qiz5.OVGcT9cRPUSsVclOSg38QeEAU.mSAiY
 es3oQLA8Qv52Xi1BM_qaKdvGozgjPEdA0rK6jjvqmweAPgDkIBwnUIcZnshi5B9ZRJKDI73TWN5X
 1AS.jleVS4XJIOAR_NuMgFEG696Iijktfy0KjIffrQQQNaD5pLTybIdU9uSOl6mlBfnaq41GsJHP
 .v2FDzftgGmbmx9CU2UUfPcCtowKGoQ5KOU1A4XeIVCbUEM4_qMxs5alsdDSG2p76RBZXezcAoBl
 sibqfvtoJZ_S__7v_SwLjPNA3IiVDrvwONbbKzE6D.Yw0vbZZbHDw5UNGD5J7eHuhmaGkBtgsUn6
 .M2mCYwjZ9jjlrvDLaHmPgFo8kTaLoE7xbzzl2aOxKw5RRi5VSNTx6gZoeMzqUZjaja3uvYw8D9n
 L2ZJ7QkFAxhjbnHgcgGf63DNz7S3pQH4zHfmdZI_diK0fP7D2IYZ6OOw4.dcjPNrsTd4dePHWvv5
 aWCuGZpTdeggN5mBCqRI1.Sjp2QyPG3TrswOOGXC_K8gk1StUVfKGv8vYRRvZupGfNHnziJz5Wtu
 ThOlXU1yfMH4tx1qyDPTsmz6FVDp9NbvUc5zU_em9Wqjx5vXlleIdsQGsErKGBm6jt6Opl0kJSZR
 uhUg.SwqL3wMK5TU8sOVXGcrueeE9TZ_LLxBzC6OR5FaBcYgSsujapfzcqtBLFx1GvXk9PLX.U4y
 EHeytiMamgj4Z2X3zf9Gudju5rrsFjobXOB.jFq1dFnhz0UkgaBIx3snHhwq0DtOt_JUot5aYU6G
 cxsUDqjDrPj6.RdOeQF9f8W38XtGDt_AgmHcE5AGmELnxXU7rQRRf0utBpZXYvRaYEvteimyFZJ0
 E5_RbmjbdYhcno.Bw45bcTfkxt56_2h90Z3vOEHU73qV6gV3j.N00ojxIk5ozqhS96ej8Ueo_.v_
 5EBzgYspdB3fEv_CeCB0jbXw_arMdM.DUYHDP.PA1YPH_GhbBzMW4IcuhDr4q17zgoiU_mUSpfnB
 UbozjqfiD6UIhMLkRZ59X6lcMXcsQhNxEEyw5CQ--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ir2.yahoo.com with HTTP; Wed, 14 Oct 2020 14:15:48 +0000
Date:   Wed, 14 Oct 2020 14:15:48 +0000 (UTC)
From:   Ms Lisa Hugh <lisa.hugh0000@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <212207276.1086095.1602684948275@mail.yahoo.com>
Subject: YOUR CO-OPERATION FROM (Ms Lisa Hugh).
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <212207276.1086095.1602684948275.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16845 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:81.0) Gecko/20100101 Firefox/81.0
To:     unlisted-recipients:; (no To-header on input)
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
