Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADE5371FAD
	for <lists+linux-gpio@lfdr.de>; Mon,  3 May 2021 20:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhECSbC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 May 2021 14:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhECSbB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 May 2021 14:31:01 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C92EEC061761
        for <linux-gpio@vger.kernel.org>; Mon,  3 May 2021 11:30:07 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id j10so9454181lfb.12
        for <linux-gpio@vger.kernel.org>; Mon, 03 May 2021 11:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xXjFgK8N0pszf3rbmmQcSMO5oH15ejleZvx8EyiEDM0=;
        b=NbuS7r4kwjOrWTgmAA+cqs4QlDOAlxmBdqomM+5iiCWU2Aigr1NJtZphJTm+5jDLR/
         UPJgc8VwjZ/Vl1p5u1UTo5uAyAMfo21q4RwCB/3gd4uaqXyBE8snbAqhsy6g24Do0DSz
         B9UIW1YUcBUU1B6X6wsy+Khde3EekF5bq2qPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xXjFgK8N0pszf3rbmmQcSMO5oH15ejleZvx8EyiEDM0=;
        b=WT+oDD3RAYqPYnWEGWRmNi6p4ASRkGyP4Zv/4p0RhM2Y6oEV9m01jeGkEDZRl8SQiq
         ofxOes/5ewPuq4h5VsFbjt6Tvm1YHKVTrRfPDfGcFP+inMg/STbKCnjX2uWlWTjREvcz
         +J4cIjp154VW9EkGLnYPC9l3qS7ADG1Q1bsNxJ22r3DuJFxmHhfesXk1emodUf0GFuWT
         1wRDiGMobh0N50ET8dcLZ0MWU0tD9zn8SAP0jG1ZFujnWTuUuA1J5/bEKLRwlZDDzXLH
         rf7yynk9625AtMJte7H0PUppNB8Kxh9ThiGHoBB6Yg34AMWhAp946IE9gmo+/bCnoHvY
         Dlcw==
X-Gm-Message-State: AOAM533fR8VSHQpw5isH4NhkvVRzrzaBTl8kV6XCufUHHwWj07JtwX7X
        IdMkv3oeD8weT9UJeFj+Y4Di5to2qmqrgdZNpNA=
X-Google-Smtp-Source: ABdhPJxoRY9A+jEJ+HJ8yDOnEcfLa1B9UoUaas4OXbtofRt1k6DlQ2eCW6ii2csKwsjc6nY8ccbNBg==
X-Received: by 2002:a05:6512:3e27:: with SMTP id i39mr14564623lfv.581.1620066605503;
        Mon, 03 May 2021 11:30:05 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id q127sm1171992ljq.88.2021.05.03.11.30.04
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 11:30:04 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id j10so9454044lfb.12
        for <linux-gpio@vger.kernel.org>; Mon, 03 May 2021 11:30:04 -0700 (PDT)
X-Received: by 2002:a05:6512:3763:: with SMTP id z3mr13487207lft.487.1620066603979;
 Mon, 03 May 2021 11:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210502193216.24872-1-brgl@bgdev.pl> <CAHk-=whSWp3exv8tZ2th5im_P7HF=c6iuOOVb9iSrNrd6405WA@mail.gmail.com>
 <YJBA1iYK7npit9vn@zeniv-ca.linux.org.uk>
In-Reply-To: <YJBA1iYK7npit9vn@zeniv-ca.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 May 2021 11:29:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wis-uAQcSsu+OELg3atsdFvMNVjzjvg4X3U1z=MeaA8Yw@mail.gmail.com>
Message-ID: <CAHk-=wis-uAQcSsu+OELg3atsdFvMNVjzjvg4X3U1z=MeaA8Yw@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.13
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 3, 2021 at 11:28 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Give me a few hours; configfs is playing silly buggers with a lot of
> structures when creating/tearing down subtrees, and I'd actually
> expect more trouble with configfs data structures than with VFS ones.
>
> I'll take a look.

Thanks, appreciated,

              Linus
