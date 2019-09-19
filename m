Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96AE4B74BE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2019 10:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbfISIKO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Sep 2019 04:10:14 -0400
Received: from sonic305-19.consmr.mail.gq1.yahoo.com ([98.137.64.82]:36254
        "EHLO sonic305-19.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725320AbfISIKO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Sep 2019 04:10:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1568880613; bh=aqgfpQSbF9xm5XIVI9xJRBUCxbTLiIvQcaFtsOtxcow=; h=Date:From:Reply-To:Subject:From:Subject; b=kR3qibXkMRNpy8rdmE/1+kh/PCRtP3aSXlwUM00UxdSTM/vuZGhL0NtWHgRyr2rupHAou2LdLP9uAie/k/MBEhJS8bysySAJ49RfwnxBKkrY9jZ320s8qoMpTa4LBFQaV654XNn8ivMo+NH5E2d+6VjU42T4h32G0Br7SjpZBrfqGYkkoQliPCjM7VYSd8qcV0OnsQ0/6m5XfqXbDIuzzP/Go7lOIr3hOm43UK5xmJiA1EjYN5peFDmbl6Y3Qqzc/P/302ZnuO/l265MOCokWz7YFb29Azf/98pRMTNdOX1Kh3AzZF4RUEwEeiuBi8Lb+cmxY//yj2eAG6IGn1NYtw==
X-YMail-OSG: 9Uce2zgVM1mPqRYbagTuvo2e7U85RS37DWbPXB9k.ub6Arh4ZPZ5x.ZYmmCuqdH
 iXi0S5e1xoE_K7mAxg969jpQx5VJG8uWQXaEFezTokRAiPnjLdvQL1C7ViCmlqdMGBBOx3mOQ2AL
 sADjl34KfSjvFEHoehFLp_N5w0nAhFJtw3bZBQfGNAKVAjJAaI0rPWrfOsECH2ljv94sqxIyTVrk
 mSNaABTxhqc9S2y8t7OW.bC_DLdFV2iMGxyObq0ZduiBMJ_.KJvgRK3oYy7mMXy81qOTXblbo6Y0
 7xPhxUzUxlbBwtXZsr.Zzmq8ndjTccTqkaSsqnkzN434uZs3NgfVbcCS_RkyO8ZxLGf2QxHjRiRK
 8WWoe0zo4PVhG6rwCiqJsp0xgY4d8VO57x8ZIk5U1wJTPmL0jVkcgR6Z0yREbXclP77BB6vEIQCx
 uJpRjrQEKU590h7qs4CAtdvNR2a3QYOSQdhiCiF_Z3UghxuA669oXIOUA0aGKxIMD_vHJkLos5P7
 sUSw8._TI8AmwlnYuswujBqBtnpCHKFGNHkOHviKWCzQnmUCJ94u.a_U6kBUwT0Eu_sL_Vatkxsj
 eiOcEzbDlSWVxJPocdV0_fMO_akejtenW_mXX_6NnfHSLWp135b0QoGolVdIpad1b0O6iMaLClSc
 NQf_miXKwwyizYAhYUQxQBKDartO2QIGGCrAYzCeOUZD3Tet7GGz6hmN7z.G0dut7f4anunNuFTk
 yQkqjJgDuCfdvHjf9kamSnhgmjRDL3KSCZDQ5jh21FX_kvSHYF7imM_8GKb47..uDcJ288TYfG_R
 LvyXRTVqOgBeDodjkFfvi1LvTTe29tRVap.g3yVAz_sOMQ5ISx.5gWDr7rDRyoKkH_aWVPvW9jRZ
 XE6cHRz1GCfLMLmV1sEUekcYe_KuTy0iCyUbCNHCIY_mo6AGbEk8PPFEwGr4plLx7mXughRE4S8h
 MTjQEtYU_NkfOb3UsGT7yhNNzKR3n9v0UeZGFD7pwGJSsyCqOeIzrkwqwRPxdIdx9qBy_STRv1SB
 lmqdDRl2fwNg2F8o4Omc1mxVavgtkLLn7iyp9bEOYQnyrWwYNESo4iB.XLCzoROrPoysjtusTBSY
 Q4852IBOFl.kHoZMUMef8vZSmTKUypPqUPzHCZVodSQjrG_BbSCKoodBIqiIEIIYBpHXkmXCqCPs
 IaNEDsWEUT6RbHpWp7jcsy.0dtF6LnxK4v.rfX95f9CMx.J32NV62NmsbLvLP7S6Ea00CvMwUNBl
 DugOOPW9ykb898fcCzIg7iofbru8gto1.JS0b9tBCC93j79urqIEaXtYE6.S3e.eDc2u1
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.gq1.yahoo.com with HTTP; Thu, 19 Sep 2019 08:10:13 +0000
Date:   Thu, 19 Sep 2019 08:10:08 +0000 (UTC)
From:   Mr Maryam Sharifi <mrscantarak@gmail.com>
Reply-To: mrmaryamsharifi@gmail.com
Message-ID: <954094629.9578094.1568880608959@mail.yahoo.com>
Subject: Assalamualaikum.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org





My Dear Friend,

Before I introduce myself, I wish to inform you that this letter is not a h=
oax mail and I urge you to treat it serious. This letter must come to you a=
s a big surprise, but I believe it is only a day that people meet and becom=
e great friends and business partners. Please I want you to read this lette=
r very carefully and I must apologize for barging this message into your ma=
il box without any formal introduction due to the urgency and confidentiali=
ty of this business and I know that this message will come to you as a surp=
rise. Please this is not a joke and I will not like you to joke with it ok,=
 with due respect to your person and much sincerity of purpose, I make this=
 contact with you as I believe that you can be of great assistance to me. M=
y name is MR. MARYAM SHARIFI, from Burkina Faso, West Africa. I work in Uni=
ted Bank for Africa (UBA) as telex manager, please see this as a confidenti=
al message and do not reveal it to another person and let me know whether y=
ou can be of assistance regarding my proposal below because it is top secre=
t.

I am about to retire from active Banking service to start a new life but I =
am skeptical to reveal this particular secret to a stranger. You must assur=
e me that everything will be handled confidentially because we are not goin=
g to suffer again in life. It has been 10 years now that most of the greedy=
 African Politicians used our bank to launder money overseas through the he=
lp of their Political advisers. Most of the funds which they transferred ou=
t of the shores of Africa were gold and oil money that was supposed to have=
 been used to develop the continent. Their Political advisers always inflat=
ed the amounts before transferring to foreign accounts, so I also used the =
opportunity to divert part of the funds hence I am aware that there is no o=
fficial trace of how much was transferred as all the accounts used for such=
 transfers were being closed after transfer. I acted as the Bank Officer to=
 most of the politicians and when I discovered that they were using me to s=
ucceed in their greedy act; I also cleaned some of their banking records fr=
om the Bank files and no one cared to ask me because the money was too much=
 for them to control. They laundered over $5billion Dollars during the proc=
ess.

Before I send this message to you, I have already diverted ($10.5million Do=
llars) to an escrow account belonging to no one in the bank. The bank is an=
xious now to know who the beneficiary to the funds is because they have mad=
e a lot of profits with the funds. It is more than Eight years now and most=
 of the politicians are no longer using our bank to transfer funds overseas=
. The ($10.5million Dollars) has been laying waste in our bank and I don=E2=
=80=99t want to retire from the bank without transferring the funds to a fo=
reign account to enable me share the proceeds with the receiver (a foreigne=
r). The money will be shared 60% for me and 40% for you. There is no one co=
ming to ask you about the funds because I secured everything. I only want y=
ou to assist me by providing a reliable bank account where the funds can be=
 transferred.

You are not to face any difficulties or legal implications as I am going to=
 handle the transfer personally. If you are capable of receiving the funds,=
 do let me know immediately to enable me give you a detailed information on=
 what to do. For me, I have not stolen the money from anyone because the ot=
her people that took the whole money did not face any problems. This is my =
chance to grab my own life opportunity but you must keep the details of the=
 funds secret to avoid any leakages as no one in the bank knows about my pl=
ans. Please get back to me if you are interested and capable to handle this

project, I shall intimate you on what to do when I hear from your confirmat=
ion and acceptance. If you are capable of being my trusted associate, do de=
clare your consent to me I am looking forward to hear from you immediately =
for further information.
Thanks with my best regards. ( mrmaryamsharifi@gmail.com )

MR. MARYAM SHARIFI
Telex Manager
United Bank for Africa (UBA)
Burkina Faso
