Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E34B5EF1B0
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Nov 2019 01:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729934AbfKEAMT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 19:12:19 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41361 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729863AbfKEAMT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 19:12:19 -0500
Received: by mail-pl1-f195.google.com with SMTP id d29so2123098plj.8
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 16:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rACpq2W15sHjD8PUevaIE6hemq4DlQ32/6cqcI6Zg5c=;
        b=uQVNxdcc8RwLTA8R25P/PwF3Fcrtvw0gj1Vl/8JkT5P3uxbrqGaPF4mRDAo1kR02xg
         0pYxxjFOaWb4KQZXBfAkrnYUP/cB4QKouJuK0ePu6cPIsFZr5T1uJfi3msHj/H6zTHFZ
         xpVeG4cjOpCojI/H0sH2rdiN8aRwIsII4lNYwMzgDIcpqTaW40OgRxpjUpH8bBq6KvNi
         n1WO02mGEPATvcWwe8tROuQS51XKFEf0CLaNoDP5ZWotbnVc3bilE9lp4ZUr3AfGX0F4
         fEl1bG4eE3pyyxRV83LIb+MtXLx5Dk32ttoxShiP/ky8UCXwki/NWOa+Pbaw7MARGIVj
         c74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rACpq2W15sHjD8PUevaIE6hemq4DlQ32/6cqcI6Zg5c=;
        b=cLIvddUKG3B7O6ZYY2ACignAyGsAby+7CZhb/zfaJhYLpo+q5FgWYVLp2aPlo+iXmn
         uzgbpNhVHY2SXjwp80dZScB8Sl696NauKYoX8VtTjeF+W3nmfnlA71KGoMOPZlc3FkjK
         ce3TkKLqFcNMK9oRCEnWAJ3RHRQSGBF4FX9Z9EC+ms8YcBAm7DLYJfYkHtpPJPnuDnfT
         V8D7WVnK7Rjnp2dYkUd4Cu3diaq3G3IjeKVYgFlgNGt3j6PuOkh/aauZ4Gwv735+G9IV
         42zvjHXIWFlPpjaW1RR0xwvUlqwto5j4HAjzg4N/oVoC89Vic2Y/+hforeXpWedwfwDV
         pAHw==
X-Gm-Message-State: APjAAAX+z3U3RFCN+/kwR8mduV/t08odeEH1WYHzX4WCPhqpGkjcVIxD
        ewUazbj+7v/08SJ0970J46BeoNtU/cw=
X-Google-Smtp-Source: APXvYqyldbqZVvGYwxPn/I32e6CmiQkvFG/naLmGyI9Q+pGJPlOXqrYJmAle8UX03qIx1s9y5zSvNg==
X-Received: by 2002:a17:902:9689:: with SMTP id n9mr30580118plp.222.1572912738337;
        Mon, 04 Nov 2019 16:12:18 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y36sm15390766pgk.66.2019.11.04.16.12.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2019 16:12:17 -0800 (PST)
Date:   Tue, 5 Nov 2019 08:12:13 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Drew Fustini <drew@pdp7.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 0/7] gpio: expose line bias flags to userspace
Message-ID: <20191105001213.GA3685@sol>
References: <20191104153841.16911-1-warthog618@gmail.com>
 <20191104195838.GA9833@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104195838.GA9833@x1>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 04, 2019 at 11:58:38AM -0800, Drew Fustini wrote:
> On Mon, Nov 04, 2019 at 11:38:34PM +0800, Kent Gibson wrote:
> > on a Raspberry Pi, in both cases using the feature/pud_set_config 
> > branch of my Go gpiod library[2], as well as with my feature/pud 
> > development branch of libgpiod[3].  Patch 7 has only been tested using 
> > my gpiod library as libgpiod has not yet been updated to support the 
> > SET_CONFIG ioctl.
> > 
> > Patch 1 adds pull-up/pull-down support to line handle requests.
> > Patch 2 adds pull-up/pull-down support to line event requests.
> > Patch 3 adds support for disabling bias.
> > Patch 4 adds support for setting bias on output lines.
> > Patch 5 adds pull-up/down support to the gpio-mockup for uAPI testing.
> > Patch 6 refactors the flag validation from linehandle_create.
> > Patch 7 adds the SET_CONFIG ioctl.
> 
> Hi Kent, thanks for continuing pushing this patch series forward.
> 
> I've not used gpiomockup before and I was hoping you might be able to share
> the commands you use to run it to test the patches.
> 

I refer you to the libgpiod tests, particularly
libgpiod/tests/mockup/gpio-mockup.c as well as gpio/gpio-mockup.c
itself.

If you run the libgpiod tests they will load and manipulate the module
themselves.  My gpiod tests do similarly.  I run them in a VM to ensure
they can't interfere with real hardware by accident.

Here is a quick guide to using the mockup manually.

Load the module with two chips with 4 and 8 lines respectively:  

 modprobe gpio-mockup gpio_mockup_named_lines gpio_mockup_ranges=-1,4,-1,8

$ gpiodetect
gpiochip0 [gpio-mockup-A] (4 lines)
gpiochip1 [gpio-mockup-B] (8 lines)

You add a -1,N pair for each chip you want mocked.
The -1s is there for historical reasons.

The gpio_mockup_named_lines is optional and creates labels for the lines 
based on chip and line number (the labels are quoted here):

$ gpioinfo
gpiochip0 - 4 lines:
	line   0: "gpio-mockup-A-0" unused input active-high
	line   1: "gpio-mockup-A-1" unused input active-high
	line   2: "gpio-mockup-A-2" unused input active-high
	line   3: "gpio-mockup-A-3" unused input active-high
gpiochip1 - 8 lines:
	line   0: "gpio-mockup-B-0" unused input active-high
	line   1: "gpio-mockup-B-1" unused input active-high
	line   2: "gpio-mockup-B-2" unused input active-high
	line   3: "gpio-mockup-B-3" unused input active-high
	line   4: "gpio-mockup-B-4" unused input active-high
	line   5: "gpio-mockup-B-5" unused input active-high
	line   6: "gpio-mockup-B-6" unused input active-high
	line   7: "gpio-mockup-B-7" unused input active-high

You manipulate the lines using debugfs as per these examples.

Pull line 1 of chip 0 high:

 echo 1 > /sys/kernel/debug/gpio-mockup/gpiochip0/1

Pull line 2 of chip 1 low:

 echo 0 > /sys/kernel/debug/gpio-mockup/gpiochip1/2

Check the value of a line, which can be set from the kernel side
for gpio output lines:

 cat /sys/kernel/debug/gpio-mockup/gpiochip0/1

Cheers,
Kent.

