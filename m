Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A0033686B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 01:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhCKAKM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 19:10:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbhCKAJw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 19:09:52 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D28CC061574
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 16:09:52 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id u4so36732714lfs.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 16:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cUMpdLVtQfjG7N/bzWqK56YThySHnK1SzbgL99zUSzY=;
        b=WD1Q41edlxS26MnBpGNwpB9P0vx3U2oxB7NLPbXE/Hv2tfkBRZv1OZXwvya+S3OL2E
         S2XbGHjys+BcSfExmbWGGnteZwy29QtDNOSQ06U5AxhFqZg1/+cgi/GSK2yMiAbiP8wj
         eHPEE615GaWEcIktBAJwDrx47c/Z7zp78r58nWo+qvANhbCo6z262tHKFogcZhDLiTin
         Az9RS28+DUcXSLVThVT+yn4cRE3VfuuNFVdG6fqWVVDkUuv4sHePo1hcPHOl2cyYiZVt
         soTkzypOtRK+I5bHzw2WkaSxM5Y4GqlNJ3QlXsSnK2SG9MlcGIbDzeHvbHPOc9xf3RQ9
         UR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cUMpdLVtQfjG7N/bzWqK56YThySHnK1SzbgL99zUSzY=;
        b=eMhFeFbJ+Hsd/VpB/af8z5dKVXeTE2ElPsjK9I27oaeRINESySfS9rj89Jq++vTlgg
         TSeO3CC32YREySMAc4fKqPjMcIpwHHoiTUEe02zyzq8gaoKK8TfKNfjfZHeoVedU2JaT
         hbKW5I9aWZdmKhMqbVu50M24fHHt/8EX3AcPHlKA1lwLj+6lmHjvdfcsr+5BSwbN50Px
         QsAHL1YfhaA/YQtg/wKYVZ9bCXL0Iy8nuKto8wMfnhUYRy358dSgmv9YVbKY6JwGcXDq
         mMzV1XLmwvaNXw+IWqfIDaAM9uJAdJghVChBYfFkgzArnW4kOp5Ixt8YoRW9LKjaAfMa
         OmGw==
X-Gm-Message-State: AOAM530glqb9AoFgAjrrS/J6MXdi2Ktwce1hha5yzTcmaxFcmHiBzTq5
        3tsRJc0m0UEIG7oXnGc5Ft7h4YLFxZdTdkTbNN7U2A==
X-Google-Smtp-Source: ABdhPJzyuIwtrd1uB4kpUJ1gTFKgzeSLm6Fuwgg3R8IFSHchEauwYERifTN6FLcpvf0bohF462Bu1M3cUH6o1flromc=
X-Received: by 2002:a19:548:: with SMTP id 69mr588724lff.465.1615421390614;
 Wed, 10 Mar 2021 16:09:50 -0800 (PST)
MIME-Version: 1.0
References: <YEjNcinYomwjyBdE@black.fi.intel.com>
In-Reply-To: <YEjNcinYomwjyBdE@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 01:09:39 +0100
Message-ID: <CACRpkdbM4ox6CC11RKgzJE2k6w5E2pCXBTsLL+-ARUATmYOztQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.12-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 10, 2021 at 2:45 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Hi Linux pin control  maintainers,
>
> One fix so far. I based my branch on v5.12-rc2 as Linus T. suggested.

Pulled in! I rebased my fixes on -rc2 as well and dropped the -rc1
tag from my tree entirely.

Yours,
Linus Walleij
