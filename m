Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 450554C3220
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Feb 2022 17:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiBXQs5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Feb 2022 11:48:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbiBXQsz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Feb 2022 11:48:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6B9C219D637
        for <linux-gpio@vger.kernel.org>; Thu, 24 Feb 2022 08:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645721304;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ed8Lh2cOU0YL5cudob+OfUR2qUzn6zWG4kvh6tQayA8=;
        b=T/QjF6RU0fzL/K6nkXGXumBMJT50rVZhV2wSh5Ydi56Ziysm2vdbA4tWUxYARe49BLdrnJ
        g0gGrAgH4sy3iYmg0ecIw2DTJgKUUgFl0La4ZmjcY/kc1csPk2U7u1dt2db7NGpOfuKrpv
        XbwqNtCHGljLO09d5+Q4GbIjj2L5J80=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-eAT93X6BMYmfOW7c-nthQw-1; Thu, 24 Feb 2022 11:48:23 -0500
X-MC-Unique: eAT93X6BMYmfOW7c-nthQw-1
Received: by mail-ej1-f72.google.com with SMTP id m4-20020a170906160400b006be3f85906eso1472949ejd.23
        for <linux-gpio@vger.kernel.org>; Thu, 24 Feb 2022 08:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:content-transfer-encoding;
        bh=ed8Lh2cOU0YL5cudob+OfUR2qUzn6zWG4kvh6tQayA8=;
        b=cDXjG3g21Ze4PV4KZ0Cvk3e+pvd+EgdYqHDqOlozQzVXzKlmgVedL1+rNyTVG12TaL
         7JaATXxFQiC1fG8Vs6Pk8jXn54663sC5lBfl4ZcuPvl2hCuvTsfK9NCjHUU5H5BNrHDW
         IqMAed9CEdPbScflagcHKlwFihLEF00ussqCW4AsJU6eeMpXK72kJjaP9cNHGok9Okm/
         L9jqZFU5ZJYq+ywcOmuGYtXXK0OaJAFUQWRYZbmnSk3jwEZvhkjoLLkvcvlzOZwPke/J
         2PAQNJcXXcBWuU85UNcMqANUn4s4g9wOUoEeH2TLkcGe0nHMJUcSMy65oY26JlBSzzm6
         mXtg==
X-Gm-Message-State: AOAM533QNfZPOxAVdW/LDRZKZy1pfJRqjWLEQ9/f+T9qqPZX0KN8MlGX
        5hmRaDEvhM/793nX3y21oGa+GW7+0gFfw0n7xKrWGLXEUAQ6tdg4Tgb3CLqMcMB1cVKc/5XEmgt
        GdLkOpTxVXUsbOI+YCtKu6w==
X-Received: by 2002:a17:906:2a85:b0:6ce:36bd:bcd9 with SMTP id l5-20020a1709062a8500b006ce36bdbcd9mr2932874eje.318.1645721301982;
        Thu, 24 Feb 2022 08:48:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCzbVpybNtYpt6KzoO4sAHpNzvlPveHRcLj6nM2900NEWrFM+SUWFtXSn0OBBhOiujgnP3jQ==
X-Received: by 2002:a17:906:2a85:b0:6ce:36bd:bcd9 with SMTP id l5-20020a1709062a8500b006ce36bdbcd9mr2932857eje.318.1645721301745;
        Thu, 24 Feb 2022 08:48:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id i9sm1660140edc.56.2022.02.24.08.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 08:48:21 -0800 (PST)
Message-ID: <7640f9ac-88af-ace7-0bd4-990d852567dd@redhat.com>
Date:   Thu, 24 Feb 2022 17:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Immutable branch with 5.17-rc1 + "pinctrl: baytrail: Add
 pinconf,group + function for the pmu_clk"
To:     Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Intel pinctrl maintainers,

As discussed here is a pull-req for an immutable branch with 5.17-rc1 +
"pinctrl: baytrail: Add pinconf,group + function for the pmu_clk".

I'll merge this into my review-hans branch with the dependend
patches merged on top and I'll push the whole set to for-next
once the buildbots have had a chance to test things.

Regards,

Hans


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-pinctrl-pmu_clk-1

for you to fetch changes up to 2f46d7f7e959da3ae18ed5d283935673f7a22354:

  pinctrl: baytrail: Add pinconf group + function for the pmu_clk (2022-02-24 16:44:34 +0100)

----------------------------------------------------------------
Immutable branch with 5.17-rc1 + "pinctrl: baytrail: Add pinconf
group + function for the pmu_clk"

For merging into both pdx86/for-next and pinctrl/intel/for-next.

----------------------------------------------------------------
Hans de Goede (1):
      pinctrl: baytrail: Add pinconf group + function for the pmu_clk

 drivers/pinctrl/intel/pinctrl-baytrail.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

