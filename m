Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90EA427B152
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 18:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbgI1QAN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 12:00:13 -0400
Received: from sonic317-32.consmr.mail.ne1.yahoo.com ([66.163.184.43]:37071
        "EHLO sonic317-32.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726657AbgI1QAN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 12:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1601308811; bh=gRxRprL89Ob+XNLI6JBQ2B0vzOGgitwkokJgziSvDSg=; h=Date:From:Reply-To:Subject:References:From:Subject; b=rqJnNJU4WrXIAUuXgLw0Xeu82ZktRzhDTVwwqp58mS9NgOWS55GG9ydW6+X35DUC86N2lveZxKQhjNQCMK2tarUJS03GsQR9PPePNqHtZ/kr8tI5Zxxq5YhwJ1ha2yN80IaO34juwSw1HTiWozmr9HmvBErT1vS+ef2FW7DdiUEGBt2Z7LB/LJTWiP8gM3LsDzcJ3oexzoRsCQQYBYe2cQT94LPayYB1Jwf/fFOY1DET78r8B44rRbvxjcdkB/KKtaXSJKMtq4jL2FPtqoZDrRzOwLtTtShCvT9MKLNU2Y/rwgxyCyvB+T2TE79xPczjt1yQUmvlcRUKiVLKO95PFg==
X-YMail-OSG: c9Tn9i4VM1koTW85nNSnWXhxcqR2JKDNHuqv8TGoULqU6KJfDVeUaqu2zmB4Aac
 OMKwaVnMq4xiArGtdEfxRQWZQGHhgcSIuB8MvY5Jfhw7.8VhtjcrOkFWDoOCNtmrhTA6srW.Xd2u
 FEm.tlrX6mCchnqPMnN6IJRUsNeqU210DjAecNg9HN7cXyDT2q48VapwwkGpBy0RHe3dLB0zRJ_O
 0jkeykAewhriVOmhKDTGdDxy5dfgIk2lAG1fwcB58vD6R6_DXyC4dYXx6krWHyuJqBTL1i0OLkii
 UL5jRHCdv2trZwdVmtMUdxmh9j1FjpsZJPkl.xB327QqVMug8sf2iBoFVyJG.b760oYnT9VHx40Z
 1WcbmdNPuhdpq0qG8GZgmQoi.e.jn4u5VaDyyk76cS6MWZ7G6WM0kQNYe2AZSiM2bHFUTPwtsuFq
 wCPZ.ux5LboijG8.kwNS9CsDzGzfmBZPUCUDPj6MmXt2vbQ7wykVvdNVx3pxOk1iAsCCoAwzWUFy
 jkBZuRhDQpsifJJFeSADi5_JojqYuI51529AMe7AjjltwYcvjE4IZSbccUs6NPIiv.PamiIgdNnv
 FCVWq7NUHj29JUY_RklCYXH8M1.xD5vg7x.QkVvSGxzuM2YSJRE4fN3.sgVYbpvZNbZ7HeK3KjDX
 eSB04ePx5AoAvsSfmM_2ya9KCcF.47Lw9898DY9GLu2hrUloDtab5Rod2jJTAl2jVN9_7MrsuSda
 Sj498PTtYR8Z3uCU85YritC77VKEwz_7HYHZ7rFjzaZzgS2M6r7oyb_fEtO8TD4mfuCgqZgAoVx4
 cF4bbd4Os5y5XOZpkSi9Lxd0_QI3DZ9jMebT0jQY5QcODuGGZNwYFjVCFnEYtd0mtaX7PXt6NEsb
 FF2iGjHlgTMDbyghxpgQeJq0dwCAjh5GV590XcvY.UQ0v8bFwWZTJs6bCoIaqw_PZ.gwFJqRzPHF
 nCvtaTcxq_A3oLZnFw9JjiYwMFoBhuo1_OCPMQrAfO_U1kX1Vq34bzhVWAbPBk_SAwMiXqWkP0kp
 6_TqunaTk1fVigEXngj0n0YpElSAY9ft33_DJtjSinXlbps1XK5zjjWIeLyJc6mlki41vTIyxhpg
 z05oyvPAKtwq.B5QWBtxRhW2hERKske8aBz6PSK4l2Pz6CqhDrCOvMLCowK28QYtSgvsS3uLHqMN
 CgNrGpNMGtxeFIPtCQdpuJxFhmi16I8gKBHj4az2h7UDABeJBFa928zRBO0N0y9AxlFOv584o04_
 BGIE8MqLiZiOPXj_qjO.prb674ORwLWuOphI9nXE6gvcU.u7Q21NW6LP9cTxX1MkbMHO5HIgAkhK
 DPJOStKr4ytKuAeyD43hm2qJLGkH0_0wUOT.etSpmNkk0KhDEUZkV0LWzmC_m6tbahhxknZpG89e
 CZKrhBANy0pTXR7yM90eSr.uhEuGdjIMxvlEm3yuMW_dAX3osNQ--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Mon, 28 Sep 2020 16:00:11 +0000
Date:   Mon, 28 Sep 2020 16:00:10 +0000 (UTC)
From:   "Mr. Mark Edward" <markedwardmanager43@gmail.com>
Reply-To: markedwardmanager42@gmail.com
Message-ID: <1009722609.1615202.1601308810455@mail.yahoo.com>
Subject: HELLO.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1009722609.1615202.1601308810455.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16674 YMailNodin Mozilla/5.0 (Windows NT 6.3; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



Nations (UN), European Union (EU) and FBI.We have been able to track down.

Information from Nations (UN), European Union (EU) and FBI.We have been able to track down some scam artist in various parts of African countries which includes (Nigeria, Ghana and Senegal with cote d'ivoire, Cotonou,
Republic of Benin ) and they are all in Government custody now, they will appear at International Criminal Court (ICC) soon for Justice.
During the course of investigation, they were able to recover some funds from these scam artists and IMF organization have ordered the fundsrecovered to be shared among the 100 Lucky people listed around the World as a compensation.
This notice is been directed to you because your email address was found in one of the scam Artists file and computer hard-disk while the investigation, maybe you have been scammed,
You are therefore being compensated with sum of $6.5million US Dollars valid into an (ATM
Card Number 506119102227). Even if you are now dealing with this nonofficial directors of the bank or any department always requesting money from you,
You should STOP your communication with them and forward the details so that we will help and recover your fund peacefully and ilegal.
Since your email address is among the lucky beneficiaries who will receive a compensation funds, we have arranged your payment to be paid to you through ATM VISA CARD and deliver to your postal address with the Pin
Numbers as to enable you withdrawal maximum of $4,000 on each withdrawal from any Bank ATM Machine of your choice, until all the funds are exhausted.
The package is coming from Ouagadougou Burkina Faso.don't forget to
reconfirm your following information.
1. Your Full Name:
2. Address Where You want us to Send Your ATM Card
3. Cell/Mobile Number
4. Copy of your passport

Contact Mr Mark Edward on his email
address(markedwardmanager42@gmail.com) or you
can Contact his direct whatsapp number on +22662295810

Yours in Services
Mr. Mark Edward
MINISTERE DES FINANCES
ET DE L'ECONOMIE(M.F.E)
BURKINA FASO
