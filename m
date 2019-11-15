Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F40CFFE2B2
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 17:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727540AbfKOQ1s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 11:27:48 -0500
Received: from sonic316-11.consmr.mail.bf2.yahoo.com ([74.6.130.121]:41077
        "EHLO sonic316-11.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727423AbfKOQ1s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 15 Nov 2019 11:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1573835267; bh=sgFa7Cs4ss6n8sA+brLiAjHMpjB11xRWsbVGUlCB1X4=; h=Date:From:Reply-To:Subject:From:Subject; b=n4zG5RWorBfhRqGFQ7plRYBYWHlj9gYauh0BpjI8l7BF/YfyksVeg6gllDyIk//mgRMx3fpT8DYBVtptyDniJ4v21r+hHeQSi85ohgR4e/hbEeDBKcE04FIo3JTW9mvccB9TGBp4JyzfOqUmDg+LDAD95xs3bftm1D9dBUgBrLS3GpiRJGJaavv0Z89yzTrQieRQU+SLVfxvo3HM2rlKUScOYJaIOXmXgfgahNRfVS3d1Ip7XCAe/AWFrn/V5QhRWRQGKzo0MNoIeiaU272+lLuwnwBHoo2e1U8Wenu7aNhm4xnMS0+5jIWlyfyeXmg4giVu9FnxFAlE1CQMuyTxdA==
X-YMail-OSG: .KZi1GUVM1ke_Db7qo_I_MdsHQPaJ1yTOpG4Z.ZkdQZoBXVLr6PBo9AVWBUEnlb
 kJfFHzsp09rXcve0NjbAgeIUmNFUDTYsSEPQrAKMJpMN3QT2BKYmNwfmlgh6U1tTpoDQktCW7It9
 kUKuPTb4sTKyaAVrICybUJh9T8umaCoXb5beMh.TSy8sEJBj2WT.tuaAFlf8f72rxndiw0n0YsVS
 VIdH_6JUAtcGC0_McibIwcS9VV3EppA5hOZvBC7avJmjcfRdoWJf4VHBiFfHbqRfdfI9WusCUlrl
 hU.0iAoScvL0FNt3iOBLJTjI8Dw48YJORjHD0XhCTXZusoWcIM9wR3AhEtfDM9dSICEz1MnYh8_V
 ipR5u6wB4IYpnTxUco8q43tiUBULCYrowaiBBq4B1.fK6tLZ7VW92iaLSfZ8N_.urMKcmRAZzMlN
 W_SSNTHdAL4tQWf0C.nRBk1OCXNFfZ6BremXwByjZltOHVX7EjUEWiN6kaFlR40UMhbzrRW8P84V
 gWWMEPfvdGeWVBfjGP6IA7PCb0_kQfHdTC0S56tj7uA4MT.RAP630Da93Fqbc507jBqoWUEzNmbS
 S.NhA.iDWPXipvGIXJcSgcKCa2pDtjpABNLN3P_EGPeaqzKz1krXANgsC.vf8I6myp9PnBlEs4yB
 IOocnYvG9Gwu8wd9xGJBhRBtutXrCAY9C43SIjb9xotjhu9HWlbYiCrWPXn6kQaHbtmC5ziZn5xJ
 XrxYTPqLj2W6sPeEESJxthewshWyxEhH3YhcD1qh2igxzc5TXFlNnBGYSVh5NM6Uv0hWKdfH9eFE
 9ljIWt_qSrXMs2NILrntKjVr45UkRQOdCr1Ux6yiNVKdNCmMlS3g.MKmFfEpQRXde8wqtsxYUaNR
 IVLaXZvG8zGYOsTr9dM5wdlNPG5JTmznhmY.H1AILOVpwoRSCTSpQzq.zWZOaWqM4rnFO2ExzqzY
 6zQQcIlZk4EBZnUfxNZHAJdbEn9UFlHUY8TQHS25noQ2bOJC.KsFXFnqiTNORMIzqQlQtF9Jpeta
 U4bY4hwGSLQikAM3rIQ2x3QHMlDqQMfLLCsxoxVdJZRH374Q9Z46oNYJz3_UKr7ez_cxQp2irKo9
 XwEjyU58DiB9qDZAQ5qqcQDm88sxhGX61wMJbvq0zXh2yo.CKONbVq5eDUIEaCb82dmwOuWEU83v
 Azh.5jjfbItGrXCnRMLEgNBmS5EvfS62qw7Dan.ZuAXgoxoW7oiJSXaNGGryvRb6yWzInOyB_t1T
 qiNh_dS0s8zhqItcDz7Xre4BiGGJnHIkFrI3kigQhft3q5WsjC3z3K7VYXfelfFDKYxPptGB1W5P
 FWQFN
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.bf2.yahoo.com with HTTP; Fri, 15 Nov 2019 16:27:47 +0000
Date:   Fri, 15 Nov 2019 16:27:44 +0000 (UTC)
From:   "Dr. Youssef Bakary," <mrs.nathaliehamon888@gmail.com>
Reply-To: dr.youssefbakary1960@gmail.com
Message-ID: <1375579144.536090.1573835264383@mail.yahoo.com>
Subject: Dear Friend
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear Friend

I am Dr. Youssef Bakary, I Have a Business Proposal of $5.3 million For You=
.
I am aware of the unsafe nature of the internet, and was compelled to use t=
his medium due to the nature of this project. I have access to very vital i=
nformation that can be used to transfer this huge amount of money, which ma=
y culminate into the investment of the said=20
funds into your company or any lucrative venture in your country.
If you will like to assist me as a partner then indicate your interest, aft=
er which we shall both discuss the modalities and the sharing percentage.Up=
on receipt of your reply on your expression of Interest
 I will give you full details, on how the business will be executed I am op=
en for negotiation.=20
Thanks for your anticipated cooperation.
Note you might receive this message in your inbox or spam or junk folder, d=
epends on your web host or server network.

Thanks=E2=80=99
Best Regards
Dr. Youssef Bakary,
