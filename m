Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA6A177535
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 12:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbgCCLXY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 06:23:24 -0500
Received: from sonic302-20.consmr.mail.ir2.yahoo.com ([87.248.110.83]:33177
        "EHLO sonic302-20.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728037AbgCCLXY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2020 06:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1583234601; bh=eg3qZapD09VJqj25AUJW5s1BYxWsWc1QdQQ9ZvAlPmk=; h=Date:From:Reply-To:Subject:References:From:Subject; b=ughNi3J4cDTFMWQnkRgo21rkHzTHo+JMCqFQbQ9f9W7HpRGdeVlWd0SZG9CtXb/AbANkV9mM3ud0UfY3dlhQnD/zKJUpXqMNrqv8qIjKh0PQO1ZmzUSC4E5hMyFGOqjFlx9w9LckDZ9arGRx835MFAlYTxiQOFcbl1KPNisI9dn9+LqnHjQd1riHWndk4+WCxWhUZ4DNN6JlJBKlRhC6Rd9ruTF9efvYZDpNPJW9dCqxybYne1LkUFsfRs1+PrHTrbrpcrDroSPXlbSbWgt4i0h68g50b6lCQT9df1x75b+1GVOcE9QKRXB/+IWWIlvNDBCSK18uXHYVTMHGnUHdZA==
X-YMail-OSG: wKp3dy4VM1mUvqFrOqPQygmRhvH4yNyzutUN17WPplY6YtOHpDSIKW7BODw_I9e
 jeG1QC1R_KDPT22KQvENJcIN2_6jGWQJacXo56wUIyb7bqJfDSRY4_ynUgJmU0bQTDDwtkKZf9b5
 Ke_8XElj8qdZaO_EEA1jCeEOsoIjFeBanxVN.dpDMXvc.5.UsVDZQWm2ov.grflQ0Zbqh2Pa1hrC
 3h7Vgx1_2IvVuxxPT6Nl9BICNTFybygQ4wM6m6bNuYg3lPVdAz2staXoM2rImNkKTjYGQXV1ssPj
 uyp_1ZATv8BmN7P_r1h6maq7rAsXsJMYjSkERX85vi6yehjq0GNMOxzCOJh9nINV_LBY1ib1P6zk
 u.GGwJLSzFAFsDi7DO9dFk32nbhNXog1NWGq8ECHOri.TAk7.KtCKf9.Su3Of4QbDrGFfHBlgEZB
 NVFrKT7gP9gAFTnjLxlqlr6bGPcR50Xh516Le03a8pTow4qHqRwTN515gujMCkZPvCGyoj.o1Yhg
 NlAOOCbK.d35Ce5XA3XRUaxiGlPxvmXLeYNCYZAAMfHaXdylSvP7UKUJdESQZI4EUYOqMt6OYuIt
 Ocu.XMrHwJFm9bhafbadpOP2C_Ub3WK_U_CPhzLtRmGeP_a0sgDe0xQgCrXrcKjsgYVoVHwU9.gb
 qTtgDSQnT0qSLF8US5VE5YyjMrvVeb8dssDiUI6h1KbGWXYEazYqoYrRg72wGqBgh8XbYkDmBtwq
 DNSmAHAMwAaPcukmihUY33mgx_fYA0MH4y2h3a698sRC68AoSLk8_.36YCoX_.021liJQFcPV6XR
 AgVf.szqM8QCeTAq7msp28jDYZRUzJP9HC6lH3niEow26V3OayK.XG1d7Zgt.7A7sFN_xOoGfSsz
 2Z5Ijg4_8fEx6PhPGUhF7B.Xg4EM9lZPNkGiQp.FbmxLHpDYylGPk_PtQtl8ZzvXjqIaQkJlwr1D
 PVJa.jrxzT3bP2ahvcCFFogNUup7vpQQ0kGYv.h2_g7eMOcpgU6trzSDXigCCBNii6pTPRBWDUEM
 nMf7_C1cupswJCk9ZhA1hMsouiqTaClhjAvyoj__sonh9RKTrOoWgt.H3Hx6I3GBsK3OfXG2tzCq
 HJ2Dcxvz9PP_Yi3D_8lK7kxXZBRiemN3XYYHSOWSjaUXqyMQ2zqOvqf1xaMnK672bbPZrZZD5ghB
 s4mG970QA59VXeTLc.xvGsbSzKBEprcnsXO6cpFKXx615aN2I9Rv42n2z7Kn4T7BD1XOdT_SBd1Y
 Gt5jb1evqxVhjxI6CWYFEavy0UT6Guuy3hSpuvvdeHNfmKmy6Jw1JRBivVbx.BUU0dOw-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Tue, 3 Mar 2020 11:23:21 +0000
Date:   Tue, 3 Mar 2020 11:23:19 +0000 (UTC)
From:   Ms Lisa Hugh <lisa.hugh111@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <1827864370.5549752.1583234599364@mail.yahoo.com>
Subject: BUSINESS CO-OPERATION.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1827864370.5549752.1583234599364.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15302 YMailNodin Mozilla/5.0 (Windows NT 6.1; rv:73.0) Gecko/20100101 Firefox/73.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



Dear Friend,

I am Ms Lisa Hugh work with the department of Audit and accounting manager here in the Bank,

Please i need your assistance for the transferring of this abandon (US$4.5M DOLLARS) to your bank account for both of us benefit.

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me after success.

Below information that is needed from you.

1)Private telephone number...
2)Age...
3)Nationality...
4)Occupation ...
5)Full Name....
Thanks.


Ms Lisa Hugh
