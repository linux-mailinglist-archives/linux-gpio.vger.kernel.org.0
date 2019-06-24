Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F16B4517FB
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 18:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731546AbfFXQGD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 12:06:03 -0400
Received: from sonic315-53.consmr.mail.ne1.yahoo.com ([66.163.190.179]:36526
        "EHLO sonic315-53.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727282AbfFXQGD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Jun 2019 12:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1561392362; bh=Wn45IEVQxjYS/KJ/AenupJ6pixj3tpnk+IQw8lNF8Cw=; h=Date:From:Reply-To:Subject:References:From:Subject; b=adz+9T8AOWQF7cpX3UIJFgDbsGa0lPQOJBD2UMxhhLU92GhZPeqNH9sniYqhQQ0dF0VUlc5Hr9P2z/tzlClgzme+/T7j6wgLNIMLpXvZaEyw1ssSgi3HQLMINJhm9QaGM+XSPb0nqXs1GaaAkl7CJ/qm5Lz2ZklTt+sl3OTGU1CYYKW6BBAkVGjb+YnkNYcI1VWYvlJvXUfuy6Kzz57gfT38X0V/oc0FVnIQh2mmSr3sdch+ySho62hc6FEc4tABm9NOulo5eXZ9aRQwghL3vPpJlSs+cYGI5lPfUqRQ/LCDL5jms4dpIaHvUa0PjD5gY+9h5EuIMderXfJuJY4s2A==
X-YMail-OSG: df8Hr4sVM1nQAOpsedsGwDE93k9EQHaKbpTdkv_ZjEX4z1dWIMJB.F5LPIDCwlA
 oZkPEFARJ0MnvZD_16HqBhebnBIpi7eGlh1xFVbmkXTSBr2qcKJ7KaXflKDpchCDebw5vcOr46p0
 oYwZEz4iUaG4G0wno3lYXbReJov.Gj459w95GB2bZGEhB2i.YyG1_RpEhZizN_bsjwX877V1B6XP
 cbdLGYCxQkYsO9G6Wu9neppUaB_OrGnbDHJHNPy3498BHWaL2eexOy8M2nikzdYOKq0VWeqePK0o
 mjncJLrwM4P536YZml58mgCuk0tkN_XXdYKEzlPGd2H52n9aLgo3sfZ.tC5L93kS9UFilrgKjEsQ
 geJCPMs1yMGR..amYJTKJRNvvLBXFas.lFO9kxa.1f4tP9HVzCtBveYs5A.Mzidki60bgvE16_WG
 8c9or4W37PsKe.6hzeRd7HmK7N1NXuZ.wuZ41adqn6FOdMqBX1QFe6t._zlDS3Ixmu30tliUNqWc
 J5aSrqjOm3MaJl2HNt97vjQKCMzzj9Iq35ufJWjZdC1_3zE3h3jNdU9FaoArhweNXOpXYitQTtel
 6If7PBPXBRPaPL_aVl2shjqbaG_KmBymOcZNb3b3p6u_8GWd3Q2TBwEY0yRo9BibDD.hob.ekkJg
 OWdGJwzU2VVPC7ueXJaQ2mRmmbLAOLlls2OLxubIwH8xI_1dzKLRwoMWFeCf6wSzEWbC8h4.V991
 fev5fAOQzEx6vNPQy61og_vjs0saS7NoM3AYblP2dTEiP6Ba8RjXf4ztYYfbd05lEKM38vyDtAwR
 s5BzoSx8hXQBpf93_JLoWxyY2NnAOjL6ukyjiM6Li.hwrMRazWn9ie81UwZKcNM7_Stk9ScteAoG
 S_jHGzU7KZtsCdTkCJEdntY2_gFOI8Uh3zDTz3vISBuBNkhbKdzVuqB1WAYHA2osYKBbonobPkW.
 j_DWgjtpt2ftKCyo.EVVxrErJr5oAWwk34L6VQwbN8kJNHaTCKzY_s8VvZ5.mVkhZ4vzlclAQEEU
 33ZcpxesVzATdBk8LSVdu6HO7abscZ2P2MG7Sct0I8W4lw3QNMvbYE6wYqJxNOMdP8_FKfNcGIch
 LmLadgkXm8D3rJsC1k_f955FgEp47WUdTqvlD8e5cren4SjXMAjpGHZtUOdY2fPYk66d933onKdq
 bcDTc0PVd7jMYBKetqEHRc5CIrAwcCxWbframCstMBLQfoVlpGj_ajwTachApW38xM2G15Nhv7ZO
 5Xub.Is.KC0vU0eHMjd5HjrI-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.ne1.yahoo.com with HTTP; Mon, 24 Jun 2019 16:06:02 +0000
Date:   Mon, 24 Jun 2019 16:04:01 +0000 (UTC)
From:   "ij49 ." <ij49@gajdm.org.in>
Reply-To: "ij49 ." <ij49@gajdm.org.in>
Message-ID: <1179155815.1171075.1561392241619@mail.yahoo.com>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1179155815.1171075.1561392241619.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.13837 YahooMailBasic Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I am in the military unit here in Afghanistan, we have some amount of funds that we want to move out of the country. My partners and I need a good partner someone we can trust. It is risk free and legal. Reply to this email: hornbeckmajordennis635@gmail.com

Regards,
Major Dennis Hornbeck.
