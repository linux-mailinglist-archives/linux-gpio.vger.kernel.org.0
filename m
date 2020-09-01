Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E052258D1B
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Sep 2020 13:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgIALBq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Sep 2020 07:01:46 -0400
Received: from sonic303-20.consmr.mail.ir2.yahoo.com ([77.238.178.201]:39305
        "EHLO sonic303-20.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726105AbgIALAA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Sep 2020 07:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1598957998; bh=XBE4xSzzkPC5/YTLs8GPUUR7cERQCUTpAxei+5SR1s4=; h=Date:From:Reply-To:Subject:References:From:Subject; b=VfJS0K2spxck/ckeESLpk6425+REOlGgYos+N1Coz9/s0ZZQqigGT9uGKCOSNuzD7bAlIXs9YANO4sMQwk4uFg/cf6ROXR1cG/3MtC3f6Sn1/1A97+f93xUtGLRtoiWzfeG/FGjgM1PFkJkC9ZTHdJNz9mClsWT34DD5ecUSmlLBEHnTJp1QIEgI2R1WtTgJzIECe5GAgoeZn1TRNNly6p5fmshf3plHiVIX7qiEYB278LUosoc5VkF1ZM29aWSNL07N5gDzumTzb3TTCPQsDWe0UwaUxv1efU2YLxumIuOExXvIffqCh15A6xQbaxtdXBxvSgtdnUAXv7mJEqQEvg==
X-YMail-OSG: .HXDPU0VM1kJa9pNNY239Q6yMzQzgUpewXonNLumnap5ZDQQzyyCCiyALa5Cq0W
 sItndPf5sbMEKUV7zlKjojQm3OCNU7wpivFRYrERe0vo.kE1BsqCsU28ahs3tm89I53uZXZoIfZl
 zMp.H4XP8eqq_6WiZsSj0B8c10p8A54l6teYY_hs5kgQViPfXhBoC4cZ4Tf81suyoTlhPAS4YZ10
 Ckmn48Y7f2YzIeU29Dn00Mlngi0uXiBMkeaY7rzhFIJR6oi9v0DPxlx8YO4WSfKODZoYvHrxMJFn
 .e.86HDpbmlHF7s_1kkxFtFAACtdRZg54HiF0rPar09eQyHJqPdIyeSoIXbFA_XIfPbt9QPPwxVu
 ZZfQC2NiyMEDYyNRfDJ9JiMIfBErsklH553QzmJFozakUft7zj9bdRE6BGLAcDTS30AbXpfFoaVW
 joz7dRL8bbr2wJWIFz8ILfH75014X6CPs3h18OYHpA52m9XMTKYLEABegyee7LDusITRFco2.APc
 QvTgU3ckvEcBUbvBLtqQfSRyrBcl1dON7GB9x3RP8.y8yyoYfnTRqRgKhLcaBrZ_aBahSx2Dc_j9
 2AkJZgS1TpdFGbUsIdQhQSjGhpVjD1toaX7LdbEhZgQd6NCqXm1KWRkM6mni2LmfanOG54yIIELA
 CwwppRLycpHu5NYP74.3vIrOlYSFNXjrwml7V_rAPZrm_ALBNkW1QDIN1X1XR0p9.qvsyiPAhy9h
 BDApmYt0_Xy.amyaoXL2Xrm8BBSHQaTYaK7Y07b9pvoLCdJ4e0v46h_fwLS30fHPwTbZZZRY4MQX
 T260VxoNeEfHVCXN0fRZI67DgBFtD0SN74FSVKzjYXBpmk3jQI6SfeGkzyE7aAWCgeqk0ZP.Ftgb
 DqLmNSJ0KYIysRl6czUXyiiE0GyD7H9tMK1plVU06987MiQu526nkvA2p_p.do5T7XoiIy7cawQp
 UB6Nqn4F1.i0J0aATpU998UTwQN7iKQXE.z8CC0lRpAyN2CqjvPV1oDRWAZWww83uC4o6t_DhzB3
 Wmq4TGr5aXzyVWOAby3edgB.ihUk2qK9uXisg2JKS5o.AzwAgX4RC4oy53Gt0wXBWngjHSojJ_3J
 VzhnbQBdpQ3PRaoXCDpgbpvrrz4om1mKRkOgRtiNS41hCue4h1K.YbT6EGiephbQhhz6J4YLquEm
 NKfwpbOGSpkjGUDQPIQLyrI6XqniM4TOM7vWROeLPR4yCJkCrTKWIQb61wb6JNN9ZEiX5maTWSyK
 l.gbHyjcP_Q.reThzMce4Gg6.gKtBvNCq5aPWj9POeuQ0yNNpJpzPEWX31D0yqtddjfhVDPsqmpw
 ewdssjKBUdleUXvY3Bn_M0iwAhQvW3YCFYiFqqDyW4yKvIZI1D94UHGnksNpRF3Htaeq.EvsnL6a
 JOkfHeoUwrTzhwk5bIuNCEI2AQJz92cluyvC5ReUzfxkkww--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ir2.yahoo.com with HTTP; Tue, 1 Sep 2020 10:59:58 +0000
Date:   Tue, 1 Sep 2020 10:59:55 +0000 (UTC)
From:   Dr Rhama Benson <rhamabenson@gmail.com>
Reply-To: drrhamabenson16@gmail.com
Message-ID: <1426456914.1756697.1598957995255@mail.yahoo.com>
Subject: Can you be trusted and sincerely.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1426456914.1756697.1598957995255.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16565 YMailNodin Mozilla/5.0 (Windows NT 6.1; rv:47.0) Gecko/20100101 Firefox/47.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



My Dear Friend.

How are you and your family Today? I hope all is well, and I am happy to share this transaction with you ,but you must keep everything as secret and very confidential.

I have a very lucrative business transaction which requires your utmost discretion. Please understand that you and me, are to work as one team to inherit this fund, hence I am your insider in the bank as the transaction commence. I advise you to feel free with me for all is going to be well with us. This business is 100% risk free.

Though, I know it would come to you at uttermost surprise unbelief because it is virtually impossible to know who is trustworthy and who to believed I am Dr. Rhama Benson sum of $10.5 million is lying in our bank without claim i want you to help me to claim and receive it to your account in your country for our benefit.

I am aware of the unsafe nature of the internet, and was compelled to use this medium due to the nature of this project.I have access to every vital information that can be used to transfer this huge amount of money, which may culminate into the investment of the said funds into your account or any lucrative company in your country.

If you will like to assist me as a partner then indicate your interest, after which we shall both discuss the modalities and the sharing percentage. Upon receipt of your reply on your expression of Interest, I will give you full details on how the business will be executed. I am open for negotiation,

Thanks for your anticipated cooperation.Note you might receive this message in your inbox or spam folder, depends on your web host or server network

Compliment of the day,
Regards,
Dr. Rhama.
