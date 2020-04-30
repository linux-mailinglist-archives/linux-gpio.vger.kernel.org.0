Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406171C01E2
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2020 18:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgD3QPa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Apr 2020 12:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726482AbgD3QP3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Apr 2020 12:15:29 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4EFCC035494;
        Thu, 30 Apr 2020 09:15:29 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id u22so2400606plq.12;
        Thu, 30 Apr 2020 09:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ohe0w2oqgXjSgHTpxKWLVpHjCPyoN0t0/3ExT/Ew+K4=;
        b=VuaBogpL2YFhEFVc9AQbn0eky1wbDGzkUtCWbCmcnp0R1bB1IRDCslhlVdcg9YPnQu
         fu5ifDguLmSeDujMNFpVcFTqdgVr8VVnpMDF3wIsEFJHYiv6MbkXcq8R3EDVziIVV6iU
         /IsZY5yA23UwE0/SAKYNbhDSUD1sxu+OPr2qQiA6P0Eu+XW4w/EaSvMfhtuy05WdBXtA
         X5Uml1oXzvwEBxH98XSlYDf54/eaMANlNcciA3Q7Ku2NHkUVsHbOT6fb2SHLzsfF8dYn
         BrDNEMwHsV/XVTd18TsGUIN+i77tFkgb24YLd77edW7RD8V6ZepGBK6YXXfCQmOFVzI8
         QFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ohe0w2oqgXjSgHTpxKWLVpHjCPyoN0t0/3ExT/Ew+K4=;
        b=eUu8MYvW7oYwO1fgXiKdb2AINj9Znym5MUbft9VtxitEE8OGFTBmiOV61vjxxKZD+q
         5vOJ5bDEdJhaJ02hLcvGxlE3fGA4Ii9jlQi99slJLSg3f3buFBkgAAKwvFddqY1h8B1L
         V5F1PFkTDyeWG6OUtAkbaj+A/rNJH7vqiVDTr1I+FwRUSfbBvGgtYXxyvP1F38xcedUL
         7X6ByGyl2koHClkKnqMEyVQ5XP9d2ciiM9dDN28vZxzpvg3zO44XTUUStqVZ6ej7bNuf
         jG9OnguTHcAak+tvdYBf0k9fj4oyDlGKWspuVtfKVqLDdoJt3/4TpNJV3F/oZzmavDx7
         BTew==
X-Gm-Message-State: AGi0PuaUqAMeveKVmWCB2k5fIfkxInuduYsroqqpjgxuoDve851K26y7
        f/eyixELgjtyr7ox4kjC41A=
X-Google-Smtp-Source: APiQypIjLOWeSYVNJv746Q8IVmk/zvFvPh6VnpGR7Dk9xsPCjPPTMMIa+9W3XRJmNz7RPBm7/1O8gw==
X-Received: by 2002:a17:90a:c481:: with SMTP id j1mr3800867pjt.5.1588263329136;
        Thu, 30 Apr 2020 09:15:29 -0700 (PDT)
Received: from syed ([106.210.97.7])
        by smtp.gmail.com with ESMTPSA id q19sm235805pfh.34.2020.04.30.09.15.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Apr 2020 09:15:28 -0700 (PDT)
Date:   Thu, 30 Apr 2020 21:45:14 +0530
From:   Syed Nayyar Waris <syednwaris@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     akpm@linux-foundation.org, vilhelm.gray@gmail.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        michal.simek@xilinx.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] gpio: xilinx: Utilize for_each_set_clump macro
Message-ID: <20200430161514.GA7107@syed>
References: <cover.1588112714.git.syednwaris@gmail.com>
 <80745504d15c87aa1da0d4be3c16d1279f48615b.1588112716.git.syednwaris@gmail.com>
 <20200429102114.GF185537@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429102114.GF185537@smile.fi.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 29, 2020 at 01:21:14PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 29, 2020 at 04:39:47AM +0530, Syed Nayyar Waris wrote:
> > This patch reimplements the xgpio_set_multiple function in
> > drivers/gpio/gpio-xilinx.c to use the new for_each_set_clump macro.
> > Instead of looping for each bit in xgpio_set_multiple
> > function, now we can check each channel at a time and save cycles.
> 
> > +	const unsigned long state_size = BITS_PER_TYPE(*state);
> 
> This '*state' is unneeded complication, use BITS_PER_U32.
> 
> > +#define TOTAL_BITS BITS_PER_TYPE(chip->gpio_state)
> 
> This macro makes code uglier, besides the fact of absence of #undef.
> And also see above.

Thank you for your review comments. Just want to clarify, you want
 a new macro to be created - 'BITS_PER_U32' ?  
Also, don't you think that with BITS_PER_TYPE(), in case later the type
of 'state' changes, it will be reflected in this code without any code
change?

Let me know if I have misunderstood something.

> 
> > +	DECLARE_BITMAP(old, TOTAL_BITS);
> > +	DECLARE_BITMAP(new, TOTAL_BITS);
> > +	DECLARE_BITMAP(changed, TOTAL_BITS);
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
