Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C862F323241
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Feb 2021 21:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233959AbhBWUno (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Feb 2021 15:43:44 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:52647 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233266AbhBWUno (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Feb 2021 15:43:44 -0500
Received: from [192.168.1.155] ([77.9.11.4]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MElhb-1l3uBY17fv-00GL8U; Tue, 23 Feb 2021 21:41:03 +0100
Subject: Re: [RFC PATCH 11/12] platform/x86: skeleton for oftree based board
 device initialization
To:     Frank Rowand <frowand.list@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>
References: <20210208222203.22335-1-info@metux.net>
 <20210208222203.22335-12-info@metux.net>
 <CACRpkdYbOX_RDqwxaiugtYB4vSpSKChvKsPjcB_vv3Q74QeG2Q@mail.gmail.com>
 <c5ed2b27-21a2-5a07-8dd9-e080f9a6cd98@metux.net>
 <f370fa7b-a5b1-4151-7018-10d1b75fa8b2@gmail.com>
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <98005671-f0f4-02df-dbbf-b449c75a5da3@metux.net>
Date:   Tue, 23 Feb 2021 21:41:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f370fa7b-a5b1-4151-7018-10d1b75fa8b2@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5A+N3SNfNui62ql8UhrDO5JCDlCas9O9Wnu0EIukQgAj7FxnmqM
 OOL6oxZJXhKJnUpD8VL6M3M55mQOYFfqIeEWdEJmcHNhbqzzeafaFidI3elE7DfUiPazUoc
 5by0M/oV9xQhX9YvzuYXWhf6kMl/MZjGAo0vjFr1hIYzkw7PIMGcZJutRoDJT0idSuq+Nyx
 GMtCEu3oDDP3Fjda+U5Ww==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WrK0loCgv7U=:QB2ocuY85TNPL4+q1guy8p
 ygwSWcnZ0VsVWY+FyyQJ2OTFaS7OQOuywCtsvpzuWK8tDJFYjD35H/92Lon3CG6pD12wLricm
 tXEFrboO9m+R20Adg6HsCNCZS9X2wCu69EL/CQN5rr0LoVTTB4xGoJxIV9kFdieUGc7Dh/72D
 UqEiCaSfU8Zwf5G2Ovl2874UvIQlOvL0gDZBdwjp42f+l9FjmEZqdYKLmkfP7mP07bwBUkbOu
 VRt88X2dgTSY14Bbyjl0tsa0tEZyQOb9No9kU+JjvxXoehdiVptXiuEWqdpiNLGDt+6DjitOR
 iuQTz6DC8YFMPIpoeCdcSTDQ2eDcaClVDld/RWZLfQ8TdrguL2PBo8WwXMvRvdz01PBLw0Pg9
 v5cFWcyQoWnGgAMlQwWnEkn9MNCMkr5F9+ZFSh3EWghzgpYVJsGHJQEFsLFzO
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15.02.21 02:18, Frank Rowand wrote:

> The RCAR use of overlays that are built into the driver are a known
> pattern that is explicitly not to be repeated. 

Well, that driver indeed looks quite complex - if belive unnecessarily.
But can't judge on these devices, don't have one of them.

In my case, I believe it's a simple and straightforward approach,
instead of writing a whole driver, that just consists of a bunch
of tables and some trivial setup calls. DT seems to be a perfect
choice for that, since it's a very short and precise language for
describing hw layout, w/o any piece of imperative code.

The only point where I'm still not satisfied with: module auto-loading
requires the match data in the kernel module. But i'd like to have
everything in one source file and not having to write individual
modules for invididual boards anymore. Finally, there should be one
dts per board and really minimal effort adding another dts.
(hmm, maybe I should try generating glue code from dt ?)

BTW: I've already rewritten much of it, using overlay instead of an
completely own detached tree (so, some of the prev patches will fall
off the queue).


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
