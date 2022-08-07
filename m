Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE1C058BB4D
	for <lists+linux-gpio@lfdr.de>; Sun,  7 Aug 2022 16:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbiHGOmG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Aug 2022 10:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233410AbiHGOmG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Aug 2022 10:42:06 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ACAB63E9
        for <linux-gpio@vger.kernel.org>; Sun,  7 Aug 2022 07:42:05 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id 13so5060021plo.12
        for <linux-gpio@vger.kernel.org>; Sun, 07 Aug 2022 07:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=ZyrPJR4nEG5YZu/6NYAs0z+NXp1inPT3efyASxXGVEQ=;
        b=qH9Zhl5vwXVRe5ihPLYYOENc72BjN8HglQ0RRPkqEDnGWAirRJi4WckpaU2zuBskkZ
         vo73rf6Z/NyhPniMnoeZaDuzQj5j8aQT5FDu1W4PHmvgDLU/9t2dEhiqQ2Wkr0SzYtzG
         DS//xZxuTUN8wmgR3EuMdOibs6GNSllgc5cW4SpjssKDFhCgu1rYyRiLr3ec59DuzWXr
         HF/doEyuOXjFqS08u+DibtsI5yHwOdw3kIcPOrzSmG/zsCEUNI1S5oz9L9Ja5tXmqk6h
         xwonOCaYopDFb66VFR8QRm+eB3u4bjGISDMFUIXrLqijh2v1H2/1vxwyvcygwf0n8SIF
         yyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=ZyrPJR4nEG5YZu/6NYAs0z+NXp1inPT3efyASxXGVEQ=;
        b=ZXdZgUKxvldSe5yXP5bPhhNrq01mBgZNxnLdr+FmqbB00etYJD4jFgxHsZzq/hMt2+
         ppb+9dEA5HQxkZ8+aHJoEIUeKGn8QVjlFsXW8l+rwHmXXUrZWxU6L2BmlELGEt3H29kx
         Wi6KXBg+91GCwOqFF9T/mdRrC02N+FWIj3jy5gAfEGZMkn65ExYGZ10Q2kyizHrdPuT3
         xXHZfSJ1e2/F1D6hluMJonV92jYIe5ViywtEIt9jJM8JommbiZRZ4GRwstRmxHrgipcy
         Ox1ewgCpAcegkOSp7ki/FZW5QFIGvNzBEqB6dFTkJaNhJZdz765RDPc87+S1LqZx58Gp
         dQew==
X-Gm-Message-State: ACgBeo3Far6XJLBYV14vHM/uKphYeGpbk7OTbdsmE8Fx2wX+V2Uxl9pQ
        WsFsNVErep8q8UiwuhatPtc=
X-Google-Smtp-Source: AA6agR4BtGgw5pYdDBYYR3pXbGpgnqgEMjlkkZK9w4x/7LO8EMaoW3UScqggYm0owUi6TbqkjjZOBg==
X-Received: by 2002:a17:90a:17e1:b0:1f2:2ff2:6cae with SMTP id q88-20020a17090a17e100b001f22ff26caemr24940396pja.196.1659883324826;
        Sun, 07 Aug 2022 07:42:04 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id a16-20020aa79710000000b0052d40c4c06esm6660127pfg.39.2022.08.07.07.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 07:42:04 -0700 (PDT)
Date:   Sun, 7 Aug 2022 22:41:58 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Robert Baumgartner <rbaumgar@redhat.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod] How can I use PWM
Message-ID: <20220807144158.GA42204@sol>
References: <CAKdJ40QqZt3MbeLNZ1fuYRgaTqSJeDaDdHkQSx1-KWCW4BcJPg@mail.gmail.com>
 <CAHp75Vd2dh5QDxAY-9N0xu6D0ywBcYnRL6FF5ZoKdqnnkBtAyg@mail.gmail.com>
 <20220806134052.GA26217@sol>
 <CAHp75VcZ8UxNiGKEq=uU5UFx+XK-B8zOjfChNqM9P-+Tf=dJAQ@mail.gmail.com>
 <CAKdJ40QmeOgGdbscp06BorATN3d1gW0zraTB+FKSXqRbgowRQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKdJ40QmeOgGdbscp06BorATN3d1gW0zraTB+FKSXqRbgowRQA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 07, 2022 at 03:20:33PM +0200, Robert Baumgartner wrote:
> Andy, Kent,
> 
> I believe I am on the right track.
> 
> I added following line to my config.txt
> # enable pwm on pin 18
> dtoverlay=pwm,pin=18,func=2
> 
> Now I have
> # ls /sys/class/pwm/pwmchip0
> device  export  npwm  power  subsystem  uevent  unexport
> # lsmod|grep pwm
> pwm_bcm2835            16384  0
> 

Excellent - if the hardware PWMs cover the lines you are interested in
then that is certainly the way to go.

> and an example I found is working
> https://github.com/jdimpson/syspw
> 

I believe that should be syspwm.

Cheers,
Kent.
