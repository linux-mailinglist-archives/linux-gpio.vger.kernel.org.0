Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F0D2885DF
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Oct 2020 11:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731374AbgJIJUB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Oct 2020 05:20:01 -0400
Received: from 241-168-195-217.cust.centrio.cz ([217.195.168.241]:49150 "EHLO
        patejl.cela.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731262AbgJIJUB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Oct 2020 05:20:01 -0400
Received: from localhost (mem-185.47.222.164.jmnet.cz [185.47.222.164])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by patejl.cela.cz (Postfix) with ESMTPSA id E9376A490;
        Fri,  9 Oct 2020 11:19:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=upir.cz; s=mail;
        t=1602235198; bh=UNdGdeqYzeADJGlHvh7iFRqUgqp6qdhK+Uqiv4YTau8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=o0SY6iHEsK8QJ987wn5oaOlCmOOXTR1AAek6zfpmh2MzbJAnoymVuosfJBq6lqFkN
         8kNnMRbmto7vlPg7P3MrivvXRIsii0/u1qicPZfRB9LRruYHnq9FUJTw6xYOO3O4X1
         N9FT0nY6hLYkCsS9gnLAZ3oJmERE8Vndp9dloAH8=
Date:   Fri, 9 Oct 2020 11:19:57 +0200
From:   Jiri Benc <jbenc@upir.cz>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH libgpiod] bindings: python: fix Line.request() crashing
Message-ID: <20201009111957.7f6cff10@upir.cz>
In-Reply-To: <CAMRc=McNs+cPmqkcGCAJgfQ_Ozy4Dc4b9GUDc2wthmj2WYaRwg@mail.gmail.com>
References: <38eff7ebd01efd34df3037ba485d61ff7291fb5e.1602004585.git.jbenc@upir.cz>
        <CAMRc=McNs+cPmqkcGCAJgfQ_Ozy4Dc4b9GUDc2wthmj2WYaRwg@mail.gmail.com>
X-Mailer: Claws Mail 3.15.0git164 (GTK+ 2.24.31; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on patejl.cela.cz
X-Virus-Scanned: clamav-milter 0.102.2 at patejl
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 9 Oct 2020 09:40:29 +0200, Bartosz Golaszewski wrote:
> Thanks for the fixes. Could you send me a chunk of code that triggers
> this error so I can make a test-case for it?

It was as simple as this:

import gpiod
c = gpiod.Chip('0')
l = c.get_line(17)
l.request('my')

Latest stable Raspbian (Debian 10.6), Python 3.7.3. It's so basic that
it's puzzling me that nobody has hit it before me. But my patch is
right, see https://docs.python.org/3/c-api/structures.html:

------
METH_VARARGS | METH_KEYWORDS

Methods with these flags must be of type PyCFunctionWithKeywords. The
function expects three parameters: self, args, kwargs where kwargs is a
dictionary of all the keyword arguments or possibly NULL if there are
no keyword arguments.
------

Yet, commit 02a3d0a2ab5e that attempted to fix this states that the
kwds dictionary was an empty dict. Maybe a change in Python C API in
3.7? The Python 3.6 and earlier documentation did not mention the NULL.
I can't find anything in Python release notes, though.

 Jiri
