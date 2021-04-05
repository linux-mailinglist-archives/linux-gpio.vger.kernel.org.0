Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6B37353C5E
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Apr 2021 10:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbhDEIZQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Apr 2021 04:25:16 -0400
Received: from wilbur.contactoffice.com ([212.3.242.68]:51510 "EHLO
        wilbur.contactoffice.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhDEIZQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Apr 2021 04:25:16 -0400
Received: from ichabod.co-bxl (ichabod.co-bxl [10.2.0.36])
        by wilbur.contactoffice.com (Postfix) with ESMTP id BB2F978E;
        Mon,  5 Apr 2021 10:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1617611108;
        s=20210208-e7xh; d=mailfence.com; i=sandberg@mailfence.com;
        h=Date:From:Reply-To:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
        l=706; bh=UFNGr8xkIp1btJf8NAs6Wcx70N/mWm5zgk0uqKWLU5k=;
        b=k4z0FJ04HZMq3vb65XZOFS6qaLsM9okYbm1cKmKTUlawznbF7QHnVproHWvsEQcs
        /xsBUDwx/YsGwkW2rMcqjkKAX7Ayk2YETEB+TsgSci3bWBxg/ZtC8WlNAd7AYCWLlIB
        ehcFOSiwsLL6EIVuj1ruXtLDZWr/A13d1VDZV4oL5ogqoh38RNoINqQQcYxtCPO18o4
        6wq9U3E9PBICiKEuyDEONGzSo1YzcgeCWSwIvqGaCDORzJd+D8epCboiDEWDK+cE237
        Hv7BXb0E0cg+X4P2DfJDsAYGpwAWvUu9XKSsrtfRQghvgHqnOJpPNbwv26vDo48Rp/p
        TV8iorZhHA==
Date:   Mon, 5 Apr 2021 10:25:05 +0200 (CEST)
From:   Mauri Sandberg <sandberg@mailfence.com>
Reply-To: Mauri Sandberg <sandberg@mailfence.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Drew Fustini <drew@beagleboard.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-ID: <10440931.720197.1617611104977@ichabod.co-bxl>
In-Reply-To: <CAHp75VcG7Uj-cDhbxDL23w0zNDG7eVqedw_eN5J6XPmVTECbvQ@mail.gmail.com>
References: <20210223195326.1355245-1-sandberg@mailfence.com> <20210223195326.1355245-2-sandberg@mailfence.com> <CAPgEAj5CZ1KxLEn3=GjKJTBFM8dTpC=NRGwLkN6wuw7VVv6YDw@mail.gmail.com> <1306564766.662706.1617546604089@ichabod.co-bxl> <CAPgEAj4Zd9FWL1UFkBLbiJRadBhGqc+NWdrKCxaTXyVeO3tSxA@mail.gmail.com> <CAHp75VcG7Uj-cDhbxDL23w0zNDG7eVqedw_eN5J6XPmVTECbvQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: driver for the NXP 74HC153 chip
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
X-Mailer: ContactOffice Mail
X-ContactOffice-Account: com:250217426
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



> ----------------------------------------
> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> On Sun, Apr 4, 2021 at 6:36 PM Drew Fustini <drew@beagleboard.org> wrote:
> > Do you think TI SN74HC153N should be ok for testing the gpio input
> > multiplexer patch [1]?
>=20
> Functionally all those *4xxx153yyy are all analogous.
> You even may try soviet copy of it, i.e. 555=D0=9A=D0=9F11 (cyrillic lett=
ers!,
> 555 can be 1533 or a few more variants).

I really do hope so. The reason for going for [1] is that it should provide=
 a generic mechanism and
be manufacturer independent. :)

> > [1] https://lore.kernel.org/linux-gpio/20210325122832.119147-1-sandberg=
@mailfence.com/
