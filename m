Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC41619CAD8
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 22:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388755AbgDBUQJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 16:16:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:34642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730837AbgDBUQI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 2 Apr 2020 16:16:08 -0400
Received: from localhost (mobile-166-170-223-166.mycingular.net [166.170.223.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CFB8420678;
        Thu,  2 Apr 2020 20:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585858568;
        bh=vRDaO7ScVc229V31QF7SuQbcUJkQRXGo5xDwf7t6Rgo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=y/f3RgNVI6crhzIS7qSj1VQ++zuo/g/C8ZdK9hF7pR0IU0jJtMEtdm+iKaoFo8TVI
         hxkeqpP35YRS7gjYGEzUSvUKAeP5jnWTnmjigNd5LXNnrNlypIcYcM0Qxl5VBL4XG8
         cmnEakssPXoj0UZVVybmIhuSyxDWzj7fOPDDxCPc=
Date:   Thu, 2 Apr 2020 15:16:05 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>, bjorn@helgaas.com,
        andy@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] gpio: ml: ioh: Convert to
 dev_pm_ops
Message-ID: <20200402201605.GA74927@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcYSaAYx5qy7S0ppb77afgz=Ma=7=opfgSMCBnnjmoWfw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 02, 2020 at 09:33:46PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 2, 2020 at 6:52 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> >
> > Convert the legacy callback .suspend() and .resume()
> > to the generic ones.
> 
> Thank you for the patch.
> 
> Rather then doing this I think  the best approach is to unify gpio-pch
> and gpio-ml-ioh together.
> Under umbrella of the task, the clean ups like above are highly appreciated.

I'd be all in favor of that, but what Vaibhav is working toward is
eliminating use of legacy PM in PCI drivers.  I think unifying drivers
is really out of scope for that project.

If you'd rather leave gpio-ml-ioh.c alone for now, I suggest that
Vaibhav move on to other PCI drivers that use legacy PM.  If we
convert all the others away from legacy PM and gpio-ml-ioh.c is the
only one remaining, then I guess we can revisit this :)

Or, maybe converting gpio-ml-ioh.c now, along the lines of
226e6b866d74 ("gpio: pch: Convert to dev_pm_ops"), would be one small
step towards the eventual unification, by making gpio-pch and
gpio-ml-ioh a little more similar.

Bjorn
