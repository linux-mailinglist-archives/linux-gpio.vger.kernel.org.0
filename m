Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F27414EC45
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Jan 2020 13:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbgAaMGB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 Jan 2020 07:06:01 -0500
Received: from sonic304-9.consmr.mail.bf2.yahoo.com ([74.6.128.32]:39413 "EHLO
        sonic304-9.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728374AbgAaMGB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 31 Jan 2020 07:06:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1580472360; bh=xdKFKwXhZBMMCl04ee9fGA+BedEzlr47CXgVbSDWzkY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=ahX1z4pBautTLek09eNnGQ/k0oGsjSzk5H10Kndv0nPQtb/O4u9amDzrhBcyPxra4llwCbJum/wgOLXJYPujjm4qrOmqRggKnj64pWf+LouAv8aYV5P5ZasVpvANVuhIIBW+agdibt8JzWOKO6DlJQJsrCjnTOUwIrOaOOwEd1UJeGnpsyPrJkxZBCG9f/IqeVH+JPCLRr5n3hcmk4z1zhHUyF9MrVXFateCbQD9xD5p+j/w277ihm8tbnmlO8Hn8NCZOkbp/cqMTt662OPst2KFMqHU8xeJlc2UeDlvsDLDunNf2GX8fgmIuJNihzkfCcIXy5ZDmXVd/pgHviEYOw==
X-YMail-OSG: 8b4M730VM1kBi_V88gIN9BDr.aralQHRbzLanscVHWTGAMOXgHwGf74RU6Lfeb0
 fgFBsABXH8h__VXSwpVE7LFG0xHghSitJnGmulnDRuB7Ov1mwC2E__SCrgf3g9U6tMC.kPexk.F3
 qTaAktk7Ad5dmiYRWMAa7lpEH60P.1LTXY6NLsfGC9MYIPjL63xKBY2c6TKzVk8JomlAKNRCcJ4A
 NNaM_.yP2ikMXfP8uUELlmur9RGkc7r0xTFannfmNMNocIyswUeWeBxMD_Kcbf38M0P8UT_7E7ul
 rxIMg4bY5oByzEEtbovm0TiQAT0wXaAa0vK0DJeQsrHyEinxRq9v4h7FzmTp0O60cwMgmQbSiEX7
 1aQ4NHR0xtTvzO78O3vLoFCAReLCEJt7I2GHbwDq57LmZPpSMlw1ue.cqX1GA.p_ug812STUAXfg
 3pcm4tiSxAwM7T3FjiUGp5agooy0GjXvDBQa1jevtN.Q487vpktVAz0Af2oDxtfcfirMVqoZj0y1
 yd42Uv_NazgeNeFtqG_6XWZ7DCqjUsQ3ihtKHn_QAL3fiEDek6ayzv_9qST7A6pTWUPiP8dQcHbv
 NNKKChLs5575IIXo8wvRWR_P8R2Oi0MlrwQ_xs9kiP2nqfLivQhNJzgLcq4brJxxi2olfHsXYNTq
 oNT0o6QmdO2NyqrbE9udKwPKp8wQcEvXJrFj.VwEdddubhwhagdCfUZpI_inXGI3_gloQ1D1QsOa
 OP_RjJNRyuFIQQOPbqenbW7lb5fpq1prHbqvYTt28C._GE_eWUzw2pRHmb.hgQk3sjONP50wTTNR
 1.CUF6sMFvtS4ST_GB17ZFUSOAj66ug5stF8EqPxZGHxYgPDeXJaCmxKnPHJSVzsY52BdzneLSe0
 hNz6RO9tDZqhzmTwC_u8ROs0DCQiovdmFBf_A75fkaKQwPN1CbwQlfOkDmn1cOXFuskRRGa0Kvcf
 GyhDSuGX_x2z8qfoWBjMBVq6tth6o8zc_hHE8T71pJU.yilm.XFIaHV2B5Y5hDrm4fryBub5IfnV
 .BhSxgr2_e7NCLKBVhrrZu8GQepQfyOlvF.ioAxW8pnYJsB_YwK32.yY_rfRtnVzLtjEpugyOs1k
 j3q4_lgXplbzsgL9zqwmzyaPTm9h96hgD4M67JTiWICSAA.6OWGiQuZO0zAMqmC.pv0MgNYqRdTl
 BxcoeBpAl6DOu3h_JWvaBLnj26.7x1BgqSfviSDASOy8scXx7WwmMJpyz4Q7q3uMU20FkaEoF8gS
 _qy9wJQmEoRpirWQ_n.pSoxVI.a.jNAh7jsWxiseHhljT2c.lVNFC3U_oiDeULDw.XYQi7dn3.P4
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.bf2.yahoo.com with HTTP; Fri, 31 Jan 2020 12:06:00 +0000
Date:   Fri, 31 Jan 2020 12:05:56 +0000 (UTC)
From:   ABDUL MAJID <majidabdul55@aol.com>
Reply-To: majidabdul70@aol.com
Message-ID: <1120265110.602395.1580472356791@mail.yahoo.com>
Subject: Hello Dear.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1120265110.602395.1580472356791.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15113 YMailNodin Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DR.ABDUL MAJID
AUDITING AND ACCOUNTING MANAGER,
AFRICAN DEVELOPMENT BANK
50-54 RUE DE THOMPSON,
OUAGADOUGOU, BURKINA FASO, WEST AFRICA
 
Dear Friend,
 
Greetings and how are you doing?
 
I want you to be my partner in the transfer of the sum of $23.6
Million dollars discovered in my department in a Bank here in West
Africa and I will give you more details on this when I get your reply
but be rest assured that I will give you 40% of the total sum once the
transfer is completed but you have to maintain secrecy of this deal if
you are ready to work with me.
 
Yours Sincerely,
 
Dr.Abdul Majid
Auditing and Accounting Manager.
