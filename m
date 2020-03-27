Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2344A1952B4
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 09:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgC0IW4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 04:22:56 -0400
Received: from sonic303-1.consmr.mail.bf2.yahoo.com ([74.6.131.40]:46061 "EHLO
        sonic303-1.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726169AbgC0IW4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 27 Mar 2020 04:22:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1585297375; bh=NajTNMrfMLb6UXcjRhYpYerQX8PtVBLz0oFgaMINSWY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=dUzc9c8bsfaykrQjvI88uwMC6TZEWw1nvSxvVOTICqc7caCrbQ3LaWn+w4r70UVQLZ2/hOV1vBRy1RUBUXGj6QSaKLTMrSBgava/ujb+WZyy+bsNKTbuUm2w2ft4gG/LODa/ILs8hHHuyfTqhb4jbvKcBURwl2EsRlby/FmgE2TjNY03vmsHLt5d6WoYipsRDhOsB6yekw07oS36OOjlITwHh60/O46fGQO6jz19yY5Qr26vvWgaj0mZKm7tpISGmkpFkn266urhadGCKZB3xj0QJtyj1HYVr2xg33S9meP0SyqhkV4C4cKWuYYema8tboUvTjHCjsbhLnn0P4wPLA==
X-YMail-OSG: mU6orekVM1kkfFEViLIqw3U6dxIwi_13MMW.FfcSKoo.kVG7mH5u5KYkaTJSKYU
 HwsCgZhq9dtKpSVvF6Oku.N2C.FFXeVZ4oneUX1uisY6XZSZgMb9oJ9Dsa6DxQjI082gfd4XXNg_
 Tq3vhPNzBS3581595ckMX4JO2ce2.PKYfWA3xOo__JLUKMf1HnD8DDC.VGIwI83ZVkwIXyzryD_c
 .gLLK.i6tohy7rTBsxdAcnt.Cfc_bh_AIG_In2crzHcW_yILWltVnIpLPeulTF.eDWQdJ2brZtd4
 r0D86cwwRumioQeYKenDaqAI_HE7zmTInHFtGnBFNLHiSBIg3nmLGOOj97vv5.UJl8yZla5UX8Xd
 GeiKGH6u2tLUT_jXgWHbniNS_C5k8Z_jK1ZCR1mJO8EaiOgly0uGO6.NgNNPTI1_VvBvjZiFOmRq
 c4u.KFdah4igWZcPrlWitYiwmvsOnqzpTkTwZR0SJ8nO.SBgq_dNCpw1Q47qcwzTc3PLdOTDGSkp
 .pxB1dWV8d3NuBg_y8kqqJwyd4JS27uDEHQfJK8fGs8RiiHkRDHr1.fnjfMKWNd9Um_jmenkbCXa
 DkrwQMXEvlBejJwAbjuB4padAI2fBUQafgBk.C3QNZrsjlbrwKjzExW1.kWzJlNS_jzlOjchC3AD
 wX2V7H4lDQk22wSIc8YDedn5vQsiyCyTTPerDpBPKz8gjyXSxMiWWtjK_llpfQQHtySPhhRhFErn
 M7eQxNgdohj4dfoxmNqK0zyAAEr.fgCjaxBDv_1pn09CHkYWwfe_RLXFLirCQX3zRjqB58cPGjwV
 iL0RpB4vid0L0j7PHPkokcqyC_7lA15HYtu.XrfR6q3HzKG.S4zNYqAq7d8SOhWkvG74dnKc18.L
 imeS3UqEKdGwFy2BDfFBAw3kLNFaNbmmpgEjdxCVC.eH.AQ.gMKkl.Vw0TI.DPT0ItE611FM0eGd
 Lv1oDIUj5c1JFGIc_2iXtJcXACYHFskJ5XKACZe.U7bBVtXpWSzVh5Hqv9DgOjytno0NEWbz_ryu
 2rJb6FS0MlnOncIoOMnWIqCC.YfLkCt0EmyccEdnKbAouzQsTh.M_iNupjQO95Thw5PeIhpr44Se
 PtM6PMzXIytkQs0KwKM4csJFYEFbPWsw3RVwtL1zVXTXToMewW1M5De5e7lWBImeNp.8ik4VbCeu
 hUqeQzMSNsmWetVkOmkyGOSvh3q1efTLA_C77LQ6SNHlUDwoFDljmdlShn.UR0TFjZch7L8tDXJQ
 HxJkoOPJG6eVSFX3Z14VgXI9mfSL2c9qvpc0C6.ikc3HlszGXUmx8D1DPOioWSFJ5MBTFGOkZ6u4
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.bf2.yahoo.com with HTTP; Fri, 27 Mar 2020 08:22:55 +0000
Date:   Fri, 27 Mar 2020 08:22:53 +0000 (UTC)
From:   Ms lisa Hugh <lisahugh531@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <1852203301.1879507.1585297373380@mail.yahoo.com>
Subject: BUSINESS CO-OPERATION OPPORTUNITY.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1852203301.1879507.1585297373380.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15518 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:74.0) Gecko/20100101 Firefox/74.0
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
