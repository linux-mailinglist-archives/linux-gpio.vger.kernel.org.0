Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9E261F13C8
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 09:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbgFHHqg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 03:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728983AbgFHHqe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 03:46:34 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA36CC08C5C3
        for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2020 00:46:33 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h5so16248688wrc.7
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2020 00:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Ii1LpA7xPLv2wdGt5UuWPaO4p+SzGddtJEFd/ScE1mM=;
        b=TbcMdd/8OOsDoTOIeYwoPHkpvrb7BLpJgvs3osnO9kgBDS52ZeSXUiVqA3cdbFfqgQ
         j+Keb/5fI6A4lol2GJ6ijyjT5cuYD1OchuUXj4zFjT5O9U0kOCVWpub3uGIR4ix8Y4he
         9LTLgODzbNdftzIB37a00BFCiR2bFxcMbQA44dL/XUL5uFD2NS0l4to3bE/K1fctTx0j
         2K3o8Z/L7yYzIVoHwF6wYOfG05xBe9ZVWwdsQ4gRjdL5lRFe8YSTkdhtduLscBq/eYKi
         58Q8jTnzbtIIt5FtaVALNA++QK8rJRqW2Uvyj29SIiBZmzT/CCw00/+UGW8ZAC0BmEPE
         sHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Ii1LpA7xPLv2wdGt5UuWPaO4p+SzGddtJEFd/ScE1mM=;
        b=iHBFIW9UwdKFtxY12tZJliIqWijJzIk8aVMF2uIE0jme+k8UilDNJ5YpjWNlakSVFq
         Nq4qTosOpf0bqoX8/64AqQmayp9Gb6ipVsD9ew7L5cHjXpDpwhSiLoLcogk3BeY/oQYi
         HFzON0louBbaBVDHcEpxRUUau35Id0cOs23MjVtWf0ORNzKn6lQcFI7wILUY+fhoaCcp
         wLeUjLm1tGJ4E2vi/uvR0xzgPsdu7kmSQkcN4qAdzVPs1zENgVmSHeo60soi+Mf5jr9v
         +zOgnBciS+E+oli50UnlUAX8/dWurD2x7IaOL1Ie1T4UQKPWQq5f82gvDJpHmBCH1qPj
         TdkQ==
X-Gm-Message-State: AOAM532exeh4qKZdd7GffMjOflImkmwAxeCVn6nlbm8loWbdgKIO1lSO
        HiE8uKVW4JqFAaea7OpMyK+xfQ==
X-Google-Smtp-Source: ABdhPJylRQSYQXNyAZiyW6rrMJLInL4XF8pMc/Y82ccj0fV0f6vQenutBOzt90BsWef9ORNQoVIZrQ==
X-Received: by 2002:adf:a449:: with SMTP id e9mr21978811wra.294.1591602392643;
        Mon, 08 Jun 2020 00:46:32 -0700 (PDT)
Received: from dell ([95.147.198.92])
        by smtp.gmail.com with ESMTPSA id u3sm22618436wrw.89.2020.06.08.00.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:46:31 -0700 (PDT)
Date:   Mon, 8 Jun 2020 08:46:30 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Michael Walle <michael@walle.cc>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 05/11] pwm: add support for sl28cpld PWM controller
Message-ID: <20200608074630.GA3567@dell>
References: <20200604211039.12689-1-michael@walle.cc>
 <20200604211039.12689-6-michael@walle.cc>
 <20200605084915.GE3714@dell>
 <b3324f5c1c908edc89a9cd2676644dfe@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3324f5c1c908edc89a9cd2676644dfe@walle.cc>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 05 Jun 2020, Michael Walle wrote:

> Am 2020-06-05 10:49, schrieb Lee Jones:
> [..]
> > > +static inline struct sl28cpld_pwm *to_sl28cpld_pwm(struct pwm_chip
> > > *chip)
> > > +{
> > > +	return container_of(chip, struct sl28cpld_pwm, pwm_chip);
> > > +}
> > 
> > Why not save yourself the trouble and just:
> > 
> >   struct sl28cpld_pwm *pwm = dev_get_drvdata(chip->dev);
> 
> Is there a reason why not a single pwm driver uses something like that?

Copy/paste?  Habit?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
