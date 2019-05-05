Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2268913C70
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2019 02:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfEEAmb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 May 2019 20:42:31 -0400
Received: from sonic310-17.consmr.mail.bf2.yahoo.com ([74.6.135.240]:37742
        "EHLO sonic310-17.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726768AbfEEAmb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 May 2019 20:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1557016949; bh=Wn45IEVQxjYS/KJ/AenupJ6pixj3tpnk+IQw8lNF8Cw=; h=Date:From:Reply-To:Subject:References:From:Subject; b=QwQEf9Vk7p2Bz0uElzVPePsJuZji1iC6YeOL7jvegtYtlbBn4L8K/5r1e5y5WWjiRCii1MyiaV1A5QduEHHLfU97F+tUTj4xPwE/zKFKcSOBn8ILh6NsOzxLnyK/iHFnfC5kbn8ciLy3Ck20iXTod166k9MTNNt8k2fC9FICFr/zxrTNoaor1DWgD8hAOgomHJKbM6Z6r0L5kGoykmmiOkQC6FoEMdPJ1F4iFYhk0nb0r1I2yFvn7X9rtiiVIzu3egKb1wPXPVpvdsEyEV5IwY3nZ5llVRapRJIG7J94FHDPc9Nt4pkrTRB5lU9yBdL0nQNXmnJEIP6Kl00qpBYSAw==
X-YMail-OSG: Qb66hxgVM1lzYcSc.B7605RVE3v9eXBp8Mk_lkQ8b.H2N2ijQ7q_dfE5AwadAsk
 ID6PfgFDC4C5km0QAqw_jcvfRWmQQ9xuL12hW1hUgygTuUF3Gqdgr9.952837dreub22ngalPYad
 QHlrPh0aJzr50CH_QCYqDNq5Fkmn4vvdbrsRsBg71b7o.URz1.lZJmvfZWg8tlRW1TsBuQyUQCVi
 4T5ooFQrHbHOF35WyuweLZoefWkJFbcd2axlTpYdW0VjV1x0qBKkNp25mEMcMhNiChLyjUjjLhb8
 oDAij4ImnWfDHfxHKZaLwtdxFDUtVo1mYO5m_c9fn_4KSn2i0i8rrHe_NtjgWuj94VvB2s7fz1yk
 9rBMSQU9OQx9GT0DegM5dEQv5uwh3bvjKHYnTQprLNFcqU.ItAYy7CDKz7.KrRHcthelEI.7AW5J
 4UZIXRVQiFbL74VgV5DjQfolq7OnI_UOuwhESaPfeNzhJw5z7rHarccSLuEJSTRZeo4nkBaV9Umv
 W398rxV.3o1SBHESQnHlNbV1wjCornNuVz0qRSRjwYjbshO43gjKZY_u9yw2lVg2.FQeX7_MVvlM
 1cQy2vS0mmHAphfpsEQ2DZuTr8.Uzr1FaKH1.UVjZvGTuYkbjP_EC.N68Af.NCMpgy63zjZv2MwF
 Z1Mdz01BzOD9lWZbebU5FAH4WFDaE0RKxZFyRKJOypAUBo6fzYrpulqs8gHmd4zRNTRt4s0Q.J6O
 aMgTImQ2g8KfBbMB6xFDfi2kkfKo_5gKbB3AygKRj.cKDemcQrCSRkEgl_llMMBu_zJYmUoy6lPu
 N2niTtP39uKY3WmCmQZ3DQN3U19s_xg.lF8kA0.0njkTTIp74r8aAOnTmp4Sw_d3LU.x2yZjgg9b
 h_60cJ5O73dU6brRjQuXwgddqzdy6sgRN17RtBIpWnmi9.L1kQgNJocF.zHd1dAU0sKxdTquV.oo
 GTeA187VxhOIclYFqZlnw727ESM7cIILoecylnns_1b_BIxCXgUvYzkVWgxEnfXa8zY2GNMotyLb
 c_2NYIbmMTxJa1_ZFhc3H7XK49hCsukDzR8hc_1oufGb6EMMMLGC.kGVoIcweUcaSdQL.s1GZOHB
 eGZ7l44ghdQXoui4WGPoGJ3x_QTDVEJSOfCE80kDNFj0fpFB3j18XUkxIGPDDbBA1qWNut0gt4kf
 kz1nt57baTyvXmlAsM9oSGNaQ4VgoaY1CihcdyDaf
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Sun, 5 May 2019 00:42:29 +0000
Date:   Sun, 5 May 2019 00:40:29 +0000 (UTC)
From:   Major Dennis Hornbeck <bc27@btopmt.online>
Reply-To: Major Dennis Hornbeck <hornbeckmajordennis635@gmail.com>
Message-ID: <1109310748.228824.1557016829171@mail.yahoo.com>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1109310748.228824.1557016829171.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.13583 YahooMailBasic Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I am in the military unit here in Afghanistan, we have some amount of funds that we want to move out of the country. My partners and I need a good partner someone we can trust. It is risk free and legal. Reply to this email: hornbeckmajordennis635@gmail.com

Regards,
Major Dennis Hornbeck.
