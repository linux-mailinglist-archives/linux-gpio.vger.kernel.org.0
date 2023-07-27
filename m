Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8787D765FD3
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jul 2023 00:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233044AbjG0Wiq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jul 2023 18:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbjG0Wio (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 18:38:44 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A394D30DA
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 15:38:18 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bbc7b2133fso9656585ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 15:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690497408; x=1691102208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w68MN6OHowr/E1geASqGx1rcC4ihNrOXW1FP097O22w=;
        b=C/a7dZwQ4WU0B+Aw3fM3Jx9bi/5/VAll+WWFMEIiIOTRhvvmzlY923K+e0ainDC1T5
         la05by2hhavmj93YdZ5z/2VC2bWpVYndWQZr89FetUHVrreuVg/Yzp/S6stA13OqEEY1
         vUyB93JTfVxM2KqqiBgOySAMHP5+Wr40GJ7Ria+IxGnpnaVU7cV5dCQW5tyt1GFK7UgR
         /+itw/dj0PZZnOoL2gRbDbpHHKfjf+M+LNI7G5E56/HVJ8Uu0zlJ7NhZdA+v+QlEgLRT
         Gd5llQb5n+cFsedkKzC/nwuBDQef5+6dML6/z6R0vmjyq/5erPEZBkqS65k7KRPCoeGj
         H2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690497408; x=1691102208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w68MN6OHowr/E1geASqGx1rcC4ihNrOXW1FP097O22w=;
        b=TfB+pLMCl1QI7TIA5876pRSZB+AcspEOV8858A8rL/8WWhgzPA1O0jRtQBV4JAHpPK
         +A+tqBiYDHl086Utyk1vOP3nMRSdk8NnJjkd24ZgG60xK6Ywkzjdh6975FTqnmrjBfOK
         W70w469J+S8Sm5fFrRtNxDi4NZyIopcsTP5IKfH1NN4mzy9ovFAX725vGdHSwx33+4n8
         NPIhtjGPNAD1vjdRp5NNrMgUzqW6UM2wouukvCsGMwOko0SLOZ47vUMpJmrkDhT1YtUy
         qTe0Er8Oq2UQrc20jzjM2RyRL0JvwyYoIc5UQZW6TOVBpH0kuHBArGBK9HY1QrsO2apT
         bA7A==
X-Gm-Message-State: ABy/qLYI1ausY7pKrVIJA6BxXW30WXEqj3vi4lS2YbgyQ0cQKCJqEOCb
        Inb+I/Lnxq1HW1e/aoc5tdZ7DentmPA=
X-Google-Smtp-Source: APBJJlHYCs+oCaqNZW3sADZujW5nOzJncjj0wghmozBNaOq0crnbeI4pPmGN5Sf9gJNfUztuvcQTew==
X-Received: by 2002:a17:902:7fce:b0:1bb:a056:2c5f with SMTP id t14-20020a1709027fce00b001bba0562c5fmr598829plb.7.1690497408501;
        Thu, 27 Jul 2023 15:36:48 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id a21-20020a170902ee9500b001b9de8fbd78sm2129659pld.212.2023.07.27.15.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 15:36:47 -0700 (PDT)
Date:   Fri, 28 Jul 2023 06:36:43 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     andy pugh <bodgesoc@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
Message-ID: <ZMLxewtSF8lurh/m@sol>
References: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
 <ZMLZSqRwrPfKEbX3@sol>
 <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
 <ZMLnz25brQvcwBVW@sol>
 <CAN1+YZVv6gkZT6yHH8fedSAbMCg0EXPWVbbEJPGNmVp9Uhgkdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN1+YZVv6gkZT6yHH8fedSAbMCg0EXPWVbbEJPGNmVp9Uhgkdg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 27, 2023 at 11:10:36PM +0100, andy pugh wrote:
> On Thu, 27 Jul 2023 at 22:55, Kent Gibson <warthog618@gmail.com> wrote:
> 
> > On a Pi is it significantly faster to go direct to hardware using
> > /dev/gpiomem, rather than going via the kernel as libgpiod does.
> > I do my best to avoid using gpiomem these days, but if you really need to
> > minimize CPU cycles or latency then that is another option.
> 
> The existing driver uses gpiomem, but the interface used seems to not
> be set up in Debian Bookworm.
> It might be available in _Raspbian_ but that current Raspbian version
> is based on Bullseye (or Buster)
> 

gpiomem is a Pi specific extension, and is not part of the mainline
kernel. Not sure what kernel your Debian Bookworm is providing, but if it
lacks the Pi extensions then you wont get gpiomem.

> https://github.com/LinuxCNC/linuxcnc/issues/2371
> 
> Is where the suggestion was made to try gpiod, initially because of a
> problem with the way we were detecting Pi versions, but then because
> gpiomem wasn't there.
> 

Yeah, the Pi4 requires a change to the driver as they changed the GPIO
register map, IIRC.

> (It can probably be configured, but we have a user base largely made
> of machinists, not Linux enthusiasts)
> 

The only way to disable gpiomem that I am aware of is to build the kernel
without it, so either a mainline kernel, or a Pi kernel without
BCM2835_DEVGPIOMEM set.
Even if there is some way to disable it in config, it seems unlikely
to me that they would compile it in, but then configure it out.

Cheers,
Kent.

