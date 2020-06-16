Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D221D1FAC5B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 11:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgFPJ15 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 05:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgFPJ14 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 05:27:56 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A20A2C05BD43;
        Tue, 16 Jun 2020 02:27:56 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id x25so6780042edr.8;
        Tue, 16 Jun 2020 02:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x3QhgzPYsk4YXww5OnxJ96yfR+po6PyrH4a8GDqlKe8=;
        b=oP8HT6xPm+Jd8PbfAnJfzBLJDQMtCiW9hmZNAZKWE8HMgB9EPpSEHL71WU9pKn9Arr
         dPhLjNWwKgbY7muygCZZh2ynHlxcaASViVzRpgRwsBjIPLzx2RP8PvYsx628zblvh9NC
         REIqD1Q18GODNR+fb5p3kx/zLM5eHsNKw58de5oUaRGQ08AoaHEpeNjPGBMyKk7UMMzu
         7MGx2LJiJOl5kt/W0jEWbS4UoBYNXsggcskbAd8gr8MNi6Xov/1xHaue5xHFT0hVHzm6
         ucMrcmix+hcukIsMqqjeGTpl4lLA3EpEm0P7SsV/fGWb8e+JE2c+WgtB/Ax4gh6eRMbO
         i+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x3QhgzPYsk4YXww5OnxJ96yfR+po6PyrH4a8GDqlKe8=;
        b=ZA5yR982d1j6RXCnRa4tuQRRbqz8Pf966576fI1OMfz/JIhDPB6tO+VYM/xagD0LDB
         mFIFBP5mr64wYn5DxwbN6sp8iFtVzX5XVRtSz1BaAHViBo3Tn9gKlyybXAhO2l9dMrqF
         GT49rnOoFmlU3wzwESs+n8Z6ZPlq7j2AUJ3JsWhFTmaWgY4wdTYbhx61eXqTqs1YXHd8
         2h3gBGE/n6aBq3H5oQPphaLU/AqGd4xz4oGyjoso+3jTlb0t0BUgtVoaikLwK1+hDcXB
         lgS6LhXxBK++DfjywEF3hRiu0qO7Lhq6rRu5Y4Vu/XQPQb2AzCCj3FA3/Nec9RITL0Mp
         BPkA==
X-Gm-Message-State: AOAM532Y/Q79k+SONReEd4Tj9JuJX+iTfRJXGoLulAfzkSWJsaGQtVOi
        Ku/nfWI4GwjtILSWlvKIRJzT74z8gDhsN+3VmzGKYlId3AE=
X-Google-Smtp-Source: ABdhPJxwxI3G8sOMPSW+QeQRyqvQfrtsLAnkaAz9/qX8rA1XrxLcxmluojj/DbY7j4zIshXelrpnqgGrpdDFAceaBH0=
X-Received: by 2002:a05:6402:1c87:: with SMTP id cy7mr1757571edb.354.1592299675040;
 Tue, 16 Jun 2020 02:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200522030743.10204-1-frank@allwinnertech.com>
 <20200522030743.10204-3-frank@allwinnertech.com> <20200522152803.twvfvuhd6ztunvll@gilmour.lan>
 <8c7a8eeb-f4ea-4df7-b381-5aeab6dd170a.frank@allwinnertech.com> <20200605151306.kqmyj673kux4sbaa@gilmour.lan>
In-Reply-To: <20200605151306.kqmyj673kux4sbaa@gilmour.lan>
From:   Frank Lee <tiny.windzz@gmail.com>
Date:   Tue, 16 Jun 2020 17:26:01 +0800
Message-ID: <CAEExFWutOjweJ_=WYKifebCPohStJdo0UJnHtmzvmhQ+VTb3kg@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8mltQQVRDSCAyLzRdIHBpbmN0cmw6IHN1bnhpOiBhZGQgc3VwcG9ydA==?=
        =?UTF-8?B?IGZvciB0aGUgQWxsd2lubmVyIEExMDAgcGluIGNvbnRyb2xsZXI=?=
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     wens <wens@csie.org>,
        =?UTF-8?B?5p2O5oms6Z+s?= <frank@allwinnertech.com>,
        "linus.walleij" <linus.walleij@linaro.org>,
        "robh+dt" <robh+dt@kernel.org>,
        mturquette <mturquette@baylibre.com>, sboyd <sboyd@kernel.org>,
        "p.zabel" <p.zabel@pengutronix.de>,
        =?UTF-8?B?6buE54OB55Sf?= <huangshuosheng@allwinnertech.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

HI Chen-Yu,  Linus,

On Fri, Jun 5, 2020 at 11:13 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Frank,
>
> On Wed, Jun 03, 2020 at 05:44:36PM +0800, =E6=9D=8E=E6=89=AC=E9=9F=AC wro=
te:
> > >> + SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),
> > >> +  SUNXI_FUNCTION(0x0, "gpio_in"),
> > >> +  SUNXI_FUNCTION(0x1, "gpio_out"),
> > >> +  SUNXI_FUNCTION(0x2, "mmc0"),  /* D1 */
> > >> +  SUNXI_FUNCTION(0x3, "jtag"),  /* MS1 */
> > >> +  SUNXI_FUNCTION(0x4, "jtag"),  /* MS_GPU */
> > >
> > >We should use another name here, since the code will just pick the fir=
st one and
> > >ignore the second. What about jtag-gpu?
> >
> > The underscores are used in front, so changing it to jtag_gpu may be mo=
re consistent.
>
> Yep, that makes sense
>
> > >> + SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 7),
> > >> +  SUNXI_FUNCTION(0x0, "gpio_in"),
> > >> +  SUNXI_FUNCTION(0x1, "gpio_out"),
> > >> +  SUNXI_FUNCTION(0x2, "spdif"),  /* DIN */
> > >> +  SUNXI_FUNCTION(0x3, "i2s0"),  /* DOUT0 */
> > >> +  SUNXI_FUNCTION(0x4, "i2s0"),  /* DIN1 */
> > >
> > >I guess the second one would be i2s1?
> >
> > No, each i2s may have many inputs and outputs.
> >
> >  SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> >      SUNXI_FUNCTION(0x0, "gpio_in"),
> >               SUNXI_FUNCTION(0x1, "gpio_out"),
> >               SUNXI_FUNCTION(0x2, "cir0"),          /* IN */
> >               SUNXI_FUNCTION(0x3, "i2s3_dout3"),       /* DOUT3 */
> >               SUNXI_FUNCTION(0x4, "i2s3_din3"),       /* DIN3 */
> >               SUNXI_FUNCTION(0x5, "ledc"),
> >               SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 19)),
> >
> > Considering that the same pin has multiple same functions,
> > so add a suffix, like i2s3_dout3 and i2s3_din3?
> >
> > Or specify muxsel in the device tree may be another solution.
>
> Having muxsel is not really an option. We have two sets of bindings to
> maintain already, adding a third one would make it fairly hard to
> maintain. And the second binding we support is the generic pinctrl
> binding, so I'm not really sure why we would want to move away from
> that.
>
> And I'm not really fond of having a suffix either. It kind of breaks the
> consistency we had so far, and ideally I'd like to keep that.
>
> Chen-Yu, Linus? Any input on that one?

PING......
