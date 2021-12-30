Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26080481A25
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Dec 2021 08:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236849AbhL3HPA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Dec 2021 02:15:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236741AbhL3HPA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Dec 2021 02:15:00 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E702C061574
        for <linux-gpio@vger.kernel.org>; Wed, 29 Dec 2021 23:15:00 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id u20so20667095pfi.12
        for <linux-gpio@vger.kernel.org>; Wed, 29 Dec 2021 23:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sfUkye3DfZxSEaJ0fGLgaSVK2OVRkK/LShat9HhuZXE=;
        b=ZMnra6inFvlv8LhHWG9m8Pq169tNeyQHUY8vesZ12mEJnERrvwpazFScW/bBQBWN7D
         r1zZg3Fpib9Lge9+4R5LzkW4wNBWW9D4AdcQakaKn3+r/09Vcga5AQXHxLcoVyN/cNlk
         M2twU1/a7RF8iHnJ4eLn4J+beqkxknXf/PAAjA9GcSZjDM5mgpZxkLPjKiJ9esaxicef
         aYHfE/+d244yWsLBsw/OCQuOF6sdIX1uFrH7N4GBYYtpIcssaemxItMK63TYF+P8TnVO
         GY8Y6Quz7xgfQR2FUlvyeA9ULLN8sShY3fFlORHCdd1SkmbxpuUh7l2Gw72PnC++D3Qc
         Y9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sfUkye3DfZxSEaJ0fGLgaSVK2OVRkK/LShat9HhuZXE=;
        b=p5GfeG0BUJBW/6pkbwA4v6y8SvnUdVQy2PnchZ5hQwW8NZ41V6EcN+ZtZ9PpAj2r2f
         5sb0sVNr2JmmHsqb0096Nvs3WfUbGkC35y3yeuQ0tPU1EoEKFzx4fQbWftMVbxi1zutN
         jC//BRtBgBghtSjcSXonMitmfoZ/3/auTtEJIa9CC+oNj1d2cEV6fsFkalLsI0h640tQ
         ie98uSfVM1sqhIL44zrPo3T44u7MrXQ26+PhVo6JbE8Sb1ru8y/pgV5SKCOed6XJ/BHX
         ZKhjVOcVnIZlWjZYCB7FLLv+HM1rzLqWAkEQaqL1HTCRzO4ZvWS66kSLkdLBhERoVwBD
         Ou3w==
X-Gm-Message-State: AOAM532l+t5CbXpD9g0jDQ2d9RmB+ClRGC4PVoTIraxfEK5u8p6Gqzds
        JcP96myJh/mUh5kdiCn/d0v7cSdRzPE=
X-Google-Smtp-Source: ABdhPJxgAf43oswhY06Lv/KwvzYrJaC4zKYRNelitMqSRs7mFu8D8qJuIlJDS93JGIZXDEOR0InmPA==
X-Received: by 2002:a62:88ce:0:b0:4ba:72e1:e2f3 with SMTP id l197-20020a6288ce000000b004ba72e1e2f3mr30172067pfd.13.1640848499860;
        Wed, 29 Dec 2021 23:14:59 -0800 (PST)
Received: from sol (14-201-12-235.tpgi.com.au. [14.201.12.235])
        by smtp.gmail.com with ESMTPSA id s3sm25007765pfm.0.2021.12.29.23.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 23:14:59 -0800 (PST)
Date:   Thu, 30 Dec 2021 15:14:55 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Ashayam Gupta <ashayamg@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod] Issue in gpioset (Tag v1.6.3)
Message-ID: <20211230071455.GA37120@sol>
References: <CAOgBvpkPOaKdwi-eWR2WAzJxQpOqAZWijKKs2twAZ9dUQ+ibgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOgBvpkPOaKdwi-eWR2WAzJxQpOqAZWijKKs2twAZ9dUQ+ibgg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 26, 2021 at 12:56:09AM +0530, Ashayam Gupta wrote:
> Hi All,
> I have used the v1.6.3 Tag from the website
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/?h=v1.6.3,
> for doing a simple testing on the breadboard(Hobby Project).
> The source code has been compiled with these flags: ./autogen.sh
> --enable-tools=yes --prefix=/home/pi/gpio/install
> --enable-bindings-cxx.
> I am facing the below mentioned issue with this build.
> 
> Issue:
> Command used: ./gpioset --mode=time --sec=1 pinctrl-bcm2711 27=1
> As per my understanding, after 1 sec the pin @27 should switch to 0 ,
> but the LED keeps glowing even after the command is complete and later
> on when I run the
> ./gpioget gpiochip0 27, the LED switches off  and the value printed is 0.
> Is this supposed to be the desired behavior for the above set command,
> or it is supposed to EXIT on default after the mentioned time limit.
> 

Hi Ashayam,

You misunderstand gpioset and gpioget - what you are seeing is expected
behaviour.

gpioset does not restore the line to its original state when it exits, nor
make any other guarantees about the line state after it exits.
Quite the opposite - as the line is no longer under your control you
should make no assumptions regarding its state.
The timer on gpioset is intended to guarantee the minimum time the line
will stay set, not to schedule a transition.

And gpioget sets the line direction to input so, as you have a load
attached, the LED will switch off and the line will get pulled low and
report the 0 you are seeing.

That is my understanding - I'm sure Bart will correct if I'm mistaken.

Cheers,
Kent.
