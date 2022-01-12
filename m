Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D84C48CCAE
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 21:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbiALUAO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 15:00:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28320 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1357588AbiALT6G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jan 2022 14:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642017483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/fVIoXcUDxCaqlrP4EIsauwQJleBaGegrSKdeG6vK/Q=;
        b=DdUHw+VNi9MWxztuN0CY75luFN7gr7GlAmahyXv5oXuRpPM+q3YC9urWnpgbaDBtVMN3D0
        PJYZ20ToHa8agmFYERnajNK7iBy2IHZjXUwprGBedb7awtAvBEB1Vp0kiqCA6TamtGxbU2
        3G8WxDZoz3Svn0/qxO4Pr5hdfZIyAU4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-1dohelmMOU23GHBwMtunNQ-1; Wed, 12 Jan 2022 14:58:02 -0500
X-MC-Unique: 1dohelmMOU23GHBwMtunNQ-1
Received: by mail-ed1-f69.google.com with SMTP id z9-20020a05640240c900b003fea688a17eso3230874edb.10
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 11:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/fVIoXcUDxCaqlrP4EIsauwQJleBaGegrSKdeG6vK/Q=;
        b=caWbMMoG3yDujJ1PYuxls0f+q6gXhLvYzEWiREju0001MNbHwO+PdaLoyj+0rGeNJe
         y7P0znOpAqZc++8fzbXjLPBmCrR0NsX3EqS77u8h4MUhxCXe7rU+v+1JCZYK+28xJxlz
         AjKIrVZ1VmDrXfEU/y7tLKdKvnmG/fvbNCdxl7dHURl3hR/KVTnutaTPVygxBzkYdWZ+
         5NekRyEz1njB7SIMUy6+5gy1NBMk0+5Ltop2gE61hCDbcaWwVxejdJryvsbpLVq31zPk
         WYp1xJesV0k7v66wq8PPuaNoKSxZZqnaWRIHL2MmvBJDVw++CDh9htzNiXmZfgOVplu3
         tvyQ==
X-Gm-Message-State: AOAM532oyrkVjY+bOGkwxxJH+iKo9xqF/HO+w4/Uio59urJ6MAMDC8+z
        NyNzxEoBzf4/FNf1jpgqglmJIVDUxZWrEgC1ldEfGPC+g52sqT8wIRo6QYfVDDlCgIGss1jhN+t
        jWZZikGKOT2D8A+8ojxYgpA==
X-Received: by 2002:a17:907:1606:: with SMTP id hb6mr1110224ejc.606.1642017481659;
        Wed, 12 Jan 2022 11:58:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKALj9WN9AdAiGT9SQyIWLDcxFR9WtNB0UWPKvLJSafSeIslvbON4e1IPIueEs9UNuVh+qgw==
X-Received: by 2002:a17:907:1606:: with SMTP id hb6mr1110197ejc.606.1642017481407;
        Wed, 12 Jan 2022 11:58:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id kw18sm216481ejc.9.2022.01.12.11.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 11:58:01 -0800 (PST)
Message-ID: <eb4ef470-cfaf-13be-cb66-ca38c1a85a23@redhat.com>
Date:   Wed, 12 Jan 2022 20:58:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Content-Language: en-US
To:     kernel test robot <lkp@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-gpio@vger.kernel.org
References: <20220107234456.148389-1-hdegoede@redhat.com>
 <202201090203.kgCw6bSd-lkp@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202201090203.kgCw6bSd-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/8/22 19:54, kernel test robot wrote:
> Hi Hans,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on linusw-pinctrl/devel]
> [also build test WARNING on v5.16-rc8 next-20220107]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Hans-de-Goede/pinctrl-baytrail-Clear-direct_irq_en-flag-on-broken-configs/20220108-074637
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> config: i386-randconfig-c001-20220107 (https://download.01.org/0day-ci/archive/20220109/202201090203.kgCw6bSd-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/fc9eb527f62b0bebde64745ec5b0a838fde7ef41
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Hans-de-Goede/pinctrl-baytrail-Clear-direct_irq_en-flag-on-broken-configs/20220108-074637
>         git checkout fc9eb527f62b0bebde64745ec5b0a838fde7ef41
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/pinctrl/intel/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/pinctrl/intel/pinctrl-baytrail.c:1483:58: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
>                    dev_dbg(vg->dev, "Pin %i: uses direct IRQ %ld\n", pin, match - direct_irq);
>                                                              ~~~          ^~~~~~~~~~~~~~~~~~
>                                                              %d
>    include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
>                    dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
>                                                        ~~~     ^~~~~~~~~~~
>    include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
>                    _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
>                                            ~~~    ^~~~~~~~~~~
>    1 warning generated.

Hmm, ok. so x86_64 needs a %ld for the pointer arithmic result on i386 needs a %d
without the 'l' what fun. I'll just store it in a temp int variable in the next
version.

I need to do a new version anyways since I ended up going down a bit of a rabithole
wrt the direct IRQ stuff and I now finally completely understand how this all works
including how the trigger bits in the pinctrl work together with the ones in the
IO-APIC. See the next version of this patch for details.

Regards,

Hans

