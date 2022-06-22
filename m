Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630345546A1
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jun 2022 14:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbiFVK0k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jun 2022 06:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231645AbiFVK0j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jun 2022 06:26:39 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0372183B6
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2022 03:26:37 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id k14so3517938plh.4
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jun 2022 03:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uJKY49OPBHK9wIGn9YiZYS14LH9y6Y8F10Qqi3Jphu4=;
        b=oFHEXRmseYrcrrbNQmpYd+jpaRa2af2vxO0NIiYwhPSlIE7F4xvVSaaiPWvp/2vYrx
         vdtYGkkSgihHf+pi4KQSWehG1+b266fLywtPBVvMu2LqWYdHM7AwD6Gw0Sk7T5QYoDh3
         mz++Cc6zPXbZVyMZdwgmYK76H/KSoUO1TGE95DNO7NxVS73RFKmwdYtf4MxZ+ERnBour
         Dax1c4HqTHZY7qAsG6huijpXA/bizKGE4+OOKysmFpYTS3hV2bJunGSMkQ9/9b2hX/fb
         xq7Oip53iyNc5aU30ssU/1WF9txYZOXzhSWlfX5b26zKx8LOy9VNa4RJQ2wnzX2wGwoZ
         j+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uJKY49OPBHK9wIGn9YiZYS14LH9y6Y8F10Qqi3Jphu4=;
        b=RcPToWclE91oNb8On35CtFwDmOoyxtVPzdMQRaZro92CqYmd3Vl6Um93HTfp+ZoZQE
         hb3mcUV+JQAOlytvhcvRSTJISWBbs+u84yyRMOWhLllpsPSwoPH3RLejbFbbSoxXw0gq
         d1hLNrd/BNz+pQzYEjB7+skaSO1LxLvubzA2UnG5hH++MxmJCHmylzcqQSzTLKO3DcgP
         mPAy+atjKYgHchPKPdvsiZ3dK7wU618TA7Uyab+nSf0fQ15q9xvSPLk8lDZVg04C9u1x
         P17SYg8bvaAhbT8+pdzlbU8/w5RsuTOhIl2aoVxJ9PnFy0cRVlhOD5KXzRx9BtZhodC7
         2yoQ==
X-Gm-Message-State: AJIora94R+B0l9G/HFP73u0DFztUAwn4XyiliyGlQZsCWY9shqnNzVaU
        ed8LWKdcCNZLavGGiNhg2Tk=
X-Google-Smtp-Source: AGRyM1vI/wm/6O5bQbh4acWR/3uOezaiqzdd4VwCpv2fn81xYs1NNSXbWrOYmhnYP3wQ5u28oD749w==
X-Received: by 2002:a17:90a:e2c5:b0:1ec:ea7f:a85c with SMTP id fr5-20020a17090ae2c500b001ecea7fa85cmr1876239pjb.232.1655893597339;
        Wed, 22 Jun 2022 03:26:37 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id jh21-20020a170903329500b0016a109c7606sm8429383plb.259.2022.06.22.03.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 03:26:36 -0700 (PDT)
Date:   Wed, 22 Jun 2022 18:26:32 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Linux GPIO List <linux-gpio@vger.kernel.org>, brgl@bgdev.pl
Subject: Re: Reading current output value
Message-ID: <20220622102632.GA37027@sol>
References: <CAGm1_kvsAir70H41RJ5vzAGeBLBAFByHyR3fWfFeq3RW5O7cBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGm1_kvsAir70H41RJ5vzAGeBLBAFByHyR3fWfFeq3RW5O7cBA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 22, 2022 at 09:54:41AM +0200, Yegor Yefremov wrote:
> On a am335x based board I have a GPIO pin that enables/disables power
> of an external device (the bootloader sets this pin to output and 1,
> and the kernel is instructed to not change it). Using kernel
> 5.19.0-rc2 and sysfs interface, I can read the current status as
> follows:
> 
> echo 68 > /sys/class/gpio/export
> cat /sys/class/gpio/gpio68/value
> 
> As a result, I read 1.
> 
> Using gpioget (libgpiod) v1.6.3, the line will be configured to
> "input" and the value is set to 0:
> 
> # gpioget 2 4
> 0
> 
> So, how can I read the state without changing it? I am mostly
> interested in using the kernel userspace API directly.
> 

The API itself supports it, but it isn't exposed in gpioget v1.6.3.
The gpioget in libgpiod master has a --dir-as-is option for exactly
this case, but that hasn't made its way into a libgpiod release yet.
(commit 3a912fbc1e2 tools: gpioget: add new --dir-as-is option for GPO read-back)
Can you try master?

> By the way, setting pin to 0 works but not to 1:
> 
> gpioset 2 4=0 - OK
> gpioset 2 4=1 - no level change
> 

gpioset has to remain running to guarantee the output level.
The pin is probably reverting when gpioset exits.
Try the --mode=wait option.

> sysfs works.
> 

Yes and no.

Cheers,
Kent.
