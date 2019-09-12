Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81A82B0E65
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 13:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731512AbfILL7F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 07:59:05 -0400
Received: from mail-lf1-f49.google.com ([209.85.167.49]:36966 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731499AbfILL7E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 07:59:04 -0400
Received: by mail-lf1-f49.google.com with SMTP id w67so19098013lff.4
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 04:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6AnWl7CDV6+n/PhRScCSnrV1CJ82DPfgUcjh1nQIBq4=;
        b=cnFFTFI0jDyks/bGM9M1LvWsn5Oz7/YXe8EM08VW7jQJE+ONiDj+/pl7Eba38GDPh+
         hrHX4E3VZ063RwNR5buWN259pbmh/+L3x6XB3e5Lv0lFImD5z65mLw2Pv12sZkT7lgvv
         IiscJJVFtOQougkj5g76QfmtnZvCrKMBiOC6nQhmEY97oId+7ZZKVDEWN0iB3Jidk43z
         3z64rlGpJjQGiW9MmkHFkleVGOitYE2JYC3EhbXJTbnlcjFSo/2E9LJC69I6eRyZDvWi
         BqNcAJTw7r0vUFLC/4ODCr695317tDSpeYrnT/jaC3hW3I0BKiPR2HzgEeAsBGa0F6k0
         s+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6AnWl7CDV6+n/PhRScCSnrV1CJ82DPfgUcjh1nQIBq4=;
        b=ErS7hUh1b/PPWTTQIESJBhd/stvgcdfISSo2IePGocwC6jBvUyavVttP47EKmkUrFZ
         kql5vqqM7/3Nis0WMCleq0zemL3zHTMuHHh9a1vPoW1ZlaHfqDCuRK0x/fK2E6ZHP8Zq
         TSBbqByDTZe1XnTT8KzNGciXeaH+WUJznOVt42r05XJL9YtkJVBKkbL8fl84ThoxTA1d
         z28hmGrojTXlUSbNYYUlfqwo6P4QU2kZW99lnvtARVfyzSvwkAOFjinDJzKpCL8wmUtM
         WsHetAK3z4MSw2+1/EFw3bMVr9gko085dy7Bwpz+m/Q/TX/ImB4xi9KxAvnlg1SwSTTG
         /QrQ==
X-Gm-Message-State: APjAAAXSbFedG/Uu/Cl4rKi2VJ2XjHyUABk+p5iFO1TbDhBP7GpiEVuL
        hF3MfnJrAQdbV3fhcOrD8c1JFOR2NdpCPXu/WISLCaVrDki4HA==
X-Google-Smtp-Source: APXvYqw2v6t548cgxoRvZULlb//0UZIAWz6R/Ic822RmgEjlvrFEidOFSja6PJDyqFJjjINiosaCp8xkQuTGsEJgc9M=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr27664601lfa.141.1568289541524;
 Thu, 12 Sep 2019 04:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190911144215.GJ2608@lahna.fi.intel.com>
In-Reply-To: <20190911144215.GJ2608@lahna.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 12:58:49 +0100
Message-ID: <CACRpkdbo-TigEqKbOhfoZPkowHGwBDQkcWfZzoEJgb73XszmCw@mail.gmail.com>
Subject: Re: intel-pinctrl for v5.4 part 2
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 11, 2019 at 3:42 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:

> The following changes since commit 6cb0880f08229360c6c57416de075aa96930be78:
>
>   pinctrl: intel: remap the pin number to gpio offset for irq enabled pin (2019-08-19 12:41:44 +0300)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.4-2
>
> for you to fetch changes up to 55dac43747be98516a337285428806d177afaa3a:
>
>   pinctrl: intel: mark intel_pin_to_gpio __maybe_unused (2019-09-09 13:11:42 +0300)

Pulled into my "devel" branch, thanks!

Yours,
Linus Walleij
