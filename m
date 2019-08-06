Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B84383D6C
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Aug 2019 00:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbfHFWlV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 18:41:21 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45473 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfHFWlU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 18:41:20 -0400
Received: by mail-pf1-f194.google.com with SMTP id r1so42283570pfq.12
        for <linux-gpio@vger.kernel.org>; Tue, 06 Aug 2019 15:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=wR183pUAGxzM3kNfgqACbzFY/DLj7hr/GbAFrqz5Mp0=;
        b=OpQrsD6f7zQ4q1Ewct2rdjEBEUjFc7ZeBDbC6kD6QVmHf6tUbrKTK/r/vyPocfJeYh
         jKN3Xiqwh62/RQpPxgVosbsp/KG8tvNRVE2rSXJ6trgCyjRHdCLVqiQjULH1EtXCRdoI
         g32R4bhRnI68ujTE4np/USwUYPBpcmzeujseZx9Vyx93LF/j9WHfOUxKiGiAIrlN29lm
         ChfMoF5Q11lftLRwtZbP/1iYZVKPhr8DCOdKG0KXw3GZ1iYaz98XhoRWVZzh+/c/bg//
         MQF9VuN8/vApwbvwVvnvAIWXSsfsjOkfkRMBPjI0Yv4jmHNwUSLC0KLavFAIAV234X5V
         V1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=wR183pUAGxzM3kNfgqACbzFY/DLj7hr/GbAFrqz5Mp0=;
        b=tCwuF0rrfr2yUtn9VYTe16lGPAcjIJD9yA5Wun/D4LBgiaxe7PCh2+JGdOFI3Qq856
         PvQwXbP0JUOKX7xYNiRRlSWQ4CQHa6CDjwPkT1tgfeZ2CV8KuumNEccoplihoY8z2QZk
         VDKKJuAyhuJu4J3ZaIPKZcL6sumDUoTYYwtqmLRQ+Fi0iTVBf88gMfYdT/uWRg8LUOmk
         LwO+Mfn73eKKeqDl0Arlak66p9TaYnJR1Ri6gv8isG/3Y5jJ+pCWkRV5vw6n8t096XqD
         Cmn60AMBIGlDGAK3ifybF9IB4vEqnDeRG8zpgK8RI7/qmTFjCfOKeNUZRhfBypWg2quW
         txiQ==
X-Gm-Message-State: APjAAAVJmkjsfhvrIsQdiKRCp21A5ChqRANWZyL0CQwE3OCf98+uKKO4
        5lAJ8EqD49FfOvf9dBtZ1WE=
X-Google-Smtp-Source: APXvYqxQtHnGBBnhb5QQmZKyCxGCC1eg1VrPP00X9yty3u8yiBn7oVwZ55cHg/DM2Wkimq47pbQIdg==
X-Received: by 2002:a17:90a:2ec1:: with SMTP id h1mr5449511pjs.101.1565131280105;
        Tue, 06 Aug 2019 15:41:20 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:8848:d70e:7e27:4c2a? ([2001:df0:0:200c:8848:d70e:7e27:4c2a])
        by smtp.gmail.com with ESMTPSA id z20sm140262204pfk.72.2019.08.06.15.41.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 15:41:19 -0700 (PDT)
Subject: Re: [pinctrl:devel 16/46]
 drivers/pinctrl/bcm/pinctrl-bcm2835.c:995:10: error: incompatible types when
 assigning to type 'volatile struct SHIFTER' from type 'unsigned int'
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        kbuild test robot <lkp@intel.com>
Cc:     Stefan Wahren <wahrenst@gmx.net>, kbuild-all@01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <201908061021.pQY2TnEK%lkp@intel.com>
 <CAMuHMdU1djc8-c1LvNLFyFa0eH9C3k8nxjN_6F40S43mYZH7Hw@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <848e57bf-41a6-3e3e-6e72-3c15acd76902@gmail.com>
Date:   Wed, 7 Aug 2019 10:41:09 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU1djc8-c1LvNLFyFa0eH9C3k8nxjN_6F40S43mYZH7Hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

could be renamed shifter_st, I suppose. Only used in 
arch/m68k/atari/config.c and drivers/video/fbdev/atafb.c.

Cheers,

     Michael

On 6/08/19 7:33 PM, Geert Uytterhoeven wrote:
> CC linux-m68k (shifter too generic a name?)
>
> On Tue, Aug 6, 2019 at 5:00 AM kbuild test robot <lkp@intel.com> wrote:
>> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
>> head:   d55b7fdd58ac12e76ef65979af4a13b9c15fc00d
>> commit: e38a9a437fb93ddafab5030165e4c6a3a5021669 [16/46] pinctrl: bcm2835: Add support for BCM2711 pull-up functionality
>> config: m68k-allmodconfig (attached as .config)
>> compiler: m68k-linux-gcc (GCC) 7.4.0
>> reproduce:
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          git checkout e38a9a437fb93ddafab5030165e4c6a3a5021669
>>          # save the attached .config to linux build tree
>>          GCC_VERSION=7.4.0 make.cross ARCH=m68k
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All error/warnings (new ones prefixed by >>):
>>
>>     In file included from arch/m68k/include/asm/io_mm.h:32:0,
>>                      from arch/m68k/include/asm/io.h:8,
>>                      from include/linux/io.h:13,
>>                      from include/linux/irq.h:20,
>>                      from include/linux/gpio/driver.h:7,
>>                      from drivers/pinctrl/bcm/pinctrl-bcm2835.c:17:
>>     drivers/pinctrl/bcm/pinctrl-bcm2835.c: In function 'bcm2711_pull_config_set':
>>>> arch/m68k/include/asm/atarihw.h:190:22: error: expected identifier or '(' before 'volatile'
>>      # define shifter ((*(volatile struct SHIFTER *)SHF_BAS))
>>                           ^
>>>> drivers/pinctrl/bcm/pinctrl-bcm2835.c:990:6: note: in expansion of macro 'shifter'
>>       u32 shifter;
>>           ^~~~~~~
>>>> arch/m68k/include/asm/atarihw.h:172:17: error: expected ')' before '(' token
>>      #define SHF_BAS (0xffff8200)
>>                      ^
>>>> arch/m68k/include/asm/atarihw.h:190:48: note: in expansion of macro 'SHF_BAS'
>>      # define shifter ((*(volatile struct SHIFTER *)SHF_BAS))
>>                                                     ^~~~~~~
>>>> drivers/pinctrl/bcm/pinctrl-bcm2835.c:990:6: note: in expansion of macro 'shifter'
>>       u32 shifter;
>>           ^~~~~~~
>>>> drivers/pinctrl/bcm/pinctrl-bcm2835.c:995:10: error: incompatible types when assigning to type 'volatile struct SHIFTER' from type 'unsigned int'
>>       shifter = PUD_2711_REG_SHIFT(pin);
>>               ^
>>>> drivers/pinctrl/bcm/pinctrl-bcm2835.c:998:27: error: invalid operands to binary << (have 'int' and 'volatile struct SHIFTER')
>>       value &= ~(PUD_2711_MASK << shifter);
>>                                ^~
>>>> drivers/pinctrl/bcm/pinctrl-bcm2835.c:999:16: error: invalid operands to binary << (have 'unsigned int' and 'volatile struct SHIFTER')
>>       value |= (arg << shifter);
>>                     ^~
>> --
>>     In file included from arch/m68k/include/asm/io_mm.h:32:0,
>>                      from arch/m68k/include/asm/io.h:8,
>>                      from include/linux/io.h:13,
>>                      from include/linux/irq.h:20,
>>                      from include/linux/gpio/driver.h:7,
>>                      from drivers/pinctrl//bcm/pinctrl-bcm2835.c:17:
>>     drivers/pinctrl//bcm/pinctrl-bcm2835.c: In function 'bcm2711_pull_config_set':
>>>> arch/m68k/include/asm/atarihw.h:190:22: error: expected identifier or '(' before 'volatile'
>>      # define shifter ((*(volatile struct SHIFTER *)SHF_BAS))
>>                           ^
>>     drivers/pinctrl//bcm/pinctrl-bcm2835.c:990:6: note: in expansion of macro 'shifter'
>>       u32 shifter;
>>           ^~~~~~~
>>>> arch/m68k/include/asm/atarihw.h:172:17: error: expected ')' before '(' token
>>      #define SHF_BAS (0xffff8200)
>>                      ^
>>>> arch/m68k/include/asm/atarihw.h:190:48: note: in expansion of macro 'SHF_BAS'
>>      # define shifter ((*(volatile struct SHIFTER *)SHF_BAS))
>>                                                     ^~~~~~~
>>     drivers/pinctrl//bcm/pinctrl-bcm2835.c:990:6: note: in expansion of macro 'shifter'
>>       u32 shifter;
>>           ^~~~~~~
>>     drivers/pinctrl//bcm/pinctrl-bcm2835.c:995:10: error: incompatible types when assigning to type 'volatile struct SHIFTER' from type 'unsigned int'
>>       shifter = PUD_2711_REG_SHIFT(pin);
>>               ^
>>     drivers/pinctrl//bcm/pinctrl-bcm2835.c:998:27: error: invalid operands to binary << (have 'int' and 'volatile struct SHIFTER')
>>       value &= ~(PUD_2711_MASK << shifter);
>>                                ^~
>>     drivers/pinctrl//bcm/pinctrl-bcm2835.c:999:16: error: invalid operands to binary << (have 'unsigned int' and 'volatile struct SHIFTER')
>>       value |= (arg << shifter);
>>                     ^~
>>
>> vim +995 drivers/pinctrl/bcm/pinctrl-bcm2835.c
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology Center
>> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
