Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33A9C2A7EB3
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 13:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730663AbgKEMgB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 07:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730461AbgKEMf5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 07:35:57 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA837C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 04:35:57 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id h6so1370446pgk.4
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 04:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wTv2OckDrY3gW3pSxbPElV039E04c/aqy25dFFPwQ8s=;
        b=vWnWFZoQ+DXyCQP2SG+hjISZBVj3/Mn3lMsQ4Eu0XUa/tf3Jrwb8WjcU2CJrv3mh1J
         469fawoAi/WNVEOdnD7Ty9Qmrl1Wpfd/w+CeidGswc1wXXZCuWu1JaIygZZLsdZ23dPI
         CcG/AW9MSnTKBBxM3NZpZs0t+NTTUAbhuxpsbukYMphEUdOnJtt5b0u0sr8zuknLsWVz
         2sOjRcgEK1qfr7oEmwxnPhk2m79t0+DFlLjdx83zUhEvUxKmMGSeKB2L1f2CtLUV5CKe
         56ThHTL3V8CGNsIzXu68pP+KWWonOE2IB8nBV3+IolCBU9snXB+E5OhzM9Ga/x0Z06Ls
         BEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wTv2OckDrY3gW3pSxbPElV039E04c/aqy25dFFPwQ8s=;
        b=udbVIx5sgUNS40buiBmfCW8dLV+wm8q5BfwlaBvpzEw2xFwCuM7owJYw6wF/oGXR0m
         bNmoV7qQKJBnOBTifvUz9QDk72WTRxCTMEBJvcgRv5mKtDK4Es3Lfy25t0ZC+0/6oK4M
         SecT7f1oopINZwH/I3PujBSeWA7pjMTGl/qfkrcVVUCWPQ53Zk4IRuPxCswROuas7nAI
         fwGOmWbLZjPEVKErmpmNZuMMDaMunYViUkSRnHqz6vsicB1AS4FrO5+egxUErJ4u+etj
         dyF6ewoL+XbD0PrUS8UxBvqhD0aMFDHFHBQ8mzDspJmJbPQjJQhh7QfhwhOnclBjxQVW
         lSHQ==
X-Gm-Message-State: AOAM533e6VCJa8Hh7+qajY6CxGslrMkiJ9eVuT0nsrODeBJ4aZswF1pp
        G/TNFbAy6Sm0rLwYlE5hNzM=
X-Google-Smtp-Source: ABdhPJyj2+PRtZW3qCUCTADYYWi6eaoW6Oe0Ne6LA0TOQkbbP7okIYba3a8Ch30wsqll9gtFh8/SaA==
X-Received: by 2002:a62:38c1:0:b029:18a:d50f:255f with SMTP id f184-20020a6238c10000b029018ad50f255fmr2300511pfa.22.1604579757316;
        Thu, 05 Nov 2020 04:35:57 -0800 (PST)
Received: from sol (106-69-171-141.dyn.iinet.net.au. [106.69.171.141])
        by smtp.gmail.com with ESMTPSA id g1sm2135938pjt.40.2020.11.05.04.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 04:35:56 -0800 (PST)
Date:   Thu, 5 Nov 2020 20:35:51 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Nicolas Schichan <nschichan@freebox.fr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: gpiolib sysfs access when CONFIG_GPIO_CDEV is not set
Message-ID: <20201105123551.GA99137@sol>
References: <CAHNNwZAucoc00gJrUsPRMpFc9U2r+os6NJfc1axsGh0m6ES=xQ@mail.gmail.com>
 <20201105083945.GA23079@sol>
 <CAHNNwZBWtZKfsEb6P4LD4gx9LhuM4WcT5n6H6jvr903Qzr2vxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHNNwZBWtZKfsEb6P4LD4gx9LhuM4WcT5n6H6jvr903Qzr2vxA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 05, 2020 at 01:07:43PM +0100, Nicolas Schichan wrote:
> On Thu, Nov 5, 2020 at 9:39 AM Kent Gibson <warthog618@gmail.com> wrote:
> [...]
> > Hi Nicolas,
> >
> > Thanks for the report and investigation.
> >
> > Just checking - the CONFIG_GPIO_CDEV defaults to enabled, so you had
> > explicitly disabled it?
> 
> Hello Kent,
> 
> Yes, we have no users of the character device gpio interface on our
> platform, so I have disabled it explicitly when updating the defconfig
> to the 5.10-rc1 kernel.
> 

Thanks for confirming that - I was concerned that it had somehow been
disabled unintentionally - which would be a bug in itself.

Cheers,
Kent.
