Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 197212229BD
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 19:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbgGPRWR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 13:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728807AbgGPRWQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 13:22:16 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EEA9C061755;
        Thu, 16 Jul 2020 10:22:16 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id u12so4153749lff.2;
        Thu, 16 Jul 2020 10:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n3q3bzAf9PCQpcN1SbQ1WFbGE7N53vwQR0aJbcOSelA=;
        b=Wirnft3yE4BZbWw8W9Aw/96GadTCNDkrIV2jt/ODAnNR0AwbPcrhmfLM+qy+zo9Bsh
         vMUKKxHJIeieQjHMvb2hnqiW1N42ws7IBScOA3Mu+fOGTLJZ+/ACwtpx0bb3qYAOZcea
         zjazgdNrVVP4WAhw3GVq2AGzvjj+TJ7jiWEyEjos7LO6vVffwTkwep47dCp+AkFLdtny
         jOQ0Pw7+X12MJtKEePc0KGpKH1vdodNqNdNp27mBRuW1Ity5NWUszm0xwDyu502k0cvI
         LYl4z6boSTX3VBIrNrPfoT4Ux75K5U8fU6Jn8tyFctkhBdHKmFo3KQjuB+5j+XJ0E1gv
         9Yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n3q3bzAf9PCQpcN1SbQ1WFbGE7N53vwQR0aJbcOSelA=;
        b=uW7zpgzf1EE8Edd/cjMmWrt8M3TFvwXazwj34L7LZmj/u6FWKYRglwDbPhuk1n2NYg
         MGhCS5pIpct14xcjhbyEClAxMXfNmbtmstfnK92DrRgGTacXSsptpbjSKCP/O7pD+1L7
         fNFz2SmLMLCGB0Cvn/yfjAWYGt6+0j6UNsCui2W0fVr0qvZx40IflZp346SID9nHZ+Dr
         y931D7l7hk6CSZsPpYpTvohIJVmDFVzrOJHwKWgX57A+jVorJ7By2/+BBOlVUnWYA8eR
         ewpEVX1pygQGgcVpCcVaRiGDJRXSSushUiJUuNhHxf8Zz27NjiCRUTSsxgVnIm7CG4k7
         Eqqw==
X-Gm-Message-State: AOAM531pFdq1P4KGJT9OFRiJDaI7zvRlh+afvsHQrNhOVhr331LwqlDd
        4VM5kTg9nkeO8MeTVW7Uzve+CAYonbOYuuGHM3s=
X-Google-Smtp-Source: ABdhPJw6PnZvtEEL7z+alpxH6AqPzRf2+wA2WB2C5xkBCcPL4XieygTzUP8ZWYj+YckIBepX04j9veOFWEMsO30ZgyU=
X-Received: by 2002:a19:8407:: with SMTP id g7mr2669723lfd.61.1594920134941;
 Thu, 16 Jul 2020 10:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200703080646.23233-1-computersforpeace@gmail.com> <CACRpkdar+aBBFn6SKJ1a90D-NT3F6qGvouzjt-jxaiR0VSuUOg@mail.gmail.com>
In-Reply-To: <CACRpkdar+aBBFn6SKJ1a90D-NT3F6qGvouzjt-jxaiR0VSuUOg@mail.gmail.com>
From:   Brian Norris <computersforpeace@gmail.com>
Date:   Thu, 16 Jul 2020 10:22:03 -0700
Message-ID: <CAN8TOE-h5Sk=eauy91rmP7y=fUtTEATrU6pQttPLoWV=RgdPsw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: ipq4019: add open drain support
To:     Linus Walleij <linus.walleij@linaro.org>,
        bjorn.andersson@linaro.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Jaiganesh Narayanan <njaigane@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+ Bjorn for real
- Bjorn @mistyped-domain

On Thu, Jul 16, 2020 at 1:47 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Jul 3, 2020 at 10:06 AM Brian Norris
> <computersforpeace@gmail.com> wrote:
>
> > From: Jaiganesh Narayanan <njaigane@codeaurora.org>
> >
> > Signed-off-by: Jaiganesh Narayanan <njaigane@codeaurora.org>
> > [ Brian: adapted from from the Chromium OS kernel used on IPQ4019-based
> >   WiFi APs. ]
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>
> Patch applied because this looks innocent and Rob
> ACKed the binding.

Thanks!

> If Bjorn opposes, I will simply pull the patch out again.

Unfortunately, depending on his mail subscriptions and filters, Bjorn
may not have had much of a chance there. I failed to notice that I
deleted the "g" in ".org", so my mail didn't deliver to him.

Bjorn: for reference, here are archive links to the entire patch set:

https://lore.kernel.org/linux-gpio/20200703080646.23233-1-computersforpeace@gmail.com/
https://lore.kernel.org/linux-gpio/20200703080646.23233-2-computersforpeace@gmail.com/

Brian
