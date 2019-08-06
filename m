Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 534CA831DE
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 14:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbfHFMvr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 08:51:47 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42143 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbfHFMvr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 08:51:47 -0400
Received: by mail-lf1-f65.google.com with SMTP id s19so61020983lfb.9
        for <linux-gpio@vger.kernel.org>; Tue, 06 Aug 2019 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MDc/iQ2eIDlTo16ZWykx7RVMjuZ37u5TnDlQkdiMrVE=;
        b=hz/VeKXGCwcPeqC9aqniT/RJo9UsBFi4+GG6MKkr1WVqOMa8ERN48EY+V0w4Ej7juJ
         aD4yF3mMtWShOw45FzaZwEZQ/GISnkbz3c1VOYxcrYhvmWv0OEN1cx9DmvJskcPZxOWv
         v9SZcPLSwIjn4rPCTbgo24zJcBqw9CKa7rK5+TNtrJ3ne+c34h9T3Y6YRcCLlA7EwJAm
         5A4d9O5pEhAa1bJ9689hIIGgMiqGW/CAr+K3hCqkuyf+CWESl2CQoUx7Dc6n+6UdLGwp
         8mUHILWIlT5Qn+34InIequttghioMTJEx5Pxqjo5kvcvSJKWUGF4XfRWosv8lOSeuoi8
         QOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MDc/iQ2eIDlTo16ZWykx7RVMjuZ37u5TnDlQkdiMrVE=;
        b=g+pvIitCwfk3o74kw1Ia7vnFEtPmX8oFy2apzJHDHRvGEbCJDc2N2Kc5mwA4rBGcCV
         crMKrZD6sqvULXnQNoUlIWi6d34bWT6yXwqXRu3sK0UX7/sxlvOJV87B+cY8NPjIWak6
         ixSNqLXWJFhuLCyuGXSAieFZahrAhniCKcTamwIy77S580w4uEBTApO7CT0GVkk3jtMI
         O9gfQ8HdS3Iy3UpQnLRU6iITJlX3ihiXeWBFSUnhg+A7vgyiFTXZjotZrRp54pmdNC4l
         jgSbYzSuu9A3jTAlZBm1tQPuSCYFXioUGB7jgC0JimUt2tYF4hwlno0W6EVTwsrWbDbS
         qvkA==
X-Gm-Message-State: APjAAAVyTThFNy4XAMGG80+KlyEbfyMQqLDPT3uMSH79W+lIbMXU4ylQ
        WGnugvYkbND2JsVwmgp5iZA3JGIwQJA+5YZwKe94ww==
X-Google-Smtp-Source: APXvYqyoPc5AWlNnRVVNlec0etzZ5zQeCgJGmX7cczsuqE5p7ZaVinvzbmAOwtQ4FwT9UfgxaziNML++orDYb9t99XY=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr2471414lfp.61.1565095905361;
 Tue, 06 Aug 2019 05:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190804155117.4753-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190804155117.4753-1-nishkadg.linux@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Aug 2019 14:51:33 +0200
Message-ID: <CACRpkdbpZM3kDD=sze5aL-nbmO6YkYk2GnSqi+0tbq9YwSoabg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: nomadik: Add of_node_put() before return
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 4, 2019 at 5:51 PM Nishka Dasgupta <nishkadg.linux@gmail.com> wrote:

> Each iteration of for_each_child_of_node puts the previous node, but in
> the case of a return from the middle of the loop, there is no put, thus
> causing a memory leak. Hence add an of_node_put before the return.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Patch applied.

Yours,
Linus Walleij
