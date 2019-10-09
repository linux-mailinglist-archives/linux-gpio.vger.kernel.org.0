Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31B1CD102C
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 15:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731183AbfJINal (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 09:30:41 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41244 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731168AbfJINal (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 09:30:41 -0400
Received: by mail-wr1-f68.google.com with SMTP id q9so3004058wrm.8
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 06:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YBUdClWn1A6jEGYphzbbEQ4ybEHRPx1vz0WsxA5dD/I=;
        b=uY1uOmT6Df+ctvqfIzFzjUCiq3pjM36p8qQIojoJagYSYC1ZcGe5Ym2gs0l65wqmNt
         mwE3r/3Nf6letzyUWVG5JTzVMAZyNe39DXZzAY6ocnE/XD9hF1yarHrqdKalK/qf21RV
         AXUvBKweiVcVIPgynLbl5H9FDv/Ki0mn7yZlHc2TxaDJSujbANr850hYF8mdMl91QBzg
         kk88Te0Wr7qR6u3S+UuXVK9ec5EcFO8tzbbVJiSilIOCrAVq5d09Hmt/mxicyo9AhNtl
         F5PEknF188Cr8DzI+YHdg81Hoq/yJfnXr0ywzU7iR4RwMJAi6rWZkqHlN5o/f+GMaV5s
         JRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=YBUdClWn1A6jEGYphzbbEQ4ybEHRPx1vz0WsxA5dD/I=;
        b=HvdSYXf8AlSBTFDB0KOvM8K/IYoD3jnaQZY7Y3C1TQ+70FTlS2trhCDGo9DXB+k9hm
         u82QDPRuTOWwxhrFJFD8nEaWtpMDotdbYnw6OJSTcZ74+ciFaWLYUqdbyAGOJQ2lI58z
         7r9P/cb0zy0hE5z+5EM3hhCj61SHF0+gLWFs+V8k4hwc3E33jacoxra99Vhx+Akyfwjr
         xWGVYrimn8AGjj/ZFnb97zJpBboW4Kp6zYjGYKRISDiy51h1Q2+aTDacOFtpur4DKpu8
         NkMC37KOZ3nURVfOMaKyHJPEFiVHwNOJNLbI8ZSdObV4ewcGuJSDmNbw9L18gFeeTh8R
         P5jQ==
X-Gm-Message-State: APjAAAVnlOm0s2RVmSBx0B81Ck+YK+JUcZcTACTLOrMdO+U6YpOiy2Hn
        FdT2R8UYqGVMi0CNLWIeoKaC2HkhCfdk6Q==
X-Google-Smtp-Source: APXvYqyr6XW0XPD9H8kpV41Mi7uiQvsWq4foG1bpgGfU47jLJ6W5/+eCx70Z5n0jOlNn43n5HPntxg==
X-Received: by 2002:adf:f441:: with SMTP id f1mr3164120wrp.340.1570627839426;
        Wed, 09 Oct 2019 06:30:39 -0700 (PDT)
Received: from x1 ([2001:16b8:5c80:ac01:2d69:222e:6eca:3415])
        by smtp.gmail.com with ESMTPSA id z6sm2336290wro.16.2019.10.09.06.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2019 06:30:38 -0700 (PDT)
Date:   Wed, 9 Oct 2019 15:30:37 +0200
From:   Drew Fustini <drew@pdp7.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191009133037.GA17244@x1>
References: <20190921102522.8970-1-drew@pdp7.com>
 <20191008061512.GA19956@sol>
 <CAMRc=Mf8DsEOWcX2BTtdVtsRkNXB3oA-xt2SrWJTn6vt3Fd8Pg@mail.gmail.com>
 <20191008232120.GA9225@sol>
 <CAMRc=MdcWUtEx3QAKxEmEEa1Effq7JpRPGNJOGfSYP6Nh0p1Hg@mail.gmail.com>
 <20191008235626.GA10744@sol>
 <CAMRc=MdCktRBkofaqAEtjNLNS=60Z9zM9a4QoBLsCsx3bSdxtQ@mail.gmail.com>
 <20191009002211.GA11168@sol>
 <20191009065524.GA4061@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009065524.GA4061@sol>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 09, 2019 at 02:55:24PM +0800, Kent Gibson wrote:
> Safe to assume your code is in your topic/gpio-uapi-config branch?
> I hope so, cos I've forked from that into github.com/warthog618/linux 
> and have started working on it.

Do you also have a fork of libgpiod that you are working in?

In case it is of any use, I just posted the libgpiod patch for pull-up/down
flags that I had been using to test with.

I help maintain Adafruit_Blinka [1] so I would like try testing pull-up/down.
I already have a Raspberry Pi 3 booting a cross-compiled kernel with my (now
outdated) patch applied and a patched libgpiod.


[1] https://github.com/adafruit/Adafruit_Blinka
