Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1119268101
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Sep 2020 21:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgIMTmn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 15:42:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgIMTmj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Sep 2020 15:42:39 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D638DC06174A
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 12:42:37 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id t16so15550634edw.7
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 12:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k2cvB0HQArtJknBkltHAoCpwXnIH5D4KwvQqQMifHm4=;
        b=WWoza80lwFN2cSIWNPpF9RO03s6vxAsB42qYdTC+2typ17TgiQsuQj2R+PaBHA24Mc
         X0NsWurndtM13ubMmMe7uzPhq1Opu5a170YrnmE2bVIwNwwaVBw83JkdWh7bQPu8fZ2H
         cqWL+xe6KzHNVp66cZeZTtUrk46ajDsyf3bfaiUDApWx9r90psJVxlx9rPM4vYP5413U
         cdL5I8USziB8vGrhrakS2Xj1zIJCfCVHB+ScOFXRKYfXvhpePasFd6ficE58V5tXEWFZ
         oydEoP3ObwzEN7oxrp5I6V0/czFh2JACXJJMwIyObuR1D8K99HglGuojcpq5UnVU4wXN
         +ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k2cvB0HQArtJknBkltHAoCpwXnIH5D4KwvQqQMifHm4=;
        b=tg1mSvIEI7AIvtIf6pMJHn1EVquXp2LNvpKz+zRdXHrwfETiWtumtwfIpZwhcRmGVn
         og2XrjA2ZMmjRgSL3wYjh81kv7TjIfWY/nsTfa8IBqZlCU9HB1Hps3jI/L6VNqy9Ld3h
         jQcvhPE/SGHqQc7Pq8/Xe79srA59LVD5WP1q7wADTlnV4OmItbD4mxeEDu3Xa5WXLqpu
         qveBS3weZWjTH+Uis7CPapPQqvcrYUXXs5NSE4PJm+AYXjlntcsqSJJGgjO7K46Tp+19
         4SPVsWF+gOpH8tAWTTcN2nvbjuz5E+TJWeyD1HLCHm6iecmem6m+aW0lQW3+Q+81C7lB
         ZoZw==
X-Gm-Message-State: AOAM532bQ9QHPKz9tAbPvxxrta32hI5p47qlTSO7ozV6ZHhVBBCVYL6c
        WPbNvmLisn18/PX/7+NihCKCdg==
X-Google-Smtp-Source: ABdhPJz7OvHoMkyN0c1qJ1xvIg2tXwvkdR2sb0uzsGhQB0HjoTTy1q871OAMdzLfTfJEW5qDmRtJCQ==
X-Received: by 2002:a05:6402:326:: with SMTP id q6mr14107023edw.216.1600026156541;
        Sun, 13 Sep 2020 12:42:36 -0700 (PDT)
Received: from x1 ([2001:16b8:5cf8:e601:5f2:8f03:4748:2bc6])
        by smtp.gmail.com with ESMTPSA id bf25sm7685811edb.95.2020.09.13.12.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 12:42:35 -0700 (PDT)
Date:   Sun, 13 Sep 2020 21:42:33 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Trent Piepho <tpiepho@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v4 1/2] pinctrl: single: parse #pinctrl-cells = 2
Message-ID: <20200913194233.GA1955808@x1>
References: <20200701013320.130441-1-drew@beagleboard.org>
 <20200701013320.130441-2-drew@beagleboard.org>
 <3139716.CMS8C0sQ7x@zen.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3139716.CMS8C0sQ7x@zen.local>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 08, 2020 at 04:52:58PM -0700, Trent Piepho wrote:
> On Tuesday, June 30, 2020 6:33:19 PM PDT Drew Fustini wrote:
> > If "pinctrl-single,pins" has 3 arguments (offset, conf, mux), then
> > pcs_parse_one_pinctrl_entry() does an OR operation on conf and mux to
> > get the value to store in the register.
> 
> 
> > -		vals[found].val = pinctrl_spec.args[1];
> > +
> > +		switch (pinctrl_spec.args_count) {
> > +		case 2:
> > +			vals[found].val = pinctrl_spec.args[1];
> > +			break;
> > +		case 3:
> > +			vals[found].val = (pinctrl_spec.args[1] | 
> pinctrl_spec.args[2]);
> > +			break;
> > +		}
> > 
> >  		dev_dbg(pcs->dev, "%pOFn index: 0x%x value: 0x%x\n",
> >  			pinctrl_spec.np, offset, 
> pinctrl_spec.args[1]);
> 
> If #pinctrl-cells value is greater than 2, nothing will set vals[found].val to 
> anything other than zero (from when it's calloc'ed) and the pinctrl will 
> silently be programmed to zero.

If #pinctrl-cells is 3, then it will be:

	vals[found].val = (pinctrl_spec.args[1] | pinctrl_spec.args[2]);

Do you mean if #pinctrl-cells is great than 3 then it will just have a
default value of zero?

That does appear to be the case and is probably not the behavior we
want.  Thank you for pointing this out.  Earlier, there is a check to
make sure there are at least 2 arguments:

	if (pinctrl_spec.args_count < 2) {
		dev_err(pcs->dev, "invalid args_count for spec: %i\n",
			pinctrl_spec.args_count); 
		break;
	}

I'll submit a patch where the upper bound is also checked:

	if (pinctrl_spec.args_count < 2 || pinctrl_spec.args_count > 3) {
		dev_err(pcs->dev, "invalid args_count for spec: %i\n",
			pinctrl_spec.args_count); 
		break;
	}

> The debug printout was not change to print vals[found].val, so it will 
> continue to print the value of the 2nd cell.

Thank you for pointing this out.  Yes, this is an oversight and I will
submit a patch.

> The result is that a #pinctrl-cells of 3 will produce no warning or error, 
> program the pinctrl to zero, whilst at the same time emit debug log messages 
> that it is programming the expected values.
>
> The device tree documentation still states that #pinctrl-cells must be 1 when 
> using pinctrl-single,pins.  This new special case of ORing two values is not 
> documented.

This is a good point, too.  I will make a patch to update the
documentation.


-Drew
