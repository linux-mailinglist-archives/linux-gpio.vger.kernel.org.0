Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499E71BBC70
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 13:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbgD1La7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 07:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgD1La6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Apr 2020 07:30:58 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D02C03C1A9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 04:30:58 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id n11so2068557pgl.9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 04:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7mluZ8A4I9xD33tssLfMPlz8TFvmTBj7H//FiLCwMKQ=;
        b=Uzz6rxf2M+0uA0gqifTALGQks4hWRLyGGLFFT02xEl0ZpUVciIXpgIq1gLWPdfAZ5N
         5yy8L64gbdCHAqkLOXIH5OnuIedLJ0Zvhv4fpsYM5iQjhPkeQpNIfXRz1NH0+UW3dx8y
         svQWYO809ihQXo7WeYTtvcjEPZYLHdfasSMCPzy4ko0SYKhoEDGD80hzwFffKVrcwfhC
         14f6c1qi+Xuk4D31slGnBdu3nOYteQ3OBHuc/WX2rWNVW0jfDoIL2mKF9BW41MfZJseD
         HUldHwkxqtRtPIdRaoZgIcOHdCxjGOTYUJvwvRnPM6eSB1zdDNrZ8UQuBshdv3hpvnsC
         H1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7mluZ8A4I9xD33tssLfMPlz8TFvmTBj7H//FiLCwMKQ=;
        b=WeIYC7jQB/JAF0yLMMkEBSroylNR0r2tIHPw6sbiy1XMCJMdAYOHdpqL5hC2f1rldr
         HGP4pTfXScmtlJyJ3gqyb67gI3GKD6Vm2I2q1KUeaCUsXMkOE5IzDcKpmT7f9gdq2aQb
         vcrd4m+GqtYT42TKwPhpo5xDGVeJp74roSn+aaGDJGxvt9wRXCbymqla2ICB0i2fSm7X
         DvlciHtheZuFrL26nQc6urp22QZFoX/wku/k/Ef1zuikSrAqMqs40TrIveshiEBDPf1b
         KKMSRILYWJ3ZmVPJXHJ8z5GDL78nGe3ONfz5XlkZF6goYBrM478o4L/gxGd1UHMo6D+m
         BNHg==
X-Gm-Message-State: AGi0PuY5fdhfp6HX7OYqbFUZwLMRsiY0fAN4q+fiIO5ycQecEhIfrlaD
        udO4YiJEC+0zLN1G7rxjb2Ri
X-Google-Smtp-Source: APiQypL9Kkbnieket+vePrygfOB6d5NB7/ZBGTCpfca9KeSGImCWXC/JlcXcQDHRS2TXxne/Tg0jMw==
X-Received: by 2002:aa7:94a3:: with SMTP id a3mr29670332pfl.101.1588073457999;
        Tue, 28 Apr 2020 04:30:57 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:816:a859:6d8a:8338:74e:a3d1])
        by smtp.gmail.com with ESMTPSA id y25sm13511710pgc.36.2020.04.28.04.30.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 04:30:57 -0700 (PDT)
Date:   Tue, 28 Apr 2020 17:00:49 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jason Yan <yanaijie@huawei.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH] pinctrl: remove unused 'pwm37_pins'
Message-ID: <20200428113049.GA5259@Mani-XPS-13-9360>
References: <20200417092112.12303-1-yanaijie@huawei.com>
 <CACRpkdb5Ozz_MKAUDoyOxdnu_NkN72vRu=ZY7j_Lb5uMAiS3SA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdb5Ozz_MKAUDoyOxdnu_NkN72vRu=ZY7j_Lb5uMAiS3SA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 28, 2020 at 11:58:01AM +0200, Linus Walleij wrote:
> On Fri, Apr 17, 2020 at 10:54 AM Jason Yan <yanaijie@huawei.com> wrote:
> 
> > Fix the following gcc warning:
> >
> > drivers/pinctrl/pinctrl-bm1880.c:263:27: warning: ‘pwm37_pins’ defined
> > but not used [-Wunused-const-variable=]
> >  static const unsigned int pwm37_pins[] = { 110 };
> >                            ^~~~~~~~~~
> >
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Jason Yan <yanaijie@huawei.com>
> 
> I'm sceptic about this. I think PWM37 exists and just need to be
> properly defined.
> 
> Mani will know the right solution to this.
> 

Sorry for missing this thread before. The original patch didn't land in my
inbox.

Anyway the issue is, pwm37 is not added to BM1880_PINCTRL_GRP. So the proper
fix would be to add it.

Jason, will you be able to send a patch for adding it? Otherwise I'll do that.

Thanks,
Mani

> Yours,
> Linus Walleij
