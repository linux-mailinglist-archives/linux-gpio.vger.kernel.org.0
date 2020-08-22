Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF0E24E5E5
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Aug 2020 08:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbgHVGk7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Aug 2020 02:40:59 -0400
Received: from sonic314-15.consmr.mail.bf2.yahoo.com ([74.6.132.125]:35459
        "EHLO sonic314-15.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725924AbgHVGk7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 22 Aug 2020 02:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1598078458; bh=yliUQgiMazWK+ELAzX9DN62s8HYSqEJxpDn4KzQ7Un0=; h=Date:From:Reply-To:Subject:References:From:Subject; b=ZAGYYks+GzaMvKJC3WkRW3gQLWzcFA9wOllPSar8BI526OUA1W4guOGPqMqQE/aubSWe8ubbkHZsMubwf5cmqNR7K/HJVyTrzD60BCOorQTzr0mV5UeX7Tp5ZcINdLqFt9FOp7Yj3HwkaSnErYhySLMjMxYEP22XlNLA+2K8km7AEplC1VYX62pQA4Kb0t6MaH5WvYR+OtCk1vhAxRn3MytjtBvbu8tGuDMPxki6zTiS0BjGIJz/za3+s9vqHUmi0InAVe8mkuw6t/aGIuzU3SmluAYr7DwBKrEp2cZQeY/5VpiQoYbjyG0B9QZc48mpTHsu7LtEqkPxzmK17dfxkw==
X-YMail-OSG: 3aq.NmwVM1njUkg6Gmb16u5UIVatZ.1bib3NDT6eI9mrUbH2VBweo_TS4JsUaNz
 HhYXEnxZBzzbATw17R9mCpAStDilYirrsolKkdzIIX4j2xGyGl_fNenAoyBCxB_XC6wEU0J9tPRK
 BnLSNuXxzzPu24qWmhjYXziIgld9vAQrQq2MN94Q_cWW70BIsEaZDekddlOE0i_HT16v6FaGz8Qs
 WFNog6Ez_D25Ql3M6zz0gBzQgOALy8T4fYhMpBGSamw_zhRTKktw.JDAC1UVROePa4efajXGzHpp
 FKz18OI03Hn2FCsmlN0aN6nEu7krRo6qeDphMImfNit.ibCzLaNtiNpQVgDoMyXSvy0NszfnsWBT
 Yn8hm4GMaZXVcQJuUH8vi22BmTUC6ELs_HCKZBLVO85WOEMkB0UKRvlaasIYj2DRDuk0vuqcWQ1l
 uhalpKwZfb9MUYMexXMYVDUEWL_Nm0jxpQdPEXVOV.HYOR9WfyBHpeVxhlENXR5SsFPfYxga2BWP
 HQMk4BO_uZRCEm_Rr_WmZLPxTAeEnGjiWGC3.mHzutHKLaIvl.kIDTyZdQT9pItCAn0h1ePfYNzF
 QzFayPjAvspXATqDabHd2i26mYn9cnl.iJE__oOWMTlnZLFqV4NOK_Hso7P9KqB2d_oUc8B3kX48
 T9SMclrvYjWiVAm32R.49IFqm48OYEzBP5._l6TL4CTfY7OAyU4g6o5NPqxMgswY94ndZ7rFZsvn
 9v3d9sb8pPLKS2ie_C_xWnFceMKIyD.9CQ.xmLS9SjmVh5dlJJZAaw51hBm6C7BMnzozB6Cf28my
 VeLprP0WHmkm1j0EzRY88_fcZozjtSxs4X.6OAdVmexj.LKuYTdrko6bCMPKbpmEneHphsnRX0nL
 X86KjODikmEsdhbopFSQSK0LP5jHTqcF2aGK34kl1tw9rK8aVebXxatI9OZbw7yFFfmj3u1ShEKN
 oV7Fm7dbQIxj4sYD9FxMAbp9JPMXcCnirOeqlkgMUZq0fYM1W3LzgkDxU32YiQTgkOQ45ikwpyHh
 Jotj5Aq6EY58XjaSu0yn_jglq9swdPlY7TUj4EvvfJRUAN58B9AcYrtEXc6CQlms_ktEBqKCPyFD
 sHEEerXGqNP6Neg.4Hjq7fK9Tr.nl5xTnP4Tfyi1hEzAyy1E8YocUZfjd_iFj.PwKH6kemaANH9O
 I5gymbPbfB5LfdFuCNLHd3pO8cUckcrF.BVFR5ZW33bwdJEDExCA.zur2y49iYOln_WaKYWJanvK
 riHi0CXx7sirvIaZmKpzUJOl2ZiB.yIKN5csITDGsKww2qkFhq7ZvTpExgjfv9C5ZC0v20WiKiX6
 _1QLaUXn82BKV_3Xk4IgmxOs_lo_yt1g_qJvcgvqP_nKbPQK_qnp4lR4o3s40uyQTgGhnQQy6WYN
 CGItgrSV4.33uPuIRYY.qDYHueMpuf0lsjiVp2lAe60Jxifsa
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.bf2.yahoo.com with HTTP; Sat, 22 Aug 2020 06:40:58 +0000
Date:   Sat, 22 Aug 2020 06:40:55 +0000 (UTC)
From:   Mubarak Diallo <diallomubarak1711@gmail.com>
Reply-To: diallomubarak171@gmail.com
Message-ID: <600269326.4388330.1598078455008@mail.yahoo.com>
Subject: From Village Man
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <600269326.4388330.1598078455008.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16455 YMailNodin Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From Village Man 

My Name is Mr. Mubarak Diallo, I am village spokesman We are local village Gold miners we are looking for real and reliable Gold buyer who can buy our gold, we sale at low price rate direct village mining price. 

My work as a village spokesman is to make sure that you buy at low price and i will get my percentage, Even if you are not prepared to buy our Gold now but can get a buyer for us i will compensate you form my percentage

I hope to hear from you soonest 

Mr.Mubarak Diallo
Village spokesman.
