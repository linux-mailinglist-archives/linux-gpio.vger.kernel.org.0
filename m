Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 631991F8274
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2020 12:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgFMKJR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Jun 2020 06:09:17 -0400
Received: from sonic316-22.consmr.mail.ne1.yahoo.com ([66.163.187.148]:44816
        "EHLO sonic316-22.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726304AbgFMKJR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 13 Jun 2020 06:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1592042956; bh=NajTNMrfMLb6UXcjRhYpYerQX8PtVBLz0oFgaMINSWY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=B2sJGAeUdCy3QtpOdZhrd9WylFl5LYuswSF7PA6rOrb74vV4DRHY3dhZt9JYUz0VEdfcNQyFc+6MGS+1jArHzO0vD7r0wJki8yRjoL0U8vKG6MTzdPkruaIS3gsh9dR70L/cxXovHBnx2oVMUQgtC2FNu0IY4qUbHOU+Pmafcr7ExL9cVWJ1XHXsjAuj90Cw/sRKyhg/1LoC0V/3gNmd3vtm6knqDY/kw/yyvS0cJW5X3IbReoGidqcaGPOV+ABDYsy9618qM4GRwPQWkiwhaNmaMPYISM0eTqsZt6y4JEh0uldLKE1UVIUc4KKXd9Y9ueqMPwVA7m7TTE2f+mRPNQ==
X-YMail-OSG: yLTs8xsVM1lGF2v0Cmq_DiL_UvrV3FCo0CouxjNcV4KCQrn1zmQoXqpEWKK_w6r
 a1a.3LWgzlLttlINYU00hh4KGgIDPmUtQMq4t_hwHUpN5s9ZEG_gHwCuHsmM1stfFoQ0VSLkSi4z
 r4nypAmV6wAT_lmpyyS2sqf1P0i0nolWyRz1_HIthAN7ia94R5MO5NqgGj4JKH0OHEFq805CIEzV
 ba3U.EcP2ZsawD3IJsQjQTi4C67wKH2faZbjdBt50eGJnKWVUCwwFL.l_0BG3OJRtvQDD4BlHo1n
 9plH17pyE7cwhilJn7g08c8CCdHSrSQqsx6Qy_YnzAmwDzpYUSkrj9mnkevuIlp_y6gqZ0UniB6H
 cDUzPxNLInHL5WWZKAUUCC5mFf9kfEFNcznvIZUZO7RYwYmBbxDmfpTu.wayok.jN_KfUykoYmCf
 XU6PuWhTgOHPfIfzka0Ch2m2nXwLvfiNlPTJWzv7ExAw_8yQKHGNoCV2yk4RBkNhPF6oQtNmNSXA
 RhjDHdlKKZWCPK.qB2yGXv5xWoBfuptR__h8ErHgpvDv7wFwbiF_puPqGYuz.q8ZuwC_HVH7Yf4c
 fCtrxbe7YXc.Wn2gQJJzJLOe2c3W5iR4pH2gon2TXpXuNekk1w7tdbtvr8v.BYpjrmfKVbgozJaF
 .nvzJ9KApba_Dkjlx6Ecg9WWHamWn80B8FLleFuSI3J868VsaUUjtwcMeNcCSegMl2uRaTzdPfPm
 EgdBc6CWS_M_i40D.8I1aB_8._pt.c6sgeD1TCWxVhWtI7fdHwAZ.r9f_iATohPuXH.4QECKnFLl
 kr_ZJCi7Oeg4OHQmzDBTZI1mv_ZH_YeE5RFsAu7.lPFx4_plEEnyf0HH2R1HIEZB_6MjwIwqLMfr
 8CqqsuMFtR3CJPHXSsx7lv5WokiAZ6n7JAKynk.bZpkm.d.aCNL4PfWfqDSTfHuxi8UgvDGzAWb5
 30kmBHyffLZGvrusAyyIcSFm4UX6lDEeyYu7JoLAbuoE3zdscxQXWiAf78Mvst_t_9IMUiKIyphG
 4TxVMev.C9k2Y4mkQ5.v6Lz2nRlyeLZf56HoevsbJMc6CiVB1H9u20tBO3e09o0L0V_DUeSinymj
 bX08HpSPJ3n8nq5dheMogKTVYDl0rp_BcUlBR.UxaFC6u2L4PSNCKrTi142MWGst9.l3oxT.P_eJ
 lyJMqwCYQUPMXk4M.gXQfIrdKx6KmVKfL5MOAeiZU50nWFcYyM0CweM0OknmHC3k.Pl5IkQwLYkE
 .OwGfNEu9A74uldV8HDaOhoGU4Ym4ckERva8.zqLeR2GXo9FrJBvp5iV3GY2e3e3vf21EqBOnwg-
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Sat, 13 Jun 2020 10:09:16 +0000
Date:   Sat, 13 Jun 2020 10:09:15 +0000 (UTC)
From:   Ms Lisa Hugh <lisa.hugh111@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <156749975.268601.1592042955052@mail.yahoo.com>
Subject: BUSINESS FROM(Ms Lisa hugh).
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <156749975.268601.1592042955052.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16119 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0
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
