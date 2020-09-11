Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5693265684
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 03:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725280AbgIKBR4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Sep 2020 21:17:56 -0400
Received: from pi.codeconstruct.com.au ([103.231.89.101]:41892 "EHLO
        codeconstruct.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgIKBRz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Sep 2020 21:17:55 -0400
Received: from pecola.lan (180-150-121-66.b49679.p1.nbn.aussiebb.net [180.150.121.66])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6CAA43FEF4;
        Thu, 10 Sep 2020 21:12:11 -0400 (EDT)
Message-ID: <5d953d84c8b84d182068329db124517f8c5603b8.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] gpio/aspeed-sgpio: don't enable all interrupts by
 default
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     Joel Stanley <joel@jms.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>
Date:   Fri, 11 Sep 2020 09:12:11 +0800
In-Reply-To: <CACPK8XdOTorJcNSON--LZU8XkWLh5kwXc8fkGWOBmXVnFiCnSQ@mail.gmail.com>
References: <20200715135418.3194860-1-jk@codeconstruct.com.au>
         <20200715135418.3194860-2-jk@codeconstruct.com.au>
         <CACPK8XdOTorJcNSON--LZU8XkWLh5kwXc8fkGWOBmXVnFiCnSQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Joel,

> And also removing the enabling of IRQs. This part makes sense, as
> it's what the commit message says.
> 
> If you think a sensible default should be single edge (and I would
> agree with that change), perhaps update the comment to say "set
> single edge trigger mode" and mention it in your commit message.

OK, shall do. That was my intention with the "reasonable defaults"
reference, but being explicit about that better here.

I'll send a v2 with an updated commit message.

Cheers,


Jeremy


