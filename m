Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12ED31742F9
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Feb 2020 00:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgB1XZx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 18:25:53 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41464 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgB1XZx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 18:25:53 -0500
Received: by mail-lf1-f68.google.com with SMTP id y17so3308236lfe.8
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 15:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dGzWMu4XBpH6ZuiaOU4SkMnEwOu+vcJlnvYgz7BApTg=;
        b=hd8jSV8zpXXGza6L6G3ymjxMJXgY+rMSU6HHDbrcrq2BxjPzx9wUvpBoLGUSD6XIH3
         9JwP8OgYtNI4RNyLQcfPcaMDlPO60XS6yo/jiSQV154OMAfGv6WFbnrKf0Sl8XOK6wyM
         ccPmgyBxa4bM4bsaqkqxtcKyWDu9RpQ7Oc5OpJcRgCxWI3ZSmIQHKt0CQALV+IbUBHD5
         O9PHjECPcWgnrVRXaLzhF+rEmGhD3aQSr3AiBdrKiSr/yZuIb+5C0tk27ZhUNNYW6J2i
         i1sMaTN1TVImUppa0bK0vUA8gUYG4msYyDfgXvPQpENzXkaffwYOzO4XElnAH22OuRkD
         BZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dGzWMu4XBpH6ZuiaOU4SkMnEwOu+vcJlnvYgz7BApTg=;
        b=HfqbAaa+TwuP8WAgX5QPfGjBZhu6/bQLsFUoJkOa/6eVvmEGR+V53CIOdVpPLS6whz
         lOZQM1H6O/aZCTXVsDkEdHFilszHvTTnlqJbYcIRZE3P3aXX8DjAduw67FzYOmffw8DO
         1Gf+AQkJy/WqiDDdQOANMay+FAMeuOCE7XxAtUf52MvuPm90mdUOY05wfVkQupH2ROx/
         n0EvjxPg4xtqiSrYH65nIZlVIJQ7IyJ+NyXtb+8oQq43tBiph168LJ4OVsezgs4RIGP+
         6xl5SAT7CRIz2DE13Zp6dZ4b5o42MPrbonBkMzMXzjovbeIC3oRSE1YXLk0qABVTrvGx
         fJCg==
X-Gm-Message-State: ANhLgQ2V3ZQE7DUAIHkzXDIG/1sMmj6nBmvHgTdKG5827hUrWSTZ/pFY
        vtzOSAQ0xri0AgizRqs/FdEaXqoXSgRhKvVzL6x2EQ==
X-Google-Smtp-Source: ADFU+vt22lyrw7moxExhDGl8n/IQ3BjuLK/mIfpVH1gfOaJRjaKyKXYZdA+gW+XCRueBh3uOay0x6spXFd7hMrj0mKY=
X-Received: by 2002:ac2:44a5:: with SMTP id c5mr3643708lfm.4.1582932351327;
 Fri, 28 Feb 2020 15:25:51 -0800 (PST)
MIME-Version: 1.0
References: <f4e7e20afacb23e6fa7a6b33ea4319b2b3492840.1582776447.git.baolin.wang7@gmail.com>
In-Reply-To: <f4e7e20afacb23e6fa7a6b33ea4319b2b3492840.1582776447.git.baolin.wang7@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 29 Feb 2020 00:25:40 +0100
Message-ID: <CACRpkdab7YLq-VoNZkB5uWSPLbFW3CyTkB+eCNgFG8KC9G3Msg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: Export some needed symbols at module load time
To:     Baolin Wang <baolin.wang7@gmail.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 27, 2020 at 5:13 AM Baolin Wang <baolin.wang7@gmail.com> wrote:

> Export the pin_get_name()/pinconf_generic_parse_dt_config() symbols needed
> by the Spreadtrum pinctrl driver when building it as a module.
>
> Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>

Patch applied.

Yours,
Linus Walleij
