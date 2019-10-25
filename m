Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFD4E4385
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2019 08:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404279AbfJYGWH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Oct 2019 02:22:07 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:42624 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404432AbfJYGWH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Oct 2019 02:22:07 -0400
Received: by mail-vs1-f65.google.com with SMTP id m22so708847vsl.9
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2019 23:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oUL/r7QZtD5Ik+k2QRguXLUKLdY7EAed/NAwUT/KY9U=;
        b=YkJqbTmbOF5cohmL/g/+uoCAwxRXy1dQhsX1PJrYc6ElZ8izugxwmqt35fiIp8AqcL
         wOiGxbnliG6GzP0WPRZ2s4V+dOq+uRI5tY+C+Mm4LnoqjVCd/CGOepcsky7zo6cMaXCl
         uDSobeaCDFn5kRs03sTbj8x3yrW8ADJntp4xIiYPOVzpqhsOy23V57RnBjWzcI8K+hc8
         HLuGPhL9/FPvJBYaygHquxJGLTJswf1XRov/ecy5JC6D+xcwdPEv2XxTnWDVdxoX0Mzk
         ue07QJkhM2Tkqcenl8WeqMjvi9tw+lsyfkI6fUhrLmzj0e1UD9Woh0fl8ljoqRE1kLy+
         9NVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oUL/r7QZtD5Ik+k2QRguXLUKLdY7EAed/NAwUT/KY9U=;
        b=mod7YTmyO1EQYKN0LAN5NUDkWBiUa0kbbe7nO8MT9L6jGWQw8v1EM35SYZHJvAF5yh
         YA6Uq13YVWO0yeCUWodIFqhBsLQOUISjpT980LNx4SCxnrKqiZwCLm+H03DTZ7JWRiV/
         JU+RdbzLPLIXfrXum+TXKIino8BItIfI+zJJcTl+CcIwCNPH5K7QDf/YM6uq/HUj1hQs
         wa/IqV9o5GkpUYvrvj6HeqwdvVgeeCE7Uot44VRBeM/5at7Ki+D5Ty4NgjZB3gMn4SMj
         wJY326jeqgfcmRHDSEPfhushdalftANuPMaNTMhMdj74IAB2XORzsUk5BBDFAXkRUZBC
         tDyA==
X-Gm-Message-State: APjAAAXwGUWJOLxEj0rUiux+uZ8RxkEiQmA0zOqzf7UW/dbJLTtIQbON
        brsnauGbwIIh4kbnLgKke3ztE2PotPdKC0m9ndbbCw==
X-Google-Smtp-Source: APXvYqw5kucyKKTM4IBkVmuVSkXxrf+2icqFYYo3E7o0rpC8KcPOlAdN91kDqK9Uvn+4QRgO8N4e4C44TueMtYXlkNI=
X-Received: by 2002:a67:7944:: with SMTP id u65mr1136558vsc.10.1571984524684;
 Thu, 24 Oct 2019 23:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191018101221.26483-1-geert+renesas@glider.be>
In-Reply-To: <20191018101221.26483-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 25 Oct 2019 08:21:52 +0200
Message-ID: <CACRpkdYodPRSb0QKLaPQm6k8Bk_N2xMvuR4c9v6rvFAAOPodjQ@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: sh-pfc: Updates for v5.5
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 18, 2019 at 1:01 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.5-tag1
>   pinctrl: sh-pfc: pfc-r8a77965: Fix typo in pinmux macro for SCL3 (2019-10-14 12:11:12 +0200)

Pulled in to my devel branch, thanks! Sorry for the delay.

Yours,
Linus Walleij
