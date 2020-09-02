Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1029A25B158
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Sep 2020 18:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728906AbgIBQSP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Sep 2020 12:18:15 -0400
Received: from sonic303-2.consmr.mail.bf2.yahoo.com ([74.6.131.41]:36155 "EHLO
        sonic303-2.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728908AbgIBQSN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Sep 2020 12:18:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1599063491; bh=NajTNMrfMLb6UXcjRhYpYerQX8PtVBLz0oFgaMINSWY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=P34v2QnbpdPCBUJDExjyBYoydprpbBCkhY59cR6SCfPVkfCddLg+7XkUGrA1uqnDVDVU4p1DmvSeE6y93ID6/rcX+tSUYEWrZ4k2LTQSUx/15iWBwk5Pj7M6oZI4kFxzV7365vVHiDOfhv+mDsuNr3k0nm6zRQ08QAl2a5/e5KRy05OH/0qWsZLYVj+CNxnaraYsxaV9C2RCKlN5Fqgpy1KC3AwtUTXr5x0eDVHq7qBZt0F3b4UFbJzsNSBPQ3sqBRgHDziYgbBVOVBXyT96sPrjLVhkj+vhlYYj7bbEcyzQFUkomyU0xfT43mu3ZDlomM/t6qNlRe6nXIhvds91qQ==
X-YMail-OSG: lJsP5_YVM1lF9XQK1.GJLhoVMbxxjOLpTMtkDSZF.bNvieeMXdhEBsfOy1oDGn0
 jDni9lq4ozXluuJligzmAwkN3SX92ZH0zFm1I5Be0j__s2xm.4peBsl2Q_8UgIzrSU9DoVxmANz_
 Tgb3TU_LVQiLjiN.AaX8KkZSNNtYQSvzVUjk7.GP3DPHmJIy1CDa8uDU6HNrRL8Yq2STqAT8CQau
 jjqCaLtxhn3AURZuIINjJfD0xFwh5586JX6rxGSuEzKf6_RbywEmyqMo6mHGDzLPzcavGVXNwLBy
 bSMRD28KTLJ76Q8CeYmLtRVOlc.hZyAp7WJiBn1STDTe5rchup0XwxinYGOvHU539eZqb8mjQY4d
 U0..HbrR7ZPfCwrn5YNQv1VksJDwQqADPGJ6aSclPL.qVQUuw24jhV_m0Kuvf_M7u5gDVwkpl4et
 nk_5uK6.xJXsihHRvzyub79qOYzZ1uJxqfIyTeBCclEwCit1d_s4V8eW8n74iDyoonq7hdMSPqeL
 OHAvuIdpfpGHPYDb5nxbSeaOkN6Y1Z5aWQSDomB32WAm.RxlZMrmAKLQNunXVzEZZyw4x8E4qy.C
 31YHqDdCUg4ZuRu.FkW3ZKFzZzXrj3qLK1_1SN_vlAWWrDN5ZGK1KUDqbbcBg4.eq5LEV9HVVpwl
 rBaNEyora4pXrqyVppS2rzjJ8W6wWS.zT0XNDYsxiVQRpRXpPEXAiXDk6L8Q_FUXgINWDNu8V18i
 LbV6B5gL5P0x_WoVjf1CRAtuFt4LTt1U2PkvgpuO0jgD7kru3zbu9YgKMgiLNMKGPYf2aBYW6Niq
 gj3d5GdwNQyTc.oTv.2ikZyrlz2iy8i9LGeeRufjkokOtbBd8iGAnpJ28HVLRFYEE6yo4HtIq49W
 XNrikmv_Ii2xzTQShgpfPdr3LvBkMEHk0wwKNeSSL_r3pth479RixTQA5zw4n0Sxjgr4xIUOAv4i
 zYQuZd7klrfeWc.94qA8QTV9UQu_jxUelH5IdTFzM2c4Lz06TDR3PpLP9txSwTmkFPr1l0VLy.Zh
 HxTsuByJtzSzgAX.JlFAtAhub08g3_G.W_LNFYXdITHsUQ7h_Pcei17.Ff0oKz3OJ4fdE3MFgXRr
 J1AmJekJaF4Qcvxb.mZtqNSbqsuLqUVUK1MPvgF_cLY1bxr6oUvhgSg.C838U9SbLqoJuxABn4Nm
 D4IzwFSLcnBWoWzLF.F_OFFSBTC7WPfy14cVaMtTrseVfEgcwThhcaFLj1tpLfs5IjoX4lF5Mesd
 EsmlliUU6KJrSpfesKD1fbsBTmRQ6KuPeurEypLTMEXbrbryEdPw_zgggR9copQoad1iXK8j7Xj8
 ODJoLTc2KCN1CxLqtwM4DIMfV3N0Dnv1Y2PsY2tBY0q7a391SB4ZBdOhbLiyn8Q6oD.ahcSSyf0u
 f72xTzcjk7J9aJm.NTzojJAfqvNRh9rJi.oFz9yruBqPOAMg-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.bf2.yahoo.com with HTTP; Wed, 2 Sep 2020 16:18:11 +0000
Date:   Wed, 2 Sep 2020 16:18:06 +0000 (UTC)
From:   Ms lisa Hugh <lisahugh531@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <1963845584.1579828.1599063486840@mail.yahoo.com>
Subject: REPLY TO MY EMAIL FOR BUSINESS(Ms Lisa hugh).
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1963845584.1579828.1599063486840.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16565 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:79.0) Gecko/20100101 Firefox/79.0
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
