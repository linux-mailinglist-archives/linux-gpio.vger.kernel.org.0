Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E30742E208
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 21:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbhJNT3H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Oct 2021 15:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhJNT3G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Oct 2021 15:29:06 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F18BC061753
        for <linux-gpio@vger.kernel.org>; Thu, 14 Oct 2021 12:27:01 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id p16so31668565lfa.2
        for <linux-gpio@vger.kernel.org>; Thu, 14 Oct 2021 12:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=plSxLdohiawK9v5g/YQxS/w9Rn9HzCKJRyvLQE2YWx8=;
        b=kZOFJUN4j714xJTUzU1dxNFBnaNDBBA58bdY92Z5ZrqC7F2kYWqI/pcg9LdQUsf+o8
         DXxtT6jINJTJeAXoRtZP/doSelLOXCL1H1fegOIItUQbYk7juW1GazDumsmw3ORSBvTE
         72oTtcriLDfxUaK+MDHrPesf/JXqtLdgLBaaWN1YSD+rgl2I2leR5Zc5+w8d11DY2jYo
         J1iiRyLBpmpvoFgz/nJkJ3Ut3EQqEm/VovzJI5pkOTZdmaqneVclQZPUpse0yUqMiti+
         ZBMe+O3oA7w2+cGmsugwBxW65zEkBRZ5xY8JriFgKVBq29Seo1bYO7pC6MOwNXbsVVar
         hsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=plSxLdohiawK9v5g/YQxS/w9Rn9HzCKJRyvLQE2YWx8=;
        b=rc6sH/X1zi5q1/MU8xeuRhwFfWpeh++br+li908uQd9ZBoxi/xe6y57LPY+AN36Fau
         4bL/4c/4bO6rQhSdKCclJ8bzqRb7VHtRD364rIHCpxxSo6x5l57+XAbbu0qtrDbRmGtE
         mjL48BR1zfE+qAYNAJvUMeVo7Tuwbd9guwIVx6Het6ryAjfKYtdR50mynXlk3mkkEjAh
         uBPoZy5eJM6diY1+7vHLXpHqJvR63CgMhv7znzBBsGd/qbmcCSHDx+xr3ga7GuNUQsgc
         mo3mr++xbhCnO77GwwPrHV0c3FJwl6Nyh3PJ4cDFdyaDce1iIwFonz2aQgr3PqUTpCR9
         SS9Q==
X-Gm-Message-State: AOAM531KU9JKcp4yWMTITavcTZ5e9sBparcMBO7twLJNPaG2WMClU4Nn
        KZnIPP0gRAIeqF/hpoItaYnGcw==
X-Google-Smtp-Source: ABdhPJyZZTUDQSFoiBxUa58tb09wa37AJZpduqIQeub/B8AmxTEv6Zh5nbYLQ4ysdr8DeAMY/rKNiw==
X-Received: by 2002:a2e:9b4e:: with SMTP id o14mr7856596ljj.278.1634239619670;
        Thu, 14 Oct 2021 12:26:59 -0700 (PDT)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
        by smtp.gmail.com with ESMTPSA id b25sm297865lfi.151.2021.10.14.12.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 12:26:59 -0700 (PDT)
Subject: Re: [PATCH v2] pinctrl: renesas: r8a779[56]x: add MediaLB pins
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
References: <CAMuHMdUvNM8Tu-+Ed0vjB2-_JUQe7ojUPbzJM=Vy1m_j31sNSg@mail.gmail.com>
 <20211007200250.20661-1-nikita.yoush@cogentembedded.com>
 <CAMuHMdU2Nr1V035Ntz-XNrc10t7femUFt_WV+Q3EHiWZD5HmkQ@mail.gmail.com>
From:   Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <c8234074-a22e-72f9-fbe7-e65d6af74eec@cogentembedded.com>
Date:   Thu, 14 Oct 2021 22:26:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU2Nr1V035Ntz-XNrc10t7femUFt_WV+Q3EHiWZD5HmkQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

> 
> Obviously not only the mlb_3pin groups, but also the functions have to
> be moved to the automotive[] arrays ;-)
> 
> I'll fix these up while applying, so no need to resend.

Looking at error mail from build robot (cited below).

Looks like also must put definitions of mlb_3pin_groups[] / mlb_3pin_mux[] / mlb_3pin_pins[] under GEN3 
ifdefs.

What are the proper steps now - send a v3 of the original patch, or send a fix to what is in linux-next ?

Nikita


 > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
 > head:   8006b911c90a4ec09958447d24c8a4c3538f5723
 > commit: 23f87fe82c0341ff79807fb5f92a05a33ce1b055 [7355/7806] pinctrl: renesas: r8a779[56]x: Add 
MediaLB pins
 > config: sh-buildonly-randconfig-r002-20211014 (attached as .config)
 > compiler: sh4-linux-gcc (GCC) 11.2.0
 > reproduce (this is a W=1 build):
 >          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O 
~/bin/make.cross
 >          chmod +x ~/bin/make.cross
 >          # 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=23f87fe82c0341ff79807fb5f92a05a33ce1b055
 >          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
 >          git fetch --no-tags linux-next master
 >          git checkout 23f87fe82c0341ff79807fb5f92a05a33ce1b055
 >          # save the attached .config to linux build tree
 >          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=sh
 >
 > If you fix the issue, kindly add following tag as appropriate
 > Reported-by: kernel test robot <lkp@intel.com>
 >
 > All errors (new ones prefixed by >>):
 >
 >>> drivers/pinctrl/renesas/pfc-r8a77965.c:5030:27: error: 'mlb_3pin_groups' defined but not used 
[-Werror=unused-const-variable=]
 >      5030 | static const char * const mlb_3pin_groups[] = {
 >           |                           ^~~~~~~~~~~~~~~
 >>> drivers/pinctrl/renesas/pfc-r8a77965.c:2616:27: error: 'mlb_3pin_mux' defined but not used 
[-Werror=unused-const-variable=]
 >      2616 | static const unsigned int mlb_3pin_mux[] = {
 >           |                           ^~~~~~~~~~~~
 >>> drivers/pinctrl/renesas/pfc-r8a77965.c:2613:27: error: 'mlb_3pin_pins' defined but not used 
[-Werror=unused-const-variable=]
 >      2613 | static const unsigned int mlb_3pin_pins[] = {
 >           |                           ^~~~~~~~~~~~~
 >     cc1: all warnings being treated as errors
 > --
 >>> drivers/pinctrl/renesas/pfc-r8a77951.c:4807:27: error: 'mlb_3pin_groups' defined but not used 
[-Werror=unused-const-variable=]
 >      4807 | static const char * const mlb_3pin_groups[] = {
 >           |                           ^~~~~~~~~~~~~~~
 >>> drivers/pinctrl/renesas/pfc-r8a77951.c:2460:27: error: 'mlb_3pin_mux' defined but not used 
[-Werror=unused-const-variable=]
 >      2460 | static const unsigned int mlb_3pin_mux[] = {
 >           |                           ^~~~~~~~~~~~
 >>> drivers/pinctrl/renesas/pfc-r8a77951.c:2457:27: error: 'mlb_3pin_pins' defined but not used 
[-Werror=unused-const-variable=]
 >      2457 | static const unsigned int mlb_3pin_pins[] = {
 >           |                           ^~~~~~~~~~~~~
 >     cc1: all warnings being treated as errors
 >
 >
 > vim +/mlb_3pin_groups +5030 drivers/pinctrl/renesas/pfc-r8a77965.c
 >
 >    5029	
 >> 5030	static const char * const mlb_3pin_groups[] = {
 >    5031		"mlb_3pin",
 >    5032	};
 >    5033	
 >

