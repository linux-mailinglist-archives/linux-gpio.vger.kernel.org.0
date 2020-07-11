Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB02421C590
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2020 19:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgGKRjv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Jul 2020 13:39:51 -0400
Received: from sonic314-48.consmr.mail.bf2.yahoo.com ([74.6.132.222]:44900
        "EHLO sonic314-48.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728510AbgGKRjv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 11 Jul 2020 13:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1594489190; bh=AEu8nK9QzTA2tbqo2l5BVwPShMs+2VsmLoZOZv6b3Lc=; h=Date:From:Reply-To:Subject:References:From:Subject; b=p4b0Y1nwTGVJDuMcE6h0nydvf0/cpmzL3/erV1jB5AkCN51bHCxxXGmha6zDlYzrPmpOlhaPpq2dl68vjJjb9PdWDHEkI//a/YOw14zInALdsprZmIH1/l94Lvg/e5i3ihWvdTZpsaBXVTI5EmU2X1HrlVMLuPBlI3b15sAfmqWH5YE9Vo4tADSQxtiBHPOL4jW0Ssi8jOIY9rf7x+jv6tJb+NhldujRol7cfgISOllloqevhi20T+qqj2oLgOM6POFWAjfoSlgr9ErhvCCGrJx36+zoDE1OWsn0KQ70+Giv8CiIxMfZJeZg+7Rx86j5MT0Ad0zljAQ7+2d0iP5izQ==
X-YMail-OSG: w6raM0QVM1n3iDXw4i3OqZ74OSmIRS4MQeDpyJoD0a4Vc01VStzZbTcbZSN_Im5
 4rf5mR_jomI1MxTjub6AdwwxAH8rAN7XkGtsLsy7qIvuHhVTY3SswyWR5PIf1sXqnrhUmEEWmA9i
 LFx48ixcLvIIiP3pAw2cd1zVWnuPWfQNGxLJcSmNn5IzIoh8JeKurF54wmNhNjiywjsbWpBa2GYd
 vuDJyBQcl5audnqyZgUGTCDLNlfJeasS6PFgJzpfufl1Va_ZwO.tlxzPbJABae.jypWXzaNPPeRs
 pnXMjyf8dNBlL2Yj5Qv4MTl5Mwd5XR0x8O6zh1AJh4jLfHbMWfdwEJRdYGHRxziRiK7H65KtBnLE
 mty.ajWTiuaQtQwNvpch8FIp4r213cHqmUCUls7riX4nuU0FOKr6tAkyv4qMf7ZHolxcKfmiETAf
 KCNDkYhtliw4XnynMTjHDUs5hJTDCZ_A77ibsS35PXJi04UsU6i8J5Ly3o6j0_7UQtjeC.nuzy62
 tMrT_o37w374WDQHxwGeuBlKZGr7dSSJ3NEKrWpJ4p.BZgKb9H9nLtIzC1YdDcJpR7o6kl_Xvr1C
 ibuKpdI9VgXYpIsRCwlaE2qT1OPqnT_fKJiwAk5zOdKM7UgbBuSfDY6B6TvfiSdsMBbL3Er.oxvz
 Gt5eBx8T0Jbw0hRSTuS2rt3tq_NnvUMeerNQ672waEwCektBX.SnpAc1sJRqE62ktrevWc991C9f
 B8Krrj4Pi7Fb9y4otyI_e0TophsoOBhbVX.3qT3DyaXCwygoq4x3A96Kx5LhHj430sfEzKC8LAac
 Q0oj1YNapVcqiaXgTEE9yv0Bb0mp3P82WYJQVkOTPVd5HieT5wBpNST0PqLFcT0dsA4GNRe7f8P8
 0CbI9V9FNEbHIdRiNH7yO7xiEiJEMMFpbQc9iLht8OanMGdA4trX9eIKRu3e75eGDNklQhdgwdfQ
 ZsBjABAPuBejVfRRttbdP8A2l8BehoK3ZbWIkmFnoje9xJ3mvLzfkPQnbOVEqpfnMT9E5nJv93P1
 iabdrT.qd1jxgZDHEq0QBNhgjWFtUBuKTZm4bdgwqcWOeZKiWCpFJWTFBNWxQ4FJbCOAnw1feiaa
 ec18yUggnkcC9xZBonIPNV4DfxuD27dK6YhyvsyjXR_HumRHQqV.qko543GTPz0A2hNKUlVYEbyi
 3wk5fGhMjHIod93zM8vsKsclP4thrpwz5EcGFCL2KfOryxcwjp1g15RCbxP5X7ni8fsPsISWWHen
 nMXlXTyP2FbmigWqHlEXm2LpcOm0u787R6M3F6qdGCeoouYZvJ9wJeOiAX9yN0PrmSMsG59YqDAf
 375tSY1nlys.hJMPFcH7_xq3FNEG4HXmW
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.bf2.yahoo.com with HTTP; Sat, 11 Jul 2020 17:39:50 +0000
Date:   Sat, 11 Jul 2020 17:37:48 +0000 (UTC)
From:   "Mrs. Maureen Hinckley" <mau33@hgvt.in>
Reply-To: maurhinck8@gmail.com
Message-ID: <713739125.181155.1594489068941@mail.yahoo.com>
Subject: RE
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <713739125.181155.1594489068941.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16271 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



I am Maureen Hinckley and my foundation is donating (Five hundred and fifty=
 thousand USD) to you. Contact us via my email at (maurhinck8@gmail.com) fo=
r further details.

Best Regards,
Mrs. Maureen Hinckley,
Copyright =C2=A92020 The Maureen Hinckley Foundation All Rights Reserved.
