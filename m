Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DAA32565A8
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Aug 2020 09:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgH2Hj0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Aug 2020 03:39:26 -0400
Received: from sonic307-56.consmr.mail.ne1.yahoo.com ([66.163.190.31]:34801
        "EHLO sonic307-56.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726056AbgH2HjZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 29 Aug 2020 03:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1598686764; bh=NajTNMrfMLb6UXcjRhYpYerQX8PtVBLz0oFgaMINSWY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=o84fImt4UcqZdt23dVHNbylMyraZDIFc+S0mrOPT1fPYnRjQ1Vik7nvqE9Gra/Ge1zG7gx88tFtfA9f2+GILcxNzpFeo+CDsDDOSp7t8oongCVat3PMs+vuMvcypVt6zttVhDQ8b3TlszPG/nkHAsyyMHS1UHbgKZj19YkpiKIwGCaTgepyX8FiDmT4g8ZoPQBMCT3o7MXGTnPPUOrG6FDKTzAm9uGcgWL2+EOOabkVZeAXIUi8mtX0BHr67FbnlFak2YyvEhlDYEfYzb+GzisVUJ8CFtBD5jhVHThRyJjwe8KVXFDYirp1j36wRKQh89qaCoJjnoM90QNAVuEnFyA==
X-YMail-OSG: eouUs1AVM1ldwPzLlgKzxZqh9SXHO0yVjA6fvXlD_c8DLKvlzWsyLaCiy9.z2sX
 8qRYg6gVrHRABsBN.0vdW46B0tblGkI3dGcoutk2av.cGHuma2s9n3JHz6VpcyqEADJ1UyAoO_MS
 xFA9p5envNlwVQM9qAmZOn51bZaQ1VCMlC4YFDRLTz_KmHAAEBqUuU8BAxDv0dY8AExYtUNQmZBV
 _u8XXH80nY9HoNGri97UGEc5fk_KgEpb4ss48HBqp1ZXwbLZ3aQrKxNHu7Mm.2eTqCtLfg.e1pqD
 V9gHxUBdBhDVZ_BZUx.CmRTaRsBW9ANagqUNJ9zJJnkFSv.YdZaK5i61A8LIjSXgqUhNOsT0GT6M
 KSLlnKNmnh4QIqqsiEWxNJ23bCi0Z5rJ0Ycd0FLjFymaFY6JspfswP05EWaYdP8w9_f47I6vLY5J
 9JUlTF742a0TtpOZmIxvdfgnNf3Y76NMhfmy_uZloi8CHsNevrTYYzU.Ep4n.gs4WtxY5WZMnsDL
 VY0_ztTvF6Dax.3X5vXtDildyrkUihAlHOLIMkkatcI0T8y3p7qOzs4_GdRthJrG4CcllXqYeA19
 dZ58VUTUv2ysP4vIx0ApWk1rDFz9j5wMzDzqFJTz_ZzhFfaWs2_EPM23.MEV4HMx7jskFZasIBUN
 OedxT1adR4X8z7.mOxePEg2wmtCmxwg4gkJFsN3m7aC8wqySwf1hmBiJNdrR_udHcPCB4LEZkf8S
 BLQphBtfPmf6KSfp0h7BWpv1pn.JUiEjWQSiOZ7ZGO8alhgyV1NO6rSsR6sGMYHYvg5inS6LknmQ
 2hvy7T2iT3DMgUTx_xuUgHZ2meLgD2X3b0S2A0LW8_Ulc..BOS7E_9IEogiVlHIRHC94rtZJgTdf
 DVRbZyS11RmBrieQ61StX2gAmdYL_679LOFp.n4HGFb8MDxfkbpndIdjHB8wYjDUDuHp3w03wOda
 8DikjhSFsA4BRVInTmGHAwBW_9gBr6WDqpdJBrPN6Ef7kHwjfszBCKENoojvFJLVpToMQhQ1ZDGj
 N_F2DN371ezC6fmpmYpoMSGNkVYj7Cp7WP3roiK9JiuQH82lnIuirRl3CdV3R1jFQyNmHprEcTd4
 uKRY4nxEPS4_gezx3PdbSTCnAp8ogea9eYcWML6CzbyN.XMQLyTTRIruej.cW5sq1WJlMtJ58UUQ
 SvmwurK3svg6QtB13cZ3tLipQbbm3R9A.C4FZIX17nTwBnaYf5tTfPmSvaWly1gXIMS_JBf4w_wy
 O7f9yKq.I14Dv7.hjj9ctoBTriEXHWGoexpR43kq9OsQGlPv5SpP9rjUD3ijK1KM_kkztbtYO2io
 _Huj4TFsImN_aFz2ZZcfERH8bJlFurhwfX5I.RVaNR9RqF08njmQnMJRkY0mPz4jqZ2poC9h2g7.
 _m4XtZwYpZzgJp3PzSEO_ppUI9RegN6qROfymfMzevATtLQ--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Sat, 29 Aug 2020 07:39:24 +0000
Date:   Sat, 29 Aug 2020 07:39:21 +0000 (UTC)
From:   Ms Lisa Hugh <lisa.hugh111@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <1084996213.91679.1598686761761@mail.yahoo.com>
Subject: REPLY TO MY EMAIL FOR BUSINESS(Ms Lisa hugh).
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1084996213.91679.1598686761761.ref@mail.yahoo.com>
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
