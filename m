Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6202744DC84
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Nov 2021 21:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233437AbhKKUd0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Nov 2021 15:33:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232666AbhKKUd0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Nov 2021 15:33:26 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAAAC061767
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 12:30:36 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so2660763otj.7
        for <linux-gpio@vger.kernel.org>; Thu, 11 Nov 2021 12:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dzDzVYR0M79hyvBHJE7uEcbzBg19CocEHZEJQr1HHzQ=;
        b=NZlNS3eUQpdJ3o2/+AsrT/n/dxmcxrDHDhg1yvQbaochf9CZ2dWOE2nI+J2ZJz5BMC
         WT3qAHVZvZbF/66Jx4Ws9hcwsKSZtxnm5RsM9iZ43F49NSMr/8Y8l7N3T8PEE+lcwpxB
         oFdifq3Scxa8UW/VYxeSlEuSDRA2Zmlkn4rPT3t6W6VEr9U3/C4vMWv8OWnzIjxfNwnw
         WjyYkRsvuSLNEKLqeDWH13qIMiar0wGTIqCaTnYzyAKUD0uLF2ZtYMx4QhtjgF2hP0vj
         e181VIOKqUjibj1m9tqESyBJRmtA5mOom2Sjo9GyjsoF2iTfV9dth7hAUiAvjW32h99j
         IRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dzDzVYR0M79hyvBHJE7uEcbzBg19CocEHZEJQr1HHzQ=;
        b=iYHUDTX2f29wqcZKqEYK8wLoN1F6id3CaKVcJvYwa4HED+9BAo3C7kdoAjC/h4KqMU
         XSz7dP8iT8Uk2FYN/uZcwT+8gc4PnzHXnwaLG0x+A45//uVz5W/l0+jmudKa1BwQEg8o
         PioV63iTORjMA37i9wWFGMvAG1dBh/5kFv829NOJRcJAAY//ufb6Cjjle6L6kuJvDSr9
         uv7lnCUhDgizlw7yUsYM7v3rYVx7kHVfyPQxpUqJTNjorpNKE+72IqybjFilzz/Zdo7+
         cN8WQPOl34x7pY2AtiQ+1STpoqkSE8WgxeTd97INDskS4abY65Nx2cdDNSsbgjJqzk27
         6K4A==
X-Gm-Message-State: AOAM5300OO/ApYEoOSpcQ0XeRcM6uhh5YotiqI1qFH50n0PCEKiKI5RY
        pbWBoSU8HKffOdQC1hhtZ2LW8n2I12YgbMx5d8BTwA==
X-Google-Smtp-Source: ABdhPJz3uUybVw3PcgXJ7g9JJ5cGGITzZNQRPuK3gNfmchhxxdGWbOxvN5+5U2L7vuPhsMx6ltALjgy8yqbnPQzgoMQ=
X-Received: by 2002:a9d:6348:: with SMTP id y8mr8262289otk.179.1636662636167;
 Thu, 11 Nov 2021 12:30:36 -0800 (PST)
MIME-Version: 1.0
References: <20211111202506.19459-1-brgl@bgdev.pl> <CACRpkdZ-DY3YVRDZmpU458wTqeNy0khdfJTNDk3UBjnX0zAUHw@mail.gmail.com>
In-Reply-To: <CACRpkdZ-DY3YVRDZmpU458wTqeNy0khdfJTNDk3UBjnX0zAUHw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Nov 2021 21:30:24 +0100
Message-ID: <CACRpkdY-_3LEZaLNXNLtuM-DUUS-DjMXM8GCsFx-MvnEU+bXQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: improve coding style for local variables
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 11, 2021 at 9:29 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Nov 11, 2021 at 9:25 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > Drop unneeded whitespaces and put the variables of the same type
> > together for consistency with the rest of the code.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>
> OK then (also results in inverse christmas-tree shape...)

i.e.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
