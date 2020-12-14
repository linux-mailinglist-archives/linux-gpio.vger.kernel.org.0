Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5980F2D9AD3
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 16:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731365AbgLNPWu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 10:22:50 -0500
Received: from relay5.mymailcheap.com ([159.100.241.64]:43466 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733040AbgLNPWo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 10:22:44 -0500
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.100])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 31AB02008F
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 15:21:50 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id 61DF33F1C5;
        Mon, 14 Dec 2020 15:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 562C42A0F7;
        Mon, 14 Dec 2020 10:20:16 -0500 (EST)
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wIiOzhnCC5Z4; Mon, 14 Dec 2020 10:20:15 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Mon, 14 Dec 2020 10:20:15 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id D5B08403C3;
        Mon, 14 Dec 2020 15:20:13 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="UByCHrDv";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [172.19.0.1] (unknown [64.225.114.122])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id D68FE404B7;
        Mon, 14 Dec 2020 15:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
        t=1607959206; bh=wH3/y6SipLVekAm0WUtujhh2byePaUzn5QHDwr5b8kU=;
        h=Date:In-Reply-To:References:Subject:To:CC:From:From;
        b=UByCHrDver083GPvb9gxP32M0p4gK+I4dFWXpkD4KHqawWcYitmOeDqyvK457Xo/8
         xTu3Dogs0+oAWQJ/FE7khFsuEOFekC17wWdURJnBoWj6DutcSXdbJYfAo9H8dqNUhQ
         vEbStdzj9poaBLs+E/1d2ABL1hnUAt1rv10wMK88=
Date:   Mon, 14 Dec 2020 23:19:48 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20201214142118.bxdzu7z7cdomhgy7@gilmour>
References: <20201212040157.3639864-1-icenowy@aosc.io> <20201212040430.3640418-2-icenowy@aosc.io> <20201214142118.bxdzu7z7cdomhgy7@gilmour>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 05/12] pinctrl: sunxi: add pinctrl driver for V831/V833
To:     Maxime Ripard <maxime@cerno.tech>
CC:     Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
From:   Icenowy Zheng <icenowy@aosc.io>
Message-ID: <5C8F8115-4DE6-4000-84DF-8D3BE2574713@aosc.io>
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [1.40 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[aosc.io:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         DMARC_NA(0.00)[aosc.io];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[aosc.io:+];
         RCPT_COUNT_SEVEN(0.00)[9];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         SUSPICIOUS_RECIPS(1.50)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: D5B08403C3
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B412=E6=9C=8814=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
10:21:18, Maxime Ripard <maxime@cerno=2Etech> =E5=86=99=E5=88=B0:
>On Sat, Dec 12, 2020 at 12:04:23PM +0800, Icenowy Zheng wrote:
>> V831/V833 are new chips from Allwinner=2E They're the same die with
>> different package=2E
>>=20
>> Add a pinctrl driver for them=2E
>>=20
>> The difference between V831/V833 pinctrl is implemented based on the
>> user manual=2E
>>=20
>> Cc: Linus Walleij <linus=2Ewalleij@linaro=2Eorg>
>> Cc: linux-gpio@vger=2Ekernel=2Eorg
>> Signed-off-by: Icenowy Zheng <icenowy@aosc=2Eio>
>> ---
>>  drivers/pinctrl/sunxi/Kconfig              |   5 +
>>  drivers/pinctrl/sunxi/Makefile             |   1 +
>>  drivers/pinctrl/sunxi/pinctrl-sun8i-v83x=2Ec | 743
>+++++++++++++++++++++
>>  drivers/pinctrl/sunxi/pinctrl-sunxi=2Eh      |   2 +
>>  4 files changed, 751 insertions(+)
>>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-v83x=2Ec
>>=20
>> diff --git a/drivers/pinctrl/sunxi/Kconfig
>b/drivers/pinctrl/sunxi/Kconfig
>> index 593293584ecc=2E=2Efc13335a3eda 100644
>> --- a/drivers/pinctrl/sunxi/Kconfig
>> +++ b/drivers/pinctrl/sunxi/Kconfig
>> @@ -73,6 +73,11 @@ config PINCTRL_SUN8I_V3S
>>  	default MACH_SUN8I
>>  	select PINCTRL_SUNXI
>> =20
>> +config PINCTRL_SUN8I_V83X
>> +	bool "Support for the Allwinner V831/V833 PIO"
>> +	default MACH_SUN8I
>> +	select PINCTRL_SUNXI
>> +
>
>We're not using the wildcard much, and I'd rather be consistent with
>the
>name / Kconfig option scheme used for the clock driver (and the rest of
>the SoCs in a similar situation)

Well, call everything V831, or call everything V833, or call things usable=
=20
on V831 V831 and things only available to V833 V833?

>
>Maxime
