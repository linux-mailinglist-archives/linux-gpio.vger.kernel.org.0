Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83F3F17BC22
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2020 12:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgCFLuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Mar 2020 06:50:14 -0500
Received: from mail-io1-f47.google.com ([209.85.166.47]:36114 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgCFLuO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Mar 2020 06:50:14 -0500
Received: by mail-io1-f47.google.com with SMTP id d15so1807669iog.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2020 03:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9MxnXKR0zcOOwRaU3HCL3rfhWFtixndLKOjhKzLlDLQ=;
        b=EcMSvyokJ4zeqiy6WAz5BhGN8MChxA+2bWJn5XCFeRjrgqRCi3s7rC7C+SVykHh+Em
         QLQzKb/0fS5pGkgXu8vyQD0lxuX5TQY2IdHbh8kdIQ+YVtHpeuDw8s9nF2ig32QBFV1A
         Ow1bLNDZsLbmRPKkmvD+dlmqU/93rIkK7RRkaWx9TQA3rt+I+QsJnXvjXa7ykwaI7RTt
         KemPRFrWPK+E+tF50Ynm1lmOf+c/TCs6n9koSFihl0TYm9lE5ai7scs2ABsS6KcOkR70
         bQ43qxsDiq7q5BGmBSdFZEYDYhQTE4iD6uaEOQV0+WiOkxYf8UG0VpVQfPxPrsBBVUnc
         cbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9MxnXKR0zcOOwRaU3HCL3rfhWFtixndLKOjhKzLlDLQ=;
        b=aBZO/K00QquZeoHIjNLTOXkG/xDV3H4SmlHdzUxXfeLQSG4Q0/Vw/rikjgjFxHuXmu
         yabpXcmxN0sVoAkj6yvw3JqT6fyLa1WATEwcKIYh6FUExcCHo9UhvdpaaEZVei6Ihows
         Id7e933xJYBVpzheQxTQcIzysZnXq87YWYZV6MPnVwTlu6Xfh4XtJorgwlc2NmLz/m3Y
         1C5Rlr6PYwzOo1if/1ZSUxNQ3nn4/B5MJqJpCJqnZVD5DWPNBsFznj3l2ocI8dqwYi29
         YCYIekWNzQFuWu2Z2iFCiMwzTvUc99kOgoCRi+GXeD5Lh8osoP9TkN3bb++BIP+CGAl4
         1gwQ==
X-Gm-Message-State: ANhLgQ0eS+bEYLcwLPl8zwLbradmuWKhbTqrCGe5/TVv8LSGuXy4De+5
        QXBk3sDF5Unt26ajeZRcyo62RkkSu9kNH2AylnyY+/fA
X-Google-Smtp-Source: ADFU+vsvqJ7pB72cC4Bc81p3vUMkV+NVJ0jauZgw6qz/+FeUy6BiT7RZ4ewUNRsPN0/p3fcWFJBocWlVCPZClSnzNL4=
X-Received: by 2002:a5e:8204:: with SMTP id l4mr2726974iom.31.1583495413615;
 Fri, 06 Mar 2020 03:50:13 -0800 (PST)
MIME-Version: 1.0
References: <CAP6JJ88N28Tn+j=jonj8fVWmoVCLwK-4_6e-Vn8z+E7WDFHC=A@mail.gmail.com>
In-Reply-To: <CAP6JJ88N28Tn+j=jonj8fVWmoVCLwK-4_6e-Vn8z+E7WDFHC=A@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 6 Mar 2020 12:50:02 +0100
Message-ID: <CAMRc=MfgpwTM54oVkJsQ0ue0uibj0OMEDZHOQPEabPkRPSm6CQ@mail.gmail.com>
Subject: Re: libgpiod gpiod_line_request output and keep existing value
To:     Mark Deneen <mdeneen@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 5 mar 2020 o 15:57 Mark Deneen <mdeneen@gmail.com> napisa=C5=82(a):
>
> Is it possible to use gpiod_line_request to set a given line as an
> output but retain the current state of the line?  I can not use
> gpiod_line_get_value to query the state since the line in question has
> not been requested yet.

No, because it doesn't make sense. If you're driving the line, you
define its state.

>
> Let's say that I have a userspace process which sets a gpio to high
> and I restart the process.  I would like for the output to remain high
> when I request the line again in the new process.  This was possible
> with gpiolib+sysfs, is it possible with libgpiod?
>

This was rather a side effect of sysfs keeping the line exported
without any user-space process controlling it. This is not the case
with a character device where if the process exits, all resources are
freed ie. GPIOs are tied to processes rather than to a sysfs
interface.

Best regards,
Bartosz Golaszewski
