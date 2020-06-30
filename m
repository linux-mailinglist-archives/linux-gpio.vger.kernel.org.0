Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B929820F2E4
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 12:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732549AbgF3KoC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 06:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732238AbgF3KoC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 06:44:02 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3832C061755
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 03:44:01 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id g13so15148131qtv.8
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 03:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4bCn6yAxhhKfFCMfxCVtciONp8WZ4qR8ToxEEMbZF44=;
        b=yBqVphZLN2l+GICEPyL10FeKN9ReRzetzIG7z/Dw1a13xJeahZY2dwtnbAhgVfE2EI
         M4urXR3MvtejtzNKSjigzTH1DgbCjMwrU9xh+v3JX+n5Di6cw0Pd6JFWNggY+1YqGdZr
         bsJ2t9s9KU5sTYq+gN5JY2lFjfseubEdMPUBNbQqX9cIwnv7/8kJ1xmXmGP0ZTp2oqeZ
         XVSTj0z3XFyhtrxvzb3sUOcJ1Xarw0F0oe0OpoUgNJKv5k2VWqwHSQu6K8CZUV4jjr8T
         rEwyjRixkrYP8Jz28ynJzG+jy1hPUdvO4HQ8pfaRZYB72hYb0LnS9l2NIenJi2bQSRZ+
         n9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4bCn6yAxhhKfFCMfxCVtciONp8WZ4qR8ToxEEMbZF44=;
        b=MmTStmaafscEcuWjM9jT8hMUjm8jRfQFZ/8i2ieEofwx7KvJlEYLtlQLi2CG+xEF7Z
         INvyyjNy6V9bCYXppMqm6IQu08CcDkBnP69rg5OJRbyrYHtvhMNj6RHp8pQNXCrhkx8d
         JnEK6o/B/vfXvNAcZPiAONKQu4F94UzM3/zwhhAwFh8jCg314S3+MN2EUAHUWTci504z
         /sbf2f5wFUAo6lXkPDMUYY6gWn0ZujZTkzQJElUT01dSEBK30K4Tw+BFZxPY78MuoX00
         wpSP3a4dMzSwDj17xynaBUVnfMYBF35vORWUF56WN6C3FZ04oGk/Nj0CfA0531Hbc1OX
         LXiw==
X-Gm-Message-State: AOAM533Es8Q2j03csdf6G5gT0ovEoi4goFvJQpfnVdEXKvAqhfwDwEWp
        AbC7gvXaiNq5yuXGlrnUffkbezFgnVqtA1A7DzIIQw==
X-Google-Smtp-Source: ABdhPJxgyHTPl/MdV/H9MRuo4y6SteuggF7clPqfYLQbfABBIYlSRtJ9cr2JB8tHJDCz+48DSc/0k9bEa0nCm5jNi3w=
X-Received: by 2002:aed:21da:: with SMTP id m26mr723714qtc.197.1593513841134;
 Tue, 30 Jun 2020 03:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-23-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-23-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 30 Jun 2020 12:43:50 +0200
Message-ID: <CAMpxmJUNHnPxgv3hvvx2GuVZHjCE3DJ4CiEqA5o5+KBg3Udw7w@mail.gmail.com>
Subject: Re: [PATCH 22/22] tools: gpio: support monitoring multiple lines
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 23, 2020 at 6:03 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Extend gpio-event-mon to support monitoring multiple lines.
> This would require multiple lineevent requests to implement using uAPI V1,
> but can be performed with a single line request using uAPI V2.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
