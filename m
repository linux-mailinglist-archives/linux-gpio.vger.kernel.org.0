Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54532140B50
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 14:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbgAQNoR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 08:44:17 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:47039 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727691AbgAQNoQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 08:44:16 -0500
Received: by mail-wr1-f66.google.com with SMTP id z7so22720133wrl.13
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2020 05:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=LhpCR5vDcuxmC13Hf7ge2eVs5JUiFOiL0U5Ba9egRMw=;
        b=zceCobLh0fkMReC9xfFdXwldcPtVuv28toduajHElpblXk9BO8nsAonZJU4d4ZYwys
         /jAk1UpPld0R+1uL1xkA85I5lfqc60s0ccLfjIWBz8kZUMUxTDfcOATaEzJmNElqL6uZ
         PdGim4iiP/O9ixXknzFJu8o2V5T3elLHj0HTdovMQi1TLRvHYUZdYLN4QjvJKz8tHgyR
         rl0n3Qu6eat1AqcvapQfUbpu9jgvixKlq99w26Q3cl57QLclNJbC7ON4reh1enfe6VGE
         ZiE4TP+DXXMHrOBpwjdNTY/QELGcU9jHKkyyIXyj9X64yyjD2CSiqjFYDmDKCQpA3Sa6
         elUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=LhpCR5vDcuxmC13Hf7ge2eVs5JUiFOiL0U5Ba9egRMw=;
        b=IH2OOs6i8BOiDfO0KPQjq32Gp24G/JLemIhrfCbF4ZMokdJQ6aPXbpAKfcXQnBvKIn
         q6TtabAAK/piCPqpdaSbTk5uAefuJW0TBGJC68WSSqRIB21dU3UCNuZSPvGxbv/xbxAp
         xNR4IHKjT9pKrMJLj6xGxxButR2aArfFZ3/GCuCDyAYzo9R15PPESHpbw7niVTKQt1iE
         CpHz9cWuDh0r2IORHFMbuFhaSRIZMl3dQcBVYTWVLQoSh72mb5I2+a3ZJo8BsQW6BgGZ
         lbdiRf7crrocmnA+af9yy1nib7QM/2DIxK2f9ZwSTX0cQ6hOoacziz936tDnAab6aoFU
         uhVA==
X-Gm-Message-State: APjAAAVRHVVLAw1HFvQJAgg6M42FrYmPbCi803E1M43Q6X8fAKBwl8ej
        JHQ+UaTR6xPFjyvrek+RKvRQTg==
X-Google-Smtp-Source: APXvYqyTu5Tky5NAfYjiXymO2Th58H5BnDHWlmZTL0ub+zBth+sD7V3P+A22iVD9kpySPXrScKf+VA==
X-Received: by 2002:adf:ee88:: with SMTP id b8mr3261159wro.249.1579268654624;
        Fri, 17 Jan 2020 05:44:14 -0800 (PST)
Received: from dell ([2.27.35.221])
        by smtp.gmail.com with ESMTPSA id t1sm9338897wma.43.2020.01.17.05.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 05:44:14 -0800 (PST)
Date:   Fri, 17 Jan 2020 13:44:32 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v10 00/13] Support ROHM BD71828 PMIC
Message-ID: <20200117134432.GO15507@dell>
References: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
 <20200117103000.GG15507@dell>
 <9785531484b32da487a6016f5c32bf2e9bc45985.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9785531484b32da487a6016f5c32bf2e9bc45985.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 17 Jan 2020, Vaittinen, Matti wrote:

> 
> On Fri, 2020-01-17 at 10:30 +0000, Lee Jones wrote:
> > On Fri, 17 Jan 2020, Matti Vaittinen wrote:
> > 
> > > Patch series introducing support for ROHM BD71828 PMIC
> > > 
> > > ROHM BD71828 is a power management IC containing 7 bucks and 7
> > > LDOs. All
> > > regulators can be controlled individually via I2C. Bucks 1,2,6 and
> > > 7 can also be assigned to a "regulator group" controlled by run-
> > > levels.
> > > Eg. Run level specific voltages and enable/disable statuses for
> > > each of
> > > these bucks can be set via register interface. The buck run-level
> > > group
> > > assignment (selection if buck is to be controlled individually or
> > > via
> > > run-levels) can be changed at run-time via I2C.
> > > 
> > > This patch series brings only the basic support for controlling
> > > regulators individually via I2C.
> > > 
> > > In addition to the bucks and LDOs there are:
> > > 
> > > - The usual clk gate
> > > - 4 IO pins (mostly usable as GPO or tied to specific purpose)
> > > - power button support
> > > - RTC
> > > - two LEDs
> > > - battery charger
> > > - HALL sensor input
> > > 
> > > This patch series adds support to regulators, clk, RTC, GPIOs and
> > > LEDs.
> > > 
> > > Power-supply driver for charger is not included in this series.
> > > 
> > > The series also adds LED DT-node lookup based on node name or given
> > > property name/value pair in LED core. It also adds generic default-
> > > state
> > > and default-trigger property handling to LED core. Follow-up
> > > patches
> > > simplifying few other LED drivers should follow.
> > > 
> > > Changelog v10:
> > >   - Split RTC patch to a BD70528 fix (which hopefully goes to 5.4)
> > > and to
> > >     BD71828 support
> > 
> > Still missing LED Acks.
> > 
> 
> Yep. I know. I haven't heard from Pavel recently and the patch 12
> definitely requires his ack. Can you take the other patches in and
> leave 12 and 13 out for now? I can continue work on LEDs with Pavel but
> I would really like to have the regulators working and BD70528 RTC
> fixed in next release...

Sure.  Give me a few days though.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
