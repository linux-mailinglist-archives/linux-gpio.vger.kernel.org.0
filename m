Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA11E3C9AB1
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jul 2021 10:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239659AbhGOIe7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 04:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbhGOIe7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 04:34:59 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86508C061760
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 01:32:05 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id ca14so6992014edb.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 01:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8U8Y/iUBnQ74pK644aq/v3mYOcIqjZnUetvaujedZ0E=;
        b=nj+EB5DfeXN1LkHvaViaUSbJ5FITxLYaHqrBqyIzM8cJyqV/Ski1i1LKR5Tz67Q2OY
         /0H6QYj2+tj3kUoEBMPZ7khu0CmRmJWfOwgExtGczLWmVk2lr7AcmheMO3rNPlN+pYfL
         2tze9fqzhEM8Cw6ohjLJSGMNmq/ELi2j0OszBLKlOR/5tZz59YrETsnJekTHSPGEYVtU
         0O3LOUOrvRwOKB15kNv5zsa7dbJdO5la9HewcA6HCSVEGxOov5moIdrgNYaYZPmtC9i6
         O6rcU2n7xSmTiyQgSEGOPcBKIYP7drk9mQ8HgjQQNaUg3/Ixz4Wt9oCPa5NyayPVoXmm
         19xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8U8Y/iUBnQ74pK644aq/v3mYOcIqjZnUetvaujedZ0E=;
        b=is0e3mYwOV28GD6cMSBxoDpPZEORElSeZ9LaWKH8+5oO4rK3SGmRrEUIIA3Fn2wMmi
         XIfVdJaT7eYrGuhGI65SyybppAb1DVA8HmleIf0GOtkxkFkV+hH3jxE3VYEz/W4lE7bj
         vtdeg0whLjN+S35M7CKpjEbj0pKpnzFQwa1AFxn3IvXRq5lAOJniWgQSx0wMQNEjEoR0
         eOLRHZIHNe0uPIda7JmuTkjBNJggbIbCBhbAKAbKRZF4iohc7lZh1X3stuBM8Vslqm0j
         iBvXCSH/Wmemu7aEPzDy2LfMAC1cZdrf0/RzCBpqCItI33XMla4VTbL4ggBbxPWivD/a
         AeDQ==
X-Gm-Message-State: AOAM533+ClO0FJACfb8iVnbcXjRNlvPT74nDplFikRcMExo7Ykj9wV3Q
        6jke3XzZKRAYdEfHHgYxh2FnFYnOIHfaVcPDyHH9tg==
X-Google-Smtp-Source: ABdhPJwDqB7YQsUgpTiDi8dz4bVA8u0mmVaySZpPHfwUYb55Yw/tTqpKg38eI3JZzm1BY1yp3AJop/5Ze3jC0REs2NQ=
X-Received: by 2002:a05:6402:1c8a:: with SMTP id cy10mr5169121edb.232.1626337924124;
 Thu, 15 Jul 2021 01:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210712210836.GA3636@cephalopod> <CAMRc=McqKfzS8EVA-RUitZMwn_TFQEzU2AOuTTxvcdSX+xLj2Q@mail.gmail.com>
 <20210713214651.GB8031@cephalopod>
In-Reply-To: <20210713214651.GB8031@cephalopod>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 15 Jul 2021 10:31:53 +0200
Message-ID: <CAMRc=Md3YUHSUGOjmNfZxDqJjBp4Rwnc9ROhqbMh7uPGJFy+eQ@mail.gmail.com>
Subject: Re: [libgpiod] How stable is the v2 API?
To:     Ben Hutchings <ben.hutchings@essensium.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 13, 2021 at 11:46 PM Ben Hutchings
<ben.hutchings@essensium.com> wrote:
>
> On Tue, Jul 13, 2021 at 10:10:12PM +0200, Bartosz Golaszewski wrote:
> [...]
> > While - as you already assumed - there are no commitments to any API &
> > ABI stability yet, the interface should not change very much. I have a
> > single set of API changes in my queue that we discussed while
> > reviewing the C++ bindings and I don't expect there to be many more
> > coming after that.
>
> Is that single set of API changes the same as
> <https://patchwork.ozlabs.org/project/linux-gpio/list/?series=250005>
> or do you have more beyond that?
>

These have already been squashed with the top commit in the
next/libgpiod-2.0 branch (except for the last one). I have two more
that I will try to send out today. I'll Cc you.

Bart

> > Again: this is an estimation, not a promise.
>
> Understood.
>
> Thanks,
>
> Ben.
