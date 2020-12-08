Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7992B2D2E6E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 16:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729846AbgLHPjn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 10:39:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729558AbgLHPjn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 10:39:43 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B21C0613D6
        for <linux-gpio@vger.kernel.org>; Tue,  8 Dec 2020 07:39:02 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id f24so20100200ljk.13
        for <linux-gpio@vger.kernel.org>; Tue, 08 Dec 2020 07:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E68YCVU353cKqGzcecaO2qcMBCpw9VzpwMqNEW7t7hM=;
        b=t3K4zowymoM5L/STU4K2XcY1jJjr673wOqRexRL1mgHYiat8uhIgVYYUemnB/XSEq4
         sfgSCrpxAxY4ae6/Ec6szVBrCj1gA9UeAxz31rNK8ar2N06cgE9tDZ63AZgMhD+6v93p
         9R2xcxTljkYzpCMXbJ3zvAY8Q73YAO1qAi3wO5WlqRbNAmg5PXnLnYGtQIwOue8P9Bid
         aMUlqtYn0Jot2jFnO/xil0WN+sg+UJo4nFsEqkHRBJSgOwDN4Wd8iXU4JSax8ZrNhb2n
         GJbIYmzFZsW44ah0WdXQZkArXEszhCDa9hfz77+5EPNDTgeL2O3A+KYfVgCsG+gHZ/+x
         /M6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E68YCVU353cKqGzcecaO2qcMBCpw9VzpwMqNEW7t7hM=;
        b=XfNH0P1tFCZRmd15cO92btugtH9uxIADfRTq8wFuOHoNdse7trOfchnteYzUwNKCa5
         okq+bD/tOOAykDNTjQeA4DjXs305DEmtpUv7CSj39xsWkEIa0DJJ4X/chuYr6w1r3aTO
         eY3fOpG8dOLo2Dy035mg61EHAa59EA8+6LvtgwA4M3LrJsVTfB+PDFVxNLKspBovNoKN
         phfl2Jp1oTMuvES6VZXKLDUAs+0vvxupIa12dmdI9GClnrm712atcOgRB5jXILco62pJ
         NuPOBeKMPl0JS4TDraIOZm8SZJ80Ym01L2GXmYfV9JMNvpfdIsLf/pJLmy7cALxvrtcu
         jCVQ==
X-Gm-Message-State: AOAM533epyBbd9r/hqIUb3E5r6Tgm/1aE56OIhJX8zpKXVB82+34SGLZ
        ntms2ceFRia5V/a301xe9WmW43qjdn1ynFZCZx2K1A==
X-Google-Smtp-Source: ABdhPJwmnHGshYCN8sEZ8rlC0Iw7HnOm6xaI2fawrWgnTMxKmnGQx1G1rqKkcyXXpHcDm6XQrWGRD7Jnjsim+nbPBIk=
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr5377596ljj.326.1607441941062;
 Tue, 08 Dec 2020 07:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20201207175940.10631-1-andriy.shevchenko@linux.intel.com>
 <CAHp75VeHz3CAZMQgQsU+WdDyjS+woMTyeOWYDzARePq1aaa=Og@mail.gmail.com>
 <CACRpkdb4AYx1dOYkZvHzRD7fbGfVbKoGqdnmh1m=rdhGnAaPag@mail.gmail.com> <20201208094853.GF4077@smile.fi.intel.com>
In-Reply-To: <20201208094853.GF4077@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Dec 2020 16:38:49 +0100
Message-ID: <CACRpkdbNQ6cwdFgraaZQJ4+uzjcs0xd6K3hZKb6Q_WinHwhanA@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: intel: Actually disable Tx and Rx buffers on
 GPIO request
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 8, 2020 at 10:47 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Linus, thanks, however something happened to it. i.e. BugLink tag disappeared.
> It's not good, because due to that link and Kai's report I quickly understood
> what was the issue.

Oh I think that is an issue with the b4 tool that I use to extract patches.
It was reported some time back and might not be fixed in the version
I'm running.

Yours,
Linus Walleij
