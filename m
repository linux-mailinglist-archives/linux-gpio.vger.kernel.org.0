Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5692DC7D8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 21:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgLPUiw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 15:38:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbgLPUiw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 15:38:52 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C915BC061794
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 12:38:11 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id w124so26124334oia.6
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 12:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e9F9FSqRal1064S7DsdWKAejb4WgRY4sV3OrKHeP5Ew=;
        b=FpnhJHv4ewbWFa0dCLb8e9rXYoudkDFQBzZM0LLc17EpEbRz118NzUKON/J20BIhqk
         cuTF8PBVMQIirF19hrGoEy5BubBHTLlGIINlynPrxy7BGN4XQrSS06gqSzKsyTkcUgcG
         7sm3XHFr38YRZqZvHUb8NhhtrH6zewaP/8QUbCPu02JZfjIdetFnQv3n1QhEqbwSPcWf
         slfpbx6de+/QhZETO/MQVanqAd3xpxvKgYkZ6hnBFAp/kiyzk5vAmhAVdl0wLqJLiIc9
         yqtNSgjzRntfk86Jq6Vl795Vx+yrYFepErgRUU3tnSbI4564i8cImKM5WmzORyiDX4fO
         4ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e9F9FSqRal1064S7DsdWKAejb4WgRY4sV3OrKHeP5Ew=;
        b=Z19iC6q81CwMIFeDpKBrVwM+FJurYMwxHJmybcQXPNMzirbvF5/nDAbb4aflE+EWdf
         ot10QzagvCJ9DTlHx5FVi3fOALXbDGxFLlYYoBQwD5PeS40yyslShhCIv7qQ7Vi1dNaI
         5URh/eh7tCyqBOYr7bKYlyJnPwCaUbMJCDMLv/fcmgBqTgljmmzjRLF3o3l7zkeVJVis
         45v3tAidToAviWDK+0i//rYYDufSsiWyPVlvzvskz7V7qPc2Pp9tL9UVTc+6aP90BDbl
         Xp5F7pagzrLnGA4o6OzHdLpvdRzRz4hRUGzQaM1ah8XVKpntVAh6fLFClKA5roD79MgG
         CQbA==
X-Gm-Message-State: AOAM530rlsr+o5hrk4VIZQfjDJqwlDA7izbXL2evF2O0tMB8tJ2/D5wL
        WHwS9z2MzunczKqu+ShZqpjM20OLNa1RSg==
X-Google-Smtp-Source: ABdhPJzynSniLEnrOcFLQn86HQovMSl1jGqO5zPeUiVaskhMbJZKeNARwURdmgb1JW1xuSlLNcLUWA==
X-Received: by 2002:aca:f15:: with SMTP id 21mr3106629oip.109.1608151091110;
        Wed, 16 Dec 2020 12:38:11 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 186sm214338ood.6.2020.12.16.12.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 12:38:10 -0800 (PST)
Date:   Wed, 16 Dec 2020 14:38:08 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Allow name duplicates of "" and "NC"
Message-ID: <X9pwML9OLalPI0O4@builder.lan>
References: <20201215170308.2037624-1-bjorn.andersson@linaro.org>
 <20201216195357.GA2583366@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216195357.GA2583366@x1>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 16 Dec 13:53 CST 2020, Drew Fustini wrote:

> On Tue, Dec 15, 2020 at 09:03:08AM -0800, Bjorn Andersson wrote:
> > Not all GPIO pins are exposed to the world and this is typically
> > described by not giving these lines particular names, commonly "" or
> > "NC".
> > 
> > With the recent introduction of '2cd64ae98f35 ("gpiolib: Disallow
> > identical line names in the same chip")' any gpiochip with multiple such
> > pins will refuse to probe.
> > 
> > Fix this by treating "" and "NC" as "no name specified" in
> > gpio_name_to_desc()
> > 
> > Fixes: 2cd64ae98f35 ("gpiolib: Disallow identical line names in the same chip")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > The introduction of 2cd64ae98f35 breaks pretty much all Qualcomm boards and
> > grepping the DT tree indicates that other vendors will have the same problem.
> > 
> > In addition to this the am335x-* boards will also needs "[NC]", "[ethernet]",
> > "[emmc"], "[i2c0]", "[SYSBOOT]" and "[JTAG]" added to this list to allow
> > booting v5.11 with the past and present dtb/dts files.
> 
> I am the one who added the gpio line names to the am335x dts board
> files, and I am happy to change them if it will make unique line name
> logic simpler.
> 
> I used the notation of "[<non-gpio-functionality>]" to make it easy for
> the user to realize that the corresponding gpiolines could not be used
> on these boards (BeagleBone and PocketBeagle) for actual GPIO.  I used
> generic names like "[ethernet]" because I didn't think it made sense
> to confuse the user by using the precise name of the non-gpio function
> (such as "[gmii1_rxd0]").  I could post a patch for the dts files that
> restores unique names for "[ethernet]", "[emmc"], "[i2c0]",
> "[SYSBOOT]" and "[JTAG]".
> 
> As for "[NC]", the BGA balls corresponding to these gpio lines are
> simply not connected to any circuits on the board.  I happy to change
> that to whatever name people prefer for a non-connected pin ("", "NC",
> etc).
> 

I think this is the right thing to do, but we can't have gpiolib refuse
to probe existing DTBs - at least not until some grace period has
expired.

Regards,
Bjorn
