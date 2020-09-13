Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B141C2681DA
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Sep 2020 01:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgIMX1Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Sep 2020 19:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbgIMX1X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Sep 2020 19:27:23 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96121C06178A
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 16:27:20 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id r7so20574344ejs.11
        for <linux-gpio@vger.kernel.org>; Sun, 13 Sep 2020 16:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7v1NPAzkydR89JgSgtMekj7yJTyNSI10q1eiI/1zrxo=;
        b=LbtnCqygM/AuEhSdhgY7FRI2gjpUMcxbHXdfb0uHIYeZA9t2vwKhMboyANhMt+5f67
         qvP9iZ5nFKResiZfOg14T1PJKOFCcBkJeb8i5gSc/PUsuz13KLo38haND0jXqkp/Kj0d
         5EEIUQFMlCLklphxKJd3PNUc+J4+66ohkvBfI99e+gc1lMr6ORQj4FIclvYNdUrbCop5
         5OIayk+vT1zzsgy0UtOTUKxkO7YDVNuZ5Wr7r/uRY60Fp+9CTZz5Kum22fzHgASJk4U4
         Kws1Gz4Y06JJzEouM/B/ntLM7vGqqU73D085Uw+j+V7ThIfmhlec9Y6j21mNBB7hnUzG
         I6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7v1NPAzkydR89JgSgtMekj7yJTyNSI10q1eiI/1zrxo=;
        b=SwNTpS/5ZHVTBgIdsc8p4lS7uJVVy4wDg4BkaBZggCC4Wl+G05yn34kfM6loSX7O2y
         Pxd3WybbWP5B63ha/larxu7q0ZwS1lNBVueIJFg87OGGHO/tZNegZ4OsGjqYKQioOdRY
         zNIzEuMWGw/8BuAAGg4piTz/rcbb11BdIDQT17YK5jhgtntibGM4SDPEcmf28V5E0omI
         JLLdNeTW1ZpalNVNIF0IeeZ5jeynxjNLVtdowJXjJtPzAN3Uv8oNiixQPCbY1RDm/8lp
         r93BXfvMV1QUQZ71ierD+wvrWw7xNs+Z0yD+cGCjj5pyPipQKCNiZEQjg82uydY0Av/2
         2BHQ==
X-Gm-Message-State: AOAM532KTyqhfPcs2SDTkTo/5NZxH0DxaraxJQsCpSkhoG58yOPC+ZYQ
        eKCw3wMOOCcpackYVOFOAWibgg==
X-Google-Smtp-Source: ABdhPJwUHzdDh00QRhRrdeDG6VXAgb0lLJ45sQRWLXSg9W49GeB8WQ7hHXcKFEid7iQQR9GZYllpnA==
X-Received: by 2002:a17:906:4cd6:: with SMTP id q22mr11753793ejt.139.1600039639010;
        Sun, 13 Sep 2020 16:27:19 -0700 (PDT)
Received: from x1 ([2604:a880:400:d0::26:8001])
        by smtp.gmail.com with ESMTPSA id br7sm6356560ejb.76.2020.09.13.16.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 16:27:18 -0700 (PDT)
Date:   Mon, 14 Sep 2020 01:27:11 +0200
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
Message-ID: <20200913232711.GA2065644@x1>
References: <20200701013320.130441-1-drew@beagleboard.org>
 <20200701013320.130441-2-drew@beagleboard.org>
 <3139716.CMS8C0sQ7x@zen.local>
 <20200913194233.GA1955808@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200913194233.GA1955808@x1>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 13, 2020 at 09:42:33PM +0200, Drew Fustini wrote:
> On Tue, Sep 08, 2020 at 04:52:58PM -0700, Trent Piepho wrote:
> > On Tuesday, June 30, 2020 6:33:19 PM PDT Drew Fustini wrote:
> > > If "pinctrl-single,pins" has 3 arguments (offset, conf, mux), then
> > > pcs_parse_one_pinctrl_entry() does an OR operation on conf and mux to
> > > get the value to store in the register.
> > 
> > 
> > > -		vals[found].val = pinctrl_spec.args[1];
> > > +
> > > +		switch (pinctrl_spec.args_count) {
> > > +		case 2:
> > > +			vals[found].val = pinctrl_spec.args[1];
> > > +			break;
> > > +		case 3:
> > > +			vals[found].val = (pinctrl_spec.args[1] | 
> > pinctrl_spec.args[2]);
> > > +			break;
> > > +		}
> > > 
> > >  		dev_dbg(pcs->dev, "%pOFn index: 0x%x value: 0x%x\n",
> > >  			pinctrl_spec.np, offset, 
> > pinctrl_spec.args[1]);
> > 
> > If #pinctrl-cells value is greater than 2, nothing will set vals[found].val to 
> > anything other than zero (from when it's calloc'ed) and the pinctrl will 
> > silently be programmed to zero.
> 
> If #pinctrl-cells is 3, then it will be:
> 
> 	vals[found].val = (pinctrl_spec.args[1] | pinctrl_spec.args[2]);
> 
> Do you mean if #pinctrl-cells is great than 3 then it will just have a
> default value of zero?
> 
> That does appear to be the case and is probably not the behavior we
> want.  Thank you for pointing this out.  Earlier, there is a check to
> make sure there are at least 2 arguments:
> 
> 	if (pinctrl_spec.args_count < 2) {
> 		dev_err(pcs->dev, "invalid args_count for spec: %i\n",
> 			pinctrl_spec.args_count); 
> 		break;
> 	}
> 
> I'll submit a patch where the upper bound is also checked:
> 
> 	if (pinctrl_spec.args_count < 2 || pinctrl_spec.args_count > 3) {
> 		dev_err(pcs->dev, "invalid args_count for spec: %i\n",
> 			pinctrl_spec.args_count); 
> 		break;
> 	}
> 

I was mistaken when I wrote the above.  I was using the term
#pinctrl-cells when I should have been writing pinctrl_spec.args_count.

pinctrl_spec.args_count is 2 when #pictrl-cells is 1.
pinctrl_spec.args_count is 3 when #pictrl-cells is 2.

I have submitted patches [1][2] with fixes for the bounds check and the
dev_dbg().


> > The debug printout was not change to print vals[found].val, so it will 
> > continue to print the value of the 2nd cell.
> 
> Thank you for pointing this out.  Yes, this is an oversight and I will
> submit a patch.
> 
> > The result is that a #pinctrl-cells of 3 will produce no warning or error, 
> > program the pinctrl to zero, whilst at the same time emit debug log messages 
> > that it is programming the expected values.
> >
> > The device tree documentation still states that #pinctrl-cells must be 1 when 
> > using pinctrl-single,pins.  This new special case of ORing two values is not 
> > documented.
> 
> This is a good point, too.  I will make a patch to update the
> documentation.
> 
> 
> -Drew

[1] https://lore.kernel.org/linux-omap/20200913231557.2063071-1-drew@beagleboard.org/
[2] https://lore.kernel.org/linux-omap/20200913230306.2061645-1-drew@beagleboard.org/
