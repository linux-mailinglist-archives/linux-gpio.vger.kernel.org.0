Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6726725E6C0
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Sep 2020 11:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbgIEJ3f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Sep 2020 05:29:35 -0400
Received: from sonic307-53.consmr.mail.ir2.yahoo.com ([87.248.110.30]:37798
        "EHLO sonic307-53.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726660AbgIEJ3f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Sep 2020 05:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1599298173; bh=NajTNMrfMLb6UXcjRhYpYerQX8PtVBLz0oFgaMINSWY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=DKRKLwtUNyEyetYfPSnrJKCuwRnGf5ri44xzezS60dxLpPiihPxrj+SJ0xDU0wd95SiA2LDWaYmaESzywdhr/TM+6Snhp/Tw+ARkZVI+D/y7RtJLNlp+1805px2GRrA/4CZJuslA1GtYbv3SLQ9iL2VWxDhHtDJEh8+pw0twVpi1rL4zB7vThUz5wdBPKAEwDkiidrP8q2ZlBmHyYn1ucII6LUgrMkefco5jKpi/RakpG4KXjYQ9Ts+NkdYcaxhWnDZorYuh0iAMwCEFRoXKcks6FdTgywc/saMyhTiNp7vguK4icA61orANQMdKS/tAgkdwvsuxQNJtWxg6Kcq1VA==
X-YMail-OSG: wM8ZSq4VM1kmGNO3eax4S9QX93T_p9s0w5abNUTrEUMRanSy5MtA9wxO5Oxo5CI
 P_QYgPYm3QiQZeH7dAHKj2M_7Apt7EbPjkqI5KrM3sWMUkPbrz2__Krl7MBMCQjFYVMXlLJc1D50
 XlM5XNukDYM4jd_q8nB5oJQnSd35rm8LTNycUX2QhW7O3X.Q0DUDJK6QpSlVk14mxfMRU4WTO3g4
 vkKfL65Vno6h2axmAlgrnyYZnuGORsaKCXBVOxmHRBdSiyVvtu7OcQncosVCZ29BzGaOWC01gL1p
 Z05q5VMwCh_k0wvZaZi35ZOu23ekVmuFPOQ1bDJ9CSVXE2RthrNpI8I1bSI96okS4a7b51xZmTkn
 MnAa_Okd_9r43qXHlQbaHQvvFMtsBXJcz5e99GXTplEwNTpXPLuqzgq5nQ3Dabp8fbn4Nmg3YbLY
 u8abZP0n41vDPNwzR9tOrXpIsC_QRIv_Y_3QjXjNZtvqFdzPlCJzmahlI_P6rAo3bA4rs78aF7FD
 OUZxLJ_LccTs5uZmCzPBSrlmOL3pnFc0XARHfStZke7v08OJ6PEJGWYE21pXQAmWmLdyKlT7O8FV
 zoTXnw6i_K0o5bFM7AwY.VsRauHaNKbVTDcdGYgOjUtoXWCwTNtO5NnNAub2K8M7zhJ2bSgLxRSx
 KGWtSKD4oLuxOROSiuWOdBdTNNcpBJRDd8BXC3vsyaJ3uAJyp6XV1PdcbSDQMBHcg6zstF4DQ1.4
 3Qs1SjTfhXvbuzgOTOpwG6jCA4R.jiaOKBncagLL6qryZIfsEUT0lSI2BY3edd2MAeu_S3zDEM.0
 hPxcZ4y_VTlK.koTOfbH92YbjzDvbbQix3a956LXAESaTChK6OR_xI19A5mqmyOPWZxIzhAveKgQ
 M36MVSHXne8JKrQ5qs798xsEDpI3iCW_Uc8Eu9RsnB35SzsGYNMRXzocnyjyuUHczjD_o2HadlFg
 STubDJQyoPGcCpLDGtwns8pQ6MGbUwxGGfhQ3PYHKvw4Tqa9RK50ap.B84S.Vm_diHEuOWjz.JBV
 eii7Wfs3p8XwPvtyi.g0iOXkbv5zy.kNX1VYDEYDvVIevYcARPVTa1Zl4qRB2gD38uUFRYLZXzCL
 qikmo.f6B1kYtiuuHBKXA3VpYRo0Yyp9NmP0e7g7GNOO.dQlChkARE0e29eVcHM0DaeGxRqWECWb
 WAOIPx.QySkbk6nkAzmBIwLE8v6gTOhCYH4ZH7VxVIcqVbwitCpHv77RsQVBjQv1bqL9Ttetj7OM
 dH9LLYSNeVzUV.Z9FIdTfWcbsNjnSqPs2VaOuMq5YbEIpq8syL8TAkzSKqkZA3qWLt.B2MoIPDA9
 srGMn0s06k3tOTOGF4pTpsIcRq6GkrpIuYMPa9IPr_FYw33f.64pOhAJvA4BnMerJ.oDC.Hxqg4B
 wZLUAaDLSgTcArDLjphn.PNDSiQNXSr.MsOIeFYx5uMwDNA--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Sat, 5 Sep 2020 09:29:33 +0000
Date:   Sat, 5 Sep 2020 09:29:32 +0000 (UTC)
From:   Ms Lisa Hugh <lisa.hugh0000@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <1137909115.4407550.1599298172358@mail.yahoo.com>
Subject: REPLY TO MY EMAIL FOR BUSINESS(Ms Lisa hugh).
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1137909115.4407550.1599298172358.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16565 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:79.0) Gecko/20100101 Firefox/79.0
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
