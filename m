Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E9C2623CE
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Sep 2020 02:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbgIIACO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 20:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbgIIACN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 20:02:13 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6263EC061755;
        Tue,  8 Sep 2020 17:02:13 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f18so513866pfa.10;
        Tue, 08 Sep 2020 17:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y360yayiYOlJxCwr5rfn4KJb8o+8ztUz73tehQvWcw8=;
        b=nB2KDW+OR3WPaSBsU4mvY6t5wlDL3Q3x+eUGspx4Q+OeIiVcDwU8IXooaN2P+zVym7
         AiiTFYHMzCR2bVvtK5J2UIl70gKwRJDwVNo9dr5QIS5WbMx6fCfdh0g7Duh4ve4IbgJ1
         u+ZtXBw56z07JaNwoXaYnHZeeg7gozrF2Kqgt/FUhJmUzm7FsSIJkP4Bp2CtgMI73zin
         Z0Kta8k5Q9c0BCXrc3zoaAfd3xTElFTeO1S2e6KAy57oblpMnLAlqMYzJrNDb3py4ZdX
         WzxS4Qrc4L6KCG9RA7NkHhaoHgrS7/LJuXx+bVMXtIEKZbYvUlno+aGUVJD8zcFk4qli
         eM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y360yayiYOlJxCwr5rfn4KJb8o+8ztUz73tehQvWcw8=;
        b=KWcAJKxRytWL8bZg2Z2eB4ZFAKefq+uyeNOB3ToNDFE/uM4nw6XZzLcVqTn5Y2tFqY
         IK+YsYK6LO5koM1V6NLtryex/ObHcx22hIRo3osaTtMNYYkam0SVDt5T6SLhzS9GZcTv
         Qq/VKBuAaeug2RVLw8Nts4cGxKcLq49xGzAXLGvlJ2QmughKAN4Z3y/bYgmMKOoJdzNX
         3Wxf3YCHFDa+VlVbNAZJeIFuPgDwPph9EQ+opdFZ6EUc8i1iEICLrj461Mr65H+CBz2+
         becDF0i+ymfn+MN6hsvDd9+55dNHyT8Rqf+OXWF9yOG8paOA98O1FdlsF35qg0iLpz4B
         DSdA==
X-Gm-Message-State: AOAM531KS/weDL0Rw3w0sgfbKj9MyJQMwEARvoGydKR46pcZszAhUecF
        wJMbKnm7NqDYMMvLaoeh5czuIyXn18NSqD2z
X-Google-Smtp-Source: ABdhPJz9b8f5fWVX9O69rFi5FU4utYtNyPoAMzrRpPE1kXlTGjA+Da2t+c7sAX61071qBkj98UdmIA==
X-Received: by 2002:aa7:80cc:: with SMTP id a12mr1161340pfn.4.1599609732930;
        Tue, 08 Sep 2020 17:02:12 -0700 (PDT)
Received: from zen.local (174-21-64-208.tukw.qwest.net. [174.21.64.208])
        by smtp.gmail.com with ESMTPSA id a13sm146249pgq.41.2020.09.08.17.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 17:02:12 -0700 (PDT)
From:   Trent Piepho <tpiepho@gmail.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v4 1/2] pinctrl: single: parse #pinctrl-cells = 2
Date:   Tue, 08 Sep 2020 16:52:58 -0700
Message-ID: <3139716.CMS8C0sQ7x@zen.local>
In-Reply-To: <20200701013320.130441-2-drew@beagleboard.org>
References: <20200701013320.130441-1-drew@beagleboard.org> <20200701013320.130441-2-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tuesday, June 30, 2020 6:33:19 PM PDT Drew Fustini wrote:
> If "pinctrl-single,pins" has 3 arguments (offset, conf, mux), then
> pcs_parse_one_pinctrl_entry() does an OR operation on conf and mux to
> get the value to store in the register.


> -		vals[found].val = pinctrl_spec.args[1];
> +
> +		switch (pinctrl_spec.args_count) {
> +		case 2:
> +			vals[found].val = pinctrl_spec.args[1];
> +			break;
> +		case 3:
> +			vals[found].val = (pinctrl_spec.args[1] | 
pinctrl_spec.args[2]);
> +			break;
> +		}
> 
>  		dev_dbg(pcs->dev, "%pOFn index: 0x%x value: 0x%x\n",
>  			pinctrl_spec.np, offset, 
pinctrl_spec.args[1]);

If #pinctrl-cells value is greater than 2, nothing will set vals[found].val to 
anything other than zero (from when it's calloc'ed) and the pinctrl will 
silently be programmed to zero.

The debug printout was not change to print vals[found].val, so it will 
continue to print the value of the 2nd cell.

The result is that a #pinctrl-cells of 3 will produce no warning or error, 
program the pinctrl to zero, whilst at the same time emit debug log messages 
that it is programming the expected values.

The device tree documentation still states that #pinctrl-cells must be 1 when 
using pinctrl-single,pins.  This new special case of ORing two values is not 
documented.



