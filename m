Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D821622227E
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 14:39:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbgGPMhk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 08:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728225AbgGPMhj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 08:37:39 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14088C08C5C0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 05:37:39 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id z24so6928005ljn.8
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 05:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FnNUxYhFyuPQjKzE8y9GdlPHRlRogzze8BallsxYE/I=;
        b=g9UvVz1IghO8CDvr3aZ9mIYL/QzzwbZV0qKv5oxbeoa0mNux2Qp5PUNbBhhqg87xDd
         g6uoRA+wpRauJwHJxurVHR6uRsRZoau5jJIntD4/0xNdi+scGE34EIByS7TEvCk9RhfG
         8eF/1YbT8ZAXnOViaBofAayfledvBFnRliY+XTt/G63C6fPIC8hJHu9k42vEce050vpI
         1AXTKj6eGXmAKJXavjCgCVeqXb3DbXroIIQ1FkT9ag7ISugc6JO/hByHXZ4nZJ2zLQFZ
         +tMhU6nqFLtRaBS4uWTVFDlkcUKHMjqBkFGJMARYBPSraKo9S2TSkd6ZURodPY5jTiYN
         oK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FnNUxYhFyuPQjKzE8y9GdlPHRlRogzze8BallsxYE/I=;
        b=U3HeuGde4sW0lZ7MKe7XIbWMdEQJmMnUt/AVOKQKStKt2GLOX/XsefnWd8gyI90c7V
         tS0abGO0Z/zJQt9iD6XyanSgA1MCNLapzE56yYDWc3F5KZWZDYkTyQAMoYBEz6gIuHQ7
         yGVVYEM8FuyO1CbdynpW0w+eVMhikcf7Thz1M9VckjgKG+YAkMj6YWgOwKtX7LTtC3vq
         EqSmtfNt5BwVMMoLKb1CpG4/JQw/pvdlUPmI7PYC2KV1NhtMXF5kJcVrV1H/BnSofd85
         VjTruzAw6J2Yx+PSfiqDNXDIXnxMg6u2KfnZC+0sQG2EMu34BYTB6sa8SOZ8/dg0hUMS
         X+qA==
X-Gm-Message-State: AOAM530UgmCnGIBO2zPLboYihGdt5czc5CqsAZdMHkB4oUAhnJmjNRJw
        Hr6FcTK//alQ/D51rKEPcoG7Za5JtKDVhaFzaC9xGg==
X-Google-Smtp-Source: ABdhPJybAk/I23kj8/SY0qnJoUwGC9fYwenCCoXPb03yQn3fxzX9qPOPGUgzqfmQkszNRbJ6Y8gHbdedlO5cJ+meHhk=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr2024973ljj.283.1594903057547;
 Thu, 16 Jul 2020 05:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200630160736.1196697-1-mans0n@gorani.run> <20200630160934.1197066-1-mans0n@gorani.run>
In-Reply-To: <20200630160934.1197066-1-mans0n@gorani.run>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 14:37:27 +0200
Message-ID: <CACRpkdYxej2rfdiTVPZ-PR4BMNih-hbiBrE4MB6pbtzOCo9pFA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: gpio: Add bindings for NXP PCA9570
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 6:10 PM Sungbo Eo <mans0n@gorani.run> wrote:

> This patch adds device tree bindings for the NXP PCA9570,
> a 4-bit I2C GPO expander.
>
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> ---
> v3:

This v3 patch applied, thanks!

Yours,
Linus Walleij
