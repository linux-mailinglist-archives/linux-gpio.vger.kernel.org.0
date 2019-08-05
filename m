Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 715A6815DC
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 11:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbfHEJsm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 05:48:42 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35056 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfHEJsl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 05:48:41 -0400
Received: by mail-lf1-f67.google.com with SMTP id p197so57376124lfa.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 02:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KkdIbKxtJoBOWFj6VvUe9M2OrYsexpiagO5AWkdp1QY=;
        b=tVHNkv2mMZK3fy0EXhhTqp2nYQU+Rl+QvE1bdnc+n4ZSUCh4+158/Zk9RSXKga/tky
         ja5gmuQ0UaldVR++RFRsoq+WpwUetHGpZc08ejc0TGnDdiLWu6ryK830HJaCq+oU4Dtv
         M24eLKRBAKlRO3zjevgVGnhhTG6cmthW26PMIyxkvoLz40dQ+6k/UvglKCW2kgkl3MqD
         VUB/KtgvPBxweEQq6QSKPEpI2z74OHavDB/Hn7E67eCcb2J17qmbTaOZ2HwJrrgS8qRT
         7EQu0SorVJdW3X6Mz3JOeDQbxkgmfccL6J3yP035fmSM2gRknLc3XvjV/efMDfZYGPPp
         hrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KkdIbKxtJoBOWFj6VvUe9M2OrYsexpiagO5AWkdp1QY=;
        b=VwRkpwaSNHr+GCiQuUOxt/W3pIu8RTYX9P/laIZchMNjqI2cwaKNGyjEnRlEOHNvat
         8HP2GjsirITYAhS9LL4rmsV3cVgWIv3FTI1QNBUYMzSIymOlB0deGDcSkvCWt7RAxgr2
         ITkSgj96SkDmmEAJVuLnednnS9BPZ6B8U7ShG0/hfvuqCOWWs/SMLzQKiaruatq7yoXR
         zH0pTfVi/NUDNY7eVe1GQ10zVmBU9c1i7dH4CsV6tlRIP6wKoCTNiAs27yJna3n8nUWV
         fS58cucLQPmz4eQVRPHtQMxK+SWlt455V5EFlu7A6ilA6AJbVwZOLGVtqC6S+ATFaunm
         4YtQ==
X-Gm-Message-State: APjAAAXah+kMn086EL2x1a+lBWm+j+eCcvxiqtotzKzY9UFJVOzFxfQw
        Su3UyVWpHQpci1X31Xg4vQT5jaaTqGtmQipXodHjt/yf
X-Google-Smtp-Source: APXvYqzb+dhsstUbqkpob5Lx+uLQpUErNUkwjMHVYh4iOAolSRxr8q+ehJAq6U4svFibkUt9pwvQhcvO72T61SbG38E=
X-Received: by 2002:ac2:5939:: with SMTP id v25mr1303774lfi.115.1564998519951;
 Mon, 05 Aug 2019 02:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190722091015.20884-1-ckeepax@opensource.cirrus.com> <20190722091015.20884-3-ckeepax@opensource.cirrus.com>
In-Reply-To: <20190722091015.20884-3-ckeepax@opensource.cirrus.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:48:28 +0200
Message-ID: <CACRpkdY6WW-jKAygSBd0+6cz8TkLJXr8zfYV5Cs1YBW9k2Ga0g@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: madera: Add configuration for Cirrus Logic CS47L92
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 22, 2019 at 11:10 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> This adds the pinctrl configuration for the CS47L92 codec to
> the madera pinctrl driver.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Patch applied.

Yours,
Linus Walleij
