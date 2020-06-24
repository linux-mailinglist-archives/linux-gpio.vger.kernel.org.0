Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFEF22074EC
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 15:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391098AbgFXNxk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 09:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391067AbgFXNxk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 09:53:40 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A95C0613ED
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 06:53:40 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id l188so1813541qkf.10
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 06:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mRYyM0zIbTqM68BjvlCr5uVHmxe6eetV1Y2qfNzGsZM=;
        b=QMdo0p8hDI4oUxlGJ6mKTHrE9I8PX2YElUaRnEJgAceas6VgcEISoKLS5RPVe7WFDF
         32KtmlRdhAmaO4ahS4applF66ZAqe/3P34ZvqPWuxynVAcOf7zgj5ZY3LoSmjEgt3qwU
         DPP8V8jT6tUX8hQqLQpMN3qSEFc9KwWa8t7BZMYm1yx5wYfgATgYQCBEOisWdijwwILF
         4tDhPSSTcSZkm6bp2sLvSBbLWGl71d8JJrOMFcLIuMd3t9ArgeGOOP4oWnkwbKSI5ge8
         FfNwpXgm3RjuMCxP72lw1nD6Fa+huxcZoXcG4iFecfcHvDQ1QkZrEwWbIhdqencn0bTk
         Xhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mRYyM0zIbTqM68BjvlCr5uVHmxe6eetV1Y2qfNzGsZM=;
        b=EDOcg8GR1xetJpwcgjL0onog4wOpFnWF9gfnGFYMunI4xUiwNwqgsqcHe1RaHBJSe+
         zk9/EvAoW8YLuABIzdi6XDTn6obobiHr3UiwijIh7Vezx6c57OMUl2MpNGCuZf1EpmpS
         JTyqVi/08q8QFkzI47xwWkLPpqAaRlUVX+DKMDgF7QfjH8AORiOqxum1+G9vTjTwNHty
         2wS6thjKRgk6jj+brE+yAHVehhO7wqYakBxbfU1j2fvq3kByWADpxRmoYp6KS+IXcd7A
         EooBPqTexTRMWCI052bxwm+L2ut8vHYc5GUxlQdhoVVoDuXZN8xfvVHo5dTerNXk6yjn
         fMMQ==
X-Gm-Message-State: AOAM533i/7gRVWSQpOAxouLf94Z0q0+wy1t4qScZcvr0E26oZNZRFNTb
        RKJOBXbH7qqiWamjurTUZ4EBnE1cnoqmXmUUeo9z9Q==
X-Google-Smtp-Source: ABdhPJzLrJsp8nI9YPn+rBVjga4ZfPE1sjzOTMQdbFWUEbt8fB5HtHHrlaJtml/YlcZA315Y+hVMaVc8OM65rS07uWU=
X-Received: by 2002:a05:620a:1114:: with SMTP id o20mr25806203qkk.120.1593006819575;
 Wed, 24 Jun 2020 06:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-7-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-7-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 15:53:29 +0200
Message-ID: <CAMpxmJWuoTGOvptmP2Z0RhW7eSeFLZSsHXx3d25o2AuV-u5wkA@mail.gmail.com>
Subject: Re: [PATCH 06/22] gpiolib: cdev: rename numdescs to num_descs
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Rename numdescs to num_descs to be more consistent with the naming of
> other counters and improve readability.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
