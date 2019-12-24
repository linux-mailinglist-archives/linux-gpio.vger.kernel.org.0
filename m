Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 049C712A451
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Dec 2019 23:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbfLXWhV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Dec 2019 17:37:21 -0500
Received: from sonic312-21.consmr.mail.bf2.yahoo.com ([74.6.128.83]:33720 "EHLO
        sonic312-21.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726224AbfLXWhV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Dec 2019 17:37:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1577227040; bh=ZkSLcXkg1xPrFHtzBsy9ipALcIc7hyyhd9T7GsQ9zU4=; h=Date:From:Reply-To:Subject:References:From:Subject; b=MVdgLSOgsCmN8fOa9vbji+2dsMv42yVNpsxpcNAUIKdYT3O64rmZZCkLpDfPbteuqI+p3UJwTd0cL0/FkSq8uZ1p7qHx38w6Kmd71ID92ue8UmKKHqWQUBGzsuyuNvX43jSocljlN+wgVo3kZSTDp8SJ2Aq2DX/Rsh7ttI3sjBLffuoXxNPLbVKBdyEUKiG9z7qOnHpx9ZdyFQFuZyd/djvTaAOxV3/I2WIDbQMuIbtOBYKUwJ+M/2hF8/L2kz8rYgw7hCmJJ0L/p1uMB46UwXM8eOGG/rsqOvDWwttHi6Lz/x1NEfFrCb8JI995fAeetLX0jV0MYAhIix5Ytzxx7g==
X-YMail-OSG: O5pdnxAVM1k_Ih5R7nD6f7o0nfooVn129SjKrIxSwgmV8LyhYonh8D5anoZGoiC
 gY6.Z4ZMnDXRttksQ3.jsxmwY12LZvi9fUShy_sBxsQIeWZxxyopeDlFAO7vtGOOehkXQOzBJhVR
 5SjqRn8eHqWp8wu5BKfnaHA1c6wWLSEuLeywfIW0vUXktCeKtP9FkOKqwON6tAJ4xjMJUZmv0wCD
 PK43CHkjGbqNvbcrXBGP7myln9GJREcx2CXFn8UEFftilib2_s9g9U3cFRgj_p50UvdGwVZ0IKzw
 abqVGPFgxFBte3tk.sBuTttk8ReRKC3NrYc5qK1z9MEFofTRaTev5QywpprBb0UKWzt2FyYvXKvj
 KMtUx_Ts8Ir0TTWvcp9GB..b7HaUNPyM0jBR1vXiudL_ZXfbBxGjr.5yg4TqjysIGMAajGk5Dh_u
 GGqid0.iO9NIdzHjcR79J0izlLrmn6U5usVyIZv1qLWwtdyCKa5xWdt_OXs7ZEUBNofxfMv3Gq9T
 4MZRLHS0CmO6ra82tTXJlHrPXZN8IbQewC7rf8fe3YrAanbNCYv2o60qMTpoVJKlLE.ciBaWBb39
 b5p5KLFR1F6TQh70tg39QCW8TBOwtI_SYu09fD4kVGxj77oPlHz22VlH1WTlt9Z3Vtd4CsOTMsmx
 3MmEnV8EYcV1CyD1CCB160pPyJ4M7Pjpn0IMZcWatS12oFEQV_iPMuHxZ4MQuxcOgmRET0N2TrEj
 W3waPTMxR3UFJNBVKrW.VR8lebv7J3TrfCV77Zdcpt92CGRhoKfe_sAcyIAyANe_2ya6EOaKXvKN
 vhYpk4qEexh8CDn6i2dTfH0mP85P5C.qKhUjNyvuOrva70xnenp.QeNq8I1bAgcRcQZFp21.Kxqk
 kdwSHBQfnvxkvmbkh5Z_MMTGrz6DriJx7m39M.3EEZIkIoySmGRDYM7Me71Wz6B0qxcLrOiffj7r
 FqF1WzA6rOyWxgsUR_dNr1MqhzvPyl0tBKBus4o5S7Ixkyb9BmAeojpQT7uyP1tO2hXbV8tRW6VA
 BuiuwSoRCeRKiYWSjzkxVxWddHouZqcHVYN9ibdlLbXp4ouQFHMyQqhHJEWfJDR42jf64_M7zQlz
 ma.i6AzFwA_AICX2G1MTq2_psPCgaQ_LjjgZRmQqt32WrA9gyPc_YGgC1KkjRSbt0q3zxnp3rlqC
 uccfMxf2wDBTXPufjq3CLoKfhax1a8X0VyOR_VIYJAwJJ.WFeF2dQFUmVBLJe8lFQBADYuFuntEM
 EX7qw_VzZ5FgDlofwqJldML0egRK2U2AH_N7rYLvAAfiDLy9rg7l5FXpG37BwWJhrkL6Y.YuZzpr
 blzc-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.bf2.yahoo.com with HTTP; Tue, 24 Dec 2019 22:37:20 +0000
Date:   Tue, 24 Dec 2019 22:37:14 +0000 (UTC)
From:   Ms Lisa Hugh <lisa.hugh222@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <797286316.2164836.1577227034877@mail.yahoo.com>
Subject: YOUR CO-OPERATION FOR THIS TRANSFER.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <797286316.2164836.1577227034877.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.14873 YMailNodin Mozilla/5.0 (Windows NT 6.2; Win64; x64; rv:71.0) Gecko/20100101 Firefox/71.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



Dear Friend,

I am Ms Lisa Hugh work with the department of Audit and accounting manager here in the Bank(B.O.A).

Please i need your assistance for the transferring of thIs fund to your bank account for both of us benefit for life time investment, amount (US$4.5M DOLLARS).

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me forsuccess.

Note/ 50% for you why 50% for me after success of the transfer to your bank
account.

Below information is what i need from you so will can be reaching each
other

1)Full name ...
2)Private telephone number...
3)Age...
4)Nationality...
5)Occupation ...


Thanks.

Ms Lisa Hugh.
