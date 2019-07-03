Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 316B75E33A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 13:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfGCLxU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 07:53:20 -0400
Received: from mail-wm1-f52.google.com ([209.85.128.52]:38870 "EHLO
        mail-wm1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbfGCLxU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 07:53:20 -0400
Received: by mail-wm1-f52.google.com with SMTP id s15so2063858wmj.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2019 04:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ECYcI8AlM2+Up/9U9dhONTZIuaFVroymFXWiMWPGvhA=;
        b=Lo998VzvGouMh4VaHm3pLpdC8XOaBts7PQecaj21Fj9ykSqkytbOHmWEHR/xa/XM2Q
         m12klRrbHu6kFGbfGpU6YcyM1Vx0SywqPrcGUud+p67+r+FBP413FPAZeeTzkQMb5b6K
         5diORxd/AlYNhcAGRNaP+MB5StUHBcRKWkqzuoADPICZfKVTmc0X99fHnTquMn4HaAVi
         ws9XvLVo11qAE0qVeAuq5at6M68rPd5cx7IwPLoPL+qX58tfv7oCpukPnfEEa7L0URRY
         9voXuft/bbTLaVXm4pnm94Yvy79QB634ZVvTTcY6GPhsA0RkrtaqIRnoyG7gGdAtMIT7
         1xCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ECYcI8AlM2+Up/9U9dhONTZIuaFVroymFXWiMWPGvhA=;
        b=lN/1zQ7Pp+JiO3HAIo3CkEhGBot33LMZwjE9t7a2A39AyOONFvfpqFn0tcdXJkVJN8
         3FhlXGF45+L3YzbbHZEEkd8hJITm89o4dTfG6+8lSr5PKK8B2+v0mXwhQUKLCwsQHtVo
         ciojOxwgQ11CWnkGLJ+aAD18Ht4Wmvjjk69q/m0LIEMHLneNAzt06+QtIFK71lI7TZDC
         OPuSAD2x+fIo0kdXiBuHsSI1pZucAlg3Z5/RFYZGEuaMJ9qxbvgWm2s7QFx98nxRcNAR
         3Ys/6kQf9n0xbrLXGct/qiuUs61cXy0t+LOuvDrWj14mgF3mKd918fZZ2KVKuhyMVZCn
         KL/Q==
X-Gm-Message-State: APjAAAXlYceW7T9dDo1OFubN/V9UGgxVVUAYn3JiLWm3euhGM3tuQPOK
        XFwfCeD6zkvb3WoWUPCChEKwjNh2xE8=
X-Google-Smtp-Source: APXvYqw1UydkA6XdM3tn/Mh6Trc55NumI7hz88+bOC34gP3xPxq6ffraSlp3cxtYo3lA+fJa+NR25g==
X-Received: by 2002:a7b:cf27:: with SMTP id m7mr8004579wmg.7.1562154796842;
        Wed, 03 Jul 2019 04:53:16 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h8sm2000695wmf.12.2019.07.03.04.53.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 04:53:16 -0700 (PDT)
Subject: Re: [RFC/RFT v3 11/14] arm64: dts: meson-g12a: add cpus OPP table
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     jbrunet@baylibre.com, khilman@baylibre.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-12-narmstrong@baylibre.com>
 <CAFBinCBg57gh1x3CKs-YrCvTD0WR2s5zVGWtycb=RGqMiQ-VgA@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <7acdafc1-39e7-a2ec-886f-ca337c60dfe7@baylibre.com>
Date:   Wed, 3 Jul 2019 13:53:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBg57gh1x3CKs-YrCvTD0WR2s5zVGWtycb=RGqMiQ-VgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03/07/2019 01:47, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Add the OPP table taken from the vendor u200 and u211 DTS.
>>
>> The Amlogic G12A SoC seems to available in 3 types :
>> - low-speed: up to 1,8GHz
>> - mid-speed: up to 1,908GHz
>> - high-speed: up to 2.1GHz
>>
>> And the S905X2 opp voltages are slightly higher than the S905D2
>> OPP voltages for the low-speed table.
>>
>> This adds the conservative OPP table with the S905X2 higher voltages
>> and the maximum low-speed OPP frequency.
> have you considered all three as separate voltage tables?
> you're other patches are assigning the OPP table to the CPU in the
> board.dts anyways, so it's easy to use different OPP tables for
> different boards

We can't assume the board and the CPU type :-/

Kevin told me about cpufreq policy, where we could add a policy reading the
eFUSE and changing the max frequency, then we could add the whole OPP table.

Neil

> 

