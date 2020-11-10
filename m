Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6F02AD7DB
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 14:41:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730511AbgKJNlP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 08:41:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730391AbgKJNlP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 08:41:15 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62E4C0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:41:13 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id 11so14711655ljf.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dEJhY1zERWxEopN/whfB1JLtWNsq333saf4QkVZJP1A=;
        b=AxT+Pqd40H3iYJyuE/ZHIaheMsEV+0/SlK7CWrvf8h08tX4OPZbNWOa/t59rjMCSSb
         ZdmVNSXeqBKW0M5k+gW/2t1WG4dVSfjOhefg+eqvLuf0d8tS2IZTQZSRvN9cgFPN+3UL
         EI77lJHkue1CkJFPRA9w1L3Oc+JBin3wyGWfaCJh2Ro4mJZdbPtztpdp/9naIHcolqmg
         gWnS12ufV/fi2KmQu+0SuaZEu4cpE/S4GUPC00ODfg1XQYA3kC4Tu5y5asNjF+DrK1jq
         4+l7gAJf60ZcT6RbS1OF6eC+XEpSZbplQByEdksK4TWRUdYmKGrly67TwWrnUgsy1mck
         /HpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dEJhY1zERWxEopN/whfB1JLtWNsq333saf4QkVZJP1A=;
        b=S261ku+xZzY+eg6+tHjdRnDhgW8RbEonprhb0m2F5GHPKkBJbWJqUegQvuAl+UN+40
         w9aFB5NAIXcjKMxH7yYMI608tv3taCZt8KTo5vUb5S7K8A8pWBTP2GQ8ln+8edAV3LWY
         9Sz6t7R+Jq61miYsXT/quZ6Cr3dxMmr/IaA9rStSIermvoFFP+AllY+iVKYUqXgWnvKV
         3zvGoIMcuxXZl6HEx/WZnafPDMt3ibhxmEGZ1ROvUmazHFyolVugihP5p4JLKDkFnggI
         Nn3lXRYF8mIln7fr0eP5mNnr6OsCTdMf77EyYUEsdSZ6Xv94NdcFGWvISqfDb8HJ26TC
         5r3w==
X-Gm-Message-State: AOAM5321eaCK40CezVYaLXvYt7psE4/ZCjlsJjAfD0K6ZGXOAGbxfhhc
        QIImjBzUSKqh5EbcKAAT8zstvKhgjMawDjBoCPb/SQ==
X-Google-Smtp-Source: ABdhPJyKm+2t1eAbsc7coZRnQZMuYl/PiLgXGbRpSrPAOz96sa5SQMUqbuChaR73Dl03LC2/bBgXUK9vfaCex/s4xVo=
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr7594702lji.338.1605015672358;
 Tue, 10 Nov 2020 05:41:12 -0800 (PST)
MIME-Version: 1.0
References: <20201009060302.6220-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.1d75dfaa-ac5d-4795-8910-47c61fe5f7fe@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.18a45163-1aba-4d15-b42d-af12641f62ac@emailsignatures365.codetwo.com>
 <CACRpkdYLDUURK5yFC5UDZ3trQ8vN4pL_0zpU_FrgfhRUXibnLQ@mail.gmail.com> <d66dd1db-ec13-2fae-9487-beccdf73a7bb@topic.nl>
In-Reply-To: <d66dd1db-ec13-2fae-9487-beccdf73a7bb@topic.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 14:41:01 +0100
Message-ID: <CACRpkdaP+OZtv2L8a7i6mJ4-N3ajdKP9rRJag2RD+i0C6ZSvfA@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: gpio: pca953x: Add support for the NXP PCAL9554B/C
To:     Mike Looijmans <mike.looijmans@topic.nl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 5, 2020 at 11:30 AM Mike Looijmans <mike.looijmans@topic.nl> wrote:
> On 05-11-2020 11:25, Linus Walleij wrote:
> > On Fri, Oct 9, 2020 at 8:03 AM Mike Looijmans <mike.looijmans@topic.nl> wrote:
> >
> >>         - nxp,pcal9535
> >> +      - nxp,pcal9554b
> >>         - nxp,pcal9555a
> >
> > This triggers my OCD. Putting B before A? Please make it alphabetic.
>
> Nothing wrong with a bit of OCD, it's probably in our job description :)
>
> But there's a "4" before the "5" too.

My perception isn't as good as my OCD apparently :D

This is already merged anyways, no big deal.

Yours,
Linus Walleij
