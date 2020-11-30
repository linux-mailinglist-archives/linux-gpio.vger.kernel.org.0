Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9AF2C8F39
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 21:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388446AbgK3Uaq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 15:30:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388430AbgK3Uaq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 15:30:46 -0500
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52DC9C0613D3
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 12:29:59 -0800 (PST)
Received: by mail-io1-xd43.google.com with SMTP id d8so12023325ioc.13
        for <linux-gpio@vger.kernel.org>; Mon, 30 Nov 2020 12:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8KcxZoOEuJO8hSUaGb/JM5TRJ+3UMMH45VyW9y2ixdM=;
        b=Mo4apLg4ZsaR9pRDNuw7dph/LLuRphjGElGwhRL2B+OTFsjGQ/EQA9KL73wC7ubzMK
         4Qw3HioaLe8cx0G6Ynh8TVP/o29eEWBB10OMZHBil7nj0p2xfyEqxlLunNcI8AQFOWNE
         1zTT7iGYU7fCLfOdp8HoYw9DgsaNGE0z/a0z0wIabi2fd9OBku2wkqqyMubqIi0RnIKz
         gdQIm8vTf7rTT3tiDC/Gx4ujSEJLirXp1AfkjUyv8Lj4rO8bg+EvAXuIJLHM6hw1L8gT
         0/jCeycMQg8qYY+43dade0JsDlu+FF8GR5RnaSDmxBX0q1Na26go4Q20k/WIIeFk8WrD
         GiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8KcxZoOEuJO8hSUaGb/JM5TRJ+3UMMH45VyW9y2ixdM=;
        b=j7aWm6wJMhoTW0zbrPw0kLmZFQcyvxaD1juNLWwsm8G/g6NxB6dOdEZ3URBr151SDV
         Rl31k8N3WSRykdayZz++Cils0lzOo7MtXfWNhTo3z/noD/ZuiIwrFKHD+HBtKUj4gmn2
         gCWnQSqo0QZSTejdF+73UJNwcGZlXgG0VIAQh6DUPjPhIpOzuJ+x35y+EsuyjDgT46jT
         pVvWbrHxZJ+GR76ax311gShJrfMNEqxV9dcPuunIHG4kROHKW4CI6mvNioF/zYdbVPqe
         iJCooxRxUD2YniXjV4oHg+9WAu2h9BA79+4pFvBIy4z5q9Vs7YI3fvlJ3CPrCH7TbJBz
         5VUQ==
X-Gm-Message-State: AOAM532mBBV91M6bH5UjTn3aQ8AIMZEku1EnAAjhHBgu/VGuGvERdJF7
        WhwJaHBxI/P8tC8r/GCW1I5qhsEwuRna38GiNL3+0Q==
X-Google-Smtp-Source: ABdhPJxPlyeEj/QJDa0YomP0jiTPWZMcNHyMP7UzF/pXgOjWfhdStF3Q1UfBrME0bpTSsOBiGjcsedFcPerzSzCwrtI=
X-Received: by 2002:a6b:6c01:: with SMTP id a1mr17710210ioh.31.1606768198749;
 Mon, 30 Nov 2020 12:29:58 -0800 (PST)
MIME-Version: 1.0
References: <20201121144420.13806-1-brgl@bgdev.pl>
In-Reply-To: <20201121144420.13806-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 30 Nov 2020 21:29:48 +0100
Message-ID: <CAMRc=Mehus9L796u4tN=dKSg+Zt0sM=S5p3ddmc9m7J0t0o3Kg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2] build: allow building with pre-v5.5 kernel headers
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Nov 21, 2020 at 3:44 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> libgpiod v1.6 requires at least v5.5 linux kernel headers to build. This
> is because several new symbols have been defined in linux v5.5. In order
> to allow building with kernel headers v4.8 and on, let's check the
> presence of the new symbols and redefine them if needed.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

I applied this and made a new release: v1.6.2. I sent out a patch to
update the yocto recipe. Feel free to update the buildroot package
now.

Bartosz
