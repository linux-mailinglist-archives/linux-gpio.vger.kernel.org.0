Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD97467F847
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jan 2023 14:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234573AbjA1Nr1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Jan 2023 08:47:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234578AbjA1NrZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Jan 2023 08:47:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA13234C2
        for <linux-gpio@vger.kernel.org>; Sat, 28 Jan 2023 05:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674913597;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OnWLal2NxQnGf3pRQ9fvHZZFlIom2ggk+6Bw3pxljoo=;
        b=ODKz93X4ycUCDf/Ludd6M1ezBvDFd+xAq1IIB5dLMCvQ0klIYevic5j45K0+1OrYeVMBHj
        jHlh94zQ8q0BSNcuAPOKskg2o97wQXKnlv2IkbZk4NUmAuXQV96sG9xsmBhOcIHg1Xb9CL
        I91VIvfZM2bYMWHStsbzsgqQ+swTyKY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-333-eNaMGHC_Ms6kszbAyIRjsQ-1; Sat, 28 Jan 2023 08:46:35 -0500
X-MC-Unique: eNaMGHC_Ms6kszbAyIRjsQ-1
Received: by mail-ed1-f71.google.com with SMTP id z6-20020aa7cf86000000b0049f95687b88so5335223edx.4
        for <linux-gpio@vger.kernel.org>; Sat, 28 Jan 2023 05:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OnWLal2NxQnGf3pRQ9fvHZZFlIom2ggk+6Bw3pxljoo=;
        b=60bjOwKcRCvX/vM0304FhHbVu1Dk//GhZF0z5nDaBcdwQIO56IYcBhbwhq8JVRTCkH
         aoXlpo2TPDpEYe9cXFoiG+R61fwoj742Fm62ROkKl+COTz6zty9lIXbYTtODAKcFOqUw
         MFEwZws8eZwfAvkk4hphi2EW9FqDUlKR+BJtDfi9D/Gn85XqDzL1vi1LdNqZxfshsr9B
         IS/2t/f41gL54ig4Lk3YKO0d6LMUN4tlKQixsA3MtuEA3bH6SNz7EhuXdBsfTYaha3c2
         D/yyNw8wJX+i12GXj4B2DCsf2KR7AVHK0MV4A2awvQJ2q13q8PtMzr9XZUaBk1gXNGZW
         jKGg==
X-Gm-Message-State: AO0yUKUYa6a+YsB9lPPzsvFC5MxXBD4wmOuL0Hw78phrKfCetRTep5gj
        zdlSRkPzjhRfKYOtqRzIQ+ktW23Dc1ectXAnw4+eK16kmA9nHCga6Vc/zNHbu9MJdoUV1uJi63L
        pcmjHHRJnOafbtlJdZpPaCA==
X-Received: by 2002:a17:906:e8c:b0:878:762b:d8fc with SMTP id p12-20020a1709060e8c00b00878762bd8fcmr8958222ejf.28.1674913594575;
        Sat, 28 Jan 2023 05:46:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8JiGNYmwm+QzlGg7STAT5nhbxMmuBeZ39NXLwCHxhMfKk4gWfvoF27XN9vqZb/BXzHB+uQaA==
X-Received: by 2002:a17:906:e8c:b0:878:762b:d8fc with SMTP id p12-20020a1709060e8c00b00878762bd8fcmr8958203ejf.28.1674913594368;
        Sat, 28 Jan 2023 05:46:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t1-20020a170906268100b0087be1055f83sm2077279ejc.206.2023.01.28.05.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 05:46:33 -0800 (PST)
Message-ID: <d5d0bdb1-3d49-2179-7aa7-08c8bf849ee7@redhat.com>
Date:   Sat, 28 Jan 2023 14:46:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code
 enable/disable the privacy LED if present
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     kernel test robot <lkp@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>
References: <20230127203729.10205-2-hdegoede@redhat.com>
 <202301281534.9Z8xRsrX-lkp@intel.com>
 <17f5f57e-0003-2b6b-bfaa-18b03a6d1874@redhat.com>
 <Y9UmYOJI3zvpne09@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y9UmYOJI3zvpne09@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/28/23 14:42, Laurent Pinchart wrote:
> Hi Hans,
> 
> On Sat, Jan 28, 2023 at 10:41:15AM +0100, Hans de Goede wrote:
>> On 1/28/23 08:35, kernel test robot wrote:
>>> Hi Hans,
>>>
>>> I love your patch! Yet something to improve:
>>>
>>> [auto build test ERROR on linus/master]
>>> [also build test ERROR on v6.2-rc5]
>>> [cannot apply to media-tree/master]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
>>> patch link:    https://lore.kernel.org/r/20230127203729.10205-2-hdegoede%40redhat.com
>>> patch subject: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code enable/disable the privacy LED if present
>>> config: riscv-randconfig-r026-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281534.9Z8xRsrX-lkp@intel.com/config)
>>> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
>>> reproduce (this is a W=1 build):
>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>         chmod +x ~/bin/make.cross
>>>         # install riscv cross compiling tool for clang build
>>>         # apt-get install binutils-riscv64-linux-gnu
>>>         # https://github.com/intel-lab-lkp/linux/commit/000ccec1824b3256e3fc1a94079bb953f19faab5
>>>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>>>         git fetch --no-tags linux-review Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
>>>         git checkout 000ccec1824b3256e3fc1a94079bb953f19faab5
>>>         # save the config file
>>>         mkdir build_dir && cp config build_dir/.config
>>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/v4l2-core/
>>>
>>> If you fix the issue, kindly add following tag where applicable
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>>>> drivers/media/v4l2-core/v4l2-subdev.c:1124:20: error: call to undeclared function 'led_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>>            sd->privacy_led = led_get(sd->dev, "privacy-led");
>>>                              ^
>>>>> drivers/media/v4l2-core/v4l2-subdev.c:1124:18: error: incompatible integer to pointer conversion assigning to 'struct led_classdev *' from 'int' [-Wint-conversion]
>>>            sd->privacy_led = led_get(sd->dev, "privacy-led");
>>>                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>    2 errors generated.
>>
>> As mentioned in the cover-letter this series depends on this immutable-branch:
>>
>> https://lore.kernel.org/platform-driver-x86/Y9QGcA+9nlmOOy2d@google.com/
>>
>> That branch not being present in the base used by LKP is what is causing this
>> error.
> 
> The --base argument to git-format-patch will record the base commit ID
> in the cover letter, that can possibly help bots getting it right.

Thanks I was not aware of the --base argument, that is useful to know.

Regards,

Hans

