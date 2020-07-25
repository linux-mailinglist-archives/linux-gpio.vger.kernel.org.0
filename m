Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B5022D649
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jul 2020 11:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgGYJBG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jul 2020 05:01:06 -0400
Received: from sonic301-36.consmr.mail.bf2.yahoo.com ([74.6.129.235]:33506
        "EHLO sonic301-36.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726467AbgGYJBF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 25 Jul 2020 05:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1595667664; bh=AEu8nK9QzTA2tbqo2l5BVwPShMs+2VsmLoZOZv6b3Lc=; h=Date:From:Reply-To:Subject:References:From:Subject; b=GmYlP+e/bkRVsMOzParmEMEKHUYQB13AFWsICOWqcuWrhsgGKJvdj4ea/+CF6w936Gc3QoDACjgcNPDnK5Iqe6MP+R1MpniS2kxLLqTeVO7Xt8vQIopLeI8sPNgeyDt7msNinrXXptcBTX3tkLzt7PlJO0pAKVr5PWxLyfGXbotOBvtKz8xfBmwft/Xq4TCsdeQb4J+9KK2Z7z12blnlByl7n7sW/Q3uR175BdlbgLR7FbA+HSgyVlLfSWp5BmxrRlIv2+OmrBhnBg+JMyvWOiHrx+2S+vhXvbJYF3rcBZkYh1k4MfrtGwzsdZbqnVrDCbQXoecCxTN80hjOoall+w==
X-YMail-OSG: z4A7ZcsVM1nsfklBNaPHQfhpZqVxeq7dGLZtSmx9i.xOxDnkUQNeggqqd4Ep_fl
 NLsVd.0dY0d2LW2pDOkXfuJwNIpmtmBffqBYxpvh9a75wogXU_.nmQqdc.8b9ULvHl6WVAq8TNR7
 I_P4YyBJfYa8OCK.C66OiTd9rYOzw.IMLKKh6AF.b5arQbC.bLGklBDlXOp9l25nCt78_TrmJ06u
 xa_rBOf37dQKERSrwiHpBFwLAtZmwRTRA8HjqhM6oadXB7uHLeqv6LlUMfn_9cMIbwl54pA1vznS
 TDFK_7nvt7h5sIDbAvSx6QahOoFecPL4r6xThk67C2SshjV5L4lZA998jxavvizu.6MF4Rb2cJr1
 hkH.5e9rPKkmiSqOnI5h00qpAZvIaUAGUUUDTE8i22Hjw5Vi6MVWgGRmMK1m.ymhaQ9k22CFKsdZ
 .ItABSK2F2vYJLAeJW8escV6QOWpJBQB1xN1bZi6lc3CQn8CGO1E36Zqs33qjwYgFEPuY5FiXqTF
 4X4u4Cc7psoiIf4vK0EVS0MwHVhGyg9BbqqdFBNSWVLngf3MqBj6R3.jB6X2GHgO.H0OJWFIXr3N
 .ABE1nBvPqi5fERo2OYdVcy2R71ciXPDR_s1hiAZIHfDTrViXSwYkeoE8mp21R7D8sDZnS2Rzsma
 tM_iWJWS28tGP.Ju1nAeHw_mxW40E1DmIdMp.rGGdYIawq4VOfE8VnF0ol1VkvnMe1o4V4ePQGPO
 MHyBHNuPstBF9eQkHt5Rf5DFTrIdQW__Mri_AwGZz9o4k9W7fONQFykBDSqOYP.X0IzCRCuyH6DZ
 Ef0XEOUOn0ECRm8xCgJ9gG9OQnVvC6y9Bl4a5XN0LMa6dBOO4dbxs8KjmLNZm4FHxbDgjvAcS8JV
 jC08m2Ne7RDaBgQ2cR2wn3Nfc.Pp7SXNmE5JehUc6BO7Zt0Q9YVfLkPMW1oaWqF70bi6hHj7KFM8
 nPNE8VljFmdjaJOLMz8MmOV.cixrV9waYYQ3JbSDPRC3SY87s3smAihpDKbY2iWy_g3QJmmuaTg_
 NwONI2waGFjUeQ9kLMGC60J32wMWK3ng2OPeQGz3jvykaJLRufO85XVRifTDnuky94yOlTIRC6_v
 w.tYph_VAKVWcn8taGTvf9onrMEfVtJwOQrBw5ztgELnKAhAssIc8u1NdvTdoZ4ImMgfsW4dEvej
 abA4Lop_hfSKsoI_iJ4tU.ZcKznwGcyoqfrMU8qD4RiZ48YytchdWXthONvLXEncZZ9wEHCB4699
 JczmekBihOSrX5AJ7tpHjQ7hONziuki5yrCSpRo2tlltPB_fGUjBr0H5ODeomGL7f.P1EKoNBbpx
 Ta4HIRMMmQ5hypRnAac_vLiGA9Pfgmw--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.bf2.yahoo.com with HTTP; Sat, 25 Jul 2020 09:01:04 +0000
Date:   Sat, 25 Jul 2020 08:59:04 +0000 (UTC)
From:   "Mrs. Maureen Hinckley" <mau22@nuedsend.online>
Reply-To: maurhinck8@gmail.com
Message-ID: <1074324192.4899846.1595667544179@mail.yahoo.com>
Subject: RE
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1074324192.4899846.1595667544179.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16271 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36
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
