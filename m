Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBC4F79D9D
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 02:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727723AbfG3Ax0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 20:53:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:52328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727590AbfG3AxZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Jul 2019 20:53:25 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5964521726;
        Tue, 30 Jul 2019 00:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564448004;
        bh=9P9XTSwZEraMWe+Bk5cn6zbx8jLkRWytZvexBkWykzI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GZn0k3A0oUKjhpHUtqLiXRw3SRuEkDcz1+PO0erXAQO/scDbcDmhX0T170FwAUyY5
         bs43EZSP1C4VOHZp6Ee6MsowaTqa2igTtD6/Gei3ZsJYZLXYW3K0cCfWMeBz+hU1eR
         bJ+/HRQ17C6p7aybDnfpD4HYvSHP4Ueg6SnmGMU4=
Received: by mail-qk1-f180.google.com with SMTP id 201so45380697qkm.9;
        Mon, 29 Jul 2019 17:53:24 -0700 (PDT)
X-Gm-Message-State: APjAAAVqOB6FEa6Tl8tJPk6LVTVvkOdh1rPaAtlVH6LHq8MYKukzx8ik
        lMm2LS+nmXwnwFAJ5QhJKsr7ThAiRoMa+oGAkw==
X-Google-Smtp-Source: APXvYqzg4CpA6qd+PAURQBwuutVBrAhYvydEn0PwGDcygNvMl/0/kHQLTQyV/snoQAZCqvPMbDRKwGTKrK5sagEuO9s=
X-Received: by 2002:a37:6944:: with SMTP id e65mr68832709qkc.119.1564448003532;
 Mon, 29 Jul 2019 17:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190726053959.2003-1-andrew@aj.id.au>
In-Reply-To: <20190726053959.2003-1-andrew@aj.id.au>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 29 Jul 2019 18:53:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ+sFDG8eKbV3gvmqVHx+otWbki4dY213apzXgfhbXXEw@mail.gmail.com>
Message-ID: <CAL_JsqJ+sFDG8eKbV3gvmqVHx+otWbki4dY213apzXgfhbXXEw@mail.gmail.com>
Subject: Re: [RFC-ish PATCH 00/17] Clean up ASPEED devicetree warnings
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        anoo@us.ibm.com, a.filippov@yadro.com,
        Arnd Bergmann <arnd@arndb.de>, yang.brianc.w@inventec.com,
        Corey Minyard <minyard@acm.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Haiyue Wang <haiyue.wang@linux.intel.com>, wangzqbj@inspur.com,
        Ken Chen <chen.kenyy@inventec.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        Patrick Venture <venture@google.com>,
        Stefan M Schaeckeler <sschaeck@cisco.com>, taoren@fb.com,
        Xo Wang <xow@google.com>, yao.yuan@linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 25, 2019 at 11:40 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> The aim of this series is to minimise/eliminate all the warnings from the
> ASPEED devicetrees. It mostly achieves its goal, as outlined below.
>
> Using `aspeed_g5_defconfig` we started with the follow warning count:
>
>     $ make dtbs 2>&1 >/dev/null | wc -l
>     218
>
> and after the full series is applied we have:
>
>     $ make dtbs 2>&1 >/dev/null | wc -l
>     2
>
> for a 100x reduction.
>
> Getting there though isn't without some potential controversy, which I've saved
> for the last half of the series. The following patches I think are in pretty
> good shape:
>
>   ARM: dts: aspeed-g5: Move EDAC node to APB
>   ARM: dts: aspeed-g5: Use recommended generic node name for SDMC
>   ARM: dts: aspeed-g5: Fix aspeed,external-nodes description
>   ARM: dts: vesnin: Add unit address for memory node
>   ARM: dts: fp5280g2: Cleanup gpio-keys-polled properties
>   ARM: dts: swift: Cleanup gpio-keys-polled properties
>   ARM: dts: witherspoon: Cleanup gpio-keys-polled properties
>   ARM: dts: aspeed: Cleanup lpc-ctrl and snoop regs
>   ARM: dts: ibm-power9-dual: Add a unit address for OCC nodes
>
> With these patches applied we get to:
>
>     $ make dtbs 2>&1 >/dev/null | wc -l
>     144
>
> So they make a dent, but fail to clean up the bulk of the issues. From here
> I've mixed in some binding and driver changes with subsequent updates to the
> devicetrees:
>
>   dt-bindings: pinctrl: aspeed: Add reg property as a hint
>   dt-bindings: misc: Document reg for aspeed,p2a-ctrl nodes
>   ARM: dts: aspeed: Add reg hints to syscon children
>   dt-bindings: ipmi: aspeed: Introduce a v2 binding for KCS
>   ipmi: kcs: Finish configuring ASPEED KCS device before enable
>   ipmi: kcs: aspeed: Implement v2 bindings
>   ARM: dts: aspeed-g5: Change KCS nodes to v2 binding
>   ARM: dts: aspeed-g5: Sort LPC child nodes by unit address
>
> By `dt-bindings: ipmi: aspeed: Introduce a v2 binding for KCS` the warnings are
> reduced to:
>
>     $ make dtbs 2>&1 >/dev/null | wc -l
>     125
>
> The bang-for-buck is in fixing up the KCS bindings which removes all-but-two of
> the remaining warnings (which we can't feasibly remove), but doing so forces
> code changes (which I'd avoided up until this point).
>
> Reflecting broadly on the fixes, I think I've made a mistake way back by using
> syscon/simple-mfds to expose the innards of the SCU and LPC controllers in the
> devicetree. This series cleans up what's currently there, but I have half a
> mind to rev the SCU and LPC bindings to not use simple-mfd and instead have a
> driver implementation that uses `platform_device_register_full()` or similar to
> deal with the mess.
>
> Rob - I'm looking for your thoughts here and on the series, I've never felt
> entirely comfortable with what I cooked up. Your advice would be appreciated.

The series generally looks fine to me from a quick scan. As far as
dropping 'simple-mfd', having less fine grained description in DT is
generally my preference. It comes down to whether what you have
defined is maintainable. As most of it is just additions, I think what
you have is fine. Maybe keep all this in mind for the next chip
depending how the SCU and LPC change.

Rob
