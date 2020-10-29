Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEFDE29E546
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 08:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732265AbgJ2Hz4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 03:55:56 -0400
Received: from smtp2.axis.com ([195.60.68.18]:5043 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731519AbgJ2Hya (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Oct 2020 03:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1006; q=dns/txt; s=axis-central1;
  t=1603958069; x=1635494069;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4gY4yVVX7l5rZ98kdmgu7rP8LiUim8X0dxJoLhLo+dQ=;
  b=VKj5agu5NnUax4Ao6XLq1JLDlcM6lDQnIPxknMSn3XQ2sxeyPHIKVtjg
   RLccP0+ev5U7k8psRCYy8XhhCrSDWU5ZqeGTqj+sL2Z3BFrgkIC7mYXu/
   n8WRxNpIhBlCn58gWYisUOPKDSDoxHyLz1kpB/Le+xYd+6/i6+FhouGjn
   NOQDdNrw/qLF8wUcVO2/hHGVXXlN4X+fBKdpIYEfuCbvp0+u+urMoIEcd
   x9JnmTYIhKYkijS9p2giFfhOYI3Bb3MPtHkdEtC7gNG7ErrZNdkZkEwQO
   2m5oSfdxj+2NlyeDavuaLeulvyA2FDEY+pxfNSZCnKeu66TFO9POMIcS2
   g==;
IronPort-SDR: QxxgPU9Y+ajVDspzc57wCdOnqfNlxgO+zd0K3eVDtsqNmqK5phMdo9VLBiOcjDMQkRjTVCUTPn
 X6YC6Ks5hQZB0BByA9XnhH9Ahi5M0TTMo2Q1yCvAkWElOEjBWL1b3AmBi40hxHphgVg2LAlEeK
 fPZdCG2L7c6/Uc1dnq4KIiPawFZxfIaKh1aUqusTwDbxTwjPJx7rscGK/ZGFqHhaMJ00LHxciI
 iqxSw5vii94y/SAgpV/qLpbDLyYdHiVMlSVeyTLAqXjQGBAyVUVC52cdNGg4ioE6ocM5kf2KrA
 HnA=
X-IronPort-AV: E=Sophos;i="5.77,429,1596492000"; 
   d="scan'208";a="14030929"
Date:   Thu, 29 Oct 2020 08:54:28 +0100
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        kernel <kernel@axis.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] gpio: mockup: Allow probing from device tree
Message-ID: <20201029075427.t2hwvusjqx27pf6l@axis.com>
References: <20201027135325.22235-1-vincent.whitchurch@axis.com>
 <CAMRc=Mdjm8tgxF_76T3f6r3TwghLKtrFtUv7ywtX3-nEQzVGtA@mail.gmail.com>
 <CAHp75Vff1AyKDb=JiocsAefnft+tcm+BnuWDrxViQqZAQZjuVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75Vff1AyKDb=JiocsAefnft+tcm+BnuWDrxViQqZAQZjuVg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 09:25:32PM +0100, Andy Shevchenko wrote:
> On Wed, Oct 28, 2020 at 8:41 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Tue, Oct 27, 2020 at 2:54 PM Vincent Whitchurch
> > > +#ifdef CONFIG_OF
> > > +static const struct of_device_id gpio_mockup_of_match[] = {
> > > +       { .compatible = "gpio-mockup", },
> > > +       {},
> > > +};
> > > +MODULE_DEVICE_TABLE(of, gpio_mockup_of_match);
> > > +#endif
> >
> > You don't need this ifdef - of_match_ptr() will evaluate to NULL if
> > CONFIG_OF is disabled and the compiler will optimize this struct out.
> 
> It's not so. If you drop ugly ifdeffery (and I vote for that, see also
> above) the of_match_ptr() must be dropped as well.  Otherwise the
> compiler will issue the warning. So it is either all or none.

Yes, you're right.  I actually tested a !OF build before but it turns
out that the warning is disabled by default and only enabled with W=1.
I'll fix this and change the header in the next version.  Thank you.
