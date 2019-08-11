Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2A889419
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2019 23:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfHKVNb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Aug 2019 17:13:31 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36764 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfHKVNb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Aug 2019 17:13:31 -0400
Received: by mail-pl1-f193.google.com with SMTP id g4so614559plo.3
        for <linux-gpio@vger.kernel.org>; Sun, 11 Aug 2019 14:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=iFnEN3Cwzg71FLpVmxXqQFuErxrLeEAUvbHz2UOpoVM=;
        b=rFo6IbwflISomuiI660x2Rjx5mSb2cdywbKFA0SDx5CLg/CKVbKOqstQ4eXwQHFpTS
         VUHE1SQlTzhdgxJArFe+Z5G9IXsrPtwD/qT0tHlYkDTy/2tNIpDFabUTd/2ObCgoggi8
         2h7+j47OXuJWVtEEh54rGHJMKs3pNSpQ95KYAg3s6fj+XkZT0GBgM7BYc8wOUAwYYohZ
         /svrr21GS4N3XVnYAoG+fo5ZP9Jny4T3lO+gHaRrmqzytshBM2sDJ+zn2OAufNlt4cpO
         7fcN8M0T5vu+mm3njKX0n5/DvypHnCjtxHY3BVFAegA81N1hsoJv2vE+XyMT/8TRZH3g
         z1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=iFnEN3Cwzg71FLpVmxXqQFuErxrLeEAUvbHz2UOpoVM=;
        b=HAlFFqmZvyTD8TM0X0Jte5JUg/EvjxFZY806M66jU7tbHmdNA1GtshXMOIQg9noON7
         Rx6JPQYiADIMomutqtt2oeF6B+aQHNieqJmSTRjIOb3PJoWef/0VaI80KAa2jJJeto7G
         h7RCyeXXcabBfHqehsVCIX6Y915oO6jjzHCBsNkRFzEAMUyPqb1PYV4hxPmVfJhd/INW
         z5GjXIku8rC2jGuHmjB5bjyvBXrrxmPUXjy160LkN3DMTgVWZ1fN2ef27u3/nb8BDtY1
         ZdQBM5Z8yzioX+Tk9h4UeM8X6JR5QCu9kcGoyftgem6Hxqqc547op/LcxjQ6j0mTbOYw
         j1xA==
X-Gm-Message-State: APjAAAU3k99vD13drHEID1Pzx4GFcwYFKYyW9AARlneJWaNy+GW4XhEH
        aGyIGKYrAIiH83WL61Opovw=
X-Google-Smtp-Source: APXvYqyRnq9q6tt9HzYbI8dR8fkT+ebnnsmmyx1a44JT5VNJ0XuMgp7YOTP5WPsnqC6XvN2n/1GJAA==
X-Received: by 2002:a17:902:547:: with SMTP id 65mr20090629plf.131.1565558011079;
        Sun, 11 Aug 2019 14:13:31 -0700 (PDT)
Received: from Schmitz-MBP.telecom (122-58-182-39-adsl.sparkbb.co.nz. [122.58.182.39])
        by smtp.googlemail.com with ESMTPSA id 81sm154404823pfx.111.2019.08.11.14.13.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Aug 2019 14:13:30 -0700 (PDT)
Subject: Re: [pinctrl:devel 16/46]
 drivers/pinctrl/bcm/pinctrl-bcm2835.c:995:10: error: incompatible types when
 assigning to type 'volatile struct SHIFTER' from type 'unsigned int'
To:     Stefan Wahren <wahrenst@gmx.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     kbuild-all@01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <201908061021.pQY2TnEK%lkp@intel.com>
 <CAMuHMdU1djc8-c1LvNLFyFa0eH9C3k8nxjN_6F40S43mYZH7Hw@mail.gmail.com>
 <848e57bf-41a6-3e3e-6e72-3c15acd76902@gmail.com>
 <0ef2d73b-c815-e3e7-a037-db7672bbb413@gmx.net>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <f1032537-aba1-7db2-2651-b9c6f27445ce@gmail.com>
Date:   Mon, 12 Aug 2019 09:13:21 +1200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0ef2d73b-c815-e3e7-a037-db7672bbb413@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Stefan,

considering that such a clash could happen again, it might be prudent to
use a less generic name in your driver as well?

Leaves the matter of who prepares a patch to atarihw.h and users of that
definition ...

Cheers,

    Michael

Am 12.08.19 um 09:01 schrieb Stefan Wahren:
> Hi,
>
> Am 07.08.19 um 00:41 schrieb Michael Schmitz:
>> Hi Geert,
>>
>> could be renamed shifter_st, I suppose. Only used in
>> arch/m68k/atari/config.c and drivers/video/fbdev/atafb.c.
> looks like you've come to a solution. Is there any action required from
> my side?
>
> Regards
> Stefan
>
>> Cheers,
>>
>>     Michael
