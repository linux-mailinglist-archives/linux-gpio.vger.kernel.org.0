Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE22FCBFA
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 18:39:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbfKNRjx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Nov 2019 12:39:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:52764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725976AbfKNRjx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 Nov 2019 12:39:53 -0500
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34B0120718;
        Thu, 14 Nov 2019 17:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573753192;
        bh=VzKteWn1F/CosCCsd6C4IKUCGWE4H5oQV8jGARZ48tc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qN2v5wV095fAUbYtR5P6fE7B5vGnb+vx313xCT936CPIndi5UGPzUwBJ4RrLRuJ3x
         doWz3mevftGogNgXftWdpHE1RIm0Y5J6GvK5tLIDIKNpwQIF4FFify2At4paexUm3K
         4SIxI+snb5+OFz1v88ytyKBaUGmq/kZP83rqrNBI=
Received: by mail-qv1-f48.google.com with SMTP id s18so2698307qvr.4;
        Thu, 14 Nov 2019 09:39:52 -0800 (PST)
X-Gm-Message-State: APjAAAWU3N45mXI3Ud44Pp4vYPoEZm/VZN9MOpL5LaaVCp0AL7a7LjP+
        ZR2aMon3mU4pSQ46aeWgIpGYozdnZqVv/a9nCw==
X-Google-Smtp-Source: APXvYqxjXzdKzRE0EK2pcCqMsxPiZ4eYz6WenDnilDBfvtuJZs9Eo9skkMhiHprH/vEA4CI6gl4l72fI4G+D1tx4Ce4=
X-Received: by 2002:a0c:d2b4:: with SMTP id q49mr8873666qvh.135.1573753191385;
 Thu, 14 Nov 2019 09:39:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573455324.git.rahul.tanwar@linux.intel.com>
 <96537f8702501a45501d5a59ca029f92e36a9e4a.1573455324.git.rahul.tanwar@linux.intel.com>
 <CACRpkdYhy1KLyZd4MNSODpy0Q59_SAcc+wkofrZr4b4N+rYDxw@mail.gmail.com> <1d3be294-5f12-462c-855c-e53ecb9190b7@linux.intel.com>
In-Reply-To: <1d3be294-5f12-462c-855c-e53ecb9190b7@linux.intel.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 14 Nov 2019 11:39:40 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+okgZgqdbosrOHhL1m0BW4E718Kb4tmyuexEfPwAZLmg@mail.gmail.com>
Message-ID: <CAL_Jsq+okgZgqdbosrOHhL1m0BW4E718Kb4tmyuexEfPwAZLmg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] dt-bindings: pinctrl: intel: Add for new SoC
To:     "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin zhu <yixin.zhu@linux.intel.com>,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 13, 2019 at 9:27 PM Tanwar, Rahul
<rahul.tanwar@linux.intel.com> wrote:
>
>
> Hi Linus,
>
> On 13/11/2019 10:46 PM, Linus Walleij wrote:
> > On Mon, Nov 11, 2019 at 11:11 AM Rahul Tanwar
> > <rahul.tanwar@linux.intel.com> wrote:
> >
> >> Add dt bindings document for pinmux & GPIO controller driver of
> >> Intel Lightning Mountain SoC.
> >>
> >> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
> > (...)
> >
> >> +properties:
> >> +  compatible:
> >> +    const: intel,lgm-pinctrl
> > Just noted from another review where Rob noted that this name should
> > match the internal name in the datasheet for this hardware block. Is it
> > really called "lgm-pinctrl" inside Intel?
> >
> > intel,lightning-mountain-io and similar are perfectly fine if that is the
> > name it has in your documentation.
>
> Our documentation does not have any specific names for these hardware
> blocks. It names it in a very generic/standard manner like GPIO, pinmux..
>
> To make the name explicit & self explanatory, i should probably change
> the name as you suggested i.e. intel,lightning-mountain-io.

You should also be consistent with 'lgm' vs. 'lightning-mountain' use
across bindings some of which I think have already been accepted.

Rob
