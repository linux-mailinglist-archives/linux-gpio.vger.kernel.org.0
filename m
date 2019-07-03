Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 826425E349
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 13:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbfGCLzB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 07:55:01 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41631 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfGCLzB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 07:55:01 -0400
Received: by mail-wr1-f65.google.com with SMTP id c2so2451978wrm.8
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2019 04:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=41RVFdcNQvnRsKqPg1U9eudlNWQIRgVPzn/HKOGBhKE=;
        b=ATr5Lsat3KeAJkm3a38/Zlbev2eOni1V/FD1IbdOMP2ag6fdCxsU/euxVCwKk9YrCM
         JDtN0/CzMWyKKzGsV53z0HKB9UezuUDQLOjkN3ztdgjY0Z5AA5kwuaLlJHnMxB4+IKYY
         /0ngegXBWHBdVGWY/qOL231xsxlFnG1+DNInvzo6JigkW+Vv4PAfyqbUOBhp0YLB1EAR
         45Q5tT7QvgpdmDepRoldrROLib/O+TYC6Q5ad3+iGuYrBjcRZ5wr+6ja67QH/LAYUs72
         /tAxz/Fi/qyB58eMyZkG/YK1DvnWatBrDO4cw/2LbtTQC6QiMyb2tiQdywtAwKk4Jrxw
         9Eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=41RVFdcNQvnRsKqPg1U9eudlNWQIRgVPzn/HKOGBhKE=;
        b=l8OTEVMLhVmikV9sIOPExi6s5wkBUYSDro7cd5U3aVFvOEqtQGsN4qSidyUE/FFmmm
         WcG1zcdBmbJp2PsfMI0zYZGjENtzO0pb8O/V7kllUJSYuK/pi2qvPLSpc0ZufEKUjxjv
         UEU0/uzy95OuFhJ36XVGK2Z8iunFuQ4G0N5DmEyGmDa78anG51xv6svlO6EiRfHABlZ3
         pW3huTolL3plEXH3soifPXwCsufiuktfCv+sfgTHD4iLnGwlCq784Yb6H3qRgW8f1FQY
         B+j9bcizc7p8ScDsP/vtS54Df2fwfzE3F4T2tD5U78tIW+cdvlZN3Csz7O030qSzW0uC
         rGEw==
X-Gm-Message-State: APjAAAXKVE/gcwXr8i8O3GtcErc41RQSwye+1ELnUPZdpnnqbY9ffBC6
        /POeY024purg7QqiICzHIz6owzIOOzg=
X-Google-Smtp-Source: APXvYqwIe3GI7EUPeLNqVHRFnPN3BTxJXBpLGBwc1JLvK12ZO9P99slT3Hfqtmn4vYDfrjVO3QGifg==
X-Received: by 2002:a05:6000:146:: with SMTP id r6mr29293765wrx.237.1562154898252;
        Wed, 03 Jul 2019 04:54:58 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j132sm2759889wmj.21.2019.07.03.04.54.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 04:54:57 -0700 (PDT)
Subject: Re: [RFC/RFT v3 14/14] arm64: dts: meson-g12b-odroid-n2: enable DVFS
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     jbrunet@baylibre.com, khilman@baylibre.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-15-narmstrong@baylibre.com>
 <CAFBinCA5-5kbD-0e7Lm7FwRneWsKeW4yQrucd1PAk=s2PrtxJQ@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <e5db811b-a86d-dffa-9036-48aade87f77d@baylibre.com>
Date:   Wed, 3 Jul 2019 13:54:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCA5-5kbD-0e7Lm7FwRneWsKeW4yQrucd1PAk=s2PrtxJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03/07/2019 01:45, Martin Blumenstingl wrote:
> On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Enable DVFS for the Odroid-N2 by setting the clock, OPP and supply
>> for each cores of each CPU clusters.
>>
>> The first cluster uses the "VDDCPU_B" power supply, and the second
>> cluster uses the "VDDCPU_A" power supply.
>>
>> Each power supply can achieve 0.73V to 1.01V using 2 distinct PWM
>> outputs clocked at 800KHz with an inverse duty-cycle.
>>
>> DVFS has been tested by running the arm64 cpuburn at [1] and cycling
>> between all the possible cpufreq translations of each cluster and
>> checking the final frequency using the clock-measurer, script at [2].
>>
>> [1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
>> [2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> [...]
>> +       vddcpu_b: regulator-vddcpu-b {
>> +               /*
>> +                * Silergy SY8120B1ABC Regulator.
>> +                */
> interesting that they use different regulator ICs for CPU A and CPU B
> the public schematics confirm your comments
> 

Yep they use a Silergy one for VDDCPU_B on every schematics I have.

The A311D VIM3 have a slightly different one, but still Silergy for VDDCPU_B.
https://dl.khadas.com/Hardware/VIM3/Schematic/VIM3_V11_Sch.pdf

Neil
