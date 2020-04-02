Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D08B819BC63
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 09:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729033AbgDBHRw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 03:17:52 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38487 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgDBHRv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 03:17:51 -0400
Received: by mail-lf1-f66.google.com with SMTP id c5so1840712lfp.5
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2020 00:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fGCNVs5ms+lfI0CqvvFzJ8SjCEm1mygHViFV+/PrmR4=;
        b=GfdUh7lZPjm9bwQlg79L00pNMOPlKxDtoFbKZClmGM26yDTyHmPF1qTg09jr2z9bGr
         uEKEaRueCHjqaGoIrOTLA794qYcrb36uZX9OM2tZh6uxtlbJs5FvlShnqs+bd5T9+Qjq
         gQNcWL+FzOuH32elDuDeaGOuJVuSFH+jZ08Tg9LED0VTyPRNo9JpDCtlW/yN+14uhhv+
         hzxM111FMW6KJy+McBkKhD9PWZe0ugqv3nAG+IQCoI8cpaNMjFJQ33roH3HcFZQpNFE+
         ETsOpAo1b9jS/7OmtFzCNIHPKSxjG/eol/0NfYHnP44L+XHq+YOmiOxD/P2MUDwAaxw9
         BrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fGCNVs5ms+lfI0CqvvFzJ8SjCEm1mygHViFV+/PrmR4=;
        b=JJ8twOtfoEV6XWtevok/3u8JhKQYdHGa04KudXTYkp3pFa7I8SGe7xNjdvY/R7n6vs
         5KflGug0Zl2NUEFYyOlx7Rx2hBB4MHGks1WsYKc9wenzrvB/SsFo8shWhm7QgygCxwZ+
         y2n7N9yZV4sadS+YA5C+TKBLxpS3xRRXiNomvOcCT3N6j8xSwgil0FhubQ85NCpmGUAr
         hp3XBifb8VgS7T0j6Ye/qQETp9pMeHNI7ZJboKlFIfU4qzGiFwSolGJQwpiBuqoKZp92
         s0uvcxRxAzqMqGaWJY3S/fafguDynwDj7zG+C6h6jplQxqFVYifE0vvD0G/fPgf2aPV1
         14Vg==
X-Gm-Message-State: AGi0PubLOlHYxM9JX193gHxUmbMTQj7q2eHOkQVAGrNO0emPeZAkx7Us
        3UrnE7SL2egUnmecTRIw6SFakf+fxNspxIVl3gUaAw==
X-Google-Smtp-Source: APiQypIEwnj9tdj1jrTHeJRfpuyBzCigYfOdOccOf4IjRg+tWNOyfZS9d/Mf38dVIkuk4m0qLC0dZK0xj7ZMRPC8i9c=
X-Received: by 2002:a05:6512:52c:: with SMTP id o12mr1096197lfc.217.1585811870053;
 Thu, 02 Apr 2020 00:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200401200527.2982450-1-thierry.reding@gmail.com> <20200401200527.2982450-2-thierry.reding@gmail.com>
In-Reply-To: <20200401200527.2982450-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 2 Apr 2020 09:17:39 +0200
Message-ID: <CACRpkdY8etT67jsoz9UHwsXcCOXwb3j5RjkoikgOx09-Nr-+xA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Unconditionally assign .request()/.free()
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 1, 2020 at 10:05 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The gpiochip_generic_request() and gpiochip_generic_free() functions can
> now deal properly with chips that don't have any pin-ranges defined, so
> they can be assigned unconditionally.
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied.

Yours,
Linus Walleij
