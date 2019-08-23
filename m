Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD3499B808
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 23:07:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731543AbfHWVH6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 17:07:58 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44608 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388270AbfHWVH6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 17:07:58 -0400
Received: by mail-lj1-f196.google.com with SMTP id e24so10053098ljg.11
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 14:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qxArl4BC5lMXfAbZsIjscqztXwRdQABlRF+/HVmqKuA=;
        b=dvrZ4aUHnO5ukdACgBSiCGQebGmC8T0TuLXeGUoFvIWOtXCmUWfjfbwMlFeuKx53Pm
         BPFQBNC8cd87iLSOJnSBlkVmO0sSv49d/B2Es8V9NkLmIFRE6VMY3zJ0tP1Ci/42Y2eD
         OoWrF1G52j8RG+ZqRDDDyIC2W4GQXIUyuud2Bmc4SoJBFfzMpE+700ydBsJH9R6O8EBR
         wrDQjqEQXHANevp0HsEWovCuYJWKbu1scEK4pgyrwi5hNeIWzXwGfxk9arWLFwhhB/Zz
         LQqvdkLDiIz78sKgUPlOtJVoKw2dnH6tHN2/VKYC5uDhpZFq07AaNRs+55X4JEUVxpIn
         35aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qxArl4BC5lMXfAbZsIjscqztXwRdQABlRF+/HVmqKuA=;
        b=rpiwu+dAlwVtP8GESI/InhEZL9tNw+y1AxLolgtWZK/MYbahIQ8KR10e+d7uPmTGpK
         L8GLCY2ZtciCB2L0vK7N38HIi/ZP5JxWPCoJY/3z/xIcODyvh9bf4gbs3sc+8bSQl6w5
         s7SmllGOjaKpJtqNYrE7jvqFKFJkq3vCk4ki6oo4l6d2UxnWNQc1yqDZdvyv1vk+SqsO
         JG9GvC6M5ORJJGC5js8pBLUbTHBHji0EVT8fm7xAQX5zyLSb4HLfF+cNcZf5HQN7vpiL
         e6a3SdqBukBS57FJT7JP/UAJUeY7W1/v27yQymtq4IScvzG970oEHWi0vIJAk50Fk4pm
         qvEA==
X-Gm-Message-State: APjAAAUoOU8nwnU45g5ScPDub+Dd3A5BZC0maxGbhlfVP7DFaq8CDRin
        QpHUAj5E/mm4xGXE4M6vYtyx6+D9hCRCCm5N3R3v8A==
X-Google-Smtp-Source: APXvYqyX/YaX5BOZMQkjzoKMxfGfgSGPcxH3EBZ+qCJDIGMfOqm6z9kudF/1Gewc8+hA3obTXaocnXxCh80RntjQfXM=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr4257616ljo.69.1566594476507;
 Fri, 23 Aug 2019 14:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190823125948.21685-1-geert+renesas@glider.be>
In-Reply-To: <20190823125948.21685-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 23:07:45 +0200
Message-ID: <CACRpkdaVM338g1gqvCYh3wJ26E1jk96Ry7m1s1wCsy6ta1d7_w@mail.gmail.com>
Subject: Re: [git pull] pinctrl: sh-pfc: Updates for v5.4 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 23, 2019 at 2:59 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 625efea83a7c37d281c6a90526813a1366929d24:
>
>   pinctrl: rza1: Use devm_platform_ioremap_resource() helper (2019-08-09 09:34:45 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.4-tag2
>
> for you to fetch changes up to 0a6864274e4166cde21f26193350c7fcd9716ef5:
>
>   pinctrl: rza2: Include the appropriate headers (2019-08-23 09:08:10 +0200)

Pulled into my pinctrl "devel" branch, thanks!

Yours,
Linus Walleij
