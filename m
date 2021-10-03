Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3EE942043C
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 00:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbhJCWL6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Oct 2021 18:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbhJCWL6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Oct 2021 18:11:58 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3B2C061780
        for <linux-gpio@vger.kernel.org>; Sun,  3 Oct 2021 15:10:10 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id y26so63758594lfa.11
        for <linux-gpio@vger.kernel.org>; Sun, 03 Oct 2021 15:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U9Mf9GI5Pm+kL+VrrV0E+/1cX+8MmlfNpjuTrHIHDBU=;
        b=yz+MMKs016NPuE07ZM/SC+j0anFa+U46jg+mEqlMroGgSo0OVRX/iofinaFE6ejX/x
         VmzstodfD09SW17AUy8oeN4nfpEg1VsLCoPIb3qX1pz40qF5uWpt7PQdZfFt4IkANUkT
         kbO945a/obo21YaI+yunotwvgZA8hGf4DX4wS+5Fqkd9lGVGx6BrKMR9YONncGZPmD2l
         Tay+n7KiAFQIa9c81prLgONI+BqzyXEFY5hXEdfBGz8n4MuJHHMfJAs/nVy7IAfWj2zF
         Od88lzNIPSr8M89btm4C01W7RyiHdr7I1IN5cmBmIA39pWY3OBgpEFZGEJrVPRfiQUmW
         aJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U9Mf9GI5Pm+kL+VrrV0E+/1cX+8MmlfNpjuTrHIHDBU=;
        b=ooNtg7vZNev+t2wFZBvfdasYzBXy+wlKEYXqW2VmeBEZJlPf+vzEIGyuPZbd9IWCY7
         LxSm6dPuxIYtshh/WPmAivPxe1NHtPOX8QW9+g/uIUPHYyxTQ8nyUJBRI1N57SXYPI/d
         Zh4Jtm5+oE118R8O7aMPAOhnXkZ6tPaTW/+riQB+5Jyz9QUQjtbyLjqwyl/ca4g1mq+M
         MO5CeKL35Aur8qiuKm8mfGd84b70rBrzGzb9L+Z9ETEtKLyTvbwefy2aMwvYiZN0JIc8
         h3Q56tGkAPOrZeSdgJ30D5a/zWxO6yYFA6V/rZPeqdbjJRlEcm8y7jBloecHRLhKhfKS
         p7NQ==
X-Gm-Message-State: AOAM532p7zDKiNVMjGLtDJYXpiQ/AdbXpcR03jZvfoToyY8LqeLRbLSi
        eaR2Kx1PALDHr7SugEXfKwU+qylQ5LWmVYM992gqbg==
X-Google-Smtp-Source: ABdhPJwXQxgJnBiCJXHiEECucos6gkDzEYPUpOuN9ryCXhy30bNBzWy6TPluZ4UpN7159wDQXClY4Uo7sDaMjt8BupI=
X-Received: by 2002:a2e:510a:: with SMTP id f10mr12187903ljb.358.1633299008538;
 Sun, 03 Oct 2021 15:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210930232617.6396-1-dipenp@nvidia.com> <20210930232617.6396-9-dipenp@nvidia.com>
In-Reply-To: <20210930232617.6396-9-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Oct 2021 00:09:57 +0200
Message-ID: <CACRpkdaO8ydTEkPU4LT+ibzb_-5VEw9mdvMbu+R9cR6zv9MsDQ@mail.gmail.com>
Subject: Re: [RFC v2 08/11] gpiolib: cdev: Add hardware timestamp clock type
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 1, 2021 at 1:26 AM Dipen Patel <dipenp@nvidia.com> wrote:

> +       if (test_bit(FLAG_EVENT_CLOCK_HARDWARE, &line->desc->flags)) {

I don't know if it's here or a few other places as well we could sneak
in a IS_ENABLED(CONFIG_HTE) to make sure the compiler will
optimize out a bunch of the HTE support code if HTE is not in use?

Just an idea, I guess it's not the most urgent.

Yours,
Linus Walleij
