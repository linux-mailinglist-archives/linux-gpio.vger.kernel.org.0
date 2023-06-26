Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 607BC73D91C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jun 2023 10:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjFZIGd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jun 2023 04:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbjFZIGb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jun 2023 04:06:31 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD28083
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 01:06:30 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b7f223994fso13066405ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 01:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687766790; x=1690358790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LYB2yAqrDUCRTLQHGBrxspKg8O60aDIesPBA4b6xyGI=;
        b=WgIcW+LyKPYk6njNdvLYa6/xn0ZyAp/ZMQfY0CZDKk6wsnpmyWLGh5x32RBAy5IzSD
         JXNxGeWdlnmGMX+K6SWSQ5uH611g03iJa7+kHdiwYLX2RoHlkDpkXvN81n+oBNKPPtXv
         lfI6tcw0s0EDxjBAal62WCEUNODd/52L7cUlly3XFZ/Cfn27oAm1rM3HjCrWKYuXmhR+
         1Tggqul4xyd8VOXOv/1U0QiSA2WBs5sKKfQkvfQOn6OSwAzH5up8XndLonhNp0ixqZpP
         TLc4ajMN6GA3OfK6oZLGlE/SYmGtoi3C+XCCGbW7welT430I3hETeVuhucLViI0z9o6S
         8aEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687766790; x=1690358790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYB2yAqrDUCRTLQHGBrxspKg8O60aDIesPBA4b6xyGI=;
        b=AfUwThweDR3h9fWcWB+Jag2YTtKFz2EWSBEdVzlI0Sf3EnzuMAAbBBYvI8t7395MnH
         5w+4y8cdQnIwp3GJKnaYKcMivjAN0LgA/h7gXO1nR7IwDL7gaBmmihIwiQYG2RrIy81l
         4RReORHwhvCqvMrxS86kMgblqAFMNvG/xV6BxVtMuUI+xBjVNXj0ToTa7mUW05iWxf9E
         Bw0j5LlvxBfA44DVYR20pF+uw1OVhe8V4SKKNZrWEKgjIG1fkpRDRHDkJEYl6haWLAtr
         UeX9mypn/E/1UaRiB3gup/+Zo/v7IrG53ZAsi0Na7oUl+Cc644JHW113sGlSim4Ce7DR
         dpqw==
X-Gm-Message-State: AC+VfDwLCFHYkzyVuf7N1jnKqG84d9WY/T+XnR/BLYvbIAvq5pYaN+vC
        zUrbHza9ZMfgUDZt0D17Uc81e5eskzA=
X-Google-Smtp-Source: ACHHUZ44meafVs8rZleCwFcQD/38q85JfZK75ZECcaoWg3x3esb5NypBKsph0mDQR9yrGX+yFXmhVg==
X-Received: by 2002:a17:903:2793:b0:1b3:f8db:6f0c with SMTP id jw19-20020a170903279300b001b3f8db6f0cmr6177903plb.58.1687766790049;
        Mon, 26 Jun 2023 01:06:30 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id i10-20020a17090332ca00b001b8053b8e0esm1113804plr.136.2023.06.26.01.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 01:06:29 -0700 (PDT)
Date:   Mon, 26 Jun 2023 16:06:25 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     "Tay Ivan (AquaEasy)" <Ivan.Tay@sg.bosch.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: Accessing Intel J4125 GPIO Pins
Message-ID: <ZJlHATTAIek9UsSD@sol>
References: <DU0PR10MB608373C134CD9CE8C7290DF8A826A@DU0PR10MB6083.EURPRD10.PROD.OUTLOOK.COM>
 <DU0PR10MB6083CF3B3E4B6495BA540BE0A826A@DU0PR10MB6083.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU0PR10MB6083CF3B3E4B6495BA540BE0A826A@DU0PR10MB6083.EURPRD10.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 26, 2023 at 05:09:50AM +0000, Tay Ivan (AquaEasy) wrote:
> Hi,
> 
> Does anyone knows how to access and write to the Intel J4125 board GPIO?
> I have tried using the raspberrypi GPIO tools and it cannot detect the
> hardware pins.

You mean the raspberrypi GPIO tools that use /dev/gpiomem to access the
pi hardware directly??  I would be horrified if it did.

> I have tired to load the gpio-it87 module and the gpiochip0 shows up
> (using gpiodetect) but I am unable to change the pin values, meaning
> using gpioset (gpioset 0 0=0 or gpioset 0 0=1) writing a 1 or 0 changes
> nothing because the read (gpioget 0 0) always return 1.

Note that by default gpioget changes the line direction to an input and
then reads it, so that whatever you set using gpioset will be lost.
You need to physically check the pin, or use the libgpiod v2 version of
gpioget that supports the --as-is option to read the line without changing
its direction.

And even then, and depending on the device driver, when gpioset exits the
line may be set back to its default value.  So you need to keep gpioset
running (the libgpiod v1 gpioset exits by default, whereas the v2 gpioset
will not).
You are almost certainly using v1 gpioset, so try `gpioset -m wait 0 0=1`
and then check the pin.

Alternatively, externally pull a line and use gpioget to check the value
read with gpioget is correct.  Just be sure you have the correct pin.

TL;DR As gpiochip0 is recognised by gpiodetect, there is a very good
chance it IS working, but the other tools have convinced you otherwise.

Cheers,
Kent.
