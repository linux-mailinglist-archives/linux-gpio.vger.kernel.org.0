Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA4DF2E07
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Nov 2019 13:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733122AbfKGMSi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Nov 2019 07:18:38 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42700 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfKGMSi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Nov 2019 07:18:38 -0500
Received: by mail-pf1-f194.google.com with SMTP id s5so2576802pfh.9
        for <linux-gpio@vger.kernel.org>; Thu, 07 Nov 2019 04:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=41ffJ72BF8dL4NXbfzrPCuqt8jw339FK3DB/iCjPpT8=;
        b=TSdDspKMpnd40FqQS1v3A9X/KJctmDO6YWnW3X+BjT/LYROXmNg91rWHROEy68B4SD
         BPxGj0vRhFDPtN3J5up42E9wRVOKsfdXqzhXtSY3XIFZdtKPukNZ3LlDmh3f8Clw+qyR
         XX76Gi9TRl5meYbSCWbLY5T/kkqCIYygl7927Ui1l0QW5ezUNgWCGFXqP+03uKlpvurw
         0iIxP4Xt5rNybQNMw6G22dOKhtYsrWqG2stJ3ZFbOyC0Wd+clIOF9fxc1nv9XEFyLdx2
         cPsV6Apo2fCM1qx4FKjQcJKwgP0Fmkc5Lhg8LhG+TndZGJCqGv8+Gmk4a3U+s3RM8jPp
         duPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=41ffJ72BF8dL4NXbfzrPCuqt8jw339FK3DB/iCjPpT8=;
        b=aByV0CGO7qF8d73+e6cZLqFGoEJGi6vnTuj6/5XgC+f82BfHngYDeSmMdIQFRhjbz6
         Mid6jupkfTj9TGZEIrAOVFa0cZaH05ML7W0SgTqBBz1NL/SBWEl1QrGbTfNWQUsnYeVw
         FqOxTe1tknVa7Gb2Rmmh+gSqoRtBt0t5LPXlXPE/eiB+OyniG1oJLjat9LOnI8uWTyDi
         oMtx6c8aBfTqt8ObtcLQI6akW4QWowWIaxeBa8o5voRnLA4mxC83JoOFM7kw+77IndjV
         HLfZwLYlee55DNFPedo5r69pQG44UshQo6cOYPvbWJfApKRfTe8t8TBlkBlLp3uoQDBx
         BPwg==
X-Gm-Message-State: APjAAAXum5OHHCpE4ZMQqieTMCqJoz+D0TBx11jdwgt7eGuPieIwCYDh
        z08WgGe8S//lfnBDEsUEl0M=
X-Google-Smtp-Source: APXvYqz/2qRD/BSFD4aT9UsscRA7mgbMu9AHIHQYsWpn4so/6f4GOeiyYv7vv7RrLnWQTXsJ7blmsA==
X-Received: by 2002:a63:f916:: with SMTP id h22mr4213308pgi.423.1573129116965;
        Thu, 07 Nov 2019 04:18:36 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id t27sm2503813pfq.169.2019.11.07.04.18.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2019 04:18:36 -0800 (PST)
Date:   Thu, 7 Nov 2019 20:18:31 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Drew Fustini <drew@pdp7.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 0/7] gpio: expose line bias flags to userspace
Message-ID: <20191107121831.GA31526@sol>
References: <20191105020429.18942-1-warthog618@gmail.com>
 <20191105152616.GA19978@sol>
 <CAMpxmJX-gvTDJ9CBBKjtcvd11yBCbqRz1Bw4Y_X7CESSsyJrzw@mail.gmail.com>
 <CAMpxmJW6R0gv5VG95ayx2wGSdPG1hUnuKqxtBEeWg+MHkcWX3Q@mail.gmail.com>
 <20191106064842.GB3478@sol>
 <CAMpxmJVORDjTWJ+j6LUERhKnW8DS_0GopcSuTVNOnda44u=3kg@mail.gmail.com>
 <20191106165804.GA12770@sol>
 <20191107103943.GA29374@sol>
 <CAMpxmJXJRsUUU34561jVjQEot58N27P8UWFz292yq_XRSW0ftA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJXJRsUUU34561jVjQEot58N27P8UWFz292yq_XRSW0ftA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 07, 2019 at 12:28:09PM +0100, Bartosz Golaszewski wrote:
> czw., 7 lis 2019 o 11:39 Kent Gibson <warthog618@gmail.com> napisał(a):
> >
> > On Thu, Nov 07, 2019 at 12:58:04AM +0800, Kent Gibson wrote:
> > > I've pushed some more changes with the updated API we discussed earlier.
> > > Those new tests I'd added now pass.  Yay.
> > > One problem though - gpiod_line_set_config as written has no way to
> > > accept an as-is direction.
> > > Hopefully I'll have some time to take another look at that tomorrow.
> > >
> >
> > I've pushed some more updates to my libgpiod branch[1].  They fix the
> > direction limitation I mentioned (I was using the wrong set flags),
> > and extend the tests to cover all of the SET_CONFIG fields.
> >
> > That completes the C API changes.
> > If that is ok with you then I can take a look at the corresponding
> > changes to the C++ and Python bindings.
> >
> > And I guess we should move this libgpiod discussion to a new thread?
> 
> Yes, and better yet - you could simply send these patches for review
> and we can continue the discussion there.
> 

I was holding off on putting a patch series together until all the
functionality was complete - so after the C++ and Python bindings.

Cheers,
Kent.
