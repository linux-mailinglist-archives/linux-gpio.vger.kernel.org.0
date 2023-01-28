Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51FBA67F6C4
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jan 2023 10:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbjA1Jmc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Jan 2023 04:42:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjA1Jmb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Jan 2023 04:42:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D902279B
        for <linux-gpio@vger.kernel.org>; Sat, 28 Jan 2023 01:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674898908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=twR14cjllGUXLpKlnOdL7uubVR+CcOSrwvbCUlEF4yg=;
        b=ByAqBjFPIVe6TNUUXR91kJbxLz4wT1nkQOryGO2OQNUvSd7c1qumVYqwkjhTQB6cYPlcQa
        nn2zX4IsL8OYphcMEjO9Yvsb4yNvPhe6NiGcdqnelwDIV11nbNfs6CjTZ/pNX6Geestq9R
        5zkr38cs5Ixur9ORmgVBlcwoYFeDY+8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-304-ip6ZLExOOCyieo7CA1R_VA-1; Sat, 28 Jan 2023 04:41:45 -0500
X-MC-Unique: ip6ZLExOOCyieo7CA1R_VA-1
Received: by mail-ej1-f72.google.com with SMTP id hp2-20020a1709073e0200b0084d47e3fe82so4676487ejc.8
        for <linux-gpio@vger.kernel.org>; Sat, 28 Jan 2023 01:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twR14cjllGUXLpKlnOdL7uubVR+CcOSrwvbCUlEF4yg=;
        b=C6E6+m5tFcq7eCKOR709/rbLucWRS5aBLal/wV9kSgseS2Uqa2iBe8przbffNydvKQ
         MxGdJOjONClURJ9kHCyKeAA3K/vC/nS3dbj/i6TVTbefwzkI3LlE57LfF86qucmXAWAn
         Kt5gZVOuforxFSmGS/6EKwycuB8YPEhXebFyVRIx12vxALzeZ38N6V9jtlQKiTJkutiJ
         +WsKaYK6i1a4kKMcmjbVmN7k3beG5uU/VwF+N7ymT+KcDS5SvxEleH4xHvbIVzubdYzN
         eUoDgoBBMwEbVjiGPFKtQEHmKAQkyPMjCUP99h4TPgsgfV8tHL26kmJA6FljY/ew65H2
         3Kgg==
X-Gm-Message-State: AFqh2koKce1lkKvXFHR0pK6olwWXGBmO+jg48LBDxpwwMo4xxhj8iSbL
        n75hq/tB9MVlLjG/QpXg+kkquGsgYajydhL3MDir8G6AkEC+Iz6EiAPXGlhdnhyxfnGnYbPJ1Nq
        F2QxZhZJAkyS8l5JHwRwE1A==
X-Received: by 2002:a17:907:8b08:b0:860:c12c:14fd with SMTP id sz8-20020a1709078b0800b00860c12c14fdmr47726555ejc.76.1674898904776;
        Sat, 28 Jan 2023 01:41:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsLWHdwigC9AWjgO/I5vHPQwk+KI0Cp2B38kYPAXsibJhvaTjuoQ0sruljT5mNLvxnF6Tby9g==
X-Received: by 2002:a17:907:8b08:b0:860:c12c:14fd with SMTP id sz8-20020a1709078b0800b00860c12c14fdmr47726543ejc.76.1674898904558;
        Sat, 28 Jan 2023 01:41:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id mb18-20020a170906eb1200b0084f7d38713esm3622593ejb.108.2023.01.28.01.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 01:41:44 -0800 (PST)
Message-ID: <579d96f3-83d3-8b0a-6760-ce1903936c1a@redhat.com>
Date:   Sat, 28 Jan 2023 10:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 3/5] platform/x86: int3472/discrete: Create a LED class
 device for the privacy LED
Content-Language: en-US, nl
To:     kernel test robot <lkp@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>
References: <20230127203729.10205-4-hdegoede@redhat.com>
 <202301281537.fKVHsgf4-lkp@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202301281537.fKVHsgf4-lkp@intel.com>
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

On 1/28/23 08:24, kernel test robot wrote:
> Hi Hans,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.2-rc5]
> [cannot apply to media-tree/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
> patch link:    https://lore.kernel.org/r/20230127203729.10205-4-hdegoede%40redhat.com
> patch subject: [PATCH v6 3/5] platform/x86: int3472/discrete: Create a LED class device for the privacy LED
> config: i386-randconfig-r004-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281537.fKVHsgf4-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/d71a1bce9c9ea0bd5b98920b2d72a5b0a36ca19d
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
>         git checkout d71a1bce9c9ea0bd5b98920b2d72a5b0a36ca19d
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=i386 olddefconfig
>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/platform/x86/intel/int3472/discrete.c:17:
>>> drivers/platform/x86/intel/int3472/common.h:107:40: error: field 'lookup' has incomplete type
>      107 |                 struct led_lookup_data lookup;
>          |                                        ^~~~~~
> --
>    In file included from drivers/platform/x86/intel/int3472/led.c:7:
>>> drivers/platform/x86/intel/int3472/common.h:107:40: error: field 'lookup' has incomplete type
>      107 |                 struct led_lookup_data lookup;
>          |                                        ^~~~~~
>    drivers/platform/x86/intel/int3472/led.c: In function 'skl_int3472_register_pled':
>>> drivers/platform/x86/intel/int3472/led.c:57:9: error: implicit declaration of function 'led_add_lookup'; did you mean 'd_can_lookup'? [-Werror=implicit-function-declaration]
>       57 |         led_add_lookup(&int3472->pled.lookup);
>          |         ^~~~~~~~~~~~~~
>          |         d_can_lookup
>    drivers/platform/x86/intel/int3472/led.c: In function 'skl_int3472_unregister_pled':
>>> drivers/platform/x86/intel/int3472/led.c:71:9: error: implicit declaration of function 'led_remove_lookup' [-Werror=implicit-function-declaration]
>       71 |         led_remove_lookup(&int3472->pled.lookup);
>          |         ^~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

As mentioned in the cover-letter this series depends on this immutable-branch:

https://lore.kernel.org/platform-driver-x86/Y9QGcA+9nlmOOy2d@google.com/

That branch not being present in the base used by LKP is what is causing this
error.

Regards,

Hans

