Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 128F3383D83
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 21:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234491AbhEQTeG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 15:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234330AbhEQTeE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 15:34:04 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02403C061761
        for <linux-gpio@vger.kernel.org>; Mon, 17 May 2021 12:32:46 -0700 (PDT)
Received: from [IPv6:2a02:a03f:eafb:ee01:404a:340a:91cb:c07b] (unknown [IPv6:2a02:a03f:eafb:ee01:404a:340a:91cb:c07b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 18E871FFC02;
        Mon, 17 May 2021 21:32:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621279965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=st+Q1TTctqUoxIlgrLDaGZoZTbZ7PzpMgveVrps9ljc=;
        b=nLP6b6oGufhmxBpGQxRsjukWfzXBhxL8zwdqca7Alswn8ITr6vh2fMJbf5uYtl+eatpuPy
        tn9uCRc370VoZ7vNIXdMyQUEC1IH+yTKH4ZbjENtqfsSIB74OloYuWv9OsB2x/6Qa+lEJN
        r7KpKwQkOLx9WvFzSSEbnjpdumOrk67leuwPqD/47RAevUz2ZL9GVfeuLRXmJHw/ie5uyZ
        p+spOXZrCil4HbsEAvnBkGEgFjNZtvyhL4pExnzYbKR2yeyS+wFCk7Ol/2FqVK11doZw5F
        CxQHhAdiScYX5CAXYT0o21saTdp5xTPZeQ/FQQpyipNPZThJ8lWk/rdHzTG6dQ==
Message-ID: <dd1b390e9fe2824bf5df386b6ecc9b381fe18484.camel@svanheule.net>
Subject: Re: [PATCH 0/5] RTL8231 GPIO expander support
From:   Sander Vanheule <sander@svanheule.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Date:   Mon, 17 May 2021 21:32:43 +0200
In-Reply-To: <b7d39a26bc3a90de4d8e4fdbf8f944de43d12a56.camel@svanheule.net>
References: <cover.1620735871.git.sander@svanheule.net>
         <CAHp75VffoKyyPJbdtKMLx575c9LT0S8+EHOk7Mw36j=aTL6Q4Q@mail.gmail.com>
         <b7d39a26bc3a90de4d8e4fdbf8f944de43d12a56.camel@svanheule.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 2021-05-16 at 23:40 +0200, Sander Vanheule wrote:
> > 2. Please, switch to fwnode API in LED driver
> 
> Since you had the same comment on my previous patch set, I had already tried to
> this this into account as much as possible.
> 
> There's a few things I couldn't find the fwnode-equivalent for:
>  * I use of_node_name_prefix to enforce the naming required by the binding. I
>    could just walk over all (available) child nodes, which would be mostly
>    equivalent.
>  * To get the address of an LED child node, I use of_get_address, since this
>    appeared to provide what I want to do: get the address of the node. I know
>    next to nothing about ACPI. Does the equivalent exist there? Or am I taking
>    the wrong approach?

Hi Andy,

I found this:
https://www.kernel.org/doc/html/latest/firmware-guide/acpi/dsd/leds.html

So instead of of_address, I now just read the "reg" property. The v2 I just sent
should be fwnode-only.

Best,
Sander


