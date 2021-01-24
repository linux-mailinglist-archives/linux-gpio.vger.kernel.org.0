Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEEF301F68
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Jan 2021 23:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbhAXWtW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Jan 2021 17:49:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbhAXWtV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Jan 2021 17:49:21 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947C3C061574
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jan 2021 14:48:40 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id b26so15077408lff.9
        for <linux-gpio@vger.kernel.org>; Sun, 24 Jan 2021 14:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k72UoikMLlx525q0BFl83qbEjXZdDbuFpiXkKFefd7E=;
        b=tQClYM4kbyiYhTRSSExdyfAs2c9urPQucz4RsGA9G5Tp+ic2fGnfWSGYI8mNO58P7n
         VcTgoH4/3psQ7/yj5Z11yCI1QNcpSfojkG4Yqdz562XyF4lIIFBNBEs+c3SN092KHeF4
         LXW8fO9n/M4yjjwQFYTiis3DeBA5I2cjKP5yI2+gaKcGuamMdsSMk4B9u2h6Zk2ONzuZ
         TqZnhy/XmsR46l//fJzLJmyJoME7GMfH2rvOVxfG40g9p9aN3rRSmwl48ppSCgKs1klN
         +XUL/VClN7zVuvd9pkqSmrTmcoedcYi1THqi48yXRzFl3bkbv/X+5PnGa9oL90tv4LU0
         vDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k72UoikMLlx525q0BFl83qbEjXZdDbuFpiXkKFefd7E=;
        b=MS0QcIQnUID5q5uEA1JML6VVfVYJsviMI8sW8JNec1ipmS/xwqm/lJkct+eyaYfgGe
         fMS2zBYILZcI+VgY82cwoy1YB5BxnBrTS/gahZTY1CDbham6FFldSR3Jm99BjYVqbF2k
         w8aJmv/IjPB5t6FE15XozSIHeQSYx/GA6MOfNN34cv1nSwEmIlTeV9s8q6Hy6YLafb0l
         soFtaokYkHHiScZsR0vKjuDVEI/GX4l0oqnvONOgv9rlh+h7zDkRClKkfS6W1eqQK6fg
         sbpPmf2W/cmEVjcBsNNL7r5m+lP395Uh9n/qtB65qo7nKM7PG0LE9KpWWfhNtoHCuUJz
         Y8BA==
X-Gm-Message-State: AOAM530tq1nfWisPffRKeh1dZLUChlvJuY/0Fk4fs3amYEcaKF3x8e6y
        zbGfPIAocIPwoGZvdhgDrskB3wrQwvE81kF+tb/d2A==
X-Google-Smtp-Source: ABdhPJz/+nrjIGb4xXZxfzfhXVYKkT7wQAbKzwhpCYComLn0ZFzcN0Vb7Ug68VyvxtG75sQkk+k4Ro/onASsTCi2eSY=
X-Received: by 2002:a19:495d:: with SMTP id l29mr264084lfj.465.1611528519160;
 Sun, 24 Jan 2021 14:48:39 -0800 (PST)
MIME-Version: 1.0
References: <20210122193600.1415639-1-saravanak@google.com>
 <CACRpkdYtToLVxyMxC=24AoGVk89c9FyQt899OTz9Jx8yJeu+mw@mail.gmail.com> <CAGETcx8Zozoe2BuP+zmJhQkJ6V0gJ1mtf5907BifEExw8s-zvQ@mail.gmail.com>
In-Reply-To: <CAGETcx8Zozoe2BuP+zmJhQkJ6V0gJ1mtf5907BifEExw8s-zvQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Jan 2021 23:48:28 +0100
Message-ID: <CACRpkdbid_LbxfmJ3cN7R1jupvOxeY10tXR=O79LAqgqg5H4ug@mail.gmail.com>
Subject: Re: [PATCH v5] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 24, 2021 at 3:54 AM Saravana Kannan <saravanak@google.com> wrote:

>  Considering the "Fixes" is only in driver-core-next, should this go
> through driver-core?

I think Bartosz should pick it up as a GPIO fix for the -rc:s
because it touches code that he is managing.

Yours,
Linus Walleij
