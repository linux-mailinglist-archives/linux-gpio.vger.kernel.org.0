Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF03BF2010
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 21:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbfKFUrh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 15:47:37 -0500
Received: from sonic301-3.consmr.mail.bf2.yahoo.com ([74.6.129.42]:35379 "EHLO
        sonic301-3.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727351AbfKFUrh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 15:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1573073256; bh=F+7QXJPRuyxKv+5YqLXXhHJC5uuItS/uRvnxFMJ0nnQ=; h=Date:From:Reply-To:Subject:From:Subject; b=lQqORUL/m8zh4hTplKRamff6sBycz5sEiZbc2i4lCKOoodnmAvrQozZt0pFxTy4Pehfhw3wScg5bn3v+loW7C5Vs5l50fOjOGv6cm3S8k+KjqRqy9vWCe7KM+V69Tcu6OhTk2+tl0NdI5a0Mc459FVj4EQUpk+lYigJ4T6vW4giEJkFhlJe8f7C0OixmC1D8HNWh0kLvSncGw6Rl8NIoe8sOhXmPYEiTUi3AVlLfTymU3YyMY/3oDaeYKNPTRJqeKvsRM3muuCAraf1evJnbFsma5Yd1bRRAlIeFPz/ethgih/vtxipKzLS3a9Y7WAqLlxgpJlbm7M7obvnxplJJ7A==
X-YMail-OSG: M7hUNzMVM1mXWpEPKQ.NWjlTjY_LdAvCIeHuxR2DjvI7GrBLGUDVod1V7zRpbVM
 mpzhb08oUjAMTqqJDgPoqWXSRSC6.4uqhGQsyPypVHtq7lO7kzu9wENZdULXuYzN6.M7qCPbdXOI
 EFvI0E5ijsYT9KT5u2RXiFfrbTtwqxKcYJZCtwR2pOrvXKhC4n8y6kLvg3fG3Lxo0jcH.vRg_dnv
 kXI7sQIW4YVKusFUO7XlepqEguAJq9J_5.5O4wGdT6TyKbiMbwG2ZD0BSsp7OlnxrPGgWmCiBlmD
 cA4R5ofhCohgUVVnG4s3lL9qlRrreRtsvSYy6fV33zZ4.ddP8yMPUQSgYWtRa1AMsk8cmwsY3b2S
 USx8puqOe_FnWCpenZvYxaumrT0EDALj8M.0UJ2YxS2rZWmeAGuKUv8_97gwcQMmwzpUOG3FaAdn
 zbu9gA8n5MVyIDAGJ4Q3vLXdjXHOTMY8yNHpwGiNrFVvqPzd75SgiRGbXqDfWF_G9HCy1jKDwPaK
 FpmuDyIswk5BCuXgVIuP.WUkSYj6NPU93ib9luZziliRXR10nWsdF31kR4wpqoX8cfzyZlIxpP.u
 WJjtYKHkeNtd0FdX.Zjxjrfmd.oDzsQ1IaND_xknjNGP6ufUfogfBvyb5JdfhvjRuUYeiiz1RLSV
 gpfSxHtI.1jSiqMAEtDxMcg5ykrxxIa4b9Or6nkUnQRxThRYtKzQ9CmYoXZe6Ved5pLEyE.n.2vI
 ZSFhIcEQNV5YHJClLKfWHASRxVG0Y9tuQGZllQ3.Ok72qQYTapqHg.WONquzgzA2F0cG0DBPPUbb
 bVoDF._plROlm44_v.3WnENZEeGhVdcB8rqkr3NZrK7Rz70TibtoisRQDuubXuMa5rSbrY34.g8p
 MdVDf555LPcsx3TQjLhWowo_ABJ_5oazXN8mTxMZLt7D13W2Y2ysM_tp1lcgHvUAWjOdxpQIFoK0
 AGOJQa3flfLTgHNz0GKE.TGercbQ8a6uGFgXvqHvdW76M1G0BCMHuC1DKl7k8f8hCU4t1xg.vN04
 dtuAu8RPuArrDgr7SRW1FUqbovCJGhe6zZ5yfp4kWQTxRZFEvS9C6f631Vv3PCxiKZGrisZXD_UK
 HYOmXn2nZ53W0ssgOQEPEHalNlKCd9RnyUCc7F65IjAXHIDz8.e9Frp7.HwAcPtXJcoc2A2KUJwu
 1_XfXdXHKU464HKYZRMDhe8qO99v7Ydkl7jz8AGjM_ZLggbhmvCYpqbSjvmTmSwpyv94i5WTv0NZ
 PHvUIKl_2Rz1hswD_9KE2jF.P5JKkasoumn5HzJuw1yhz2wPfspvvmrJqFur_ijuQoUVo3x1o7RX
 1W7rjM2uL
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.bf2.yahoo.com with HTTP; Wed, 6 Nov 2019 20:47:36 +0000
Date:   Wed, 6 Nov 2019 20:47:32 +0000 (UTC)
From:   MR DAN KOURE <dankoure2@gmail.com>
Reply-To: dkoure73@gmail.com
Message-ID: <829576526.363317.1573073252547@mail.yahoo.com>
Subject: BUSINESS AFFAIR.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



Dear Friend,

I am Mr Dan Koure work with the department of Audit and accounting manager here in the Bank,

Please i need your assistance for the transferring of this abandon (US$4.5M DOLLARS) to your bank account for both of us benefit.

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me after success.

Below information that is needed from you.

1)Private telephone number...
2)Age...
3)Nationality...
4)Occupation ...
5)Full Name....
Thanks.

Mr Dan Koure
