Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 419D446A302
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 18:29:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242607AbhLFRdG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Dec 2021 12:33:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236887AbhLFRdG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Dec 2021 12:33:06 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E398C061746;
        Mon,  6 Dec 2021 09:29:37 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id k64so2620072pfd.11;
        Mon, 06 Dec 2021 09:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+4D2gd34chIeky2+Mk94dpK2WzcUZASaCDqX1ESt5ek=;
        b=GlBcN0/Q0jgQzFNFmk5XW+lqVah7ziMXS0Av6h382Qu/J6mOWiSs365RYqaoN0qfeG
         ZVoIMi4m/mqbrRCMB84hkh6xdG4vPuBYqHqnipum337AoS/OxI/o7kTrStYRImkbA9k1
         PdoiRDfN/sYYYSuQpQIqclNn/6tnGvZKCsd+rHh0zHzE6c+8Y+0RhGkm+ylE6ESLwvSR
         1r+xqIjSDk+i5u0BAwiK3N9E9AirUr2qLQU5bmjxBgcrmrIpjsStKwfcEjVGy59mNlZ7
         B1O+84sLzNblTUQTrGtZ0o92zhUcFFMiQtyn9qt8of4wCIOPtYOdWvq32AaYm85Hw1v/
         7aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+4D2gd34chIeky2+Mk94dpK2WzcUZASaCDqX1ESt5ek=;
        b=bWOKLddp0HhKIvkxSBklMvHJ+ymF0jLmbEI1ndqzTV7zVvjgni8eHrbLfbS3aySSY/
         IgrYhXJRpBuJLio239Lp7QI6vQ/OsndicDyVfHmRoDLC7A5K/buYx+n46G2+/eaMylJw
         MvCD+mppV8+qxKAs4sf9/QgvlCilYYgq8xvLwFe9qUY2wKvP56KjLWoDvoEg0MlKNe0e
         vPkrdpfwxyk1jtbWEgEP4K5P88x9FTEVOew7vdXfJzYbeWJHJaodxH6dTfg2+D8YpmUm
         8H184o+S6ohYDHMO1mB8jlPF85cykBltMpDIa0oHBhQ2qe42n695uQubcQls2IpmpYD9
         in1Q==
X-Gm-Message-State: AOAM533w/c4vYA8mD5ujgkkmiSt0VbnwiRZM4zMebS8xHoEJv0YFZsc0
        8sxfWGiKA3FXVs2QawwX4rAafIrBU0Y=
X-Google-Smtp-Source: ABdhPJzObQy1ac11926kAG+QhAGbysShB/qk5amvYBRp3rHagbfyfTeBFpiAA/VvDrKIvis+/3ymiA==
X-Received: by 2002:a05:6a00:8cc:b0:4a8:262:49e1 with SMTP id s12-20020a056a0008cc00b004a8026249e1mr37711586pfu.28.1638811776791;
        Mon, 06 Dec 2021 09:29:36 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id ms15sm2153pjb.26.2021.12.06.09.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 09:29:36 -0800 (PST)
Subject: Re: [RFC PATCH 2/3] pinctrl-bcm2835: don't call
 pinctrl_gpio_direction()
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl>
 <20211206131648.1521868-3-hverkuil-cisco@xs4all.nl>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <1623272c-75ce-4410-d939-e4d28ffe5bd9@gmail.com>
Date:   Mon, 6 Dec 2021 09:29:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211206131648.1521868-3-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/6/21 5:16 AM, Hans Verkuil wrote:
> Set the direction directly without calling pinctrl_gpio_direction().
> This avoids the mutex_lock() calls in that function, which would
> invalid the can_sleep = false.

make invalid, or invalidate?

With that fixed:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
