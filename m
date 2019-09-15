Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57BB5B3247
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Sep 2019 23:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfIOVlw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Sep 2019 17:41:52 -0400
Received: from sonic307-54.consmr.mail.ir2.yahoo.com ([87.248.110.31]:39032
        "EHLO sonic307-54.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726139AbfIOVlw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 15 Sep 2019 17:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1568583708; bh=lAh1VSII1GxH1Lprx9ZFG4FPrK3+vs4TTowEGakve2I=; h=Date:From:Reply-To:Subject:From:Subject; b=amqXg37f4YcDrVxIrYO0cXpaRGE/ysFQawBer/OF0nIqgW3CmzGKJRmJzVwVc38Q+AZXZqJu0jwix6ADcfwMCuu/eL3r2QJN5fPk8ESE6lltDM+Bn1kPqGOLM38IJiN+vCwXmn3vy97EsJvb7g0JYQ0PzoWpl76OtX9VSvmRdiNpvSxvZTzcZMJ6DVUk2iSOUuBLE2GrKL2lXZn/MS8mTtaCrKZn4yrzxKk95ePXDR3STfBnV3syERxWnbM8Cqehy/bdwmcwZ9lQZN2m/CQAKsmrgmhfuYb9qY4sYZ2eD7X5OSj/UP+G3LfQrfJZBR/J4CB4r1jbJ8USf6urJKJZSQ==
X-YMail-OSG: Ny4QInoVM1kGVDdB.gfkcPbNbOCW6QQYKslKxUZrKGfRnhCJ4qR9Tv5LB2VgtuQ
 1tOCBYEuTN9Cp2D6fkArh7NHS6qE0tJfQd9OEjMsJ0LuUfJ5wUgy5nHojv.uNKuHArSDg5e1xh._
 4YGTLSlx9tLIPwNba4WEDnMSTR9WXWT9tCpZfpyfCxGqJ3iE8Wq0FRLMhXlYyxDHUmSHWX5esYRF
 BYMznTpkZlZ5TTqiohxdWkU9C5ZKEPfBrxEwjyfVo6UUvMuCstvpgHOmEA4LT7Jttcit4sVt4Tu3
 Aj17mCTdYBLI3haCGBM1TuFO86JccxfcJQNLvCqnPJE_hEuEBMNL6TNrxilbR5SZWTiaooNuz5ds
 EKepFirNdHB4aIPszx4nC946kYbLcSa0kgZcB_To.vpCabdC4c67ELmnUdlTUrVgcMdorfDUwy9.
 p_n86q3RnH3j5m7DB73wC02EEBP8GFdw5S_8kOaJ.x2lFbvUWen1ko_Rx6a7voA55vil2.1U2Bjx
 QOl9U46Mx53QwNe1up8Q7egyssJrxCuBkEqTWU5aO2uZ_vrjsNop_n8LE93VaTsnt.CeymPuN79P
 fFdh74swJHGf05NdLnLYWg7C.8NzpoLz5QBZqv6n9O2wHog.XwjFTCSpUnOm6XIS2I7uy0zhM9xb
 s5SoSgZoVwc0ifBHxLfFpkhBpK47FZd2LKv17BW4lI.el8VUZ3rKUnQX1zFIwug1vFCI4dFzAOXm
 OJ2YFdCd9qFIIY5erwo0JrogFKXFYoC1hCN84PoRCD.aZiwzQd4mrTQU9adDg2ryexWgj5CG6jec
 NkRO7JMnMeiAYsD.uYWDDTYpKyOxGM2nWx2NG6ixZpD_ZcECi5YxHz3SxzqEJkCEZi665agZYvT9
 B2qZFaZMNmg.V6zKf2InIc6DeAKIGWJO0MySQhktecwosY.UP1unBs1FG0jWBFYdTwz11TnogO9Q
 0zaBx4mdmYx7dnAOVOZPsxHn4j0cm4_S4TmTRUxoiLJaHN._aQ_J6aYbuKTDOolk6eON9uE64uZc
 6_EXXZTWK3Vli_jZOufEFzrRqzGjGq8gIjH4gW9w6QcfCK3E31H_VAlvcEOvOsxCFYtQlg83mQBM
 5A5spLa.SCJgdV2YDw8AQn6BPKDTg4qjzRNHYzHQ1UHNMXg834tbR2IFA.dwSzXJPkKGrUelFcjz
 pv.trfuTC59t7MxbKua7U8Lm5CKmp3Av3PludFMFZxw3ClDM7EH.8NqWihewAQALCTAgISA9hxG.
 a.QVPGLqG32ApJYXxdIW6NI2a0qCUPli63rzp
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Sun, 15 Sep 2019 21:41:48 +0000
Date:   Sun, 15 Sep 2019 21:41:46 +0000 (UTC)
From:   "Engr. Issah Ahmed" <officefilele@gmail.com>
Reply-To: engrissahahmd@gmail.com
Message-ID: <83731469.10245694.1568583706456@mail.yahoo.com>
Subject: INVESTMENT PROPOSAL.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Dear Sir,

My Name is Engr. Issah Ahmed, I was a top official in the former government of Late Muammar Gaddafi of Libya.

My late master Muammar Gaddafi, the deposed leader of our country, died on 20 October 2011 during the Battle of Sirte. Gaddafi was found hiding in a culvert west of Sirte and captured by National Transitional Council forces. He was killed shortly afterwards.

We the official members continued with war till the early year 2017 due to the painful death and forceful removal of our Late Master Muammar Gaddafi, our country was totally destabilized because we refused to another government.

In this year 2019 all we the officials in the former Gaddafi government are being arrested, persecuted and imprisoned by the new wicked government.

Libya is presently not safe at the moment, therefore we all moving our money out of Libya.

I want you to quickly help me receive and keep the sum US $20.5million to your country for safety. I have agreed you take 25% of the said money for your assistance.

It is very urgent and Please reply me urgently If you can be trustful to help. I will be waiting to hear from you as soon as possible.

Regards
Engr. Issah Ahmed
