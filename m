Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6022AD8FE
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 15:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730306AbgKJOlH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 09:41:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730059AbgKJOlH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 09:41:07 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF5F4C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:41:05 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id i13so5546437pgm.9
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 06:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=94SMVHlHxacGDgm2q3giI2hZLO+mR8k8TKdaWeq9tQ4=;
        b=pXEGHrkBjX9Y6T504uaZk4TfN5NIJ1PSdjIKU9x1hv+5KqxtDiIKIljXLVBql61sYz
         wt172j/5hWTUPqt+gyNjS7DnwT+0W1mA59Cexn7HfUgGzp0ZuQ5AqN/CkZjO3tqJZQB+
         auDLdXvGaA3Wf+N+fW9SOusWkUWSBl+Gv7K78KlRPRYr+PeSUkj9fDzOGHZ/wdZgxunf
         XHWwXQFDDEYbkIAx+Tv+Wa9p0Uz8Xlj5ZKa2dC85zl6Dyy1+VU+gUcQYPgPjH/8vM2y9
         K0QwTfrQtfD6xwBZ5wEySfRIluZnQd8WbhJWfO2n+AqLISq1+cQfqLVZjtjj0MLN++Q4
         Ta5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=94SMVHlHxacGDgm2q3giI2hZLO+mR8k8TKdaWeq9tQ4=;
        b=atTCIJIWqxX3pENE3z39vCvD7qAB93ctOZDQrP9IJ6lc6XO2cIJtOVrtMw3NCLe0hX
         uuYglLH8+G79OJxyDJxQ7WL4fTlr0NoFhNkQpgjFhirbaEPdTvmFRh/X+lkz6PNMa5LT
         9BYl9e/BpSwOW39hyIKLL9CsHw1LgNgcEDBRxvJNx6zLTzL3HKeVqYG8VssfhaLYy8sZ
         0EQxcaT4F/FVLodqG5D4oqfBf3k9oAnKAsSahftW9XLIfV/3gf3M12GMKm6m4ItIkHiG
         duLj0MfAL3GOzfWkfki3coY3VfQEJzPKsMn+U98lzJRm65Qbem+gC0M872FeNnyZkiiL
         w/Ug==
X-Gm-Message-State: AOAM5316GMNzHTyih0q1fnMjxuytfKELQyYbtabwKQZaZ/O4/6DjKzGU
        Y8NRozcKwZd1g9IHFDHeTOde6vr62ZYQuJSnKvU=
X-Google-Smtp-Source: ABdhPJzXZsFYBfKWyA4ohwJhykDOLRZvN4cSFmUokAvQIHyC+iQ5jM1j+WGdwjUS/J/UAZ44lIcVPsePRjjR9jm0cuw=
X-Received: by 2002:a17:90a:4816:: with SMTP id a22mr5716497pjh.228.1605019265472;
 Tue, 10 Nov 2020 06:41:05 -0800 (PST)
MIME-Version: 1.0
References: <20201110142724.14760-1-linus.walleij@linaro.org>
In-Reply-To: <20201110142724.14760-1-linus.walleij@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 10 Nov 2020 16:41:54 +0200
Message-ID: <CAHp75Veg_1S76i7by+3sJNhb3to_V=Qs8t_DydewzUYFtOhNUw@mail.gmail.com>
Subject: Re: [PATCH] gpio: sysfs: Enforce character device
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 10, 2020 at 4:27 PM Linus Walleij <linus.walleij@linaro.org> wrote:



> +       select GPIO_CDEV # We need to encourage the new ABI

While I am all for new ABI, I don't think this is a good idea.
If they are brave enough to move to old ABI it should be a reason
(supporting old scripts all around the product while updating the
kernel, comes to my mind).
But at the same time they may want to keep a low memory footprint.

-- 
With Best Regards,
Andy Shevchenko
