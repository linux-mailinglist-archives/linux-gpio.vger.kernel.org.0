Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6D492AD8E1
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730059AbgKJOgQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:36:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgKJOgQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:36:16 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7631C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:36:14 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id v18so14962479ljc.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Y/WABV4dkAAPohTwZ0DZ0Vgx8CLbt0DxmO40ulAyDg=;
        b=wZWHjiIm5BiXsy+qzHMDQrotqGfMwGgIp9xbGvRiCEsswhXIP5Og59fjLTsVkCoB/1
         VAWij/tAlDTnsTWP4YONDXFVfwis5ARMpKf/+S3elIG5hjqIqal/T8SPG4XJxF5Zb/kM
         ZYH2kpaFkQicwAsk5b0LURDzzEwqeujNnZ4Ovtk/0E4y3yo3HrhyAUxykIjbnvKqgXEc
         uAazOf/lGsmzctsXvKd0ay0eZ8ad53jgtu+Y01R+qZz6j5fTH0NftMTc7GH8Otc580UW
         2dV3PaoE59x5kVhYlLNJGMDDs+cYnbGNsRzJCJlpHLb0rHXZpUBk5QuT51sfF/fbohrp
         JxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Y/WABV4dkAAPohTwZ0DZ0Vgx8CLbt0DxmO40ulAyDg=;
        b=TZvUap3gwKQjS2liX/vNncXrStgeXPrD+8tOKd5jw9bKjG8JwbtQEnSF7YMwq2V6Sc
         AhPI28ZNl0YOeFZbHqknBySJbJkLzBF/HxHEezZouGPhGYxY2Ft7YuYpDOxYcd9xteq9
         jBb3lD5xe2sLnQ0Rsod1LipKlqd/v+1aXWKt3imNYbOpe3/MDdqrHV8Bo1qISVL/7oKK
         bhZth95Kx4CHVlYNc00QVrpwpoK6x0ZweoqBAQGdudYjBav6FT5cWp7RHEBdayyCi6/s
         x2ZKbtV5hxeLLGOciJn7RVdkJ5VWUHanCMFH2qF2p2ahTO0yt1fc0Z7Lw7nun28YW66K
         12dQ==
X-Gm-Message-State: AOAM531sHuQzEBVpWrDvIPeb6cVdpZXvuSB/Blj0dgVNQBjxOCIxGevS
        39q/Yh4jxiKoML+/tLimLS+KBoguxHHozQMfpd1ayMPHDiC/5Q==
X-Google-Smtp-Source: ABdhPJzj+u9M3VXX6usvLPV4CDquMKQ5jJVM1Fmd1B02uqsR8aKenUdxHFHWrGDE9RfHl2WiDrcyEYwbdYWFaEVldcs=
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr9087272ljg.286.1605018973464;
 Tue, 10 Nov 2020 06:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20201106181938.GA41213@black.fi.intel.com>
In-Reply-To: <20201106181938.GA41213@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 15:36:02 +0100
Message-ID: <CACRpkdY6wbt5_pVMfVyF3-g0_=9LqpooL_Dp2AsRGYX7onFgEw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.10-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 6, 2020 at 7:19 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Bias configuration fixes. This PR is crucial for another GPIO ACPI related
> patch series, which I want to have in v5.11. I.o.w. this should go into v5.10
> to make everyone's life easier.

OK! Pulled into fixes!

Yours,
Linus Walleij
