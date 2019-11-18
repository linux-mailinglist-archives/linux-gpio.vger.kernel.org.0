Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C45310072E
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 15:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfKROR7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 09:17:59 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39401 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbfKROR7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 09:17:59 -0500
Received: by mail-pg1-f195.google.com with SMTP id 29so9710384pgm.6
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2019 06:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=kDor6SIANi4KjzzeArLUD78xMXODnjUPjp1qNdcs94Y=;
        b=e7uJaUgPQRWIpgizRWIrXEcs/H2yDSdYYhk4GWtx6yquzXTsslYjzYm9XYj8NMdiar
         ZXLImD3AqCjCF0BPMacXs5mdyG1guxgoxyEXkO4yRrp1k6buYBBbStIMrdAIrkXBWDce
         AP6ZHiJqeX2syvpd4oaNRHBt/510n++G4NjoHFkEKAPitStoIvqKUGMguU0qQpqTeaCG
         /eIT/Rb7V5HpB4qIJMImTcCmRFN4E06oGZqxlM1+6tTpDCLx9eax+Mwxe5pGYO3CroXh
         vEWHVfXt2CKISq9tSams5fwWFLsLMznBROz2/RBMOCFfkL7xeoW//yQXdnav6F2gVKIj
         5WKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=kDor6SIANi4KjzzeArLUD78xMXODnjUPjp1qNdcs94Y=;
        b=g/4IN1vm9DzNJsLtmNcNKvRFxakd5hMiJVivJ8bB/Cxvs2362vMVQZrsKqheBRtmlw
         oTZywvmByZr/h3GLWIQc0j0/7hK4SkqlcRZZp4Q39DOk5xYZKRP5iOgzmQcHkqL9zCLP
         iu1idihCiV9UTXJ0NSypfLRaRRLMMGahPgNUan7Dpzn/K9KsewOGV7PZyKoM7clhPNuS
         0tC+vvFAOIdC66DNgWg6SmhuCZkHJw+Na+17uWLNaYjTggrBlj6eoUiihzQRi9uvCIrF
         0/nTqzRjaxBRTY5qtaeMvRC0c8+diUZKPJT9lfrvKzl1BU0DenBGr3/tej/qUnIDY0bM
         1Clw==
X-Gm-Message-State: APjAAAWSXCemXLgUpRCl1BElX+TSu05HJL14vXW10lwri8UyeLl5EPTq
        yzBHHA0PtOWv6cZGWnkmuI4=
X-Google-Smtp-Source: APXvYqwq9/oS/y2coLHm8iJtr1U1/CQxqXm7mfoT1GAzdpBdHNx92AVhH0C3AKAbapmMimZ28dLdxw==
X-Received: by 2002:a63:5d26:: with SMTP id r38mr33945160pgb.48.1574086678381;
        Mon, 18 Nov 2019 06:17:58 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id m67sm19817976pje.32.2019.11.18.06.17.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:17:57 -0800 (PST)
Date:   Mon, 18 Nov 2019 22:17:53 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] [PATCH 06/19] bindings: cxx: initialise bitset with
 integer instead of string
Message-ID: <20191118141753.GD27359@sol>
References: <20191115144355.975-1-warthog618@gmail.com>
 <20191115144355.975-7-warthog618@gmail.com>
 <CAMpxmJUeWMt1AWn7H1BOegW+Tc2MJB7YPS1TpouSFg+qAwRDsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJUeWMt1AWn7H1BOegW+Tc2MJB7YPS1TpouSFg+qAwRDsA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 18, 2019 at 02:51:42PM +0100, Bartosz Golaszewski wrote:
> pt., 15 lis 2019 o 15:44 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > Initialising bitsets with string is inefficient and confusing.
> > Initialise them with the corresponding int instead.
> >
> 
> I'm not a native English speaker, of course, so correcting you on
> spelling may be risky but I generally try to stick to American
> spelling so "initialise" looks somehow wrong to me. :) Anyway, this is
> just the commit message, so never mind that.
> 

And I speak English, not American, so I didn't even notice.
I will try to keep that in mind though.

Kent.

