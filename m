Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 667751699C9
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2020 20:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgBWTeH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Feb 2020 14:34:07 -0500
Received: from sonic305-36.consmr.mail.bf2.yahoo.com ([74.6.133.235]:43988
        "EHLO sonic305-36.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726208AbgBWTeH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 23 Feb 2020 14:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1582486446; bh=VxFSqOLnoyhxZXWK73TPGK3hr8yutZ4yWmLQa/jSY/I=; h=Date:From:Reply-To:Subject:References:From:Subject; b=Ru6kRsNgYNxrgJKwo8J7vl2zlfaGl7ETU+aX1fQPpyyJh6XVeLLrr1iWAby4XzPXvcqX//YCMCTMRd3VLmjOZxI3hpxF2HJ9ELsVuwv2fbznZ2MonCTFn1/+gqmOiezHAAgBV8/9HtYncPFwS6y+XX4/p/hqjz3jLT73KbWWtT/bE4Gx8mRdy8cwdnQdSW3yAArgXbqYuGFeHJT1yX3wOInNpE59+wnZmxz0hr+S0a5aNjzYvo2irvmQThY+DPasvNzcgeLFC/d03gd/a/7isN02nXEcgZDcxJKcWv2lSpiggb3qmTDw/27Lu2gJMQ3sl4DwkXUnkI1l3fTzoSptGg==
X-YMail-OSG: BtObS7EVM1nTVN65xaJUufmCxJji.Fpe8Cqbmi6Fj9ENPnGDf6LuHTPX3xelaB7
 swPgHzZWKCvszS8F0AhulGEtMeRCrzmXAg7MmvbA4WbVp6hVLcn5GXmT3_Qm1ZkIExrbfj83yujI
 MgbTf8Fk_j3nWyT0MCzUh4kgOsXB6VCNeqk80iIvLNS7MBMtT_EKeTtoZQvs9Y4Gaufp_ucDtWta
 SNaYaIv0TivPDMEFxHoj53sJh6HDLMjAP4LbcC.8nw3M0W_6Mj0tMKcXoaWiM_UZFEaQuNBzEpkM
 wLFRTUBCvm_qdax25qH4E.4nPvoqBraGB3tfVjMYepRlZjzdXTfKTX3ARX2e_s2YKUEI0U.CmI2t
 WIZoeN3Z.av1xyKbJuvkWi0Rd16s4rA71gPQ3PfYjAI95li0xeXK5Rf9zUd2ponf50gPhGFnB5YA
 cMRHM.i8_MthEWcclN5WzJbfabA4SspzhGn.dxCdXVOKV5GqHe91LprxiFr2mVLIfzoquESUTvGz
 i9Izxog84co9XE0TuMZ58IiVlRwjiPOt5cABCgytCuKgf3yPd_s1ht8yVkqBR8iS1HCau9LUm2rE
 teZq8tdIW0bLG24Nfsl8ugXd6kBZFcmWm8SbVpyJFuCplX.4fXESnSwd62YnY9CunXyWCDsaLW8.
 j8ngbzpb0E0Jp3Uq4N2yHsoSQw6EMX4MaSnhhgeHizflD8GhnEf3yZZxU2TVIiXBvU5kyBpI.Nl2
 K_Hm4F0UOM3FtsrAwfvRzO5peEKjlNI9mWaNTO5vMEMwSP1xDtkFTCxbZcqhh2eXmX_uCWQ9UtcB
 jU0r18jPxZpiswMfkiglofy4Nwc2lnkFe3k9NM6i64HTQDXqJ2Y_aiOpTNuWVC0e2ejN0lGg9kO6
 CecZF_WcpOtz6lvnE.gbAj6nL4sF51eJuXz6uDA.xoj0j9in4HYkBm.MBJnGTZ46IjennIBiWJUd
 t_9wLHg6deKRm0_2HsumMGKc6oVSvdsnQBdJeYYIPBncpB5.gWBCVQQ3JVxaZA3f_ZWFtAlEx.YJ
 wGto7bckyfoD2NiTKjG.Q9phg_TS71yiPVcsygRxrkBJhgY1lEWnmsRNWFNH.pXHYU820qxNfwrS
 JQAW4eL5mkuYZf0LprkILnNkw.1ILCq7yLIjlI7LHoYFpG0qxkUFYEctMiXXPW0GL6igNiJcSJAR
 p53Qymg6rHhilg2SSIphMUOagvvCELlZ2ivU9DFArOgw3PwrrIFQhu.KLrGy058cB3wFy4JWjVTc
 36SRYVcjpA0FW3jAn4E5ZXaDdohdksWGM1Ayh2oFhc4QwAkpgt9I1z1Sz8Qi3JpfEtKyuE053b4w
 bB9fMq4QRC_BUofuIqleAvuuEI1RzgmsEwJ7_gQETIw.X_40fqMU-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.bf2.yahoo.com with HTTP; Sun, 23 Feb 2020 19:34:06 +0000
Date:   Sun, 23 Feb 2020 19:32:05 +0000 (UTC)
From:   "Mrs. Maureen Hinckley" <hh5@gztmo.com>
Reply-To: maurhinck6@gmail.com
Message-ID: <843874354.5079702.1582486325912@mail.yahoo.com>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <843874354.5079702.1582486325912.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15199 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.72
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



I am Maureen Hinckley and my foundation is donating (Five hundred and fifty=
 thousand USD) to you. Contact us via my email at (maurhinck6@gmail.com) fo=
r further details.

Best Regards,
Mrs. Maureen Hinckley,
Copyright =C2=A92020 The Maureen Hinckley Foundation All Rights Reserved.
