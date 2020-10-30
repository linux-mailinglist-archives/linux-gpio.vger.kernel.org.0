Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E8B29FA2F
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 02:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgJ3BCh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 21:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgJ3BCg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 21:02:36 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1763BC0613D2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 18:02:27 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id o14so4191298otj.6
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2020 18:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8v0LR09o1q2keQ82icRFIanZ6SYH95u30bGsIWz70wM=;
        b=voOINdGME5r7SS40N5xJySdvVN2o5El+ut5jOWRTCcL4LahtOQKhNXT6J4urs1LTou
         EjsoCnUTqjs/mkPjJFz5DatBjwFhZ5PaeFK4ceTrY3kvthmHVw6z2LRxVI5KDuPDX7LY
         5uz9W+BYYLErVIKqRUcpumgTWYjPLt3JU/sGil+oilksaiRN9TfB5NM1N9U2ymv4cokn
         FBUleI8FOWmszEzDFwyLTooqujrIaQ09FE+X8gswkFeMKWGVAPUZNaeZ7+aUcsT/9j76
         6+1+/pJKAjIKf2EjZIRgIQQUliUJddMkg1D3HmHux0/vSzjhR/qbdMcTP/cck0eOGPt9
         R8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8v0LR09o1q2keQ82icRFIanZ6SYH95u30bGsIWz70wM=;
        b=szqt0zqcM3TkeBE+6nzdpZvFthEBXFq6IGTwEoHZNna8HWkSQkjSQuGMEgvjjD8x0A
         A47xYReGucUH28FmH3en8vqsP4Xejr5X4Q9At7km6Y4k70pN6M5qcRDwVvS/oIJMUtTY
         rKrg2hweqtbOU/0SVgr/WeegD4oEaQJkvrcVEeBU9RVnBVzu8MSirwh/ttQcZEpMsqZu
         VlvU4H/EddWCejPHWgeOLnGK3lD46+Gj3N7vwfyx58qOwlUMb/ss4hpDjXfKVoquiLTm
         Z7W1d9NLLBH+kYyUPnoKa6lhxammc5ZTHRnQfC0F6xJETmu5jMt94IRcd2hjm34g1rNc
         Tuqw==
X-Gm-Message-State: AOAM531jknFoHxyQqcdt+tBTUF7f4hj9UiikWM84O9arLBFC5jzmc4nL
        xmz1vwiE7jqnil1nnK89hTEJU7VEwd2javQkwOgTVA==
X-Google-Smtp-Source: ABdhPJwTerSintYpMU7viWh2jWbkoDcom7lThKWTj8gvIHMRVeH+6XC8I1DuN16tS2twPZYOVGa/qvLBx0z24Bqky0Y=
X-Received: by 2002:a05:6830:1558:: with SMTP id l24mr5088291otp.352.1604019746421;
 Thu, 29 Oct 2020 18:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-6-john.stultz@linaro.org> <20200702141825.GA16941@willie-the-truck>
 <CALAqxLVZ2EhutYjOt7Be1RgnYwHT6-4m6DxA-t1wuxuSy=6yDQ@mail.gmail.com>
 <20200710075411.GA30011@willie-the-truck> <CALAqxLWadLrxckRHRAR0Q417RnFKquQJbRfO_DLEVH56cykRow@mail.gmail.com>
 <20200713204133.GA3731@willie-the-truck> <CALAqxLUDVEq4ds2Wbic6uaK3=dELKKO4eGQxjHFFz19GeUFd_w@mail.gmail.com>
 <20201028135118.GA28554@willie-the-truck> <ae6ba27a-d3c8-8b98-c263-ec779ef35738@arm.com>
In-Reply-To: <ae6ba27a-d3c8-8b98-c263-ec779ef35738@arm.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 29 Oct 2020 18:02:14 -0700
Message-ID: <CALAqxLW13=cvTX3ghskb9uG_YoVh7kvp8UQGUB8mVDGYXHWpVQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Maulik Shah <mkshah@codeaurora.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Saravana Kannan <saravanak@google.com>,
        Marc Zyngier <maz@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 7:51 AM Robin Murphy <robin.murphy@arm.com> wrote:
> Hmm, perhaps I'm missing something here, but even if the config options
> *do* line up, what prevents arm-smmu probing before qcom-scm and
> dereferencing NULL in qcom_scm_qsmmu500_wait_safe_toggle() before __scm
> is initialised?

Oh man, this spun me on a "wait, but how does it all work!" trip. :)

So in the non-module case, the qcom_scm driver is a subsys_initcall
and the arm-smmu is a module_platform_driver, so the ordering works
out.

In the module case, the arm-smmu code isn't loaded until the qcom_scm
driver finishes probing due to the symbol dependency handling.

To double check this, I added a big msleep at the top of the
qcom_scm_probe to try to open the race window you described, but the
arm_smmu_device_probe() doesn't run until after qcom_scm_probe
completes.

So at least as a built in / built in, or a module/module case its ok.
And in the case where arm-smmu is a module and qcom_scm is built in
that's ok too.

Its just the case my patch is trying to prevent is where arm-smmu is
built in, but qcom_scm is a module that it can't work (due to build
errors in missing symbols,  or if we tried to use function pointers to
plug in the qcom_scm - the lack of initialization ordering).

Hopefully that addresses your concern? Let me know if I'm still
missing something.

thanks
-john
