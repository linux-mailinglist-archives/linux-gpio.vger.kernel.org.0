Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9DFA577D4B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 10:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbiGRIOK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 04:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233618AbiGRIOJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 04:14:09 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E26365DD
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 01:14:07 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id bu1so15864002wrb.9
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 01:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2omM97dYIoicKuEdzJAVf4kqUWVFvUq+yqaYGyKWESQ=;
        b=mVxABh+bQ8W1yMDK8n/QVJ2AE2Qhe3B9nadSu3nKxdWgwKW2mCFsFl76g/OHKKKF+e
         REldvqDm3TQ9J8LP6G343CMgS2SG+D36VI7PRtdHCWMBpeoz7kyhLI0kNqwowxY9RdBE
         U8AeYrFc2r4Kq9bVx3dCxzARk/Pfeja9dQY7I1ygMjExPMqz1YVvOZdgNnWoXR+pbZWp
         6EFNR2eZ3GuHB041BvmEAEik9jG218XXgWFcjbjcNX4cWGvK/OqBhDLTsPiFR6SQs2UF
         8wFfZyO/Jfsb5/LZEbGMsDdHm2TexBMX9b/giStkjEFaW3XxtaWeFJRIuUp6/93s7LwV
         DmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2omM97dYIoicKuEdzJAVf4kqUWVFvUq+yqaYGyKWESQ=;
        b=yzm0Vqa2l695eY3SkBPuSiPALdLSfZFIlhq/o4Gj33vkUkJPWfjcJ34zPgaOHyvX5F
         rQDW0SIj8R7iXVjfVfz+CVdMZELJtjkCw/A5Ci6qAW860iVKmfPCUljIMduxXrAXw+kA
         s+KwFRhI7bWD6wQ+s2etSuMSGhvpkybz5QaP2b3elvPtFXg4q4IWoB9IzQZkMMFuvvBs
         cYfyo08Edcs52MtmmZKnp8BZaVyjDNll/13U2xgzOeDyxmuTOvyHzmwQWN5TrLEywxyA
         jSYuGkRXivC/QuaHI9Ig+73T41PVkujYRSsleljKDmYN5TzTEh3E94ElCw9W5CdHU2dv
         R9Kg==
X-Gm-Message-State: AJIora9BzbOjaqgAFhlHjpLldbEIFxo997EQvjWUeefueeddRNo2D89S
        0op9SnfQHrEiK05qjtVPLadAyA==
X-Google-Smtp-Source: AGRyM1ukjuTij8T/BXmDxEHv9q604qxIWdB2h6s4eJPjXyAyOWXh05brRbNOYm9vaw+73TuPuP5CGw==
X-Received: by 2002:a5d:5451:0:b0:21d:2295:6a05 with SMTP id w17-20020a5d5451000000b0021d22956a05mr21528425wrv.302.1658132046025;
        Mon, 18 Jul 2022 01:14:06 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id p13-20020adff20d000000b0020e6ce4dabdsm10194268wro.103.2022.07.18.01.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 01:14:05 -0700 (PDT)
Date:   Mon, 18 Jul 2022 09:14:03 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Colin Foster <colin.foster@in-advantage.com>
Cc:     Vladimir Oltean <vladimir.oltean@nxp.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
        Wolfram Sang <wsa@kernel.org>,
        Terry Bowman <terry.bowman@amd.com>,
        "katie.morris@in-advantage.com" <katie.morris@in-advantage.com>
Subject: Re: [PATCH v13 net-next 0/9] add support for VSC7512 control over SPI
Message-ID: <YtUWS8N2p1Ej/PeD@google.com>
References: <20220705204743.3224692-1-colin.foster@in-advantage.com>
 <20220708200918.131c0950@kernel.org>
 <YsvWh8YJGeJNbQFB@google.com>
 <20220711112116.2f931390@kernel.org>
 <YszYKLxNyuLdH35Q@COLIN-DESKTOP1.localdomain>
 <20220712220856.qbfyhll5o7ygloka@skbuf>
 <YtGcdGj6yi546oWk@euler>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YtGcdGj6yi546oWk@euler>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 15 Jul 2022, Colin Foster wrote:

> On Tue, Jul 12, 2022 at 10:08:57PM +0000, Vladimir Oltean wrote:
> > On Mon, Jul 11, 2022 at 07:10:48PM -0700, Colin Foster wrote:
> > > On Mon, Jul 11, 2022 at 11:21:16AM -0700, Jakub Kicinski wrote:
> > > > On Mon, 11 Jul 2022 08:51:35 +0100 Lee Jones wrote:
> > > > > > Can this go into net-next if there are no more complains over the
> > > > > > weekend? Anyone still planning to review?  
> > > > > 
> > > > > As the subsystem with the fewest changes, I'm not sure why it would.
> > > > 
> > > > Yeah, just going by the tag in the subject. I have no preference,
> > > > looks like it applies cleanly to Linus'.
> > > > 
> > > > > I'd planed to route this in via MFD and send out a pull-request for
> > > > > other sub-system maintainers to pull from.
> > > > > 
> > > > > If you would like to co-ordinate it instead, you'd be welcome to.
> > > > > However, I (and probably Linus) would need a succinct immutable branch
> > > > > to pull from.
> > > > 
> > > > Oh, that'd be perfect, sorry, I didn't realize there was already a plan.
> > > > If you're willing to carry on as intended, please do.
> > > > 
> > > > Colin if there is another version please make a note of the above
> > > > merging plan in the cover letter and drop the net-next tag. 
> > > > Just in  case my goldfish brain forgets.
> > > 
> > > I wasn't sure of the plan, but this makes sense to bring it through MFD.
> > > Fortunately there's enough work for me on the DSA front that there's no
> > > way that'll land before this merge window - so I have no objection to it
> > > going any non-net-next path.
> > > 
> > > I'll look to Lee as to whether there should be a v14 with the header
> > > guard addition per Vladimir's review, or whether that should be in a
> > > future patch set. I'm happy to go either way.
> > 
> > From my side, the changes to this patch set can be incremental, I'd be
> > happy if Lee would take them as is.
> 
> Just making sure this hasn't slipped through the cracks. Should I resend
> this next week (Monday / Tuesday?) with the Reviewed-by tags and switch
> it to MFD instead of net-next?

Not yet please.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
