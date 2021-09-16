Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80DCF40ED13
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Sep 2021 00:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240664AbhIPWGB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Sep 2021 18:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbhIPWF5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Sep 2021 18:05:57 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C0DC061756
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 15:04:35 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i25so24614583lfg.6
        for <linux-gpio@vger.kernel.org>; Thu, 16 Sep 2021 15:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i5Lmg3iciAlrjDC4HYZ2C7ch3bH7MUVQ8/StYpsobIE=;
        b=uyRunCrojHHgndv9BlQ2m1MYLAdoTFpcREv/G0+LkWkQwMrb5TmbVV45+d6AARDajn
         LHnK38ZNktHwjDAy96X175bBEs05CMkqLMNtsq0yXjGjZ3bT0jE8+pige7aOc8ZexADw
         FZnYNMPC2WtHR2uqoAuWqZmg1gK5CXh6rrH6bPHEb14LxLDdSkypexUfSZYyR1fDjCAH
         99W+0TKpY8lyQOx+RhgpCqjBRgJDZ12waxlU+XXJsbrJxqQQyqvczRqf/lN8epXDp3Yt
         NvaOB8iQE3qtl1KFvL3zghOSiWK/HrhVgk923F2PHSzhnKHVtjUg3ep0fFDhDy9hf8h5
         CRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i5Lmg3iciAlrjDC4HYZ2C7ch3bH7MUVQ8/StYpsobIE=;
        b=kTlJyJas6pXQ4P6wttbjZ10XpdkYmgED5XCk2p/9fPTayxGuuk+FKxQvnK6gVudLrZ
         OzRyvRC+cgGG0pC3xQwf9FHTvEbClXxmcIlmyrqAp9SLq8DpiwMycYVZJu1sY01dt1bO
         exNSeOHbA1FD1grCb2UKLwaePEm6AOhEpG2tmPlg7uPuEZT7TbCQgZFeLw2+o4gCQhzu
         5nrgRr/yfECht6ZV6VST6b0o+fm7A8m+kcYvE96/XdVu7vefR2CncgXNMkUUMwpwVhxZ
         A57aqM7Wu/y4txt6DbQF6iJu001+xnock3w2Xvc9+flemIN3jbkXQdXGwIVwXvKUOzqH
         Q+ew==
X-Gm-Message-State: AOAM530IKY+YEfK1QRqdLSaK968fXk82UcaDsavDe4BdEONe8me9n07F
        qSxpNOwfDgYEJEPFS7F/C3ruJj801qpZGejTEHDx1O1RWn8=
X-Google-Smtp-Source: ABdhPJz+IOU7LRAUnUDDYa/u7Us4BS0iYQAVccCjV8lzjn3X2MhHKjEqsVxjTkjJaZ09pjLDZo5XcJYChjHD8k22cEQ=
X-Received: by 2002:ac2:4d03:: with SMTP id r3mr5891598lfi.339.1631829874343;
 Thu, 16 Sep 2021 15:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <8b75e5dfd9363f35ebdd7812e119757379678f97.1629877281.git.michal.simek@xilinx.com>
In-Reply-To: <8b75e5dfd9363f35ebdd7812e119757379678f97.1629877281.git.michal.simek@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Sep 2021 00:04:23 +0200
Message-ID: <CACRpkdZd6NfvVXGYsuqbOEYZ28brQbqNRXYWqCtg1Bei6w4jUA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: core: Remove duplicated world from devm_pinctrl_unregister()
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Michal Simek <monstr@monstr.eu>, git <git@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 25, 2021 at 9:41 AM Michal Simek <michal.simek@xilinx.com> wrote:

> Remove duplicated "which" from devm_pinctrl_unregister() kernel doc
> description.
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Patch applied.

Yours,
Linus Walleij
