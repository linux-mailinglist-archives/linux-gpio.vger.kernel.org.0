Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5246047CB67
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 03:48:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238744AbhLVCs3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Dec 2021 21:48:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238780AbhLVCs2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Dec 2021 21:48:28 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A18C061747
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 18:48:28 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id m6so1790937oim.2
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 18:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/FZUFL2wLkEGZGFTbPONkk6mLWd8J6cDzMFXomn323A=;
        b=Niimf1jllbIyv3wnG8/DrqRRpShYICD8EWAfwYqJY8qcVGHPp/f2EqajPpp/OQ55iX
         7avYtd0TmboDXiqV4tshfdp7cv/Y4/zbfmr6GhPhXYMEd3RJyNmCADsOeW/Vpwl+ZvIT
         LCNinerXlMPpFLuJvTQh3YrZ3jK8M543vM7IfidOglerQpDjrYzdYHBP6gSN8eYW9nG8
         ezvZHL4Eh4mkMiiOTgSwT3gL+IUApU4GILXtkZatXC0KV1jRk+jCLVJ86BMVK9p+m7zu
         F5KqUESKLmMKEKql51KlJO9x+//yei5FefBnN6rCNbYCyK6dNQmRq+6xk8cp/8TH+Z84
         sG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/FZUFL2wLkEGZGFTbPONkk6mLWd8J6cDzMFXomn323A=;
        b=s6Ss8zueEZfOgGYUulGMdOsthoSAomld2bsrvAZYTAiKg/Q7eFsnOttlyM1zn67I4b
         xU0Vou07CuSaPJ/m+Cptl8cyMdAXHbezEDEpxx2IXp7zDfmIaCssEKZyPcZwREhbbbLH
         EiD2RdiME0jDgC3bSqRYbrhBnZuiqA9ghhMmLayr5MewMoQHKzLp9ZEdFcwjYTMD1uIE
         2pIMEuUXFs04miggvVRBI/y0IMEY5/V1xjfdBmpV75X/0Hv+8/boeMSvl3BeL34NcuiC
         hhWhzpYxif1+8sj3MiSH4WpXTHDrpYEvNnRFYJX0d8yGQKd5yvrFGCVMwLkqfBslAVFu
         kZRQ==
X-Gm-Message-State: AOAM531CuIpZ6pLr5lY8aVQiF0DDWino9KRrynx+Elpwb5hJFq4+rmIc
        MO+A3lUECAJAy34d+98lf2dR26iEaaeJuQ4FSL1IuA==
X-Google-Smtp-Source: ABdhPJzgjgZvCZer+0qK1pclgej1TT1RDlfQKfCQvqjVS3qOHMzJGGAXe5nK0e/t6ph4iTgc1ECudtqKVJBwg9u1Q/o=
X-Received: by 2002:aca:120f:: with SMTP id 15mr742282ois.132.1640141307641;
 Tue, 21 Dec 2021 18:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 Dec 2021 03:48:15 +0100
Message-ID: <CACRpkdbLk1aHEaiumq3d4qmg007QtZcitmCwdyFyLxyY=H7MXQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] platform/x86: introduce p2sb_bar() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 21, 2021 at 7:21 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Please, comment on the approach and individual patches.

This approach looks reasonable to me so FWIW:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
for the series.

Yours,
Linus Walleij
